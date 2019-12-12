module timer_switch(
  input clock, // clock period is 1s
  input reset, // active high
  input btn,   // active high, duration of one clock period
  output logic light // 0 - off, 1 - on
);

  enum logic {OFF, ON} state, next_state;

  logic [4:0] timer, next_timer;

  parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;
  parameter ON_DURATION = 19; // 20s

  always_ff @(posedge clock or posedge reset) begin
    if(reset) begin
      state <= OFF;
    end
    else begin
      state <= next_state;
    end
  end

  always_ff @(posedge clock or posedge reset) begin
    if(reset) begin
      timer <= '0;
    end
    else begin
      timer <= next_timer;
    end
  end

  always_comb begin
    next_state = state;
    next_timer = timer;
    case (state)
      OFF: begin
        light = '0;
        if(btn==1)begin
          next_state = ON;
          next_timer = ON_DURATION;
          light = 1;
        end
      end
      ON: begin
        light = '1;
        if(timer==0)begin
          next_state = OFF;
        end
        else begin
          next_timer = timer - 1;
        end
        if(btn==1)begin
          next_timer = ON_DURATION; // pushing the button while in ON state will reset the timer to ON_DURATION
        end
      end
    endcase
  end
endmodule