module weight_bram_one #(
    parameter int NEURON_ID = 0,
    parameter int NUM_PIXELS = 784,
    parameter int NUM_NEURONS = 128,
    parameter int DATA_WIDTH = 16,
    parameter string INIT_FILE = "training_build/pynq_z2_bram_full/data/weights_init_flat.mem"
) (
    input  logic clk,
    input  logic wr_en,
    input  logic [$clog2(NUM_PIXELS)-1:0] wr_addr,
    input  logic signed [DATA_WIDTH-1:0] wr_data,
    input  logic [$clog2(NUM_PIXELS)-1:0] rd_addr,
    output logic signed [DATA_WIDTH-1:0] rd_data,
`ifdef SIM_DEBUG  // SV preprocessor: only compile these debug ports when SIM_DEBUG is defined.
    input  logic [$clog2(NUM_PIXELS)-1:0] debug_addr,
    output logic signed [DATA_WIDTH-1:0] debug_data,
`endif  // End of SIM_DEBUG conditional compile block.
    input  logic unused_tieoff
);

  logic signed [DATA_WIDTH-1:0] ram [0:NUM_PIXELS-1];
  logic signed [DATA_WIDTH-1:0] init_mem [0:NUM_NEURONS*NUM_PIXELS-1];

  initial begin
    if (INIT_FILE != "") begin
      $readmemh(INIT_FILE, init_mem);
      for (int p = 0; p < NUM_PIXELS; p++) begin
        ram[p] = init_mem[NEURON_ID*NUM_PIXELS+p];
      end
    end
  end

  always_ff @(posedge clk) begin  // SV sequential block: flip-flop behavior triggered by clock edge.
    if (wr_en) begin
      ram[wr_addr] <= wr_data;
    end
    rd_data <= ram[rd_addr];
  end

`ifdef SIM_DEBUG  // Keep debug readback out of synthesis/builds unless SIM_DEBUG is enabled.
  assign debug_data = ram[debug_addr];
`endif

endmodule
