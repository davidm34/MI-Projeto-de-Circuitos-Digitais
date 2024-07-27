module main_display(a, b, c, d, e, f, g, D1, D2, D3, D4, buttom, Gotejamento, Aspersao, clk1, frequencia_display, agroDefensivo, saidaAgroDefensivo);
	input buttom, Gotejamento, Aspersao, agroDefensivo;
	output a, b, c, d, e, f, g, D1, D2, D3, D4, saidaAgroDefensivo;
	
	input frequencia_display, clk1;
	wire [1:0] dEstado;
	wire [1:0] qEstado;
	wire [1:0] presetEstado;
	wire [1:0] resetEstado;
	wire [3:0] saidaEstado;
	wire pulseEnchimento, pulseGotejamento, pulseAspersao, pulseLimpeza;
	wire [3:0] qUnidadedeSegundos;
	wire [3:0] presetUs;
	wire [3:0] resetUs;
	wire [3:0] qDezenadeSegundos;
	wire [3:0] presetDs;
	wire [3:0] resetDs;
	wire clk2; 
	wire [3:0] Transicao;
	wire clkTransicaoE, clkTransicaoG, clkTransicaoA, clkTransicaoL;
	wire TrE, TrG, TrA, TrL;
	
	
	flipflopd Estado0(frequencia_display, dEstado[0], qEstado[0], presetEstado[0], resetEstado[0]);
	flipflopd Estado1(frequencia_display, dEstado[1], qEstado[1], presetEstado[1], resetEstado[1]);
	
	and EEnchimento(saidaEstado[0], !qEstado[0], !qEstado[1]);
	and EGotejamento(saidaEstado[1], !qEstado[0], qEstado[1]);
	and EAspersao(saidaEstado[2], qEstado[0], !qEstado[1]);
	and ELimpeza(saidaEstado[3], qEstado[0], qEstado[1]);
	
	
	contadorunidade UnidadeSegundos(clk1, clk2, saidazerada0, qUnidadedeSegundos, presetUs, resetUs);
	contadordezena DezenaSegundos(clk2, saidazerada1, qDezenadeSegundos, presetDs, resetDs);
	
	and(W0, saidazerada0, saidazerada1);
	levelToPulse(frequencia_display, W0, W);

	assign dEstado[0] = (~W & qEstado[0]) | (W & ~qEstado[0] & qEstado[1]) | (qEstado[0] & ~qEstado[1]) | (W & Aspersao & ~qEstado[0]);
	assign dEstado[1] = (~W & qEstado[1]) | (~qEstado[0] & qEstado[1]) | (W & qEstado[0] & ~qEstado[1]) | (W & ~Aspersao & Gotejamento & ~qEstado[0]);

	levelToPulse(frequencia_display, saidaEstado[0], pulseEnchimento);
	levelToPulse(frequencia_display, saidaEstado[1], pulseGotejamento);
	levelToPulse(frequencia_display, saidaEstado[2], pulseAspersao);
	levelToPulse(frequencia_display, saidaEstado[3], pulseLimpeza);
	
	or(presetDs[2], pulseGotejamento, !buttom);
	or(presetDs[3], pulseEnchimento, pulseAspersao, pulseGotejamento);
	or(resetUs[1], pulseEnchimento, !buttom);
	or(resetUs[3], pulseEnchimento, !buttom);
	or(presetUs[1], pulseAspersao, pulseLimpeza);
	or(presetUs[3], pulseAspersao, pulseLimpeza);
	or(resetDs[2], pulseLimpeza, !buttom);
	or(resetDs[3], pulseLimpeza, !buttom);
	
	flipflopjk(1, 1, agroDefensivo, pulseLevelAgro);
	and(saidaAgroDefensivo, pulseLevelAgro, saidaEstado[2]);

	wire [1:0] dContador;
	wire [1:0] qContador;
	
	flipflopd Contador0(frequencia_display, dContador[0], qContador[0]);
	flipflopd Contador1(frequencia_display, !qContador[1], qContador[1]);
	
	demuxdisplay(qContador[0], qContador[1], D1, D2, D3, D4);

	xor(dContador[0], qContador[0], qContador[1]);
	
	
	wire [3:0] mMux;
	
	muxdisplaycronometro(
	qContador[0], qContador[1], 
	qUnidadedeSegundos[0], qUnidadedeSegundos[1], qUnidadedeSegundos[2], qUnidadedeSegundos[3], 
	qDezenadeSegundos[0], qDezenadeSegundos[1], qDezenadeSegundos[2], qDezenadeSegundos[3], 
	mMux[0], mMux[1], mMux[2], mMux[3]);
	
	
	wire [6:0] EstadoDisplay;
	wire [6:0] NumeroDisplay;
	
	estadodisplay(saidaEstado[0], saidaEstado[1], saidaEstado[2], saidaEstado[3], EstadoDisplay);
	
	display7segNUM(mMux[0], mMux[1], mMux[2], mMux[3], NumeroDisplay[0], NumeroDisplay[1], NumeroDisplay[2], NumeroDisplay[3], NumeroDisplay[4], NumeroDisplay[5], NumeroDisplay[6]);
	
	// Segmentos do Display
	
	// a
	and(al, !qContador[0], EstadoDisplay[0]);
	and(an, qContador[0], NumeroDisplay[0]);
	or(a, al, an);
	
	// b 
	and(bl, !qContador[0], EstadoDisplay[1]);
	and(bn, qContador[0], NumeroDisplay[1]);
	or(b, bl, bn);
	
	// c
	and(cl, !qContador[0], EstadoDisplay[2]);
	and(cn, qContador[0], NumeroDisplay[2]);
	or(c, cl, cn);
	
	// d
	and(dl, !qContador[0], EstadoDisplay[3]);
	and(dn, qContador[0], NumeroDisplay[3]);
	or(d, dl, dn);
	
	// e 
	and(el, !qContador[0], EstadoDisplay[4]);
	and(en, qContador[0], NumeroDisplay[4]);
	or(e, el, en);
	
	// f
	and(fl, !qContador[0], EstadoDisplay[5]);
	and(fn, qContador[0], NumeroDisplay[5]);
	or(f, fl, fn);
	
	// g
	and(gl, !qContador[0], EstadoDisplay[6]);
	and(gn, qContador[0], NumeroDisplay[6]);
	or(g, gl, gn);
	
endmodule 
