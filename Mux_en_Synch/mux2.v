
module mux2 #(parameter width = 4)(
input sel,
input [width -1: 0]d0,d1,
output [width -1: 0]y
); 

assign y = sel?d1:d0; 

endmodule 

// instance:
//  mux2 #(.width(  )) myMux(.sel(), .d0(), .d1(), .y());   

