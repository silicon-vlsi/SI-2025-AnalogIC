v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 90 -210 90 -90 {lab=vin}
N 90 -210 250 -210 {lab=vin}
N 250 -210 250 -190 {lab=vin}
N 250 -130 250 -90 {lab=vout}
N 250 -30 250 -0 {lab=GND}
N 90 0 250 0 {lab=GND}
N 90 -30 90 0 {lab=GND}
N 140 -0 140 20 {lab=GND}
C {devices/code.sym} -140 -130 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {devices/code_shown.sym} -500 -240 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
  save all
  op
  write TB_diode.raw
  set appendwrite
  tran 1u 10m
.endc
"}
C {res.sym} 250 -60 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 90 -60 0 0 {name=V1 value="0 sin(0 1 1k 0 0 0)" savecurrent=false}
C {gnd.sym} 140 20 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 150 -210 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_wire.sym} 250 -100 0 0 {name=p2 sig_type=std_logic lab=vout}
C {sky130_fd_pr/diode.sym} 250 -160 2 0 {name=D1
model=diode_pw2nd_05v5
area=1
perim=1
spiceprefix=X
}
