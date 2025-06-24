v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -100 -20 -100 10 {lab=GND}
N 30 -20 30 10 {lab=#net1}
N -30 -50 -10 -50 {lab=vgds}
N -30 -100 -30 -50 {lab=vgds}
N -30 -100 30 -100 {lab=vgds}
N 30 -100 30 -80 {lab=vgds}
N 30 -50 50 -50 {lab=GND}
N -100 -100 -100 -80 {lab=vgds}
N -100 -100 -30 -100 {lab=vgds}
N 30 70 30 80 {lab=GND}
N -100 80 30 80 {lab=GND}
N -100 10 -100 80 {lab=GND}
N -40 80 -40 90 {lab=GND}
N 50 -50 80 -50 {lab=GND}
N 80 -50 80 80 {lab=GND}
N 30 80 80 80 {lab=GND}
C {vsource.sym} -100 -50 0 0 {name=Vds value=1}
C {simulator_commands_shown.sym} -420 -340 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands

.CONTROL 
  OP
  DC Vds 0 1.8 0.05 TEMP -40 120 20 
  **Vsb 0 0.5 0.1
  PLOT abs(vds#branch)
  plot sqrt(2*abs(vds#branch))
  plot log(abs(vds#branch))
.ENDC
"}
C {devices/code.sym} -410 -100 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 10 -50 0 0 {name=M1
L=1
W=4
nf=1 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {gnd.sym} -40 90 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -50 -100 0 0 {name=p1 sig_type=std_logic lab=vgds}
C {vsource.sym} 30 40 0 0 {name=Vsb value=0}
