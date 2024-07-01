
module Toggle_ff(
input wire clk, rst_n, 
input wire T, 
output reg q 
);
//Operation of Toggle flip flop
// rst_n = 0 , T=x, q = 0; 
// rst_n = 1 , T=1, q = ~q; 
// rst_n = 1 , T=x, q = q; 

always @(posedge clk or negedge rst_n)
if (!rst_n) q <= 0;
else if(T) q <= ~q;
else        q <= q; 
 
endmodule 


// instance: 
// Toggle_ff inst_name(.clk(),.rst_n(),.T(),.q()); 