module decoder_linhas_irrigacao(aspersao, gotejamento, col , l0, l1, l2, l3, l4, l5, l6);

	input aspersao, gotejamento;
	input  [4:0]col ;
	output l0, l1, l2, l3, l4, l5, l6;
	
	wire saida_col1, saida_col2, saida_col3, saida_a1, saida_a2, saida_g1, saida_g2;
	wire not_aspersao_gotejameto, aspersao_notgotejameno;
	
	and (not_aspersao_gotejameto, !aspersao, gotejamento);
	and (aspersao_notgotejameno, aspersao, !gotejamento);

	// decodificacao das linhas 
	
	
	and (l0, !aspersao, !gotejamento);
	
	or (saida_col1, col[1], col[2], col[3], col[4]);
	and  (saida_a1, saida_col1, not_aspersao_gotejameto);
	and (saida_g1, aspersao_notgotejameno, col[2]);
	or  (l1, l0, saida_a1, saida_g1);

	
	or  (l2, l0, saida_a1, saida_g1);
	
	and (saida_col2, not_aspersao_gotejameto, col[1]);
	or (l3, l0, saida_col2);
	

	or (saida_col3, col[1], col[2]);
	and (saida_a2, saida_col3, not_aspersao_gotejameto);
	and (saida_g2, aspersao_notgotejameno, col[2]);
	or (l4, l0, saida_a2, saida_g2);

   or (l5, l0, saida_a2, saida_g2);
	
	or (l6, l0, saida_g2);
	
endmodule 