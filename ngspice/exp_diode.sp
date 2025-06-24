.TITLE Didoe experiement

*.MODEL diomod1 D (bv=50 is=1e-13 n=1.05)
**.INCLUDE 'sky130_fd_pr__diode_pd2nw_05v5.model.spice'
.lib /home/ubuntu/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt

**D1	vin	vout	diomod1
D1	vin	vout	sky130_fd_pr__diode_pd2nw_05v5
R1	vout	GND	100k
**C1	vout	GND	1p

Vsin	vin	GND	0 sin(0 1 1e3 0 0 0)

.OP
.TRAN 1u 4m

.END
