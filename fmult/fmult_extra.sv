//====================================================================================================================================================
//needed modules inherited from fadd_sub.

module ze(a,b,w);
input[31:0]a,b;
wire[31:0]q;
output w;
wire ww;
assign q[30:0]=a[30:0]^b[30:0];
assign ww = q[0] | q[1] | q[2] | q[3] | q[4] | q[5] | q[6] | q[7] | q[8] | q[9] | q[10] | q[11] | q[12] | q[13] | q[14] | q[15] | q[16] | q[17] | q[18] | q[19] | q[20] | q[21] | q[22] | q[23] | q[24] | q[25] | q[26] | q[27] | q[28] | q[29] | q[30];

assign w=~ww;
endmodule

module faa(x, y, k, sum1, cout);
  input x, y, k;
  output sum1, cout;

  wire w1, w2, w3;

  assign w1 = x ^ y;
  assign sum1 = w1 ^ k;
  assign w2 = x & y;
  assign w3 = w1 & k;
  assign cout = w2 | w3;
endmodule

module defl(inn,clk,rst,o);
input inn;
input clk,rst;
//wire rst;
output o;
reg o;
always @( posedge clk)
begin 
if (rst)
begin
o<=1'b0;
end
else
begin
o<=inn;
end 
end
endmodule

module counte(clk,rst,sumw);
input clk,rst;
output [7:0]sumw;
wire mcout;
wire [7:0]in1,in2;
adsu8 a1(in1,8'b00000001,1'b0,in2,mcout);
dref18 a2(in2,clk,rst,in1);
assign sumw=in1;
endmodule

module adsu8(x1, y1, k, sa, mcout);
  input [7:0] x1, y1;
  input k;
  output [7:0] sa;
  output mcout;
  wire [7:0] y1;
  wire [7:0] s;
  wire [7:0] cout;
faa fa1(x1[0], {y1[0]^k}, k, s[0], cout[0]);
  // Generate block to handle the loop
  genvar j;
  generate
    for (j = 1; j <= 7; j = j + 1) begin : sas
      faa fa_inst(x1[j], y1[j] ^ k, cout[j-1], s[j], cout[j]);
    end
  endgenerate
  assign sa = s;
  assign mcout = cout[7];
endmodule

module smux8 (input [7:0] in1, in2, input sel, output [7:0]out);
  genvar i;
  generate
    for (i = 0; i <= 7; i = i + 1) begin : gen_mux
      mux m (.in1(in1[i]), .in2(in2[i]), .sel(sel), .out(out[i]));
    end
  endgenerate
endmodule

module dref18(inn,clk,rst,o);
input [7:0]inn;
input clk,rst;
//wire rst;
output [7:0]o;
reg [7:0]o;
always @(posedge clk)
begin 
if (rst)
begin
o<=8'b00000000;
end
else
begin
o<=inn;
end 
end
endmodule

module ze0(a,b,w);
input[31:0]a,b;
wire[31:0]q;
output w;
wire ww;
assign q[31:0]=a[31:0]^b[31:0];
assign ww = q[0] | q[1] | q[2] | q[3] | q[4] | q[5] | q[6] | q[7] | q[8] | q[9] | q[10] | q[11] | q[12] | q[13] | q[14] | q[15] | q[16] | q[17] | q[18] | q[19] | q[20] | q[21] | q[22] | q[23] | q[24] | q[25] | q[26] | q[27] | q[28] | q[29] | q[30] |q[31];

assign w=~ww;
endmodule

//====================================================================================================================================