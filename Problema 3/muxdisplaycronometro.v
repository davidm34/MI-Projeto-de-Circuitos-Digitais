module muxdisplaycronometro(c1, c2, q10, q11, q12, q13, q21, q22, q23, q24, m0, m1, m2, m3);
	input c1, c2, q10, q11, q12, q13, q21, q22, q23, q24;
	output m0, m1, m2, m3;
	
	// m0
	and(s2, c1, !c2, q10);
	and(s3, c1, c2, q21);
	or(m0, s0, s1, s2, s3);
	
	// m1
	and(s6, c1, !c2, q11);
	and(s7, c1, c2, q22);
	or(m1, s4, s5, s6, s7);

	// m2
	and(s10, c1, !c2, q12);
	and(s11, c1, c2, q23);
	or(m2, s8, s9, s10, s11);
	
	// m3
	and(s14, c1, !c2, q13);
	and(s15, c1, c2, q24);
	or(m3, s12, s13, s14, s15);

endmodule 