module contador_decrescente(
 input clk1,
 input clr, 
 input prst,
 output [2:0] Q
 
);

wire [2:0] T;
wire [2:0] W;


//frequencia (t, clk, clr, clk1, frequencia_display, frequencia_col);

// EXPRESSAO T2
and and0 (T[2], Q[2], !Q[1], !Q[0]);

// EXPRESSAO T1
and and1 (W[0], Q[2], !Q[0]);
and and2(W[1], Q[1], !Q[0]);
or or0 (T[1], W[0], W[1]);

// EXPRESSAO T0
or or1 (T[0], Q[2], Q[1], Q[0]);

// INSTÂNCIAS DOS FLIP-FLOPS T
ff_1 ff_T2 (.clk(clk1), .clr(clr), .prst(prst), .T(T[2]), .Q(Q[2]));
ff_1 ff_T1 (.clk(clk1), .clr(clr), .prst(prst), .T(T[1]), .Q(Q[1]));
ff_1 ff_T0 (.clk(clk1), .clr(clr), .prst(prst), .T(T[0]), .Q(Q[0]));




endmodule





module ff_1(
 input clk,
 input clr,
 input prst,
 input T,
 output reg Q
);

always @(posedge clk or posedge clr or posedge prst) begin
 if (prst) begin
 Q <= 1;
end else if (clr) begin
  Q <= 0;
 end else if (T) begin
  Q <= !Q;
 end
end
	

endmodule