`timescale 1ns / 100ps
//`define CLK_PEERIOD  10

module Toggle_Synch_tb (); 
// inputs & outputs 
reg clkA, clkB, rst_n; 
reg pulse; 

// wire outputs
wire q; 

// instantiate dut
Toggle_Synch dut(.clkA(clkA), .clkB(clkB), .rst_n(rst_n), .pulse(pulse), .q(q)); 

// generate clk
parameter CLK_PEERIOD = 10;
// clkA: fast, #5 High, #5 Low, period = 10
initial begin
    clkA = 1; 
forever  begin 
#(CLK_PEERIOD/2) clkA = ~clkA; 
end 
end 


// clkB: slow, #20 High, #20 Low, period = 40 
initial begin
    clkB = 1; 
forever  begin 
#(CLK_PEERIOD*2) clkB = ~clkB; 
end 
end 

// initiate pulse
initial begin
    repeat(2)@(posedge clkA); 
    pulse = 1; 
    @(posedge clkA); 
    pulse = 0; 
end

// put reset values.  
initial begin
rst_n = 1'b0; 
pulse = 1'b0;
@(negedge clkB); rst_n = 1'b1;  
end

endmodule 