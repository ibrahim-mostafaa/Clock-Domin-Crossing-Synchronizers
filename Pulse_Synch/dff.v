
module dff(
input wire clk, rst_n, 
input wire d, 
output reg q 
);

always @(posedge clk or negedge rst_n)
if (!rst_n) q <= 0;
else q <= d;
 
endmodule 


// instance: 
// dff inst_name(.clk(),.rst_n(),.d(),.q()); 