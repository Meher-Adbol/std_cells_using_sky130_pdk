*buffer

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt           
*voltage sources:
Vdd vdd gnd DC 1.8
Vin in gnd pulse(0 1.8 0p 20p 20p 1n 2n)
Xnot1 in vdd gnd out2 buffer
Xnot3 out2 vdd gnd out3 not
.subckt not a vdd vss z
xm01  z a vdd vdd sky130_fd_pr__pfet_01v8 l=0.15 w=1.27 as=0.381 ad=0.381 ps=3.14 pd=3.14
xm02 z a vss vss sky130_fd_pr__nfet_01v8 l=0.15 w=0.42 as=0.126 ad=0.126 ps=1.44 pd=1.44
.ends
.param l1=0.15
.param w1=1.27
.param w2=0.42
.param l2=0.15
.param w3=1.9
.param w4=0.6
.param as1=2*l1*w1
.param ad1=2*l1*w1
.param ps1=2*(2*l1+w1)
.param pd1=2*(2*l1+w1)
.param as2=2*l1*w2
.param ad2=2*l1*w2
.param ps2=2*(2*l1+w2)
.param pd2=2*(2*l1+w2)
.param as3=2*l2*w3
.param ad3=2*l2*w3
.param ps3=2*(2*l2+w3)
.param pd3=2*(2*l2+w3)
.param as4=2*l2*w4
.param ad4=2*l2*w4
.param ps4=2*(2*l2+w4)
.param pd4=2*(2*l2+w4)
.subckt  buffer in Vdd Vss out2
xm01  z in vdd vdd sky130_fd_pr__pfet_01v8 l={l1} w={w1} as={as1} ad={ad1} ps={ps1} pd={pd1}
xm02 z in vss vss sky130_fd_pr__nfet_01v8 l={l1} w={w2} as={as2} ad={ad2} ps={ps2} pd={pd2}
xm03  out2 z vdd vdd sky130_fd_pr__pfet_01v8 l={l2} w={w3} as={as3} ad={ad3} ps={ps3} pd={pd3}
xm04 out2 z vss vss sky130_fd_pr__nfet_01v8 l={l2} w={w4} as={as4} ad={ad4} ps={ps4} pd={pd4}
C0 Vdd z 0.314929f
C1 Vdd in 0.136087f
C2 z out2 0.063238f
C3 in out2 4.63e-20
C4 in z 0.043537f
C5 Vdd out2 0.181883f
C6 out2 Vss 0.389807f
C7 in Vss 0.469839f
C8 Vdd Vss 2.39974f
C9 z Vss 0.832877f
.ends
.tran 1ps 4ns 0 10p
.control
run
meas tran tRISE TRIG v(out2) VAL=0.36 RISE=1 TARG v(out2) VAL=1.44 RISE=1
meas tran tFALL TRIG v(out2) VAL=1.44 FALL=2 TARG v(out2) VAL=0.36 FALL=2
 plot in out2
.endc
.end
