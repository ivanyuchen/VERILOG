`timescale 1ns / 1ps

module w_rom_bank #(
    parameter int HIDDEN_DIM = 128,
    parameter int INPUT_DIM = 784,
    parameter WEIGHTS_FILE = ""
) (
    input logic clk,
    input logic [$clog2(INPUT_DIM)-1:0] addr,
    output logic signed [15:0] data_out[HIDDEN_DIM-1:0]
);

  localparam int WORD_WIDTH = HIDDEN_DIM * 16;

  (* rom_style = "block" *)
  logic [WORD_WIDTH-1:0] rom[0:INPUT_DIM-1];
  logic [WORD_WIDTH-1:0] rom_word;

  initial begin
    integer i;

    for (i = 0; i < INPUT_DIM; i = i + 1) begin
      rom[i] = {WORD_WIDTH{1'b0}};
    end

    if (WEIGHTS_FILE != "") begin
      $readmemh(WEIGHTS_FILE, rom);
    end

    rom_word = {WORD_WIDTH{1'b0}};
  end

  always_ff @(posedge clk) begin
    rom_word <= rom[addr];
  end

  genvar neuron_index;
  generate
    for (neuron_index = 0; neuron_index < HIDDEN_DIM; neuron_index = neuron_index + 1) begin : gen_data_out
      assign data_out[neuron_index] = rom_word[neuron_index*16+:16];
    end
  endgenerate

endmodule
