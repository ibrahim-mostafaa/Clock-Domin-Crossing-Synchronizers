
module register #(parameter width = 8)(
input clk, rst_n,
input [width-1:0] d,
output reg [width-1:0] q
); 


always @(posedge clk or negedge rst_n) begin
 
if (!rst_n) begin 
q  <= 0; 
end 

else begin  
q  <= d; 
end 

end 

endmodule 

// instance:
//  register #(.width( ))inst_name (.clk(),.rst_n(), .d(), .q());  

