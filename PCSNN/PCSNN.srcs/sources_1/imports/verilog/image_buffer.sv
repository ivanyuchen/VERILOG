`timescale 1ns / 1ps

module image_buffer #(
    parameter int INPUT_DIM = 784,
    parameter int PIXEL_BITS = 8,
    parameter logic [31:0] LFSR_SEED = 32'h1ACE_B00C
) (
    input logic clk,
    input logic rst_n,

    input logic [INPUT_DIM*PIXEL_BITS-1:0] X_t,
    input logic [2:0] Control,

    output logic [INPUT_DIM-1:0] X_out
);

  localparam logic [2:0] State_Clear = 3'b000;
  localparam logic [2:0] State_Load = 3'b001;
  localparam logic [2:0] State_Random = 3'b010;
  localparam logic [2:0] State_Hold = 3'b011;
  localparam logic [2:0] State_Send = 3'b100;

  logic [INPUT_DIM*PIXEL_BITS-1:0] image_reg;
  logic [31:0] lfsr;

  function automatic logic [31:0] next_lfsr32(input logic [31:0] value);
    logic feedback;
    begin
      feedback = value[31] ^ value[21] ^ value[1] ^ value[0];
      next_lfsr32 = {value[30:0], feedback};
    end
  endfunction

  function automatic logic [7:0] random_byte(input logic [31:0] seed, input logic [9:0] index);
    logic [31:0] mixed;
    begin
      mixed = seed ^ {index[7:0], index[9:2] ^ 8'hA5, index[7:0] + 8'h3D, ~index[9:2]};
      random_byte = mixed[7:0] ^ mixed[15:8] ^ mixed[23:16] ^ mixed[31:24];
    end
  endfunction

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      image_reg <= '0;
      X_out <= '0;
      lfsr <= LFSR_SEED;
    end else begin
      case (Control)
        State_Clear: begin
          image_reg <= '0;
          X_out <= '0;
          lfsr <= LFSR_SEED;
        end

        State_Load: begin
          image_reg <= X_t;
        end

        State_Random: begin
          lfsr <= next_lfsr32(lfsr);

          for (int pixel = 0; pixel < INPUT_DIM; pixel = pixel + 1) begin
            X_out[pixel] <= (random_byte(lfsr, pixel[9:0]) <
                             image_reg[pixel*PIXEL_BITS+:PIXEL_BITS]);
          end
        end

        State_Send: begin
          for (int pixel = 0; pixel < INPUT_DIM; pixel = pixel + 1) begin
            X_out[pixel] <= (image_reg[pixel*PIXEL_BITS+:PIXEL_BITS] != '0);
          end
        end

        State_Hold: begin
          X_out <= X_out;
        end

        default: begin
          X_out <= X_out;
        end
      endcase
    end
  end

endmodule
