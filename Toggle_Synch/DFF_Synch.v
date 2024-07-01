
module DFF_Synch(
input clk, rst_n,
input d,
output reg q
); 

reg q0; 

always @(posedge clk or negedge rst_n) begin 
if (!rst_n) begin 
q0 <= 0; 
q  <= 0; 
end 
else begin 
q0 <= d; 
q  <= q0; 
end 

end 

endmodule 

// instance:
//  DFF_Synch inst_name (.clk(),.rst_n(), .d(), .q());  

