package tlight_package;
  typedef enum logic [2:0]{
    RED = 3'b100,
    YELLOW = 3'b010,
    GREEN = 3'b001} tlight_control_t;
endpackage

import tlight_package::*;

module tlight_v1(
  input clock, reset,
  output tlight_control_t ns, we
);

  enum logic[1:0] {S1, S2, S3, S4} state, state_next;

  logic [3:0] timer, timer_next;

  parameter YELLOW_DURATION = 3;
  parameter RED_GREEN_DURATION = 15;

  always_ff @(posedge clock or posedge reset)
    if (reset)
      state <= S1;
    else
      state <= state_next;

  always_ff @(posedge clock, posedge reset)
    if (reset) begin
      timer <= YELLOW_DURATION;
    end else begin
      timer <= timer_next;
    end

  always_comb begin
    state_next = state;
    case (state)
      S1: begin
        ns = YELLOW;
        we = YELLOW;
        if (timer == 0) begin
          state_next = S2;
          timer_next = RED_GREEN_DURATION;
        end else begin
          timer_next = timer - 1;
        end
      end
      S2: begin
        ns = RED;
        we = GREEN;
        if (timer == 0) begin
          state_next = S3;
          timer_next = YELLOW_DURATION;
        end else begin
          timer_next = timer - 1;
        end
      end
      S3: begin
        ns = YELLOW;
        we = YELLOW;
        if (timer == 0) begin
          state_next = S4;
          timer_next = RED_GREEN_DURATION;
        end else begin
          timer_next = timer - 1;
        end
      end
      S4: begin
        ns = GREEN;
        we = RED;
        if (timer == 0) begin
          state_next = S1;
          timer_next = YELLOW_DURATION;
        end else begin
          timer_next = timer - 1;
        end
      end
    endcase
  end
endmodule
