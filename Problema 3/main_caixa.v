module main_caixa(Alta, Media, Baixa, Solo, Umidade, Temperatura,Erro, Alarme, Ve, Caixa, Gotejamento, Aspersao);

  // Entradas
  input Alta, Media, Baixa, Solo, Umidade, Temperatura; 
  
  // Saídas
  output Erro, Alarme, Ve, Caixa, Gotejamento, Aspersao;
  
  // Instanciando o módulo de caixa de água
  caixa_agua dut_caixa(
    .Alta(Alta),
    .Media(Media),
    .Baixa(Baixa),
    .Erro(Erro),
    .Alarme(Alarme),
    .Ve(Ve),
    .Caixa(Caixa)
  );
  
  // Instanciando o módulo de irrigação
  irrigacao dut_irrigacao(
    .Solo(Solo),
    .Umidade(Umidade),
    .Temperatura(Temperatura),
    .Caixa(Caixa),
    .Alarme(Alarme),
    .Aspersao(Aspersao),
    .Gotejamento(Gotejamento)
  );

	
endmodule
