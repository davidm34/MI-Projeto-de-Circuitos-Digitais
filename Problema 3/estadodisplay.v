module estadodisplay(E, G, A, L, EstadoDisplay);
	input E, G, A, L;
	output [6:0] EstadoDisplay;
	
	assign EstadoDisplay[0] = L;
	not(EstadoDisplay[1], A);
	or(EstadoDisplay[2], E, L);
	assign EstadoDisplay[3] = A;
	assign EstadoDisplay[4] = 0;
	assign EstadoDisplay[5] = 0;
	or(EstadoDisplay[6], G, L);



endmodule 