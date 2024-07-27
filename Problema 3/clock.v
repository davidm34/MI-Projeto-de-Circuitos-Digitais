module clock(T, clk, clk1, frequencia_display, Q21, frequencia_matriz);
	input T, clk;
	output clk1, frequencia_display, Q21, frequencia_matriz;
	
	flipflopt(T, !clk, Q1);
	flipflopt(T, !Q1, Q2);
	flipflopt(T, !Q2, Q3);
	flipflopt(T, !Q3, Q4);
	flipflopt(T, !Q4, Q5);
	flipflopt(T, !Q5, Q6);
	flipflopt(T, !Q6, Q7);
	flipflopt(T, !Q7, Q8);
	flipflopt(T, !Q8, Q9);
	flipflopt(T, !Q9, Q10);
	flipflopt(T, !Q10, Q11);
	flipflopt(T, !Q11, Q12);
	flipflopt(T, !Q12, Q13);
	flipflopt(T, !Q13, Q14);
	flipflopt(T, !Q14, frequencia_matriz);
	flipflopt(T, !frequencia_matriz, Q16);
	flipflopt(T, !Q16, frequencia_display);
	flipflopt(T, !frequencia_display, Q18);
	flipflopt(T, !Q18, Q19);
	flipflopt(T, !Q19, Q20);
	flipflopt(T, !Q20, Q21);
	flipflopt(T, !Q21, Q22);
	flipflopt(T, !Q22, Q23);
	flipflopt(T, !Q23, Q24);
	
	// Flip Flop D
	wire sa, san, sb, sbn;
	wire da, db;
	
	flipflopd(Q24, da, sa);
	flipflopd(Q24, db, sb);
	and DA(da, !sa, !sb);
	and DB(db, sa);
	or Frequencia(clk1, sa, !sb);
	

endmodule 

module flipflopt(T, clk, Q);
	input T, clk;
	output reg Q;
	
	always @(posedge clk)
	begin
	if (T)
		Q <= !Q;
	end
	
	
endmodule 