v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 620 -430 860 -430 {
lab=VX}
N 620 -600 620 -520 {
lab=#net1}
N 620 -690 620 -670 {
lab=VDD}
N 660 -630 820 -630 {
lab=#net1}
N 620 -580 690 -580 {
lab=#net1}
N 690 -580 740 -580 {
lab=#net1}
N 740 -630 740 -580 {
lab=#net1}
N 740 -300 740 -270 {
lab=0}
N 740 -270 740 -250 {
lab=0}
N 450 -330 700 -330 {
lab=VBIAS}
N 470 -390 470 -330 {
lab=VBIAS}
N 410 -390 470 -390 {
lab=VBIAS}
N 620 -730 620 -690 {
lab=VDD}
N 410 -300 410 -250 {
lab=0}
N 350 -330 410 -330 {
lab=0}
N 740 -330 800 -330 {
lab=0}
N 620 -480 680 -480 {
lab=0}
N 800 -480 860 -480 {
lab=0}
N 620 -520 620 -510 {
lab=#net1}
N 620 -450 620 -430 {
lab=VX}
N 860 -450 860 -430 {
lab=VX}
N 860 -600 860 -510 {
lab=VOUT1}
N 620 -670 620 -660 {
lab=VDD}
N 860 -730 860 -660 {
lab=VDD}
N 560 -630 620 -630 {
lab=VDD}
N 860 -630 920 -630 {
lab=VDD}
N 620 -730 860 -730 {
lab=VDD}
N 740 -750 740 -730 {
lab=VDD}
N 410 -730 410 -700 {
lab=VDD}
N 410 -750 410 -730 {
lab=VDD}
N 1220 -300 1220 -270 {
lab=0}
N 1220 -270 1220 -250 {
lab=0}
N 1220 -330 1280 -330 {
lab=0}
N 580 -330 580 -190 {
lab=VBIAS}
N 580 -190 950 -190 {
lab=VBIAS}
N 950 -330 950 -190 {
lab=VBIAS}
N 950 -330 1060 -330 {
lab=VBIAS}
N 1220 -730 1220 -660 {
lab=VDD}
N 1220 -630 1280 -630 {
lab=VDD}
N 1220 -600 1220 -360 {
lab=VOUT}
N 860 -560 990 -560 {
lab=VOUT1}
N 990 -590 990 -560 {
lab=VOUT1}
N 990 -630 990 -590 {
lab=VOUT1}
N 990 -630 1060 -630 {
lab=VOUT1}
N 1060 -630 1180 -630 {
lab=VOUT1}
N 1220 -750 1220 -730 {
lab=VDD}
N 1060 -330 1180 -330 {
lab=VBIAS}
N 680 -480 800 -480 {
lab=0}
N 410 -640 410 -560 {
lab=#net2}
N 410 -500 410 -360 {
lab=VBIAS}
N 740 -430 740 -420 {
lab=VX}
C {sky130_fd_pr/nfet_01v8.sym} 720 -330 0 0 {name=M3
L=2
W=4
nf=4 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 430 -330 0 1 {name=M6
L=2
W=4
nf=4
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 560 -630 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 920 -630 2 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 740 -750 1 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 410 -750 1 0 {name=p13 sig_type=std_logic lab=VDD}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Sai"}
C {devices/lab_pin.sym} 900 -480 2 0 {name=p16 sig_type=std_logic lab=VICM}
C {sky130_fd_pr/nfet_01v8.sym} 1200 -330 0 0 {name=M7
L=2
W=7
nf=7
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1280 -630 2 0 {name=p20 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1220 -750 1 0 {name=p22 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1220 -510 2 0 {name=p24 sig_type=std_logic lab=VOUT}
C {devices/launcher.sym} 1410 -370 0 0 {name=h26
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/launcher.sym} 1410 -340 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/vsource.sym} 1300 -150 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/lab_pin.sym} 1300 -180 1 0 {name=p21 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1300 -120 3 0 {name=p25 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1220 -250 3 0 {name=p8 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 740 -250 3 0 {name=p9 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 410 -250 3 0 {name=p19 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 580 -480 0 0 {name=p17 sig_type=std_logic lab=VICM}
C {devices/vsource.sym} 1390 -150 0 0 {name=V2 value=0.9 savecurrent=false}
C {devices/lab_pin.sym} 1390 -120 3 0 {name=p27 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1390 -180 1 0 {name=p26 sig_type=std_logic lab=VICM}
C {devices/code_shown.sym} 1480 -590 0 0 {name=OP_COMMANDS
simulator=ngspice
only_toplevel=false
value="* ngspice commands
.options savecurrents
.control
   save all
* start op analysis here
   op
   remzerovec
   write p3_opamp_op.raw
.endc
"}
C {devices/lab_pin.sym} 350 -330 0 0 {name=p3 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 390 -670 0 0 {name=p4 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 740 -480 1 0 {name=p6 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 1280 -330 2 0 {name=p7 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 800 -330 2 0 {name=p5 sig_type=std_logic lab=0}
C {sky130_fd_pr/corner.sym} 90 -240 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/lab_pin.sym} 1100 -330 1 0 {name=p1 sig_type=std_logic lab=VBIAS}
C {devices/lab_pin.sym} 990 -560 2 0 {name=p14 sig_type=std_logic lab=VOUT1}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 410 -670 0 0 {name=R1
L=2.8
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {devices/ammeter.sym} 410 -530 0 0 {name=Vcurrent savecurrent=true}
C {devices/ammeter.sym} 740 -390 0 0 {name=Vtail savecurrent=true}
C {devices/lab_pin.sym} 740 -430 1 0 {name=p2 sig_type=std_logic lab=VX}
C {sky130_fd_pr/nfet_01v8.sym} 600 -480 0 0 {name=M2
L=0.5
W=2.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 880 -480 0 1 {name=M1
L=0.5
W=2.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 640 -630 0 1 {name=M4
L=2
W=6
nf=6
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 840 -630 0 0 {name=M5
L=2
W=6
nf=6
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1200 -630 0 0 {name=M8
L=0.5
W=20
nf=20
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
