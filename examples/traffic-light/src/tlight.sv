module tlight(
  input clock, reset, // clock period is 1s
  output logic [2:0] ns, we
);

  typedef enum logic[2:0] {s1, s2, s3, s4} state_type;
  state_type state, next_state;

  logic [3:0] timer, next_timer;

  parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;
  parameter YELLOW_DURATION = 2; // 3s
  parameter RED_GREEN_DURATION = 14; // 15s

  always_ff @(posedge clock or posedge reset) begin
    if(reset) begin
      state <= s1;
    end
    else begin
      state <= next_state;
    end
  end

  always_ff @(posedge clock or posedge reset) begin
    if(reset) begin
      timer <= YELLOW_DURATION;
    end
    else begin
      if(timer==0)
        timer <= next_timer;
      else
        timer <= timer - 1;
    end
  end

  always_comb begin
    next_state = state;

    case (state)
      s1: begin
        ns = YELLOW;
        we = YELLOW;
        if(timer==0)begin
          next_state = s2;
          next_timer = RED_GREEN_DURATION;
        end
      end
      s2: begin
        ns = RED;
        we = GREEN;
        if(timer==0)begin
          next_state = s3;
          next_timer = YELLOW_DURATION;
        end
      end
      s3: begin
        ns = YELLOW;
        we = YELLOW;
        if(timer==0)begin
          next_state = s4;
          next_timer = RED_GREEN_DURATION;
        end
      end
      s4: begin
        ns = GREEN;
        we = RED;
        if(timer==0)begin
          next_state = s1;
          next_timer = YELLOW_DURATION;
        end
      end
    endcase
  end
endmodule