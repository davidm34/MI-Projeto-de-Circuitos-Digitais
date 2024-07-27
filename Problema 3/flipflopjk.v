module flipflopjk(j, k, clk, q, preset, clear);
    input j, k, clk, preset, clear;
    output reg q;
    
    always @(posedge clk, posedge preset, posedge clear)
   	 begin
   		 if (clear == 1) begin
   			 q <= 0;
   		 end else if (preset == 1) begin
   			 q <= 1;
   		 end else begin
   			 case ({j, k})
   				 2'b00 : q <= q;
   				 2'b01 : q <= 0;
   				 2'b10: q <= 1;
   				 2'b11 : q <= ~q;
   			 endcase
   		 end
   	 end
endmodule 