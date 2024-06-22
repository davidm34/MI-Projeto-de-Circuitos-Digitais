module contadorunidademin(clk3, clk4, qUnidadedeMinutos, presetUm, clearUm);
	input clk3;
	output clk4;
	
	input [3:0] presetUm;
	input [3:0] clearUm;
	
	// Flip Flop JK
	wire [3:0] jUnidadedeMinutos;
	wire [3:0] kUnidadedeMinutos;
	output [3:0] qUnidadedeMinutos;
	
	// Jd e Kd
	 
	// JD = QC'.QB'.QA'
	and JUs0(jUnidadedeMinutos[0], !qUnidadedeMinutos[1], !qUnidadedeMinutos[2], !qUnidadedeMinutos[3]);
	
	// KD = QA'
	or kUs0(kUnidadedeMinutos[0], !qUnidadedeMinutos[3]);
	
	// Jc e Kc
	
	// JC = QD.QA'
	and JUs1(jUnidadedeMinutos[1], qUnidadedeMinutos[0], !qUnidadedeMinutos[3]);
		
	// KC = QB'.QA'
	and KUs1(kUnidadedeMinutos[1], !qUnidadedeMinutos[2], !qUnidadedeMinutos[3]);
	
	
	// Jb e Kb
	
	// JB = QA'(QC + QD)
	or(F1, qUnidadedeMinutos[1], qUnidadedeMinutos[0]);
	and JUs2(jUnidadedeMinutos[2], !qUnidadedeMinutos[3], F1);
		
	// KB = QA'
	or KUs2(kUnidadedeMinutos[2], !qUnidadedeMinutos[3]);

	// Ja e Ka
	
	// Ja = 1
	or JUs3(jUnidadedeMinutos[3], 1);
	
	// Ka = 1
	or KUs3(kUnidadedeMinutos[3], 1);
	
	// 10 seg
	and saidaclock2(clk4, qUnidadedeMinutos[0], !qUnidadedeMinutos[1], !qUnidadedeMinutos[2], qUnidadedeMinutos[3]);
	
	flipflopjk Us1(jUnidadedeMinutos[0], kUnidadedeMinutos[0], clk3, qUnidadedeMinutos[0], presetUm[0], clearUm[0]);
	flipflopjk Us2(jUnidadedeMinutos[1], kUnidadedeMinutos[1], clk3, qUnidadedeMinutos[1], presetUm[1], clearUm[1]);
	flipflopjk Us3(jUnidadedeMinutos[2], kUnidadedeMinutos[2], clk3, qUnidadedeMinutos[2], presetUm[2], clearUm[2]);
	flipflopjk Us4(jUnidadedeMinutos[3], kUnidadedeMinutos[3], clk3, qUnidadedeMinutos[3], presetUm[3], clearUm[3]);
	
	
endmodule 	



