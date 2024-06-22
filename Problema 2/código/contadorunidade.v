module contadorunidade(clk1, clk2, qUnidadedeSegundos, clearUs);
	input clk1;
	output clk2;

	input [3:0] clearUs;
	
	// Flip Flop JK
	wire [3:0] jUnidadedeSegundos;
	wire [3:0] kUnidadedeSegundos;
	output [3:0] qUnidadedeSegundos;
	
	// Jd e Kd
	 
	// JD = QC'.QB'.QA'
	and JUs0(jUnidadedeSegundos[0], !qUnidadedeSegundos[1], !qUnidadedeSegundos[2], !qUnidadedeSegundos[3]);
	
	// KD = QA'
	or kUs0(kUnidadedeSegundos[0], !qUnidadedeSegundos[3]);
	
	// Jc e Kc
	
	// JC = QD.QA'
	and JUs1(jUnidadedeSegundos[1], qUnidadedeSegundos[0], !qUnidadedeSegundos[3]);
		
	// KC = QB'.QA'
	and KUs1(kUnidadedeSegundos[1], !qUnidadedeSegundos[2], !qUnidadedeSegundos[3]);
	
	
	// Jb e Kb
	
	// JB = QA'(QC + QD)
	or(F1, qUnidadedeSegundos[1], qUnidadedeSegundos[0]);
	and JUs2(jUnidadedeSegundos[2], !qUnidadedeSegundos[3], F1);
		
	// KB = QA'
	or KUs2(kUnidadedeSegundos[2], !qUnidadedeSegundos[3]);

	// Ja e Ka
	
	// Ja = 1
	or JUs3(jUnidadedeSegundos[3], 1);
	
	// Ka = 1
	or KUs3(kUnidadedeSegundos[3], 1);
	
	// 10 seg
	and saidaclock2(clk2, qUnidadedeSegundos[0], !qUnidadedeSegundos[1], !qUnidadedeSegundos[2], qUnidadedeSegundos[3]);
	
	flipflopjk Us1(jUnidadedeSegundos[0], kUnidadedeSegundos[0], clk1, qUnidadedeSegundos[0], 0, clearUs[0]);
	flipflopjk Us2(jUnidadedeSegundos[1], kUnidadedeSegundos[1], clk1, qUnidadedeSegundos[1], 0, clearUs[1]);
	flipflopjk Us3(jUnidadedeSegundos[2], kUnidadedeSegundos[2], clk1, qUnidadedeSegundos[2], 0, clearUs[2]);
	flipflopjk Us4(jUnidadedeSegundos[3], kUnidadedeSegundos[3], clk1, qUnidadedeSegundos[3], 0, clearUs[3]);
	
	
endmodule 	



