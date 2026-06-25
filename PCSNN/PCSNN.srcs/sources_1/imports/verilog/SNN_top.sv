`timescale 1ns / 1ps

module SNN_top #(
    parameter int HIDDEN_DIM = 128,
    parameter int INPUT_DIM = 784,
    parameter int PIXEL_BITS = 8,
    parameter int TIME_STEPS = 15,
    parameter int PARALLEL_NEURONS = 16,
    parameter int SPIKE_COUNT_WIDTH = (TIME_STEPS <= 1) ? 1 : $clog2(TIME_STEPS + 1)
) (
    input logic clk,
    input logic rst_n,

    input logic start,
    input logic learn_enable,
    input logic [INPUT_DIM*PIXEL_BITS-1:0] X_t,

    output logic busy,
    output logic done,
    output logic [5:0] Control,
    output logic [HIDDEN_DIM-1:0] spike_vector,
    output logic [HIDDEN_DIM*SPIKE_COUNT_WIDTH-1:0] spike_counts_flat
);

  SNN_layer #(
      .HIDDEN_DIM(HIDDEN_DIM),
      .INPUT_DIM(INPUT_DIM),
      .PIXEL_BITS(PIXEL_BITS),
      .TIME_STEPS(TIME_STEPS),
      .PARALLEL_NEURONS(PARALLEL_NEURONS),
      .SPIKE_COUNT_WIDTH(SPIKE_COUNT_WIDTH)
  ) snn_layer_inst (
      .clk(clk),
      .rst_n(rst_n),
      .start(start),
      .learn_enable(learn_enable),
      .X_t(X_t),
      .busy(busy),
      .done(done),
      .Control(Control),
      .Spike_out_Cluster(spike_vector),
      .spike_counts_flat(spike_counts_flat)
  );

endmodule
