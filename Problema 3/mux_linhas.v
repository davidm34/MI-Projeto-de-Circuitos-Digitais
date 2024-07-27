// mux para linhas da matriz de leds
module mux_linhas(l, linha_encher, linha_esvaziar, sel);

	output [6:0]l;
	input [6:0]linha_encher;
	input [6:0]linha_esvaziar; 
	input sel;

	
	wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13;
	
	
	// Linha 0
	and (s0,  linha_esvaziar[0], sel);
	and (s1, linha_encher[0], !sel);
	or (l[0], s0, s1);
	
	// Linha 1
	and (s2,  linha_esvaziar[1], sel);
	and (s3, linha_encher[1], !sel);
	or (l[1], s2, s3);
	
	// Linha 2
	and (s4,  linha_esvaziar[2], sel);
	and (s5, linha_encher[2], !sel);
	or (l[2], s4, s5);
	
	// Linha 3
	and (s6,  linha_esvaziar[3], sel);
	and (s7, linha_encher[3], !sel);
	or (l[3], s6, s7);
	
	// Linha 4
	and (s8,  linha_esvaziar[4], sel);
	and (s9, linha_encher[4], !sel);
	or (l[4], s8, s9);
	
	// Linha 5
	and (s10,  linha_esvaziar[5], sel);
	and (s11, linha_encher[5], !sel);
	or (l[5], s10, s11);
	
	
	// Linha 6	
	and (s12,  linha_esvaziar[6], sel);
	and (s13, linha_encher[6], !sel);
	or (l[6], s12, s13);
	
endmodule