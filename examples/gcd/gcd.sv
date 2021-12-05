module gcd(
  input clk, reset, start,
  input integer a_in, b_in,
  output integer gcd_out,
  output logic ready, done_tick
);

enum {IDLE, CHECK, RUN, DONE} state, state_next;
integer a_next, b_next, a, b;

assign gcd_out = a;

always_ff @ (posedge clk, posedge reset)
  if(reset) begin
    state <= IDLE;
    a <= 0;
    b <= 0;
  end else begin
    state <= state_next;
    a <= a_next;
    b <= b_next;
  end;

always_comb begin
  state_next = state;
  ready = '0;
  done_tick = '0;
  a_next = a;
  b_next = b;

  case(state)
  IDLE: begin
    ready = '1;
    if (start) begin
      assert(a_in | b_in) else $error("gcd(0,0) is undefined");
      a_next = a_in;
      b_next = b_in;
      state_next = CHECK;
    end
  end
  CHECK: 
    if (a==0 || b==0) begin
      a_next = 0;
      state_next = DONE;
    end else 
      state_next = RUN;
  RUN: 
    if (b==0) 
      state_next = DONE;
    else if (a >= b) 
      a_next = a - b;
    else begin
      a_next = b;
      b_next = a;
    end
  DONE: begin
    state_next = IDLE;
    done_tick = '1;
  end
  endcase
end;
endmodule
