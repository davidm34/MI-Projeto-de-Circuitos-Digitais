module main(clk, D1, D2, D3, D4, a, b, c, d, e, f, g, buttom, Alta, Media, Baixa, Solo, Umidade, Temperatura, Erro, Alarme, Ve, col, l0, l1, l2, l3, l4, l5, l6, seletor);
	input clk, Alta, Media, Baixa, Solo, Umidade, Temperatura, buttom, seletor;
	output D1, D2, D3, D4, a, b, c, d, e, f, g, Erro, Alarme, Ve, l0, l1, l2, l3, l4, l5, l6;
	output [4:0] col;
	
	wire Gotejamento, Aspersao;
	
	sistema_irrigacao(Alta, Media, Baixa, Solo, Umidade, Temperatura, Erro, Alarme, Ve, Gotejamento, Aspersao);
	
	wire clk1, frequencia_display, Q21;
	
	and(Sespecifica, !Solo, Umidade, !Temperatura, !Alarme);
	
	clock SaidaClock(1, clk, clk1, frequencia_display, Q21, Gotejamento, Aspersao, frequencia_matriz);
	
	contador(clk1, frequencia_display, D1, D2, D3, D4, a, b, c, d, e, f, g, Gotejamento, Aspersao, buttom, Q21, Sespecifica);
	
	matrizleds(frequencia_matriz, col, l0, l1, l2, l3, l4, l5, l6, Alta, Media, Baixa, Aspersao, Gotejamento, seletor);

endmodule 