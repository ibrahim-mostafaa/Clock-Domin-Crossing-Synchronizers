`include "dff.v"
`include "DFF_Synch.v"

module Pulse_Synch(
input clkA, clkB, rst_n,
input pulse,
output q
); 

wire m; 
wire n1,n2; 

dff dff_inst2 (.clk(clkA),.rst_n(rst_n),.d(pulse),.q(m)); 

DFF_Synch inst1 (.clk(clkB),.rst_n(rst_n), .d(m), .q(n1));  

dff dff_inst1 (.clk(clkB),.rst_n(rst_n),.d(n1),.q(n2)); 

assign q = n1 & (~n2); 

endmodule 

// instance:
//  Pulse_Synch inst_name (.clk(),.rst_n(), .pulse(), .q());  

