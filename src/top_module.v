`timescale 1ns/1ps
module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);

    wire E0, E1, E2;

    assign E0 = (ss[3:0] == 4'd9);
    assign E1 = (ss == 8'h59);
    assign E2 = (mm == 8'h59) && E1;

    always @(posedge clk) begin
        if (reset)
            pm <= 1'b0;
        else if (hh == 8'h11 && mm == 8'h59 && ss == 8'h59 && ena)
            pm <= ~pm;
    end

    nine sec_ones(.clk(clk), .reset(reset), .enable(ena), .q(ss[3:0]));
    five sec_tens(.clk(clk), .reset(reset), .enable(E0 && ena), .q(ss[7:4]));

    nine min_ones(.clk(clk), .reset(reset), .enable(E1 && ena), .q(mm[3:0]));
    five min_tens(.clk(clk), .reset(reset), .enable((mm[3:0] == 4'd9) && E1 && ena), .q(mm[7:4]));

    hours hours(.clk(clk), .reset(reset), .enable(E2 && ena), .q(hh));

endmodule
