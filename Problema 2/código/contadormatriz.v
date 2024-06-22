module contadormatriz(frequencia_display, q);
	input frequencia_display;
	
	// Flip Flop JK
	wire jd, jc, jb, ja;
	wire kd, kc, kb, ka;
	output [3:0] q;
	
	flipflopjk D(jd, kd, frequencia_display, q[0]);
	flipflopjk C(jc, kc, frequencia_display, q[1]);
	flipflopjk B(jb, kb, frequencia_display, q[2]);
	flipflopjk A(ja, ka, frequencia_display, q[3]);
	
	// Jd e Kd
	 
	// JD = QC'.QB'.QA'
	and JD(jd, !q[1], !q[2], !q[3]);
	
	// KD = QA'
	or(kd, !q[3]);
	
	// Jc e Kc
	
	// JC = QD.QA'
	and JC(jc, q[0], !q[3]);
	
	// KC = QB'.QA'
	and KC(kc, !q[2], !q[3]);
	
	
	// Jb e Kb
	
	// JB = QA'(QC + QD)
	or(F1, q[1], q[0]);
	and JB(jb, !q[3], F1);
	
	// KB = QA'
	or (kb, !q[3]);

	// Ja e Ka
	
	// Ja = 1
	or (ja, 1);
	
	// Ka = 1
	or (ka, 1);
	
endmodule 