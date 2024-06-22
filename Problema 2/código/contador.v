module contador(clk1, frequencia_display, D1, D2, D3, D4, a, b, c, d, e, f, g, Gotejamento, Aspersao, buttom, Q21, Sespecifica);
	
	input Gotejamento, Aspersao, buttom, Q21, Sespecifica;
	
	// Display 7 segmentos
	output a, b, c, d, e, f, g;
	
	// Posicao do Display
	output D1, D2, D3, D4;

	// 1 seg e 400 Hz
	input clk1, frequencia_display;
	
	// 1s, 10s, 1min, 10min
	wire clk2, clk3, clk4;
	
	wire [3:0] mMux;
	wire [1:0] qMux;
	
	wire [3:0] qUnidadedeSegundos;
	wire [3:0] qDezenadeSegundos;
	wire [3:0] qUnidadedeMinutos;
	wire [3:0] qDezenadeMinutos;
	
	
	// PRESET E CLEAR
	
	wire [3:0] presetDm;
	wire [3:0] presetUm;
	wire [3:0] presetDs;
	wire [3:0] presetUs;
	wire [3:0] clearDm;
	wire [3:0] clearUm;
	wire [3:0] clearDs;
	wire [3:0] clearUs;
	
	// Dezena de Minutos
	
	// Preset
	or(gs, Gotejamento, Sespecifica);
	and(presetDm[2], gs, !buttom);
	and(asn, Aspersao, !Sespecifica);
	
	or(ag, Aspersao, Gotejamento);
	and(snag, !Sespecifica, ag);
	and(presetDm[3], snag, !buttom);
	
	// Clear
	or(gas, Aspersao, Gotejamento, Sespecifica);
	and(clearDm[0], gas, !buttom);
	and(clearDm[1], gas, !buttom);
	and(clearDm[2], asn, !buttom);
	and(clearDm[3], Sespecifica, !buttom);
	
	
	// Unidade de Minutos
	
	// Preset
	
	or(presetUm[0], 0);
	and(presetUm[1], asn, !buttom);
	and(presetUm[2], Sespecifica, !buttom);
	or(asgs, asn, gs);
	and(presetUm[3], asgs, !buttom);
	
	// Clear
	or(ags, Aspersao, Gotejamento, Sespecifica);
	and(clearUm[0], ags, !buttom);
	and(clearUm[1], gs, !buttom);
	and(clearUm[2], snag, !buttom);
	and(clearUm[3], gs, !buttom);
	
	
	// Dezena de Segundos
	
	// Preset
	or(presetDs[0], 0);
	and(presetDs[1], gs, !buttom);
	and(gnsa, !Gotejamento, Sespecifica);
	and(presetDs[2], Sespecifica, !buttom);
	and(presetDs[3], Sespecifica, !buttom);
	
	// Clear
	and(clearDs[0], ags, !buttom);
	and(clearDs[1], ags, !buttom);
		
	and(clearDs[2], snag, !buttom);
	and(clearDs[3], snag, !buttom);
	
	
	// Unidade de Segundos
	or(f1, Aspersao, Gotejamento);
	and(clearUs[0], f1, !buttom);
	and(clearUs[1], f1, !buttom);
	and(clearUs[2], f1, !buttom);
	and(clearUs[3], f1, !buttom);
	
	
	// FIM DO PRESET E CLEAR 
	  
	// Unidade de Segundos
	contadorunidade UnidadeSegundos(new_clock, clk2, qUnidadedeSegundos, clearUs);
	
	// Dezena de Segundos
	contadordezena DezenadeSegundos(clk2, clk3, qDezenadeSegundos, presetDs, clearDs);
	
	// Unidade de Minutos 
	contadorunidademin UnidadedeMinutos(clk3, clk4, qUnidadedeMinutos, presetUm, clearUm);

	// Dezena de Minutos
	contadordezenamin DezenadeMinutos(clk4, qDezenadeMinutos, presetDm, clearDm);
	
	
	// ZERAR CRONOMÊTRO
	
	wire sUnidadedeSegundos, sDezenadeSegundos, sUnidadedeMinutos, sDezenadeMinutos;
	
	or sUs(sUnidadedeSegundos, qUnidadedeSegundos[0], qUnidadedeSegundos[1], qUnidadedeSegundos[2], qUnidadedeSegundos[3]);
	or sDs(sDezenadeSegundos, qDezenadeSegundos[0], qDezenadeSegundos[1], qDezenadeSegundos[2], qDezenadeSegundos[3]);
	or sUm(sUnidadedeMinutos, qUnidadedeMinutos[0], qUnidadedeMinutos[1], qUnidadedeMinutos[2], qUnidadedeMinutos[3]);
	or sDm(sDezenadeMinutos, qDezenadeMinutos[0], qDezenadeMinutos[1], qDezenadeMinutos[2], qDezenadeMinutos[3]);
	or(h1, sUnidadedeSegundos, sDezenadeSegundos, sUnidadedeMinutos, sDezenadeMinutos);
	or(h2, Aspersao, Gotejamento);
	and(new_clock, Q21, h1, h2);
	
	// MUX
	
	
	flipflopjk(!qMux[1], !qMux[1], frequencia_display, qMux[0]);
	flipflopjk(1, 1, frequencia_display, qMux[1]);
	
	
	
	muxdisplay(
	qMux[0], qMux[1], 
	qUnidadedeSegundos[0], qUnidadedeSegundos[1], qUnidadedeSegundos[2], qUnidadedeSegundos[3], 
	qDezenadeSegundos[0], qDezenadeSegundos[1], qDezenadeSegundos[2], qDezenadeSegundos[3], 
	qUnidadedeMinutos[0], qUnidadedeMinutos[1], qUnidadedeMinutos[2], qUnidadedeMinutos[3], 
	qDezenadeMinutos[0], qDezenadeMinutos[1], qDezenadeMinutos[2], qDezenadeMinutos[3], 
	mMux[0], mMux[1], mMux[2], mMux[3]);
	
	display7seg(mMux[0], mMux[1], mMux[2], mMux[3], a, b, c, d, e, f, g);
	
	demuxdisplay(qMux[0], qMux[1], D1, D2, D3, D4);
		
	
endmodule 	