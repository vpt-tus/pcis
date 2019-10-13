import definitions::*; // import package into $unit space
module alu_test;
  instruction_t instr;
  data_t alu_out;

  alu uut (.*);

  initial begin
    instr.opc = ADD;
    instr.op_type = UNSIGNED;
    instr.op_a = 24'h0005;
    instr.op_b = 24'h0003;
    #10;
    instr.opc = SUB;
    #10;
    instr = '{MULT,UNSIGNED,24'd12,24'd3};
    #10;
    $finish;
  end

  initial begin
    $monitor(alu_out);
  end
endmodule