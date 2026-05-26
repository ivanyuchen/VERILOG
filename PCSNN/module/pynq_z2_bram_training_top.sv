`timescale 1ns/1ps

`include "training_build/pynq_z2_bram_full/module/weight_bram_one.sv"
`include "training_build/pynq_z2_bram_full/module/slif_stream_pe.sv"

module pynq_z2_bram_training_top #(
    parameter int NUM_PIXELS = 784,
    parameter int NUM_NEURONS = 128,
    parameter int BLOCK_NEURONS = 8,
    parameter int DATA_WIDTH = 16,
    parameter int ACC_WIDTH = 48,
    parameter int GRAD_WIDTH = 48,
    parameter int TRAIN_STEPS = 4,
    parameter int INPUT_SHIFT = 10,
    parameter int CORR_SHIFT = 10,
    parameter int LEARN_SHIFT = 14,
    parameter int DECAY_SHIFT = 14,
    parameter int LEAK_SHIFT = 3,
    parameter string TRAIN_SPIKE_FILE = "training_build/pynq_z2_bram_full/data/train_spikes_packed.mem"
) (
    input  logic clk,
    input  logic rst_n,
    input  logic start,
    input  logic clear_v,
    input  logic signed [DATA_WIDTH-1:0] threshold,

    output logic busy,
    output logic done,
    output logic [$clog2(TRAIN_STEPS+1)-1:0] train_step_count,
    output logic [31:0] total_neuron_spikes,
    output logic [31:0] total_abs_error,

`ifdef SIM_DEBUG  // SV preprocessor: compile these debug ports only when SIM_DEBUG is defined.
    input  logic [$clog2(NUM_NEURONS)-1:0] debug_neuron,
    input  logic [$clog2(NUM_PIXELS)-1:0] debug_pixel,
    output logic signed [DATA_WIDTH-1:0] debug_weight,
`endif  // End of SIM_DEBUG conditional compile block.
    output logic [3:0] state_debug
);

  localparam int PIXEL_AW = $clog2(NUM_PIXELS);
  localparam int BLOCKS = NUM_NEURONS / BLOCK_NEURONS;
  localparam int BLOCK_AW = $clog2(BLOCKS);

  typedef enum logic [3:0] {  // SV enum: named FSM states encoded as 4-bit logic values.
    S_IDLE        = 4'd0,
    S_CLEAR_GRAD  = 4'd1,
    S_SET_PIXEL   = 4'd2,
    S_READ_WAIT   = 4'd3,
    S_PIXEL_CALC  = 4'd4,
    S_SLIF        = 4'd5,
    S_CAPTURE     = 4'd6,
    S_GRAD_ACCUM  = 4'd7,
    S_NEXT_STEP   = 4'd8,
    S_UPDATE_SET  = 4'd9,
    S_UPDATE_WAIT = 4'd10,
    S_UPDATE_WRITE= 4'd11,
    S_NEXT_BLOCK  = 4'd12,
    S_DONE        = 4'd13
  } state_t;

  state_t state;
  logic [PIXEL_AW-1:0] pixel_idx;
  logic [PIXEL_AW-1:0] bram_rd_addr;
  logic [BLOCK_AW-1:0] block_idx;
  logic [$clog2(NUM_NEURONS)-1:0] block_base;
  logic [NUM_PIXELS-1:0] train_spike_rom [0:TRAIN_STEPS-1];
  logic signed [DATA_WIDTH-1:0] error_mem [0:NUM_PIXELS-1];
  logic signed [GRAD_WIDTH-1:0] grad_accum [0:BLOCK_NEURONS-1][0:NUM_PIXELS-1];

  logic signed [DATA_WIDTH-1:0] old_w_rd_data [0:NUM_NEURONS-1];
  logic signed [DATA_WIDTH-1:0] final_w_rd_data [0:NUM_NEURONS-1];
  logic signed [DATA_WIDTH-1:0] final_w_wr_data [0:NUM_NEURONS-1];
  logic [NUM_NEURONS-1:0] final_w_wr_en;

  logic [NUM_NEURONS-1:0] spike_state;
  logic [NUM_NEURONS-1:0] spike_wire;
  logic signed [DATA_WIDTH-1:0] voltage_wire [0:NUM_NEURONS-1];
  logic signed [ACC_WIDTH-1:0] feedback_accum [0:NUM_NEURONS-1];
`ifdef SIM_DEBUG  // Debug-only signal array; not present unless SIM_DEBUG is enabled.
  logic signed [DATA_WIDTH-1:0] debug_weight_arr [0:NUM_NEURONS-1];
`endif

  logic signed [31:0] x_hat_sum;
  logic signed [31:0] x_scaled;
  logic signed [31:0] err_calc_32;
  logic signed [DATA_WIDTH-1:0] err_calc;
  logic [31:0] abs_err_calc;
  logic [31:0] step_spike_count;

  initial begin
    $readmemh(TRAIN_SPIKE_FILE, train_spike_rom);
  end

  assign state_debug = state;
  assign block_base = block_idx * BLOCK_NEURONS;
  assign x_scaled = train_spike_rom[train_step_count][pixel_idx] ? (32'sd1 <<< INPUT_SHIFT) : 32'sd0;
  assign err_calc_32 = x_scaled - x_hat_sum;
  assign err_calc = (err_calc_32 > 32'sd32767) ? 16'sh7fff :
                    (err_calc_32 < -32'sd32768) ? 16'sh8000 :
                    err_calc_32[DATA_WIDTH-1:0];
  assign abs_err_calc = err_calc[DATA_WIDTH-1] ? $unsigned(-err_calc) : $unsigned(err_calc);

  always_comb begin  // SV combinational block: simulator checks that outputs are assigned every path.
    x_hat_sum = 0;
    step_spike_count = 0;
    for (int n = 0; n < NUM_NEURONS; n++) begin
      if (spike_state[n]) begin
        x_hat_sum += $signed(old_w_rd_data[n]);
      end
      if (spike_wire[n]) begin
        step_spike_count += 32'd1;
      end
    end
  end

  // function defines reusable combinational code.
  // automatic gives each call its own local storage, so parallel calls in generate logic are safe.
  function automatic signed [DATA_WIDTH-1:0] sat16(input signed [31:0] value);
    begin
      if (value > 32'sd32767) sat16 = 16'sh7fff;
      else if (value < -32'sd32768) sat16 = 16'sh8000;
      else sat16 = value[DATA_WIDTH-1:0];
    end
  endfunction

  genvar n;
  generate  // Elaborates NUM_NEURONS copies of the BRAM/SLIF hardware at compile time.
    for (n = 0; n < NUM_NEURONS; n++) begin : GEN_NEURON
      localparam int THIS_BLOCK = n / BLOCK_NEURONS;
      localparam int LOCAL_IDX = n % BLOCK_NEURONS;
      logic signed [ACC_WIDTH-1:0] slif_current;
      logic signed [GRAD_WIDTH-1:0] grad_avg;
      logic signed [31:0] final_w_next;

      assign slif_current = feedback_accum[n] >>> CORR_SHIFT;
      assign grad_avg = grad_accum[LOCAL_IDX][pixel_idx] / TRAIN_STEPS;
      assign final_w_next = $signed(old_w_rd_data[n])
          + ($signed(grad_avg) >>> LEARN_SHIFT)
          - ($signed(old_w_rd_data[n]) >>> DECAY_SHIFT);
      assign final_w_wr_data[n] = sat16(final_w_next);
      assign final_w_wr_en[n] = (state == S_UPDATE_WRITE) && (block_idx == THIS_BLOCK[BLOCK_AW-1:0]);

      weight_bram_one #(
          .NEURON_ID(n),
          .NUM_PIXELS(NUM_PIXELS),
          .NUM_NEURONS(NUM_NEURONS),
          .DATA_WIDTH(DATA_WIDTH)
      ) u_old_weight_bram (
          .clk(clk),
          .wr_en(1'b0),
          .wr_addr(pixel_idx),
          .wr_data('0),
          .rd_addr(bram_rd_addr),
          .rd_data(old_w_rd_data[n]),
`ifdef SIM_DEBUG  // Only connect BRAM debug ports when the module interface includes them.
          .debug_addr(debug_pixel),
          .debug_data(),
`endif
          .unused_tieoff(1'b0)
      );

      weight_bram_one #(
          .NEURON_ID(n),
          .NUM_PIXELS(NUM_PIXELS),
          .NUM_NEURONS(NUM_NEURONS),
          .DATA_WIDTH(DATA_WIDTH)
      ) u_final_weight_bram (
          .clk(clk),
          .wr_en(final_w_wr_en[n]),
          .wr_addr(pixel_idx),
          .wr_data(final_w_wr_data[n]),
          .rd_addr(bram_rd_addr),
          .rd_data(final_w_rd_data[n]),
`ifdef SIM_DEBUG  // Only connect BRAM debug ports when the module interface includes them.
          .debug_addr(debug_pixel),
          .debug_data(debug_weight_arr[n]),
`endif
          .unused_tieoff(1'b0)
      );

      slif_stream_pe #(
          .DATA_WIDTH(DATA_WIDTH),
          .ACC_WIDTH(ACC_WIDTH),
          .LEAK_SHIFT(LEAK_SHIFT)
      ) u_slif (
          .clk(clk),
          .rst_n(rst_n),
          .clear_v(clear_v || state == S_CLEAR_GRAD),
          .update_en(state == S_SLIF),
          .current_in(slif_current),
          .threshold(threshold),
          .spike_out(spike_wire[n]),
          .voltage(voltage_wire[n])
      );
    end
  endgenerate

`ifdef SIM_DEBUG  // Debug mux exists only in simulation/debug builds.
  always_comb begin
    debug_weight = debug_weight_arr[debug_neuron];
  end
`endif

  always_ff @(posedge clk or negedge rst_n) begin  // Sequential FSM/register logic with async active-low reset.
    if (!rst_n) begin
      state <= S_IDLE;
      busy <= 1'b0;
      done <= 1'b0;
      train_step_count <= '0;
      total_neuron_spikes <= 32'd0;
      total_abs_error <= 32'd0;
      pixel_idx <= '0;
      bram_rd_addr <= '0;
      block_idx <= '0;
      spike_state <= '0;
      for (int i = 0; i < NUM_NEURONS; i++) begin
        feedback_accum[i] <= '0;
      end
      for (int l = 0; l < BLOCK_NEURONS; l++) begin
        for (int p = 0; p < NUM_PIXELS; p++) begin
          grad_accum[l][p] <= '0;
        end
      end
    end else begin
      done <= 1'b0;

      case (state)
        S_IDLE: begin
          busy <= 1'b0;
          if (start) begin
            busy <= 1'b1;
            train_step_count <= '0;
            total_neuron_spikes <= 32'd0;
            total_abs_error <= 32'd0;
            pixel_idx <= '0;
            bram_rd_addr <= '0;
            block_idx <= '0;
            spike_state <= '0;
            state <= S_CLEAR_GRAD;
          end
        end

        S_CLEAR_GRAD: begin
          spike_state <= '0;
          train_step_count <= '0;
          bram_rd_addr <= '0;
          for (int i = 0; i < NUM_NEURONS; i++) begin
            feedback_accum[i] <= '0;
          end
          for (int l = 0; l < BLOCK_NEURONS; l++) begin
            grad_accum[l][pixel_idx] <= '0;
          end
          if (pixel_idx == NUM_PIXELS-1) begin
            pixel_idx <= '0;
            state <= S_SET_PIXEL;
          end else begin
            pixel_idx <= pixel_idx + 1'b1;
          end
        end

        S_SET_PIXEL: begin
          bram_rd_addr <= pixel_idx;
          state <= S_READ_WAIT;
        end

        S_READ_WAIT: begin
          state <= S_PIXEL_CALC;
        end

        S_PIXEL_CALC: begin
          error_mem[pixel_idx] <= err_calc;
          if (block_idx == 0) begin
            total_abs_error <= total_abs_error + abs_err_calc;
          end
          for (int i = 0; i < NUM_NEURONS; i++) begin
            feedback_accum[i] <= feedback_accum[i] + ($signed(err_calc) * $signed(old_w_rd_data[i]));
          end
          if (pixel_idx == NUM_PIXELS-1) begin
            state <= S_SLIF;
          end else begin
            pixel_idx <= pixel_idx + 1'b1;
            state <= S_SET_PIXEL;
          end
        end

        S_SLIF: begin
          state <= S_CAPTURE;
        end

        S_CAPTURE: begin
          spike_state <= spike_wire;
          if (block_idx == 0) begin
            total_neuron_spikes <= total_neuron_spikes + step_spike_count;
          end
          for (int i = 0; i < NUM_NEURONS; i++) begin
            feedback_accum[i] <= '0;
          end
          pixel_idx <= '0;
          state <= S_GRAD_ACCUM;
        end

        S_GRAD_ACCUM: begin
          for (int l = 0; l < BLOCK_NEURONS; l++) begin
            if (spike_wire[block_base + l]) begin
              grad_accum[l][pixel_idx] <= grad_accum[l][pixel_idx] + $signed(error_mem[pixel_idx]);
            end
          end
          if (pixel_idx == NUM_PIXELS-1) begin
            state <= S_NEXT_STEP;
          end else begin
            pixel_idx <= pixel_idx + 1'b1;
          end
        end

        S_NEXT_STEP: begin
          if (train_step_count == TRAIN_STEPS-1) begin
            pixel_idx <= '0;
            bram_rd_addr <= '0;
            state <= S_UPDATE_SET;
          end else begin
            train_step_count <= train_step_count + 1'b1;
            pixel_idx <= '0;
            bram_rd_addr <= '0;
            state <= S_SET_PIXEL;
          end
        end

        S_UPDATE_SET: begin
          bram_rd_addr <= pixel_idx;
          state <= S_UPDATE_WAIT;
        end

        S_UPDATE_WAIT: begin
          state <= S_UPDATE_WRITE;
        end

        S_UPDATE_WRITE: begin
          if (pixel_idx == NUM_PIXELS-1) begin
            state <= S_NEXT_BLOCK;
          end else begin
            pixel_idx <= pixel_idx + 1'b1;
            state <= S_UPDATE_SET;
          end
        end

        S_NEXT_BLOCK: begin
          if (block_idx == BLOCKS-1) begin
            state <= S_DONE;
          end else begin
            block_idx <= block_idx + 1'b1;
            pixel_idx <= '0;
            bram_rd_addr <= '0;
            state <= S_CLEAR_GRAD;
          end
        end

        S_DONE: begin
          busy <= 1'b0;
          done <= 1'b1;
          state <= S_IDLE;
        end

        default: begin
          state <= S_IDLE;
        end
      endcase
    end
  end

endmodule
