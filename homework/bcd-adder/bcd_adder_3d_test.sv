import bcd::*;

module bcd_adder_3d_test;
  bcd_t [2:0] op1, op2, sum;
  logic cin, cout;

  bcd_adder_3d uut(.*);

  task test_vector (
    input bcd_t [2:0] op1_test, op2_test,
    input cin_test,
    input cout_expected,
    input bcd_t [2:0] sum_expected);

    op1 = op1_test;
    op2 = op2_test;
    cin = cin_test;

    #10 assert (sum_expected == sum);
    assert (cout_expected == cout);
  endtask

  initial begin
    test_vector(
      {4'd0,4'd0,4'd2},	// op1_test
      {4'd0,4'd0,4'd2},	// op2_test
      0,					// cin_test
      0,					// cout_expected
      {4'd0,4'd0,4'd4});	// sum_expected

    test_vector({'0,'0,'0}, {'0,'0,'0}, 0, 0, {'0,'0,'0});
    test_vector({'0,'0,'0}, {'0,'0,'0}, 1, 0, {'0,'0,'1});
    test_vector({4'd9,4'd9,4'd9}, {'0,'0,'0}, 1, 1, {'0,'0,'0});
    test_vector({4'd5,4'd6,4'd7}, {4'd2,4'd8,4'd5}, 0, 0, {4'd8,4'd5,4'd2});        
    test_vector({4'd5,4'd6,4'd7}, {4'd2,4'd8,4'd5}, 1, 0, {4'd8,4'd5,4'd3});    
    test_vector({4'd9,4'd9,4'd9}, {4'd9,4'd9,4'd9}, 1, 1, {4'd9,4'd9,4'd9});    

    $finish;
  end

  initial $monitor("%0d%0d%0d + %0d%0d%0d + %b = %0b%0d%0d%0d",op1[2], op1[1], op1[0], op2[2], op2[1], op2[0], cin, cout, sum[2],sum[1],sum[0]);
endmodule