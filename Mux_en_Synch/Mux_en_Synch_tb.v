`timescale 1ns / 100ps

module Mux_en_Synch_tb(); 
// inputs & outputs
parameter width = 8;  
reg clk1, clk2, rst_n; 
reg [width-1:0] data_in; 

// wire outputs
wire [width-1:0] data_out; 

// instantiate dut
Mux_en_Synch #(.width(width)) dut (.clk1(clk1),.clk2(clk2),.rst_n(rst_n),
 .data_in(data_in), .data_out(data_out));  

// generate clk
always begin 
clk1 = 1'b1; #10 clk1 = 1'b0; #10; 
end 
always begin 
clk2 = 1'b1; #5 clk2 = 1'b0; #5; 
end 

// store inputs in testvectors and put reset values.  
initial begin
rst_n = 1'b0; 
@(negedge clk1); rst_n = 1'b1; 
 
@(posedge clk1);
#1 data_in = 8'b0000_0110; 
repeat (2) @(posedge clk1); 
#1 data_in = 8'b0000_0001; 
end

endmodule 