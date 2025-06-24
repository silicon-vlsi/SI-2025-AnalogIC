Title: transient experiement: rise, fall, delat, period, etc.
** Parameters
.PARAM vdd_var=1
.CSPARAM csvddvar=vdd_var

** RC Network 
**Cbyp	vin	vout    1p	
**Rhp	vout	GND	1k
Rlpf 	vin	vout	1k
Clpf	vout	GND	1p

**Stimuli
Vsin	vin	GND	0 PULSE(0 vdd_var 1n 1p 1p 1n 2n) 


** Rise/Fall 10-90%
.MEASURE TRAN tr1090 TRIG v(vout) VAL='0.1*vdd_var' RISE=1 TARG v(vout) VAL='0.9*vdd_var' RISE=1 
.MEASURE TRAN tf9010 TRIG v(vout) VAL='0.9*vdd_var' FALL=1 TARG v(vout) VAL='0.1*vdd_var' FALL=1 
** Rise/Fall 20-80%
.MEASURE TRAN tr2080 TRIG v(vout) VAL='0.2*vdd_var' RISE=1 TARG v(vout) VAL='0.8*vdd_var' RISE=1 
.MEASURE TRAN tf8020 TRIG v(vout) VAL='0.8*vdd_var' FALL=1 TARG v(vout) VAL='0.2*vdd_var' FALL=1 
** Delay Rise Fall
.MEASURE TRAN tdrise TRIG v(vin)  VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' RISE=1 
.MEASURE TRAN tdfall TRIG v(vin)  VAL='0.5*vdd_var' FALL=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1 
** Pulse width/ Period
.MEASURE TRAN PWidth TRIG v(vout)  VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1 
.MEASURE TRAN Period TRIG v(vout)  VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' RISE=2 


.CONTROL
  OP
  TRAN 10p 40n
  **MEAS TRAN tr1090cs TRIG v(vout) VAL='0.1*csvddvar' RISE=1 TARG v(vout) VAL='0.9*csvddvar' RISE=1 

.ENDC

.GLOBAL GND
