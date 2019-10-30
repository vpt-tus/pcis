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
logic [39:0][15:0] packet; // 40 16-битови думи
packet = input_stream; // присвояване на свички думи от packet
data = packet[24]; // избор на една 16-битова дума
tag = packet[3][7:0]; // избор на част от дума