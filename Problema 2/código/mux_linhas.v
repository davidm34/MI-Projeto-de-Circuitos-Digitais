// mux para linhas da matriz de leds
module mux_linhas(l0, l1, l2, l3, l4, l5, l6, l0_rega, l1_rega, l2_rega, l3_rega, l4_rega, l5_rega, l6_rega, l0_caixa, l1_caixa, l2_caixa,l3_caixa, l4_caixa, l5_caixa, l6_caixa,sel);

	input  l0_rega, l1_rega, l2_rega, l3_rega, l4_rega, l5_rega, l6_rega, l0_caixa, l1_caixa, l2_caixa,l3_caixa, l4_caixa, l5_caixa, l6_caixa,sel;
	output l0, l1, l2, l3, l4, l5, l6;
	
	wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13;
	
	
	// Linha 0
	and (s0,  l0_rega, sel);
	and (s1, l0_caixa, !sel);
	or (l0, s0, s1);
	
	// Linha 1
	and (s2, l1_rega, sel);
	and (s3, l1_caixa, !sel);
	or  (l1, s2, s3);
	
	// Linha 2
	and and4 (s4, l2_rega, sel);
	and and5 (s5, l2_caixa, !sel);
	or or2 (l2, s4, s5,);
	
	// Linha 3
	and and6 (s6, l3_rega, sel);
	and and7 (s7, l3_caixa, !sel);
	or or3 (l3, s6, s7);
	
	// Linha 4
	and and8 (s8, l4_rega, sel);
	and and9 (s9, l4_caixa, !sel);
	or or4 (l4, s8, s9);
	
	// Linha 5
	and and10 (s10, l5_rega, sel);
	and and11 (s11, l5_caixa, !sel);
	or or5 (l5, s10, s11);
	
	// Linha 6	
	and and12 (s12, l6_rega, sel);
	and and13 (s13,l6_caixa, !sel);
	or or6 (l6, s12, s13);
	
endmodule