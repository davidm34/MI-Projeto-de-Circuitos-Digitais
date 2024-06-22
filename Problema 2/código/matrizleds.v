module matrizleds(frequencia_display, col, l0, l1, l2, l3, l4, l5, l6, Alta, Media, Baixa, Aspersao, Gotejamento, seletor);

	 input Aspersao, Gotejamento, frequencia_display, seletor;
	 wire [3:0] q;
	 
	 wire regal0, regal1, regal2, regal3, regal4, regal5, regal6,  caixal0, caixal1, caixal2, caixal3, caixal4, caixal5, caixal6;
	 
	 input Alta, Media, Baixa;
	 inout [4:0] col;
	 output l0,l1,l2,l3,l4,l5,l6;
	 
	 
	contadormatriz(frequencia_display, q);
	
	demux1x5 (1,col,q);
	
   decoder_linhas_irrigacao(Aspersao, Gotejamento, col ,regal0, regal1, regal2, regal3, regal4, regal5, regal6);
	
	decoder_linhas_caixa(Alta, Media, Baixa, col, caixal0, caixal1, caixal2, caixal3, caixal4, caixal5, caixal6);
	
	mux_linhas(l0, l1, l2, l3, l4, l5, l6, regal0, regal1, regal2, regal3, regal4, regal5, regal6, caixal0, caixal1, caixal2, caixal3, caixal4, caixal5, caixal6, seletor);
	
	
endmodule

