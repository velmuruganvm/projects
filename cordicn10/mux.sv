module mux(in1,in2,sel,out);
input in1,in2,sel;
output out;
wire a,b,c;
assign a=in2&sel;
assign b=~sel;
assign c=in1&b;
assign out=(a|c);
endmodule