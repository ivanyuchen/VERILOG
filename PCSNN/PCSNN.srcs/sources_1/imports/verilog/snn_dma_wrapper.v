`timescale 1ns / 1ps

module snn_dma_wrapper #(
    parameter HIDDEN_DIM = 128,
    parameter INPUT_DIM = 784,
    parameter PIXEL_BITS = 8,
    parameter TIME_STEPS = 15,
    parameter PARALLEL_NEURONS = 16,
    parameter AXIS_DATA_WIDTH = 32,
    parameter SPIKE_COUNT_WIDTH = (TIME_STEPS <= 1) ? 1 : $clog2(TIME_STEPS + 1)
) (
    input wire aclk,
    input wire aresetn,

    input  wire [AXIS_DATA_WIDTH-1:0] s_axis_tdata,
    input  wire                       s_axis_tvalid,
    output wire                       s_axis_tready,
    input  wire                       s_axis_tlast,

    output reg  [AXIS_DATA_WIDTH-1:0] m_axis_tdata,
    output reg                        m_axis_tvalid,
    input  wire                       m_axis_tready,
    output reg                        m_axis_tlast
);

  localparam IMAGE_BITS = INPUT_DIM * PIXEL_BITS;
  localparam INPUT_WORDS = (IMAGE_BITS + AXIS_DATA_WIDTH - 1) / AXIS_DATA_WIDTH;
  localparam RESULT_BITS = HIDDEN_DIM * SPIKE_COUNT_WIDTH;
  localparam RESULT_WORDS = (RESULT_BITS + AXIS_DATA_WIDTH - 1) / AXIS_DATA_WIDTH;

  localparam INPUT_COUNT_WIDTH = (INPUT_WORDS <= 1) ? 1 : $clog2(INPUT_WORDS);
  localparam RESULT_COUNT_WIDTH = (RESULT_WORDS <= 1) ? 1 : $clog2(RESULT_WORDS);

  localparam [2:0] State_Idle = 3'd0;
  localparam [2:0] State_Rx = 3'd1;
  localparam [2:0] State_Start = 3'd2;
  localparam [2:0] State_Run = 3'd3;
  localparam [2:0] State_Tx = 3'd4;

  reg [2:0] state;
  reg [INPUT_COUNT_WIDTH-1:0] input_word_index;
  reg [RESULT_COUNT_WIDTH-1:0] result_word_index;
  reg [IMAGE_BITS-1:0] image_flat;
  reg [RESULT_WORDS*AXIS_DATA_WIDTH-1:0] result_flat_padded;
  reg snn_start;

  wire snn_busy;
  wire snn_done;
  wire [5:0] snn_control;
  wire [HIDDEN_DIM-1:0] spike_vector;
  wire [RESULT_BITS-1:0] spike_counts_flat;

  assign s_axis_tready = (state == State_Idle) || (state == State_Rx);

  SNN_top #(
      .HIDDEN_DIM(HIDDEN_DIM),
      .INPUT_DIM(INPUT_DIM),
      .PIXEL_BITS(PIXEL_BITS),
      .TIME_STEPS(TIME_STEPS),
      .PARALLEL_NEURONS(PARALLEL_NEURONS),
      .SPIKE_COUNT_WIDTH(SPIKE_COUNT_WIDTH)
  ) snn_top_inst (
      .clk(aclk),
      .rst_n(aresetn),
      .start(snn_start),
      .X_t(image_flat),
      .busy(snn_busy),
      .done(snn_done),
      .Control(snn_control),
      .spike_vector(spike_vector),
      .spike_counts_flat(spike_counts_flat)
  );

  always @(posedge aclk) begin
    if (!aresetn) begin
      state <= State_Idle;
      input_word_index <= {INPUT_COUNT_WIDTH{1'b0}};
      result_word_index <= {RESULT_COUNT_WIDTH{1'b0}};
      image_flat <= {IMAGE_BITS{1'b0}};
      result_flat_padded <= {(RESULT_WORDS * AXIS_DATA_WIDTH) {1'b0}};
      snn_start <= 1'b0;
      m_axis_tdata <= {AXIS_DATA_WIDTH{1'b0}};
      m_axis_tvalid <= 1'b0;
      m_axis_tlast <= 1'b0;
    end else begin
      snn_start <= 1'b0;

      case (state)
        State_Idle: begin
          input_word_index <= {INPUT_COUNT_WIDTH{1'b0}};
          result_word_index <= {RESULT_COUNT_WIDTH{1'b0}};
          m_axis_tvalid <= 1'b0;
          m_axis_tlast <= 1'b0;

          if (s_axis_tvalid && s_axis_tready) begin
            image_flat[0+:AXIS_DATA_WIDTH] <= s_axis_tdata;

            if (INPUT_WORDS == 1 || s_axis_tlast) begin
              state <= State_Start;
            end else begin
              input_word_index <= input_word_index + 1'b1;
              state <= State_Rx;
            end
          end
        end

        State_Rx: begin
          if (s_axis_tvalid && s_axis_tready) begin
            image_flat[input_word_index*AXIS_DATA_WIDTH+:AXIS_DATA_WIDTH] <= s_axis_tdata;

            if ((input_word_index == INPUT_WORDS - 1) || s_axis_tlast) begin
              input_word_index <= {INPUT_COUNT_WIDTH{1'b0}};
              state <= State_Start;
            end else begin
              input_word_index <= input_word_index + 1'b1;
            end
          end
        end

        State_Start: begin
          snn_start <= 1'b1;
          state <= State_Run;
        end

        State_Run: begin
          if (snn_done) begin
            result_flat_padded <= {(RESULT_WORDS * AXIS_DATA_WIDTH) {1'b0}};
            result_flat_padded[0+:RESULT_BITS] <= spike_counts_flat;
            result_word_index <= {RESULT_COUNT_WIDTH{1'b0}};
            m_axis_tdata <= spike_counts_flat[0+:AXIS_DATA_WIDTH];
            m_axis_tvalid <= 1'b1;
            m_axis_tlast <= (RESULT_WORDS == 1);
            state <= State_Tx;
          end
        end

        State_Tx: begin
          if (m_axis_tvalid && m_axis_tready) begin
            if (result_word_index == RESULT_WORDS - 1) begin
              m_axis_tvalid <= 1'b0;
              m_axis_tlast <= 1'b0;
              result_word_index <= {RESULT_COUNT_WIDTH{1'b0}};
              state <= State_Idle;
            end else begin
              result_word_index <= result_word_index + 1'b1;
              m_axis_tdata <= result_flat_padded[(result_word_index + 1'b1)*AXIS_DATA_WIDTH+:AXIS_DATA_WIDTH];
              m_axis_tlast <= (result_word_index == RESULT_WORDS - 2);
            end
          end
        end

        default: begin
          state <= State_Idle;
        end
      endcase
    end
  end

endmodule
