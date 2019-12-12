module timer_switch_top(
	input clock_1Hz, reset, btn_ext,
	output logic light
);

	logic btn;

	single_shot u2 (.clk(clock_1Hz),.rst(reset),.sig(btn_ext),.tick(btn));
	timer_switch u3 (.clock(clock_1Hz),.*);

endmodule