`timescale 1ns / 1ps

module w_bram #(
    parameter int INPUT_DIM = 784,
    parameter WEIGHTS_FILE = ""
) (
    input logic clk,
    input logic [$clog2(INPUT_DIM)-1:0] addr,
    output logic signed [15:0] data_out
);

  (* rom_style = "block" *)
  logic signed [15:0] bram[0:INPUT_DIM-1];

  initial begin
    integer i;

    for (i = 0; i < INPUT_DIM; i = i + 1) begin
      bram[i] = 16'sd0;
    end

    if (WEIGHTS_FILE != "") begin
      $readmemh(WEIGHTS_FILE, bram);
    end

    data_out = 16'sd0;
  end

  always_ff @(posedge clk) begin
    data_out <= bram[addr];
  end

endmodule
