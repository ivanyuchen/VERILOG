module slif_stream_pe #(
    parameter int DATA_WIDTH = 16,
    parameter int ACC_WIDTH = 48,
    parameter int LEAK_SHIFT = 3
) (
    input  logic clk,
    input  logic rst_n,
    input  logic clear_v,
    input  logic update_en,
    input  logic signed [ACC_WIDTH-1:0] current_in,
    input  logic signed [DATA_WIDTH-1:0] threshold,
    output logic spike_out,
    output logic signed [DATA_WIDTH-1:0] voltage
);

  localparam signed [DATA_WIDTH-1:0] V_MAX = {1'b0, {(DATA_WIDTH-1){1'b1}}};
  localparam signed [DATA_WIDTH-1:0] V_MIN = {1'b1, {(DATA_WIDTH-1){1'b0}}};

  logic signed [ACC_WIDTH-1:0] voltage_sum;
  logic signed [DATA_WIDTH-1:0] voltage_next;

  assign voltage_sum = $signed(voltage) - $signed(voltage >>> LEAK_SHIFT) + current_in;
  assign voltage_next = (voltage_sum > V_MAX) ? V_MAX :
                        (voltage_sum < V_MIN) ? V_MIN :
                        voltage_sum[DATA_WIDTH-1:0];

  always_ff @(posedge clk or negedge rst_n) begin  // Sequential logic with async active-low reset.
    if (!rst_n) begin
      voltage <= '0;
      spike_out <= 1'b0;
    end else if (clear_v) begin
      voltage <= '0;
      spike_out <= 1'b0;
    end else if (update_en) begin
      if (voltage_next > threshold) begin
        voltage <= '0;
        spike_out <= 1'b1;
      end else begin
        voltage <= voltage_next;
        spike_out <= 1'b0;
      end
    end
  end

endmodule
