module demux1x5(d, o, s);
	
	input [3:0] s;
	input d;
	output [4:0] o;

	wire [4:0] w;

	// Primeira saída
	and (w[0], !s[0], !s[1], !s[2]);
	and (o[0], d, w[0]);

	// Segunda saída
	and (w[1], !s[0], !s[1], s[2]);
	and (o[1], d, w[1]);

	// Terceira saída
	and (w[2], !s[0], s[1], !s[2]);
	and (o[2], d, w[2]);

	// Quarta saída
	and (w[3], !s[0], s[1], s[2]);
	and (o[3], d, w[3]);

	// Quinta saída
	and (w[4], s[0], !s[1], !s[2]);
	and (o[4], d, w[4]);


endmodule 