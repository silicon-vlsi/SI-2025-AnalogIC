TITEL: RC Step input testbench

.PARAM 	vdd_var=1

** Netlist
R1	vin	vout	1k
C1	vout	GND	1p

**Sources
Vsin	vin	GND	0 PULSE(0 vdd_var 0.5n 1p 1p 0.05n 0.1n)

**Simulation
.SAVE ALL
.OP
.TRAN 10p 40n

.GLOBAL GND

.END 
