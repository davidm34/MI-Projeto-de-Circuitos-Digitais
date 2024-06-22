module decoder_linhas_caixa(alto, medio, baixo, col, l0, l1, l2, l3, l4, l5, l6);

	input alto, medio, baixo;
	input [4:0]col;
	output l0, l1, l2, l3, l4, l5, l6;

	wire desenho_baixo, desenho_baixo1, col0_1, saida1, col2_3_4, desenho_critico1, desenho_l1, desenho_baixo3, saida_3, desenho_critico3, desenho_linha3;
	wire saida_4b, saida_4c, desenho_vazio5, saida_5v, desenho_erro5, saida_5e,saida_l5;

	// Linha 0
	or (desenho_baixo0, !medio, baixo);
	and (l0, !alto, desenho_baixo0);

	// Linha 1
	or (col0_1, col[0], col[1]);
	and (saida1, col0_1, l0);
	
	or (col2_3_4, col[2], col[3], col[4]);
	and (desenho_baixo1, !alto, baixo);
	
	or (desenho_critico1, desenho_baixo1, !medio, !baixo);
	and (desenho_l1, desenho_critico1, col2_3_4);
	or (l1, saida1, desenho_l1);

	// Linha 2
	or (l2, saida1, desenho_l1);

	// Linha 3
	and (desenho_baixo3, !alto, !medio);
	or (col0_1_2_3, col[0], col[1], col[2], col[3]);
	and (saida_3, desenho_baixo3, col0_1_2_3);
	
	or (desenho_critico3, !medio, !baixo);
	and (desenho_linha3, desenho_critico3, col[4]);
	or (l3, saida_3, desenho_linha3);

	// Linha 4
	and (saida_4b, col0_1, desenho_baixo3);
	and (saida_4c, desenho_critico3, col2_3_4);
	or (l4, saida_4b, saida_4c);

	// Linha 5
	and (desenho_vazio5, !alto, !medio, !baixo);
	and (saida_5v, desenho_vazio5, col0_1);
	and (desenho_erro5, alto, !medio);
	
	or (saida_5e, desenho_erro, !baixo);
	and (saida_l5,saida_5e , col2_3_4);
	or (l5, saida_5v,saida_l5);

	// Linha 6
	and (l6, !alto, !medio, !baixo);

endmodule 