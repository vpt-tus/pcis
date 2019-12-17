module tlight_test_2;
  logic clock, reset;
  logic [2:0] ns, we;

  tlight uut(.*);

  parameter T = 10;

  initial begin
    clock = 0;
    forever begin
      #(T/2) clock = ~clock;
    end
  end

  initial begin
    reset = 1;
    #T reset = 0;
    #(50*T) $finish;
  end

  // check that after reset the fsm is in state s1
  property after_reset_state_s1;
    @(posedge clock) $fell(reset) |-> uut.state == uut.s1;
  endproperty;
  ap_after_reset_state_s1: assert property(after_reset_state_s1);

  // check the duration of s1
  property check_s1_duration;
    @(posedge clock) uut.state == uut.s1 ##1 uut.state == uut.s2 |-> $past(uut.state==uut.s1,3);
  endproperty;

  // check the duration of s2 - after the s1 to s2 transition, the fsm stays in s2 for 15 clock cycles then jumps to s3
  property check_s2_duration;
    @(posedge clock) uut.state == uut.s1 ##1 uut.state == uut.s2 |-> uut.state==uut.s2 [*15] ##1 uut.state==uut.s3;
  endproperty;

    // check the duration of s3 - after the s2 to s3 transition, the fsm stays in s3 for 3 clock cycles then jumps to s4
  property check_s3_duration;
    @(posedge clock) uut.state == uut.s2 ##1 uut.state == uut.s3 |-> uut.state==uut.s3 [*3] ##1 uut.state==uut.s4;
  endproperty;

  // check the duration of s4 - after the s2 to s3 transition, the fsm stays in s4 for 15 clock cycles then jumps to s1
  property check_s4_duration;
    @(posedge clock) uut.state == uut.s3 ##1 uut.state == uut.s4 |-> uut.state==uut.s4 [*15] ##1 uut.state==uut.s1; 
  endproperty;

  ap_check_s1_duration: assert property(check_s1_duration);
  ap_check_s2_duration: assert property(check_s2_duration);
  ap_check_s3_duration: assert property(check_s3_duration);
  ap_check_s4_duration: assert property(check_s4_duration);

endmodule