 module display_caixa(Alta, Media, Baixa, Erro, D1, D2, D3, A, G, D, B, F, E, C);
	input Alta, Media, Baixa, Erro;
	output D1, D2, D3, A, G, D, B, F, E, C;
	wire S21, S22, S23, S24, S25, S26;
	
    not SS0(D1, 1'B0);
    
    not SS1(D2, 1'B0);
    
    not SS2(D3, 1'B0);
    
    // A, M, B, E
    not PS7(S26, Erro);
	 
    // Saida Alta = Alta.Media.Baixa.Erro'
    and PS3(S21, Alta, Media, Baixa, S26);
    or PS5(S24, S21, !S26);
    not SS3(A, S24);
    
    // Saida Media = Media.Baixa.Erro'
    and PS2(S22, Media, Baixa, S26);
    not SS4(G, S22);
    
    // Saida Baixa = Baixa.Erro'
    and PS4(S23, Baixa, S26);
    or PS6(S25, S23, !S26);
	 not SS6(B, !S25);
	 not SS7(C, !S25);
	 not SS8(F, !S25);
	 not SS9(E, !S25);
    not SS5(D, S25);
    // Saida Vazia = Alta'.Media'.Baixa'.Erro'
   

endmodule 