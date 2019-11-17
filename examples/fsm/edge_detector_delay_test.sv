`timescale 1us / 1ns

module edge_detector_delay_test;
 
logic clk, sig, tick, rst;

edge_detector_delay #(.DELAY(20)) uut (.*);

localparam T = 10;
initial begin  
   clk = 0;
   forever #(T/2) clk = ~clk;
end

initial begin
   sig = 0;
   rst = 1;
   #T rst = 0;
   
   #42 sig = 1;        
   #17 sig = 0;
   #3 sig = 0;     
   #8 sig = 1;
   #7 sig = 0;
   #8 sig = 1;
   #11 sig = 0;     
   #13 sig = 1;
   #7 sig = 0;
   #3 sig = 1; 
   #300 sig = 0;
                    
   #100 $finish; 
end

initial begin
    @(posedge sig);
    @(posedge clk) assert (tick == 1'b0) else $error("tick: expected=%b, actual=%b",1'b0,tick); 
    @(posedge clk) assert (tick == 1'b1) else $error("tick: expected=%b, actual=%b",1'b1,tick); 
    @(posedge clk) assert (tick == 1'b0) else $error("tick: expected=%b, actual=%b",1'b0,tick);         
end

initial 
    $monitor("%t sig=%b, tick=%b",$time,sig,tick);
    
endmodule
