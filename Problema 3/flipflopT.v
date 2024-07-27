module flipflopT(T, clk, Q);
    input T, clk;
    output reg Q;
    
    always @(posedge clk)
    begin
    if (T)
   	 Q <= !Q;
    end
endmodule 