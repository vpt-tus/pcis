`timescale 1ns / 1ps
module alu_74181_subset_test;
    // Inputs 
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] S;    
    reg M;
    
    // Outputs    
    wire [3:0] F; 
   
    // Instantiate the Unit Under Test (UUT)
    alu_74181_subset uut (
        .A(A),
        .B(B),
        .S(S),
	  .M(M),
        .F(F)          	
    );
   
    initial begin              
	  $monitor("%b %b %b %b -> %b",M, S, A, B, F);	
		
	  M = 1; S = 4'b0000;
        $display("\nF = not A");
        $display("M    S    A    B ->    F");     
        #100 A = 4'b1111;
        #100 A = 4'b0001;
        #100 A = 4'b1000;                  
        #100 A = 4'b0101;
        #100 A = 4'b0000;         
        #100;
        
        M = 0;
        $display("\nF = A");
        $display("M    S    A    B ->    F");  
        #100 A = 4'b1111;
        #100 A = 4'b0001;
        #100 A = 4'b1000;                  
        #100 A = 4'b0101;
        #100 A = 4'b0000;         
        #100;        

	  M = 1; S = 4'b0001;
        $display("\nF = not A or not B");        
        $display("M    S    A    B ->    F");
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000;         
        #100;                         

        M = 0;
        $display("\nF = A or B");        
        $display("M    S    A    B ->    F");       
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000;        
        #100;     
        
	  M = 1; S = 4'b0010;
        $display("\nF = not A and B");        
        $display("M    S    A    B ->    F");         
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000; 
        #100;                         

        M = 0;
        $display("\nF = A or not B");        
        $display("M    S    A    B ->    F");       
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000;        
        #100;   
        
	  M = 1; S = 4'b0011;
        $display("\nF = 0");        
        $display("M    S    A    B ->    F");         
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000; 
        #100;                         

        M = 0;
        $display("\nF = -1");        
        $display("M    S    A    B ->    F");       
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000;        
        #100;   
        
	  M = 1; S = 4'b0100;
        $display("\nF = not (A and B)");        
        $display("M    S    A    B ->    F");         
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000; 
        #100;                         

        M = 0;
        $display("\nF = A + (A and not B)");        
        $display("M    S    A    B ->    F");       
        #100 A = 4'b0001; B = 4'b0000;                  
        #100 A = 4'b0001; B = 4'b0001; 
        #100 A = 4'b1111; B = 4'b1111; 
        #100 A = 4'b0101; B = 4'b1010; 
        #100 A = 4'b1000; B = 4'b1111;
        #100 A = 4'b0000; B = 4'b0000;        
        #100;                              	
               
        $finish;
    end          	
endmodule
