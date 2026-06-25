`timescale 1ns / 1ps

module w_ram_bank #(
    parameter int HIDDEN_DIM = 128,
    parameter int INPUT_DIM = 784,
    parameter int WORD_WIDTH = HIDDEN_DIM * 16,
    parameter WEIGHTS_FILE = ""
) (
    input logic clk,
    input logic [$clog2(INPUT_DIM)-1:0] addr,
    input logic wr_en,
    input logic [WORD_WIDTH-1:0] wr_word,
    output logic [WORD_WIDTH-1:0] word_out
);

  (* ram_style = "block" *)
  logic [WORD_WIDTH-1:0] ram[0:INPUT_DIM-1];

  initial begin
    integer i;

    for (i = 0; i < INPUT_DIM; i = i + 1) begin
      ram[i] = {WORD_WIDTH{1'b0}};
    end

    if (WEIGHTS_FILE != "") begin
      $readmemh(WEIGHTS_FILE, ram);
    end

    word_out = {WORD_WIDTH{1'b0}};
  end

  always_ff @(posedge clk) begin
    if (wr_en) begin
      ram[addr] <= wr_word;
    end

    word_out <= ram[addr];
  end

endmodule

module SNN_layer #(
    parameter int HIDDEN_DIM = 128,
    parameter int INPUT_DIM = 784,
    parameter int PIXEL_BITS = 8,
    parameter int TIME_STEPS = 15,
    parameter int BATCH_SIZE = 32,
    parameter int PARALLEL_NEURONS = 16,
    parameter int SPIKE_COUNT_WIDTH = (TIME_STEPS <= 1) ? 1 : $clog2(TIME_STEPS + 1),
    parameter WEIGHTS_FILE = "/home/ivanyuchen/CODING_FILES/PC_SNN/verilog/weights/pc_snn_weights_by_pixel.mem"
) (
    input logic clk,
    input logic rst_n,

    input logic start,
    input logic learn_enable,
    input logic [INPUT_DIM*PIXEL_BITS-1:0] X_t,

    output logic busy,
    output logic done,
    output logic [5:0] Control,
    output logic [HIDDEN_DIM-1:0] Spike_out_Cluster,
    output logic [HIDDEN_DIM*SPIKE_COUNT_WIDTH-1:0] spike_counts_flat
);

  localparam int ADDR_WIDTH = (INPUT_DIM <= 1) ? 1 : $clog2(INPUT_DIM);
  localparam int TIME_WIDTH = (TIME_STEPS <= 1) ? 1 : $clog2(TIME_STEPS);
  localparam int NEURON_GROUP_COUNT = (HIDDEN_DIM + PARALLEL_NEURONS - 1) / PARALLEL_NEURONS;
  localparam int NEURON_GROUP_WIDTH = (NEURON_GROUP_COUNT <= 1) ? 1 : $clog2(NEURON_GROUP_COUNT);
  localparam int WEIGHT_BITS = 16;
  localparam int GRAD_BITS = 16;
  localparam int WEIGHT_WORD_WIDTH = HIDDEN_DIM * WEIGHT_BITS;
  localparam int GRAD_WORD_WIDTH = HIDDEN_DIM * GRAD_BITS;
  localparam logic [ADDR_WIDTH-1:0] LAST_PIXEL = ADDR_WIDTH'(INPUT_DIM - 1);
  localparam logic [TIME_WIDTH-1:0] LAST_TIMESTEP = TIME_WIDTH'(TIME_STEPS - 1);
  localparam logic [NEURON_GROUP_WIDTH-1:0] LAST_NEURON_GROUP =
      NEURON_GROUP_WIDTH'(NEURON_GROUP_COUNT - 1);

  localparam logic [1:0] Control_Clear = 2'b00;
  localparam logic [1:0] Control_Wait = 2'b01;
  localparam logic [1:0] Control_Update = 2'b10;
  localparam logic [1:0] Control_Spike = 2'b11;

  localparam logic [2:0] Image_Buffer_Load = 3'b001;
  localparam logic [2:0] Image_Buffer_Random = 3'b010;
  localparam logic [2:0] Image_Buffer_Hold = 3'b011;

  localparam logic signed [25:0] SCALE_VALUE = 26'sd1024;
  localparam logic signed [25:0] V_THR = 26'sd512;
  localparam int CURRENT_SHIFT = 13;
  localparam int LEARNING_SHIFT = 10;
  localparam int BATCH_AVG_SHIFT = 5;
  localparam int TIME_AVG_SHIFT = 4;
  localparam int WEIGHT_DECAY_SHIFT = 13;
  localparam logic signed [15:0] WEIGHT_CLIP_MIN = 16'sh8000;
  localparam logic signed [15:0] WEIGHT_CLIP_MAX = 16'sh7fff;
  localparam logic signed [16:0] WEIGHT_CLIP_MIN_EXT = -17'sd32768;
  localparam logic signed [16:0] WEIGHT_CLIP_MAX_EXT = 17'sd32767;

  typedef enum logic [3:0] {
    State_Idle,
    State_Load_Image,
    State_Clear,
    State_Random,
    State_Set_Pixel,
    State_Wait_Weight,
    State_Accum,
    State_Update,
    State_Spike,
    State_Done,
    State_Weight_Update,
    State_Wait_Weight2,
    State_Grad_Set_Pixel,
    State_Grad_Wait,
    State_Grad_Update
  } state_t;

  state_t state;

  logic [ADDR_WIDTH-1:0] pixel_addr;
  logic [TIME_WIDTH-1:0] timestep_counter;
  logic [NEURON_GROUP_WIDTH-1:0] neuron_group_counter;
  logic [WEIGHT_WORD_WIDTH-1:0] weight_word;
  logic weight_wr_en;
  logic [WEIGHT_WORD_WIDTH-1:0] weight_wr_word;
  logic [WEIGHT_WORD_WIDTH-1:0] weight_next_word;
  logic [GRAD_WORD_WIDTH-1:0] grad_word;
  logic grad_wr_en;
  logic [GRAD_WORD_WIDTH-1:0] grad_wr_word;
  logic [GRAD_WORD_WIDTH-1:0] grad_update_word;
  logic [GRAD_WORD_WIDTH-1:0] grad_next_word;
  logic [INPUT_DIM-1:0] spike_frame;
  logic signed [25:0] weight_accum;
  logic signed [25:0] lane_weight_sum;
  logic signed [25:0] err_latched;
  logic signed [25:0] err_history[0:INPUT_DIM-1];
  logic signed [51:0] I_accum[0:HIDDEN_DIM-1];
  logic signed [25:0] V_mem[0:HIDDEN_DIM-1];
  logic [SPIKE_COUNT_WIDTH-1:0] spike_counts[0:HIDDEN_DIM-1];
  logic [$clog2(BATCH_SIZE)-1:0] batch_counter;
  logic start_d;
  logic start_pulse;
  logic [1:0] snn_control;
  logic [2:0] image_buffer_control;
  logic spike_count_en;

  assign start_pulse = start & ~start_d;
  assign busy = (state != State_Idle) && (state != State_Done);
  assign done = (state == State_Done);
  assign spike_count_en = (state == State_Spike);
  assign Control = {spike_count_en, image_buffer_control, snn_control};
  assign weight_wr_en = learn_enable && (state == State_Weight_Update);
  assign weight_wr_word = weight_next_word;
  assign grad_wr_en = learn_enable && (
      ((state == State_Grad_Update) && (neuron_group_counter == LAST_NEURON_GROUP)) ||
      (state == State_Weight_Update)
  );
  assign grad_wr_word = (state == State_Weight_Update) ? {GRAD_WORD_WIDTH{1'b0}} : grad_next_word;

  function automatic logic signed [15:0] weight_at(input logic [WEIGHT_WORD_WIDTH-1:0] word,
                                                   input int unsigned neuron_index);
    begin
      weight_at = word[neuron_index*WEIGHT_BITS+:WEIGHT_BITS];
    end
  endfunction

  function automatic logic signed [15:0] grad_at(input logic [GRAD_WORD_WIDTH-1:0] word,
                                                 input int unsigned neuron_index);
    begin
      grad_at = word[neuron_index*GRAD_BITS+:GRAD_BITS];
    end
  endfunction

  function automatic logic signed [25:0] extend_weight(input logic signed [15:0] weight);
    begin
      extend_weight = {{10{weight[15]}}, weight};
    end
  endfunction

  function automatic logic signed [15:0] grad_addend(input logic spike,
                                                     input logic signed [25:0] error);
    logic signed [25:0] scaled_error;
    begin
      if (!spike) begin
        grad_addend = 16'sd0;
      end else begin
        scaled_error = error >>> LEARNING_SHIFT;

        if (scaled_error > 26'sd32767) begin
          grad_addend = 16'sd32767;
        end else if (scaled_error < -26'sd32768) begin
          grad_addend = WEIGHT_CLIP_MIN;
        end else begin
          grad_addend = scaled_error[15:0];
        end
      end
    end
  endfunction

  function automatic logic signed [15:0] golden_weight_delta(input logic signed [15:0] grad);
    logic signed [15:0] shifted_grad;
    begin
      shifted_grad = grad >>> (BATCH_AVG_SHIFT + TIME_AVG_SHIFT);
      golden_weight_delta = shifted_grad;
    end
  endfunction

  function automatic logic signed [15:0] clipped_weight_add(input logic signed [15:0] weight,
                                                            input logic signed [15:0] delta,
                                                            input logic signed [15:0] decay);
    logic signed [16:0] sum;
    begin
      sum = {weight[15], weight} + {delta[15], delta} - {decay[15], decay};

      if (sum > WEIGHT_CLIP_MAX_EXT) begin
        clipped_weight_add = WEIGHT_CLIP_MAX;
      end else if (sum < WEIGHT_CLIP_MIN_EXT) begin
        clipped_weight_add = WEIGHT_CLIP_MIN;
      end else begin
        clipped_weight_add = sum[15:0];
      end
    end
  endfunction

  image_buffer #(
      .INPUT_DIM (INPUT_DIM),
      .PIXEL_BITS(PIXEL_BITS)
  ) image_buffer_inst (
      .clk    (clk),
      .rst_n  (rst_n),
      .X_t    (X_t),
      .Control(image_buffer_control),
      .X_out  (spike_frame)
  );

  w_ram_bank #(
      .HIDDEN_DIM  (HIDDEN_DIM),
      .INPUT_DIM   (INPUT_DIM),
      .WORD_WIDTH  (WEIGHT_WORD_WIDTH),
      .WEIGHTS_FILE(WEIGHTS_FILE)
  ) weight_ram_bank_inst (
      .clk     (clk),
      .addr    (pixel_addr),
      .wr_en   (weight_wr_en),
      .wr_word (weight_wr_word),
      .word_out(weight_word)
  );

  w_ram_bank #(
      .HIDDEN_DIM  (HIDDEN_DIM),
      .INPUT_DIM   (INPUT_DIM),
      .WORD_WIDTH  (GRAD_WORD_WIDTH),
      .WEIGHTS_FILE("")
  ) grad_ram_bank_inst (
      .clk     (clk),
      .addr    (pixel_addr),
      .wr_en   (grad_wr_en),
      .wr_word (grad_wr_word),
      .word_out(grad_word)
  );

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      start_d <= 1'b0;
    end else begin
      start_d <= start;
    end
  end

  always_comb begin
    case (state)
      State_Clear:  snn_control = Control_Clear;
      State_Update: snn_control = Control_Update;
      State_Spike:  snn_control = Control_Spike;
      default:      snn_control = Control_Wait;
    endcase
  end

  always_comb begin
    case (state)
      State_Load_Image: image_buffer_control = Image_Buffer_Load;
      State_Random:     image_buffer_control = Image_Buffer_Random;
      default:          image_buffer_control = Image_Buffer_Hold;
    endcase
  end

  always_comb begin
    int unsigned neuron_index;
    logic signed [15:0] grad_lane;

    grad_next_word = grad_update_word;

    for (int lane = 0; lane < PARALLEL_NEURONS; lane = lane + 1) begin
      neuron_index = (neuron_group_counter * PARALLEL_NEURONS) + lane;

      if (neuron_index < HIDDEN_DIM) begin
        grad_lane = grad_at(grad_update_word, neuron_index);
        grad_next_word[neuron_index*GRAD_BITS+:GRAD_BITS] =
            grad_lane + grad_addend(Spike_out_Cluster[neuron_index], err_history[pixel_addr]);
      end
    end
  end

  always_comb begin
    logic signed [15:0] current_weight;
    logic signed [15:0] current_grad;
    logic signed [15:0] weight_delta;
    logic signed [15:0] weight_decay;

    weight_next_word = weight_word;

    for (int neuron_index = 0; neuron_index < HIDDEN_DIM; neuron_index = neuron_index + 1) begin
      current_weight = weight_at(weight_word, neuron_index);
      current_grad   = grad_at(grad_word, neuron_index);
      weight_delta   = golden_weight_delta(current_grad);
      weight_decay   = current_weight >>> WEIGHT_DECAY_SHIFT;
      weight_next_word[neuron_index*WEIGHT_BITS+:WEIGHT_BITS] =
          clipped_weight_add(current_weight, weight_delta, weight_decay);
    end
  end

  always @* begin
    int unsigned neuron_index;
    logic signed [15:0] current_weight;

    lane_weight_sum = 26'sd0;

    for (int lane = 0; lane < PARALLEL_NEURONS; lane = lane + 1) begin
      neuron_index = (neuron_group_counter * PARALLEL_NEURONS) + lane;

      if (neuron_index < HIDDEN_DIM) begin
        current_weight = weight_at(weight_word, neuron_index);

        if (Spike_out_Cluster[neuron_index]) begin
          lane_weight_sum += extend_weight(current_weight);
        end
      end
    end
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= State_Idle;
      pixel_addr <= '0;
      timestep_counter <= '0;
      neuron_group_counter <= '0;
      weight_accum <= 26'sd0;
      err_latched <= 26'sd0;
      grad_update_word <= {GRAD_WORD_WIDTH{1'b0}};
      batch_counter <= '0;

      for (int i = 0; i < HIDDEN_DIM; i = i + 1) begin
        I_accum[i] <= 52'sd0;
        V_mem[i] <= 26'sd0;
        Spike_out_Cluster[i] <= 1'b0;
        spike_counts[i] <= '0;
      end
    end else begin
      case (state)
        State_Idle: begin
          pixel_addr <= '0;
          timestep_counter <= '0;
          neuron_group_counter <= '0;
          weight_accum <= 26'sd0;
          err_latched <= 26'sd0;

          if (start_pulse) begin
            state <= State_Load_Image;
          end
        end

        State_Load_Image: begin
          pixel_addr <= '0;
          timestep_counter <= '0;
          neuron_group_counter <= '0;
          state <= State_Clear;
        end

        State_Clear: begin
          pixel_addr <= '0;
          timestep_counter <= '0;
          neuron_group_counter <= '0;
          weight_accum <= 26'sd0;
          err_latched <= 26'sd0;

          for (int i = 0; i < HIDDEN_DIM; i = i + 1) begin
            I_accum[i] <= 52'sd0;
            V_mem[i] <= 26'sd0;
            Spike_out_Cluster[i] <= 1'b0;
            spike_counts[i] <= '0;
          end

          state <= State_Random;
        end

        State_Random: begin
          pixel_addr <= '0;
          neuron_group_counter <= '0;
          weight_accum <= 26'sd0;
          state <= State_Set_Pixel;
        end

        State_Set_Pixel: begin
          neuron_group_counter <= '0;
          weight_accum <= 26'sd0;
          state <= State_Wait_Weight;
        end

        State_Wait_Weight: begin
          grad_update_word <= grad_word;
          state <= State_Accum;
        end

        State_Accum: begin
          weight_accum <= weight_accum + lane_weight_sum;

          if (neuron_group_counter == LAST_NEURON_GROUP) begin
            err_latched <= (spike_frame[pixel_addr] ? SCALE_VALUE : 26'sd0) -
                (weight_accum + lane_weight_sum);
            neuron_group_counter <= '0;
            state <= State_Update;
          end else begin
            neuron_group_counter <= neuron_group_counter + 1'b1;
          end
        end

        State_Update: begin
          int unsigned neuron_index;
          logic signed [15:0] current_weight;

          for (int lane = 0; lane < PARALLEL_NEURONS; lane = lane + 1) begin
            neuron_index = (neuron_group_counter * PARALLEL_NEURONS) + lane;

            if (neuron_index < HIDDEN_DIM) begin
              current_weight = weight_at(weight_word, neuron_index);
              I_accum[neuron_index] <= I_accum[neuron_index] + (err_latched * extend_weight(
                  current_weight
              ));
            end
          end

          if (learn_enable) begin
            if (neuron_group_counter == '0) begin
              err_history[pixel_addr] <= err_latched;
            end
          end

          if (neuron_group_counter == LAST_NEURON_GROUP) begin
            neuron_group_counter <= '0;

            if (pixel_addr == LAST_PIXEL) begin
              pixel_addr <= '0;
              state <= State_Spike;
            end else begin
              pixel_addr <= pixel_addr + 1'b1;
              state <= State_Set_Pixel;
            end
          end else begin
            neuron_group_counter <= neuron_group_counter + 1'b1;
          end
        end

        State_Spike: begin
          int unsigned neuron_index;
          logic signed [51:0] i_shifted;
          logic signed [25:0] i_to_v;
          logic signed [25:0] v_update;
          logic spike_next;

          for (int lane = 0; lane < PARALLEL_NEURONS; lane = lane + 1) begin
            neuron_index = (neuron_group_counter * PARALLEL_NEURONS) + lane;

            if (neuron_index < HIDDEN_DIM) begin
              i_shifted = I_accum[neuron_index] >>> CURRENT_SHIFT;
              i_to_v = i_shifted[25:0];
              v_update = V_mem[neuron_index] - (V_mem[neuron_index] >>> 3) + i_to_v;
              spike_next = (v_update > V_THR);

              Spike_out_Cluster[neuron_index] <= spike_next;
              V_mem[neuron_index] <= spike_next ? 26'sd0 : v_update;
              I_accum[neuron_index] <= 52'sd0;

              if (spike_next) begin
                spike_counts[neuron_index] <= spike_counts[neuron_index] + 1'b1;
              end
            end
          end

          if (neuron_group_counter == LAST_NEURON_GROUP) begin
            neuron_group_counter <= '0;

            if (learn_enable) begin
              pixel_addr <= '0;
              state <= State_Grad_Set_Pixel;
            end else if (timestep_counter == LAST_TIMESTEP) begin
              state <= State_Done;
            end else begin
              timestep_counter <= timestep_counter + 1'b1;
              state <= State_Random;
            end
          end else begin
            neuron_group_counter <= neuron_group_counter + 1'b1;
          end
        end

        State_Grad_Set_Pixel: begin
          neuron_group_counter <= '0;
          state <= State_Grad_Wait;
        end

        State_Grad_Wait: begin
          grad_update_word <= grad_word;
          neuron_group_counter <= '0;
          state <= State_Grad_Update;
        end

        State_Grad_Update: begin
          grad_update_word <= grad_next_word;

          if (neuron_group_counter == LAST_NEURON_GROUP) begin
            neuron_group_counter <= '0;

            if (pixel_addr == LAST_PIXEL) begin
              pixel_addr <= '0;

              if (timestep_counter == LAST_TIMESTEP) begin
                state <= State_Done;
              end else begin
                timestep_counter <= timestep_counter + 1'b1;
                state <= State_Random;
              end
            end else begin
              pixel_addr <= pixel_addr + 1'b1;
              state <= State_Grad_Set_Pixel;
            end
          end else begin
            neuron_group_counter <= neuron_group_counter + 1'b1;
          end
        end

        State_Done: begin
          if (!start) begin
            if (learn_enable) begin
              batch_counter <= batch_counter + 1'b1;
              if (batch_counter == (BATCH_SIZE - 1)) begin
                batch_counter <= '0;
                pixel_addr <= '0;
                state <= State_Wait_Weight2;
              end else begin
                state <= State_Idle;
              end
            end else begin
              state <= State_Idle;
            end
          end
        end

        State_Weight_Update: begin
          if (pixel_addr == LAST_PIXEL) begin
            pixel_addr <= '0;
            state <= State_Idle;
          end else begin
            pixel_addr <= pixel_addr + 1'b1;
            state <= State_Wait_Weight2;
          end
        end

        State_Wait_Weight2: begin
          state <= State_Weight_Update;
        end

        default: begin
          state <= State_Idle;
        end

      endcase
    end
  end

  genvar count_index;
  generate
    for (
        count_index = 0; count_index < HIDDEN_DIM; count_index = count_index + 1
    ) begin : gen_spike_counts
      assign spike_counts_flat[count_index*SPIKE_COUNT_WIDTH+:SPIKE_COUNT_WIDTH] =
          spike_counts[count_index];
    end
  endgenerate

endmodule
