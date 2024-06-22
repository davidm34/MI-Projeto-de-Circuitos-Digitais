module caixa_agua(Alta, Media, Baixa,Erro, Alarme, Ve, Caixa);

	input Alta, Media, Baixa;
	output Erro, Alarme, Ve, Caixa;
	wire S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10,S20;


	// Baixa'
	not Baixa_not(S0, Baixa);

	// Media.Baixa'
	and MediaBaixa_not(S1, Media, S0);

	// Media'
	not Media_not(S2, Media);

	// Alta.Media'
	and AltaMedia_not(S3, Alta, S2);

	// Alta.Media' + Media.Baixa'
	or saida_erro(S6, S3, S1);

	// Erro'
	not fio1(S7, S6);

	// Erro = Alta.Media' + Media.Baixa'
	not fio2(Erro, S7);



	// Alta.Media.Baixa
	and Todos_Nivel(S4, Alta, Media, Baixa);

	// Ve = '(Alta.Media.Baixa + Erro)
	nor Nivel_Erro(Ve, S6, S4);

	// Erro
	not fio3_not(S8, S7);

	// Erro + Baixa'
	nor saida_alarme(S20, S8, S0);

	// Alarme = Erro + Baixa'
	not fio_para_alarme(Alarme, S20);


	// Caixa = Media.(Erro + Baixa')
	and saida_caixa(Caixa, Media, S20);


endmodule 