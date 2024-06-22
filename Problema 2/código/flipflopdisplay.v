module flipflopdisplay(clk, D1, D2, D3, D4);
	input clk;
	output D1, D2, D3, D4;

	flipflopjk A(jd1, kd1, clk, qd1);
	flipflopjk B(jd2, kd2, clk, qd2);
	flipflopjk C(jd3, kd3, clk, qd3);
	flipflopjk D(jd4, kd4, clk, qd4);
	
	// J1, J2, J3, J4 
	and(jd1, 1);
	and(jd2, 1);
	and(jd3, 1);
	and(jd4, 1);
	
	// K1 = D2.D3 + D1'
	and(t1, qd2, qd3);
	or(kd1, t1, !qd1);
	
	// K2 = D1'.D3
	and(kd2, !qd1, qd3);
	
	// K3 = D2'.D3
	and(kd3, !qd2, qd3);
	
	// K4
	not(kd4, qd3);
	
	// D1, D2, D3, D4
	not(D1, !qd1);
	not(D2, !qd2);
	not(D3, !qd3);
	not(D4, !qd4);
	
endmodule 

