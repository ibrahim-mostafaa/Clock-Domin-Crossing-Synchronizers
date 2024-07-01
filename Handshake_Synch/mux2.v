
module mux2(
input sel,
input d0,d1, 
output y
);

assign y = sel?d1:d0; 
 
endmodule 


// instance: 
// mux2 inst_name(.sel(),.d0(),.d1(),.y()); 