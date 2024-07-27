module contadordezena(clk2, saidazerada1, qDezenaSegundos, presetDs, clearDs);
	input clk2;
	output saidazerada1;
	
	wire [3:0] jDezenaSegundos;
	wire [3:0] kDezenaSegundos;
	output [3:0] qDezenaSegundos;
	
	input [3:0] presetDs;
	input [3:0] clearDs;
	
	or(qDezenaSegundos[0], 0);
	or(qDezenaSegundos[1], 0);
	
	flipflopjk(!qDezenaSegundos[3], !qDezenaSegundos[3], clk2, qDezenaSegundos[2], presetDs[2], clearDs[2]);
	flipflopjk SS(1, 1, clk2, qDezenaSegundos[3], presetDs[3], clearDs[3]); 
	
	and cronometrozerado1(saidazerada1, !qDezenaSegundos[2], !qDezenaSegundos[3]);
	
endmodule 