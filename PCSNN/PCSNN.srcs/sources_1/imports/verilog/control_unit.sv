`timescale 1ns / 1ps

module control_unit #(
    parameter int INPUT_DIM  = 784,
    parameter int TIME_STEPS = 15,
    parameter int PIXEL_ADDR_WIDTH = (INPUT_DIM <= 1) ? 1 : $clog2(INPUT_DIM),
    parameter int TIME_ADDR_WIDTH = (TIME_STEPS <= 1) ? 1 : $clog2(TIME_STEPS)
) (
    input logic clk,
    input logic rst_n,

    input logic start,

    output logic [5:0] Control,
    output logic busy,
    output logic done
);

  localparam logic [1:0] Control_Clear  = 2'b00;
  localparam logic [1:0] Control_Wait   = 2'b01;
  localparam logic [1:0] Control_Update = 2'b10;
  localparam logic [1:0] Control_Spike  = 2'b11;

  localparam logic [2:0] Image_Buffer_Load = 3'b001;
  localparam logic [2:0] Image_Buffer_Random = 3'b010;
  localparam logic [2:0] Image_Buffer_Hold_State = 3'b011;

  localparam logic [PIXEL_ADDR_WIDTH-1:0] LAST_PIXEL = PIXEL_ADDR_WIDTH'(INPUT_DIM - 1);
  localparam logic [TIME_ADDR_WIDTH-1:0] LAST_TIMESTEP = TIME_ADDR_WIDTH'(TIME_STEPS - 1);

  // State flow:
  //
  //   Idle
  //     Wait for a rising edge on start.
  //
  //   Load_Image
  //     Tell image_buffer to latch the external grayscale image X_t.
  //     This runs once at the beginning of one inference.
  //
  //   Clear
  //     Clear SNN layer internal runtime state such as voltage/spikes/pixel address.
  //
  //   For each timestep:
  //     Random
  //       Ask image_buffer to generate one Poisson spike frame from the stored image.
  //
  //     Wait -> Update
  //       One pixel is processed through the SNN layer.
  //       Wait gives the weight BRAM/address path one cycle to settle.
  //       Update consumes that pixel/weight result.
  //       These two states repeat for all INPUT_DIM pixels.
  //
  //     Spike
  //       After all pixels in the timestep are accumulated, update neuron spike output.
  //
  //     Count
  //       Add this timestep's spike output into spike_count.
  //       If this was not the last timestep, go back to Random.
  //
  //   Done
  //     Inference is complete. Hold done high until start is released.
  typedef enum logic [3:0] {
    State_Idle,
    State_Load_Image,
    State_Clear,
    State_Random,
    State_Wait,
    State_Update,
    State_Spike,
    State_Count,
    State_Done
  } state_t;

  state_t state;
  logic   start_d;
  logic   start_pulse;
  logic [PIXEL_ADDR_WIDTH-1:0] pixel_counter;
  logic [TIME_ADDR_WIDTH-1:0] timestep_counter;
  logic [1:0] snn_control;
  logic [2:0] image_buffer_control;
  logic spike_count_en;

  assign start_pulse = start & ~start_d;
  assign busy = (state != State_Idle) && (state != State_Done);
  assign done = (state == State_Done);
  assign spike_count_en = (state == State_Count);
  assign Control = {spike_count_en, image_buffer_control, snn_control};

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      start_d <= 1'b0;
    end else begin
      start_d <= start;
    end
  end

  always_comb begin
    case (state)
      State_Clear:      snn_control = Control_Clear;
      State_Load_Image: snn_control = Control_Wait;
      State_Random:     snn_control = Control_Wait;
      State_Wait:       snn_control = Control_Wait;
      State_Update:     snn_control = Control_Update;
      State_Spike:      snn_control = Control_Spike;
      State_Count:      snn_control = Control_Wait;
      State_Done:       snn_control = Control_Wait;
      default:          snn_control = Control_Clear;
    endcase
  end

  always_comb begin
    case (state)
      State_Load_Image: image_buffer_control = Image_Buffer_Load;
      State_Random:     image_buffer_control = Image_Buffer_Random;
      default:          image_buffer_control = Image_Buffer_Hold_State;
    endcase
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= State_Idle;
      pixel_counter <= '0;
      timestep_counter <= '0;
    end else begin
      case (state)
        State_Idle: begin
          // Idle state: counters are reset and the unit waits for a new start pulse.
          pixel_counter <= '0;
          timestep_counter <= '0;

          if (start_pulse) begin
            state <= State_Load_Image;
          end
        end

        State_Load_Image: begin
          // Load the input image into image_buffer once before inference begins.
          pixel_counter <= '0;
          timestep_counter <= '0;
          state <= State_Clear;
        end

        State_Clear: begin
          // Clear SNN runtime state before the first timestep.
          pixel_counter <= '0;
          timestep_counter <= '0;
          state <= State_Random;
        end

        State_Random: begin
          // Generate one Poisson spike frame for the current timestep.
          pixel_counter <= '0;
          state <= State_Wait;
        end

        State_Wait: begin
          // Wait one cycle so pixel/weight address data is stable before Update.
          state <= State_Update;
        end

        State_Update: begin
          // Process one pixel. Repeat Wait/Update until all INPUT_DIM pixels are done.
          if (pixel_counter == LAST_PIXEL) begin
            pixel_counter <= '0;
            state <= State_Spike;
          end else begin
            pixel_counter <= pixel_counter + 1'b1;
            state <= State_Wait;
          end
        end

        State_Spike: begin
          // All pixels for this timestep are accumulated; produce neuron spikes.
          state <= State_Count;
        end

        State_Count: begin
          // Accumulate current timestep spikes into spike_count, then move to next timestep.
          if (timestep_counter == LAST_TIMESTEP) begin
            state <= State_Done;
          end else begin
            timestep_counter <= timestep_counter + 1'b1;
            state <= State_Random;
          end
        end

        State_Done: begin
          // Inference is complete. Return to Idle only after start goes low.
          if (!start) begin
            state <= State_Idle;
          end
        end

        default: begin
          state <= State_Idle;
          pixel_counter <= '0;
          timestep_counter <= '0;
        end
      endcase
    end
  end

endmodule
