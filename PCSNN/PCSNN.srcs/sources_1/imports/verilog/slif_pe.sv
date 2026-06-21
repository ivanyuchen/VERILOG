
`timescale 1ns / 1ps

module slif_pe (
    input logic clk,
    input logic rst_n,

    input  logic signed [ 25:0] I,
    input  logic        [2-1:0] Control,
    output logic                Spike_out

);

  localparam logic signed [25:0] V_THR = 26'sd512;

  localparam logic [1:0] State_clear_V = 2'b00;
  localparam logic [1:0] State_Wait = 2'b01;
  localparam logic [1:0] State_Update = 2'b10;
  localparam logic [1:0] State_Spike = 2'b11;

  logic signed [25:0] V;
  logic signed [25:0] V_next;
  logic signed [25:0] V_update;
  logic spike_next;

  assign V_update  = V - (V >>> 3) + I;
  assign spike_next = (V_update > V_THR);

  always_comb begin
    V_next = V;

    case (Control)
      State_clear_V: V_next = 26'sd0;
      State_Wait:    V_next = V;
      State_Update:  V_next = V;
      State_Spike:   V_next = spike_next ? 26'sd0 : V_update;
      default:       V_next = V;
    endcase
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      V <= 26'sd0;
      Spike_out <= 1'b0;
    end else begin
      case (Control)
        State_clear_V: Spike_out <= 1'b0;
        State_Spike:   Spike_out <= spike_next;
        default:       Spike_out <= Spike_out;
      endcase

      V <= V_next;
    end
  end



endmodule
