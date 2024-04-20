
module Mux_en_Synch #(parameter width = 8)(
input clk1,clk2,
input rst_n,
input [width-1:0]  data_in,
output [width-1:0] data_out
); 

//wire en;
//assign en=1;  

wire q0; 
wire sel; 

wire [width-1:0] din,dout,q_out; 

dff f1 (.clk(clk1),.rst_n(rst_n),.d(clk1),.q(q0)); 
DFF_Synch dff1 (.clk(clk2),.rst_n(rst_n), .d(q0), .q(sel));
mux2 #(.width(width)) myMux1(.sel(sel), .d0(q_out), .d1(din), .y(dout));   

register #(.width(width)) reg1 (.clk(clk1),.rst_n(rst_n), .d(data_in), .q(din)); 
register #(.width(width)) reg2 (.clk(clk1),.rst_n(rst_n), .d(dout), .q(q_out)); 
assign data_out = q_out;  

endmodule 

// instance:
//  Mux_en_Synch inst_name (.clk1(),.clk2(),.rst_n(), .data_in(), .data_out());  

