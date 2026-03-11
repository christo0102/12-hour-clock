`timescale 1ns/1ps 
module hours (
    input clk,
    input enable,
    input reset,
    output reg [7:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 8'h12;
        else if (enable) begin
            if (q == 8'h12)
                q <= 8'h01;
            else if (q == 8'h09)
                q <= 8'h10;
            else
                q[3:0] <= q[3:0] + 4'd1;
        end
    end
endmodule
