module frequencia(T, clk, clk1, frequencia_display, frequencia_coluna,  f_gotejar, f_aspersao, frequencia2);
    input T, clk;
    output clk1, frequencia_display, frequencia_coluna, f_gotejar, f_aspersao, frequencia2;
    
    flipflopT(T, !clk, Q1);
    flipflopT(T, !Q1, Q2);
    flipflopT(T, !Q2, Q3);
    flipflopT(T, !Q3, Q4);
    flipflopT(T, !Q4, Q5);
    flipflopT(T, !Q5, Q6);
    flipflopT(T, !Q6, Q7);
    flipflopT(T, !Q7, Q8);
    flipflopT(T, !Q8, Q9);
    flipflopT(T, !Q9, Q10);
    flipflopT(T, !Q10, frequencia_coluna);
    flipflopT(T, !frequencia_coluna, Q12);
    flipflopT(T, !Q12, Q13);
    flipflopT(T, !Q13, Q14);
    flipflopT(T, !Q14, Q15);
    flipflopT(T, !Q15, Q16);
    flipflopT(T, !Q16, frequencia2);
    flipflopT(T, !frequencia2, Q18);
    flipflopT(T, !Q18, Q19);
    flipflopT(T, !Q19, Q20);
    flipflopT(T, !Q20, Q21);
    flipflopT(T, !Q21, frequencia_display);
    flipflopT(T, !frequencia_display, Q23);
    flipflopT(T, !Q23, Q24);
	 
	 // Frequencia de Gotejamento
	 
	 flipflopD(Q23, P0, G0);
	 flipflopD(Q23, P1, G1);
	 flipflopD(Q23, P2, G2);
	 
	 // P0
	 assign P0 = (G1 & G2);
	 // P1
	 assign P1 = (~G1 & G2) | (G1 & ~G2);
	 
	 // P2
	 assign P2 = (~G0 & ~G2);
	 
	 // S
	 assign f_quase = (G0);
	 
	 
	 // H0
	 assign J0 = (H1 & H2) | (H0 & ~H1);
	 
	 // H1
	 assign J1 = (~H1 & H2) | (~H0 & H1 & ~H2);
	 
	 // H2
	 assign J2 = (~H0 & ~H2) | (~H1 & ~H2);
	 
	 flipflopD(f_quase, J0, H0);
	 flipflopD(f_quase, J1, H1);
	 flipflopD(f_quase, J2, H2);
	 
	 assign f_gotejar = (H0 & H1);
	 
	 
	// Frequencia Aspersao 
	 flipflopD(frequencia_display, Z0, C0);
	 flipflopD(frequencia_display, Z1, C1);
	 flipflopD(frequencia_display, Z2, C2);
	 
	 // Z0
	 assign Z0 = (C1 & C2);
	 // Z1
	 assign Z1 = (~C1 & C2) | (C1 & ~C2);
	 
	 // Z2
	 assign Z2 = (~C0 & ~C2);
	 
	 // S
	 assign f_quaseA = (C0);
	 
	 
	 // R0
	 assign Y0 = (R1 & R2) | (R0 & ~R1);
	 
	 // R1
	 assign Y1 = (~R1 & R2) | (~R0 & R1 & ~R2);
	 
	 // R2
	 assign Y2 = (~R0 & ~R2) | (~R1 & ~R2);
	 
	 flipflopD(f_quaseA, Y0, R0);
	 flipflopD(f_quaseA, Y1, R1);
	 flipflopD(f_quaseA, Y2, R2);
	 
	 assign f_aspersao = (R0 & R1);
	 
    // Flip Flop D
    wire sa, san, sb, sbn;
    wire da, db;	
    
    flipflopD(Q24, da, sa, san);
    flipflopD(Q24, db, sb, sbn);
    and DA(da, san, sbn);
    and DB(db, sa);
    or Frequencia(clk1, sa, sbn);
    
endmodule



module flipflopD(clk, d, q, qb, rst);
    input clk, d, rst;
    output reg q, qb;
    
    always @(posedge clk)  
   		 if (rst)  
   		 begin
   			 q = 1'b0;
   			 qb = ~q;
   		 end
   		 else
   		 begin  
   			 q = d;  
   			 qb = ~q;
   		 end
endmodule     





	 