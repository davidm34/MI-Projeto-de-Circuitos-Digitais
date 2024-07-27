module flipflopd(clk, d, q, preset, reset);
	input clk, d, preset, reset;
	output reg q;
	
	always @(posedge clk or posedge preset or posedge reset) begin
        if (preset) begin
            q <= 1'b1;  
        end else if (reset) begin
            q <= 1'b0;  
        end else begin
            q <= d;     
        end
    end


endmodule 