# 12-hour-clock
This project implements a 12-hour digital clock with an AM/PM indicator using Verilog. The design uses a set of BCD counters to track hours, minutes, and seconds. The clock is driven by a fast-running system clock (clk), while the actual time increment occurs only when the enable signal (ena) generates a pulse once per second.
