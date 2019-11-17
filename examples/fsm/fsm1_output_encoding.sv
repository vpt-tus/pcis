module fsm1_output_encoding(
    output logic rd, ds,
    input go, ws, clock, reset_n);

	// state signals
	enum logic [2:0]{
		IDLE = 3'b0_00, 
		READ = 3'b0_01, 
		DLY  = 3'b1_01, 
		DONE = 3'b0_10, 
		XX   = 3'b0_xx} state, state_next;

	assign {ds,rd} = state[1:0];

	// state register
	always_ff @(posedge clock, negedge reset_n)
			if (!reset_n) state <= IDLE;
			else state <= state_next;
			
	// next state logic
	always_comb begin
		state_next = XX;
		case (state)
			IDLE: 
				if (go) state_next = READ;
				else state_next = IDLE;
			READ: state_next = DLY;            
			DLY: 
				if (ws) state_next = READ;
				else state_next = DONE;            
			DONE: state_next = IDLE;
		endcase
	end	

endmodule