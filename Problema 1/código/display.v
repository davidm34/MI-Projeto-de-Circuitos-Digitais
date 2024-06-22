module display(Aspersao,Gotejamento,D,B,A);

	wire s1,s2;
	input Aspersao,Gotejamento;
	output D,B,A;
	
	
	and(s1,Gotejamento,!Aspersao);
	not(D,s1);
	

	and(s2,Aspersao, !Gotejamento);
	not(B,s2);
	
	
endmodule 
