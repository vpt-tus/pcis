module encoder_if(
  input IRQ3, IRQ2, IRQ1,
  output logic [1:0] ENC);

always_comb
  if (IRQ3)
    ENC = 3;
  else if (IRQ2)
    ENC = 2;
  else if (IRQ1)
    ENC = 1;
  else
    ENC = 0;

endmodule

module encoder_test;
logic IRQ3, IRQ2, IRQ1;
logic [1:0] ENC;

encoder_if uut (.*);

initial $monitor("%b %b %b -> %d", IRQ3, IRQ2, IRQ1, ENC);

initial begin
  {IRQ3, IRQ2, IRQ1} = 3'b100;
  #1 assert (ENC==3);

  {IRQ3, IRQ2, IRQ1} = 3'b010;
  #1 assert (ENC==2);

  {IRQ3, IRQ2, IRQ1} = 3'b001;
  #1 assert (ENC==1);

  {IRQ3, IRQ2, IRQ1} = 3'b000;
  #1 assert (ENC==0);

  {IRQ3, IRQ2, IRQ1} = 3'b111;
  #1 assert (ENC==3);

  {IRQ3, IRQ2, IRQ1} = 3'b011;
  #1 assert (ENC==2);
  $finish;
end
endmodule
