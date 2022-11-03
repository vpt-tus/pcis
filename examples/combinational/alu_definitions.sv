// SystemVerilog for Design, 2nd ed, p175

package definitions;
  typedef enum logic [2:0] {ADD,SUB,MULT,DIV,SL,SR} opcode_t;
  typedef enum logic {UNSIGNED, SIGNED} operand_type_t;
  typedef union packed {
    logic [23:0] u_data;
    logic signed [23:0] s_data;
  } data_t;
  typedef struct packed {
    opcode_t opc;
    operand_type_t op_type;
    data_t op_a;
    data_t op_b;
  } instruction_t;
endpackage