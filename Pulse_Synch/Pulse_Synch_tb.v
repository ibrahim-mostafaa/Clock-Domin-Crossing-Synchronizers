`timescale 1ns / 100ps

module Pulse_Synch_tb(); 
// inputs & outputs 
reg clk, rst_n; 
reg pulse; 

// wire outputs
wire q; 

// instantiate dut
Pulse_Synch dut(.clk(clk), .rst_n(rst_n), .pulse(pulse), .q(q)); 

// generate clk
always begin 
clk = 1'b1; #5 clk = 1'b0; #5; 
end 

// put reset values.  
initial begin
rst_n = 1'b0; 
pulse = 1'b0;
@(negedge clk); rst_n = 1'b1;  
repeat (3) begin 
@(posedge clk); pulse = 1; 
repeat(8)@(posedge clk); pulse = 0; 
end
end


endmodule 