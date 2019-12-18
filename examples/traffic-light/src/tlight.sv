module tlight(
  input clock, reset, // clock period is 1s
  output logic [2:0] ns, we
);

  typedef enum logic[2:0] {RESET, WE_READY_TO_GO, WE_GO, WE_PREPARE_TO_STOP, NS_READY_TO_GO, NS_GO, NS_PREPARE_TO_STOP} state_type;
  state_type state, state_next;

  logic [3:0] timer, timer_next;

  parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;
  parameter YELLOW_DURATION = 2; // 3s
  parameter RED_GREEN_DURATION = 14; // 15s

  always_ff @(posedge clock or posedge reset) begin
    if(reset) begin
      state <= RESET;
    end
    else begin
      state <= state_next;
    end
  end

  always_ff @(posedge clock or posedge reset) begin
    if(reset) begin
      timer <= '0;
    end
    else begin
      timer <= timer_next;
    end
  end

  always_comb begin
    state_next = state;

    case (state)
      RESET: begin
        ns = RED;
        we = RED;
        timer_next = YELLOW_DURATION;
        state_next = WE_READY_TO_GO;
      end
      WE_READY_TO_GO: begin
        ns = RED;
        we = YELLOW;
        if(timer_next==0)begin
          state_next = WE_GO;
          timer_next = RED_GREEN_DURATION;
        end
        else
          timer_next = timer - 1;
      end
      WE_GO: begin
        ns = RED;
        we = GREEN;
        if(timer_next==0)begin
          state_next = WE_PREPARE_TO_STOP;
        end
        else
          timer_next = timer - 1;
      end
      WE_PREPARE_TO_STOP: begin
        ns = RED;
        we = YELLOW;        
        state_next = NS_READY_TO_GO;
        timer_next = YELLOW_DURATION;
      end
      NS_READY_TO_GO: begin
        ns = YELLOW;
        we = RED;
        if(timer_next==0)begin
          state_next = NS_GO;
          timer_next = RED_GREEN_DURATION;
        end
        else
          timer_next = timer - 1;
      end
      NS_GO: begin
        ns = GREEN;
        we = RED;
        if(timer_next==0)begin
          state_next = NS_PREPARE_TO_STOP;
          timer_next = YELLOW_DURATION;
        end
        else
          timer_next = timer - 1;
      end
      NS_PREPARE_TO_STOP: begin
        ns = YELLOW;
        we = RED;        
        state_next = WE_READY_TO_GO;
      end      
    endcase
  end
endmodule