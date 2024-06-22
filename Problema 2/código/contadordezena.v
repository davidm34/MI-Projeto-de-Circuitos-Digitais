module contadordezena(clk2, clk3, qDezenadeSegundos, presetDs, clearDs);
	input clk2;
	output clk3;
	
	input [3:0] clearDs;
	input [3:0] presetDs;
	
	output [3:0] qDezenadeSegundos;
	wire [3:0] jDezenadeSegundos;
	wire [3:0] kDezenadeSegundos;
	
	// J1 = 0
	and(jDezenadeSegundos[0], 0);
	
	// K1 = 0
	and(kDezenadeSegundos[0], 0);
	
	// J2 = Q3'.Q4'
	and(jDezenadeSegundos[1], !qDezenadeSegundos[2], !qDezenadeSegundos[3]);
	
	// K2 = Q4'
	or(kDezenadeSegundos[1], !qDezenadeSegundos[3]);
	
	// J3 = Q2.Q4'
	and(jDezenadeSegundos[2], qDezenadeSegundos[1], !qDezenadeSegundos[3]);
	
	// K3 = Q4'
	or(kDezenadeSegundos[2], !qDezenadeSegundos[3]);
	
	// J4 = 1
	and(jDezenadeSegundos[3], 1);
 
	// K4 = 1
	and(kDezenadeSegundos[3], 1);
	
	// 1 min
	and saidaclock3(clk3, !qDezenadeSegundos[0], qDezenadeSegundos[1], !qDezenadeSegundos[2], qDezenadeSegundos[3]);

	flipflopjk D1(jDezenadeSegundos[0], kDezenadeSegundos[0], clk2, qDezenadeSegundos[0], presetDs[0], clearDs[0]);
	flipflopjk D2(jDezenadeSegundos[1], kDezenadeSegundos[1], clk2, qDezenadeSegundos[1], presetDs[1], clearDs[1]);
	flipflopjk D3(jDezenadeSegundos[2], kDezenadeSegundos[2], clk2, qDezenadeSegundos[2], presetDs[2], clearDs[2]);
	flipflopjk D4(jDezenadeSegundos[3], kDezenadeSegundos[3], clk2, qDezenadeSegundos[3], presetDs[3], clearDs[3]);
	


endmodule 