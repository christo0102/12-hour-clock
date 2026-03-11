`timescale 1ns/1ps

module clock_tb;

reg clk;
reg reset;
reg ena;
wire pm;
wire [7:0] hh;
wire [7:0] mm;
wire [7:0] ss;

top_module uut (
    .clk(clk),
    .reset(reset),
    .ena(ena),
    .pm(pm),
    .hh(hh),
    .mm(mm),
    .ss(ss)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    ena = 0;
    #20
    reset = 0;
    ena = 1;
    #200000
    $finish;
end

endmodule
