`timescale 1ns/1ps
module five (
    input clk,
    input enable,
    input reset,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'd0;
        else if (enable) begin
            if (q == 4'd5)
                q <= 4'd0;
            else
                q <= q + 1;
        end
    end
endmodule
