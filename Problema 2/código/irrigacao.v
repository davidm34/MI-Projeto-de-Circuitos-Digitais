module irrigacao(Solo, Umidade, Temperatura, Caixa, Alarme, Aspersao, Gotejamento);


	input Solo, Umidade, Temperatura, Caixa, Alarme;
	output Aspersao, Gotejamento;
	wire S11, S12, S13, S14, S15, S16, S17, S18, S19,S20;

	not fio_alarme(S20,Alarme);

	// Umidade'
	not Umidade_not(S11, Umidade);
	// Temperatura'
	not Temperatura_not(S12, Temperatura);
	// Temperatura'.Caixa
	and T_notCaixa(S13, Caixa, S12);
	// (Temperatura'.Caixa + Umidade')
	or TCaixa_notUm(S14, S13, S11);
	// Solo'
	not Solo_not(S15, Solo);
	// Aspersao = Solo'(Temperatura'.Caixa + Umidade').Alarme'
	and Solo_completo(Aspersao, S15, S14,S20);

	
	// Caixa'
	not Caixa_not(S19, Caixa);
	// Temperatura + Caixa'
	or TCaixa_not(S16, Temperatura, S19);
	// Solo'.Umidade
	and SnotUm(S18, S15, Umidade);
	// Gotejamento = Solo'.Umidade(Temperatura + Caixa').Alarme'
	and saida_gotejamento(Gotejamento, S18, S16, S20);

endmodule 