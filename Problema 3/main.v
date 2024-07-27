module main (clk ,l , col, clr, a, b, c, d, e, f, g, D1, D2, D3, D4, buttom, Solo, Umidade, Temperatura, agroDefensivo, saidaAgroDefensivo);

    input clr,clk, buttom, Solo, Umidade, Temperatura, agroDefensivo;
	 wire caixaVazia, Baixa, Media, Alta;
    output [6:0] l; 
	 wire [6:0] linha_esvaziar;
	 wire [6:0] linha_encher; 
    output [4:0] col;
    wire [2:0] q;
	 wire [2:0] q_n;
	 wire [1:0] qEstado;
	 output a, b, c, d, e, f, g, D1, D2, D3, D4, saidaAgroDefensivo;
	
	 wire clear, f_aspersao;
	 wire preset; 
    wire clk1, f_gotejar,  f_gtg_asper,  frequencia_atual;

	 frequencia(1, clk, clk1, frequencia_display, frequencia_coluna, f_gotejar, f_arpersao, frequencia2); 
	 
    // varredura das colunas
    contador_coluna(col , frequencia_coluna);
	
	 main_display(a, b, c, d, e, f, g, D1, D2, D3, D4, buttom, Gotejamento, Aspersao, clk1, frequencia2, agroDefensivo, saidaAgroDefensivo);
	
    reg [26:0] k;
	  reg clkp;
	 always @(posedge clk) begin
	 if (k == 27'd70422534) begin
			k <= 0;
			clkp <= 1;
		end
	else begin
		k <= k + 1;
		clkp <= 0;
	end
	 end
  
	 
    //enchimento 
    contador_crescente(clkp ,linha_vazia, !linha_vazia, q);
    decoder_encher(q, frequencia_display, linha_encher);
	 
	 nor(Alta, l[0], l[1]);
	 nor(Media, l[3], l[4]);
	 or(Baixa, q[0], q[1]);	
	 main_caixa(Alta, Media, Baixa, Solo, Umidade, Temperatura,Erro, Alarme, Ve, Caixa, Gotejamento, Aspersao);
	 
    // esvaziamento 
    mux_frequencia(f_gotejar, f_arpersao, Gotejamento, Aspersao, frequencia_atual);
	 
	 and (linha_cheia, q[2], q[1], q[0]);
	 and (linha_vazia, !q_n[2], !q_n[1], !q_n[0]);
	 
    contador_decrescente(frequencia_atual ,clr,!linha_cheia,q_n); 
    decoder_esvaziar(q_n,  frequencia_display, linha_esvaziar); 
	 
		
	 // or(estado_descida, qEstado[0], qEstado[1]);
	 // seleciona desencer ou encher 
	 and(seletor, linha_cheia, 1);
	 mux_linhas(l, linha_encher,linha_esvaziar,seletor);
	 
	 
endmodule 