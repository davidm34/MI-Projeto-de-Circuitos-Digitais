module levelToPulse(Clock,Level,Pulse);
	input Clock, Level;
	output Pulse;
	
	wire D0, D1, Q0, Q1;
	
	flipflopd(Clock, Level, Q0);
	
	and(D1, Level, Q0);
	
	flipflopd(Clock, D1, Q1);
	
	and(Pulse, Q0, !Q1);

endmodule 