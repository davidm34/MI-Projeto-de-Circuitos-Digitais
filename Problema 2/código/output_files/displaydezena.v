module displaydezena(q4, q3, q2, q1, a, b, c, d, e, f, g);
	input q4, q3, q2, q1;
	output a, b, c, d, e, f, g;
	
	// A = Q3'.Q2'.Q1 + Q3.Q1'
	and(s1, !q3, !q2, q1);
	and(s2, q3, !q1);
	or(a, s1, s2);
	
	// B = Q3.Q1
	and(b, q3, q1);
	
	// C = Q2.Q1'
	and(c, q2, !q1);
	
	// D = Q3'.Q2'.Q1 + Q3.Q1'
	or(d, s1, s2);
	
	// E = Q1 + Q3
	or(e, q1, q3);
	
	// F = Q3'.Q1 + Q2
	and(s3, !q3, q1);
	or(f, s3, q2);
	
	// G = Q3'.Q2'
	and(g, !q3, !q2);
	
endmodule 