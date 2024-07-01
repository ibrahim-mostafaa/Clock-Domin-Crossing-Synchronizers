`include "dff.v"
`include "DFF_Synch.v"

module Pulse_Synch(
input clk, rst_n,
input pulse,
output q
); 

wire n1,n2; 

DFF_Synch inst1 (.clk(clk),.rst_n(rst_n), .d(pulse), .q(n1));  

dff dff_inst1 (.clk(clk),.rst_n(rst_n),.d(n1),.q(n2)); 

assign q = n1 & (~n2); 

endmodule 

// instance:
//  Pulse_Synch inst_name (.clk(),.rst_n(), .pulse(), .q());  

