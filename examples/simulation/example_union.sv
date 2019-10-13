module example_union;
  union {
    int x;
    int unsigned y;
  } data;

  initial begin
    data.x = -5;
    $display("data is %d", data.x);
    data.y = -5;
    $display("now data is %d", data.y);
  end
endmodule

logic [639:0] input_stream; // пакет от 640 бита
logic [39:0][15:0] packet; // 40 16-bit words

packet = input_stream; // assign to all words
data = packet[24]; // select 1 16-bit word
tag = packet[3][7:0]; // select part of 1 word