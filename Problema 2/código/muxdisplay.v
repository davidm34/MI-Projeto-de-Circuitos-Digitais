module muxdisplay(q30, q31, qd, qc, qb, qa, q1, q2, q3, q4, q10, q11, q12, q13, q21, q22, q23, q24, m0, m1, m2, m3);
	input q30, q31, qd, qc, qb, qa, q1, q2, q3, q4, q10, q11, q12, q13, q21, q22, q23, q24;
	output m0, m1, m2, m3;
	
	// m0
	and(s0, !q30, !q31, qd);
	and(s1, !q30, q31, q1);
	and(s2, q30, !q31, q10);
	and(s3, q30, q31, q21);
	or(m0, s0, s1, s2, s3);
	
	// m1
	and(s4, !q30, !q31, qc);
	and(s5, !q30, q31, q2);
	and(s6, q30, !q31, q11);
	and(s7, q30, q31, q22);
	or(m1, s4, s5, s6, s7);

	// m2
	and(s8, !q30, !q31, qb);
	and(s9, !q30, q31, q3);
	and(s10, q30, !q31, q12);
	and(s11, q30, q31, q23);
	or(m2, s8, s9, s10, s11);
	
	// m3
	and(s12, !q30, !q31, qa);
	and(s13, !q30, q31, q4);
	and(s14, q30, !q31, q13);
	and(s15, q30, q31, q24);
	or(m3, s12, s13, s14, s15);

endmodule 