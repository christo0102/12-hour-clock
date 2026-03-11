`timescale 1ns/1ps
module nine (
    input clk,
    input enable,
    input reset,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'd0;
        else if (enable) begin
            if (q == 4'd9)
                q <= 4'd0;
            else
                q <= q + 1;
        end
    end
endmodule
