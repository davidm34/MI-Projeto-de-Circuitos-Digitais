module contadordezenamin(clk4, qDezenadeMinutos, presetDm, clearDm);
	input clk4;
	
	wire [3:0] jDezenadeMinutos;
	wire [3:0] kDezenadeMinutos;
	output [3:0] qDezenadeMinutos;
	
	input [3:0] presetDm;
	input [3:0] clearDm;
	
	or(qDezenadeMinutos[0], 0);
	or(qDezenadeMinutos[1], 0);
	
	flipflopjk(!qDezenadeMinutos[3], !qDezenadeMinutos[3], clk4, qDezenadeMinutos[2], presetDm[2], clearDm[2]);
	flipflopjk SS(1, 1, clk4, qDezenadeMinutos[3], presetDm[3], clearDm[3]); 
	
	
endmodule 