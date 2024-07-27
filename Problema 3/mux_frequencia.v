module mux_frequencia(f_gotejar, f_arpersao, Gotejamento, Aspersao, frequencia_atual);

	input Gotejamento, Aspersao, f_arpersao, f_gotejar;
	output frequencia_atual;

	
	and (s1, Aspersao, f_arpersao);
	and (s2, Gotejamento, f_gotejar);
	// and (s3,  asper_gote,f_caso_especifico); 
	
	or(frequencia_atual, s1, s2);
	
	
endmodule 