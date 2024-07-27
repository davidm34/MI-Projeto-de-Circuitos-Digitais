module contador_coluna(col , frequencia_coluna);

	input frequencia_coluna; 
	wire frequencia_display, rst, clk2;


	//frequencia (T, clk, rst, clk2, frequencia_display, frequencia_coluna);
	
	
	// Flip Flop JK
	wire jd, jc, jb, ja;
	wire kd, kc, kb, ka;
	wire [3:0] q;
	output [4:0] col;
	
	flipflopjk D(jd, kd, frequencia_coluna, q[0]);
	flipflopjk C(jc, kc, frequencia_coluna, q[1]);
	flipflopjk B(jb, kb, frequencia_coluna, q[2]);
	flipflopjk A(ja, ka, frequencia_coluna, q[3]);
	
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
	
	// JB = QA'(QC + QD)frequencia_display
	or(F1, q[1], q[0]);
	and JB(jb, !q[3], F1);
	
	// KB = QA'
	or (kb, !q[3]);

	// Ja e Ka
	
	// Ja = 1
	or (ja, 1);
	
	// Ka = 1
	or (ka, 1);
	

	assign col = 5'b11111;
	
endmodule 	


/*
module flipflopjk(j, k, clk, q);
    input j, k, clk;
    output reg q;
    
    always @(posedge clk) 
   	 begin
   		 case ({j, k})
   			 2'b00 : q <= q;
   			 2'b01 : q <= 0;
   			 2'b10: q <= 1;
   			 2'b11 : q <= ~q;
   		 endcase
   	 end
endmodule 	
*/