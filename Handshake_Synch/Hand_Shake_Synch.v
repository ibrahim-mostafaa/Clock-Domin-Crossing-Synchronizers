`include "dff.v"
`include "mux2.v"
`include "DFF_Synch.v"

module Hand_Shake_Synch(
input clkA, clkB, rst_n,
input pulse,
output q
); 

wire m0,m1; 
wire Req; 
wire n1; 
wire Ack; 
wire sel; 

mux2 mux_1(.sel(sel),.d0( Req ),.d1(1'b0),.y(m0)); 

mux2 mux_2 (.sel(pulse),.d0(m0),.d1(1'b1),.y(m1)); 

dff dff_1 (.clk(clkA),.rst_n(rst_n),.d(m1),.q(Req)); 

DFF_Synch Dff_Synch1 (.clk(clkB),.rst_n(rst_n), .d(Req), .q(n1));  

dff dff_2 (.clk(clkB),.rst_n(rst_n),.d(n1),.q(Ack)); 

DFF_Synch Dff_Synch2 (.clk(clkA),.rst_n(rst_n), .d(Ack), .q(sel)); 

assign q = n1 & (~Ack); 

endmodule 

// instance:
//  Hand_Shake_Synch inst_name (.clkA(), .clkB(clkB), .rst_n(), .pulse(), .q());  

