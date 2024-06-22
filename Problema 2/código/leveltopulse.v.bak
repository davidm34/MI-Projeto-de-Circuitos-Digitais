module leveltopulse(clk, ch, p);
	input ch, clk;
	output p;
	
	flipflopd(clk, ch, q0, q0n, rst);
	flipflopd(clk, d1, q1, q1n, rst);
	
	and(d1, ch, q0);
	
	and(p, q0, !q1);
	

endmodule 