module display7seg(qd, qc, qb, qa, a, b, c, d, e, f, g);
	input qd, qc, qb, qa;
	output a, b, c, d, e, f, g;
	
	
	// QC.QA'
	and(s1, qc, !qa);

	// QD'.QC'.QA
	and(s2, !qd, !qc, qa);
	
	// (QD'.QC'.QA + QC.QA')
	or(s3, s1, s2);
	
	// A = QB'(QD'.QC'.QA + QC.QA')
	and(a, !qb, s3);
	

	
	// QB.QA'
	and(s4, qb, !qa);
	
	// QB'.QA
	and(s5, !qb, qa);
	
	// (QB'.QA + QB.QA')
	or(s6, s4, s5);
	
	// B = QC(QB'.QA + QB.QA')
	and(b, qc, s6);
	
	

	// C = QC'.QB.QA'
	and(c, !qc, qb, !qa);
	
	 
	 
	// QC.QB.QA
	and(s7, qc, qb, qa);
	
	// QC.QB'.QA'
	and(s8, qc, !qb, !qa);
	
	// QD'.QC'.QB'.QA
	and(s9, !qd, !qc, !qb, qa);
	
	// D = QD'.QC'.QB'.QA + QC.QB'.QA' + QC.QB.QA
	or(d, s9, s8, s7);
	
	
		
	// QC.QB'
	and(s10, qc, !qb);
	
	// E = QC.QB' + QA
	or(e, s10, qa);
	

		
	// QD'.QC'.QA
	and(s11, !qd, !qc, qa);
	
	// QB.QA
	and(s12, qb, qa);
	
	// QC'.QB
	and(s13, !qc, qb);
	
	// F = QD'.QC'.QA + QB.QA + QC'.QB
	or(f, s11, s12, s13);
	
	
		
	// QC.QB.QA
	and(s14, qc, qb, qa);
	
	// QD'.QC'.QB'
	and(s15, !qd, !qc, !qb);

	// G = QC.QB.QA. + QD'.QC'.QB'
	or(g, s14, s15);
	
	
endmodule 