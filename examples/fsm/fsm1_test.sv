module fsm1_test;
  
    typedef enum logic [1:0] {IDLE, READ, DELAY, DONE} states_t;

    logic go, ws, clock, reset_n;
    logic rd, ds;

    fsm1 uut (.*);

    parameter Tclock = 100;

    initial begin
      clock = 0;
      forever #(Tclock/2) clock = ~clock;
    end

    initial begin
      {go, ws, reset_n} = '0;
      #Tclock reset_n = 1;

      @(negedge clock)
      assert (uut.state == IDLE) else $error("state - expected: %s , actual: %s",IDLE, uut.state);
      assert (ds == 0) else $error("ds - expected: %b , actual: %b",1'b0,ds);
      assert (rd == 0) else $error("ds - expected: %b , actual: %b",1'b0,rd);

      @(negedge clock)
      assert (uut.state == IDLE) else $error("state - expected: %s , actual: %s",IDLE,uut.state);
      assert ({ds,rd} == {1'b0,1'b0}) else $error("{ds,rd} - expected: %b,%b , actual: %b,%b",1'b0,1'b0,ds,rd);

      go = 1;
      @(negedge clock) check(1'b0, 1'b1, READ);
      @(negedge clock) check(1'b0, 1'b1, DELAY);

      go = 0; ws = 1;
      @(negedge clock) check(1'b0, 1'b1, READ);
      @(negedge clock) check(1'b0, 1'b1, DELAY);

      ws = 0;
      @(negedge clock) check(1'b1,1'b0,DONE);
      @(negedge clock) check(1'b0,1'b0,IDLE);

      #(2*Tclock) $finish;
    end

    task check (input logic a, b, states_t state);
      assert (uut.state == state)  else $error("state - expected: %d , actual: %d",state,uut.state);
      assert ({ds,rd} == {a,b}) else $error("{ds,rd} - expected: %b,%b , actual: %b,%b",a,b,ds,rd);
    endtask

    initial begin
      $timeformat(-9, 2, " ns", 10);
      $monitor("%0t - go=%b ws=%b: state=%s(%0d): rd=%b ds=%b",$realtime, go,ws,uut.state,uut.state,rd,ds);
    end

endmodule