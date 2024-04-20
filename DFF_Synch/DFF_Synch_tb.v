`timescale 1ns / 100ps

module DFF_Synch_tb(); 
// inputs & outputs 
reg clk, rst_n; 
reg d; 

// wire outputs
wire q; 

// instantiate dut
DFF_Synch dut(.clk(clk), .rst_n(rst_n), .d(d), .q(q)); 

// generate clk
always begin 
clk = 1'b1; #5 clk = 1'b0; #5; 
end 

// store inputs in testvectors and put reset values.  
initial begin
rst_n = 1'b0; 
@(negedge clk); rst_n = 1'b1;  
@(posedge clk); d = 1; 
#1 d = 0; 
#1 d = 1; 
#1 d = 0; 
#1 d = 1; 
#1 d = 0; 
#1 d = 1; 
#1 d = 0; 
#1 d = 1; 
#1 d = 0; 
#1 d = 1; 
#1 d = 0; 
#1 d = 1; 
end


endmodule 