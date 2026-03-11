# 12-Hour Digital Clock (Verilog)

This project implements a **12-hour digital clock with an AM/PM indicator** using Verilog. The design uses a set of BCD counters to track hours, minutes, and seconds. The clock is driven by a fast-running system clock (`clk`), while the actual time increment occurs only when the enable signal (`ena`) generates a pulse once per second.

The design supports a **synchronous reset** that initializes the clock to **12:00:00 AM**. The reset signal has higher priority than the enable signal and can reset the clock at any time.

## Features

* 12-hour clock format
* AM/PM indicator (`pm`)
* BCD representation for time values
* Seconds and minutes range: **00–59**
* Hours range: **01–12**
* Reset initializes the clock to **12:00:00 AM**
* Enable pulse increments the clock once per second

## Inputs

* `clk` – System clock
* `reset` – Resets the clock to **12:00:00 AM**
* `ena` – Enable signal that increments time once per second

## Outputs

* `pm` – AM/PM indicator (`0` = AM, `1` = PM)
* `hh[7:0]` – Hours in BCD format (01–12)
* `mm[7:0]` – Minutes in BCD format (00–59)
* `ss[7:0]` – Seconds in BCD format (00–59)

## Functionality

* Seconds increment from **00 to 59**.
* Minutes increment when seconds roll over from **59 to 00**.
* Hours increment when minutes and seconds roll over from **59:59**.
* The clock toggles the **AM/PM indicator** when transitioning from **11:59:59 to 12:00:00**.

## Implementation

The design uses modular counters for:

* **0–9 BCD counter**
* **0–5 BCD counter**
* **Hour counter (01–12)**

These modules are combined to build the complete 12-hour clock system.

## Applications

* Digital clock designs
* FPGA learning projects
* Practice for RTL design and counter implementation
* Basic digital system design demonstrations
