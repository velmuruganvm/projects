module mux(in1,in2,sel,out);
input logic in1,in2,sel;
output logic out;
wire a,b,c;
assign a=in2&sel;
assign b=~sel;
assign c=in1&b;
assign out=(a|c);
endmodule