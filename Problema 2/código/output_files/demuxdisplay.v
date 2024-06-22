module demuxdisplay(c1, c2, D1, D2, D3, D4);
	input c1, c2;
	output D1, D2, D3, D4;
	
	// [0]
	or(D4, c1, c2);
	
	// [1]
	or(D3, c1, !c2);
	
	// [2]
	or(D1, !c1, !c2);

	// [3]
	or(D2, !c1, c2);


endmodule 