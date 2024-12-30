
`include "fmult_extra.sv"
`include "mux.sv"

/*=======================================###################################################################################################==========================
this is 32 floating bit multiplier writern in quartus software.
if you have any reviews on this code please mail to velmuruganvm15in@gmail.com. 
writen by vekmurugan v.m
this multiplier is modified to accomodate adders and multipliers specially for cordic algorithm
if you want change only for multiplier please do so ........


=======================================###################################################################################################==========================*/
module fmult(a,b,clk,rst,p1,zd1);
//module vlsi(a,b,clk,rst,p,zd1);
input[31:0]a,b;
input clk,rst;
output[31:0]p1;
wire[31:0]p;
wire pw;
output zd1;
wire zm1;
wire za1,za2,za3,za4;
ppvlsi a1(a,b,clk,rst,p);
ze0 zsa2(a,32'b00000000000000000000000000000000,za1);
ze0 zsa3(b,32'b00000000000000000000000000000000,za2);
ze0 zsa1(p1,32'b00000000000000000000000000000000,zm1);
nmux31 mn(p,32'b00000000000000000000000000000000,rst,p1);
assign za3=za1|za2;
mux wwu (zm1,1'b1,{{za3^zm1}},zd1);
//ppvlsi a1(32'b11000100001000100101001100100100,32'b11000100001001010110010100011111,clk,rst,p);
endmodule
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------






============================================================================================================================================================*/


module faaa(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
wire r,i,t;
assign r=a^b;
assign s=cin^r;
assign i=a&b;
assign t=cin&r;
assign cout=i|t;
endmodule
module add3(w2b,w2a,w1b,w1a,w0b,w0a,cin,s2,s1,s0,cout);
input w0a,w0b,w1a,w1b,w2a,w2b,cin;
output s0,s1,s2,cout;
wire c0,c1;
faaa fa1(w0b,w0a,cin,s0,c0);
faaa fa2(w1b,w1a,c0,s1,c1);
faaa fa3(w2b,w2a,c1,s2,cout);
endmodule
module vedic33(a,b,p);
input[2:0]a;
input[2:0]b;
output[5:0]p;
wire[9:0]w;
wire[5:0]s;
wire[2:0]c;
assign w[0]=a[0]&b[0];
assign w[1]=a[1]&b[0];
assign w[2]=a[2]&b[0];
assign w[3]=a[0]&b[1];
assign w[4]=a[1]&b[1];
assign w[5]=a[2]&b[1];
assign w[6]=a[0]&b[2];
assign w[7]=a[1]&b[2];
assign w[8]=a[2]&b[2];
add3 a1(1'b0,w[5],w[2],w[4],w[1],w[3],1'b0,s[2],s[1],s[0],c[0]);
add3 a2(c[0],w[8],s[2],w[7],s[1],w[6],1'b0,s[5],s[4],s[3],c[1]);
assign p[0]=w[0];
assign p[1]=s[0];
assign p[2]=s[3];
assign p[3]=s[4];
assign p[4]=s[5];
assign p[5]=c[1];
endmodule
module fa6(x1, y1, k, sa, mcout);
  input [5:0] x1, y1;
  input k;
  output [5:0] sa;
  output mcout;
  wire [5:0] s;
  wire [5:0] cout;
faa fa1(x1[0],y1[0], k, s[0], cout[0]);
  // Generate block to handle the loop
  genvar j;
  generate
    for (j = 1; j <= 5; j = j + 1) begin : sas
      faa fa_inst(x1[j], y1[j] , cout[j-1], s[j], cout[j]);
    end
  endgenerate
  assign sa = s;
  assign mcout = cout[5];
endmodule
module fa12(x1, y1, k, sa, mcout);
  input [11:0] x1, y1;
  input k;
  output [11:0] sa;
  output mcout;
  wire [11:0] s;
  wire [11:0] cout;
faa fa1(x1[0],y1[0], k, s[0], cout[0]);
  // Generate block to handle the loop
  genvar j;
  generate
    for (j = 1; j <= 11; j = j + 1) begin : sas
      faa fa_inst(x1[j], y1[j] , cout[j-1], s[j], cout[j]);
    end
  endgenerate
  assign sa = s;
  assign mcout = cout[11];
endmodule
module fa24(x1, y1, k, sa, mcout);
  input [23:0] x1, y1;
  input k;
  output [23:0] sa;
  output mcout;
  wire [23:0] s;
  wire [23:0] cout;
faa fa1(x1[0],y1[0], k, s[0], cout[0]);
  // Generate block to handle the loop
  genvar j;
  generate
    for (j = 1; j <= 23; j = j + 1) begin : sas
      faa fa_inst(x1[j], y1[j] , cout[j-1], s[j], cout[j]);
    end
  endgenerate
  assign sa = s;
  assign mcout = cout[23];
endmodule
//
module vedic66(y,x,p);
input[5:0]x,y;
output[11:0]p;
//output[5:0]s01;
wire[5:0]s1,s2,s3,s4;
wire [5:0]f0,f1,f2;
wire [5:0]mout;
vedic33 a1(y[2:0],x[2:0],s1[5:0]);
vedic33 a2(y[2:0],x[5:3],s2[5:0]);
vedic33 a3(y[5:3],x[2:0],s3[5:0]);
vedic33 a4(y[5:3],x[5:3],s4[5:0]);
fa6 da0(s3[5:0],s2[5:0],1'b0,f0[5:0],mout[0]);
fa6 da1(f0[5:0],{3'b000,s1[5:3]},1'b0,f1[5:0],mout[1]);
wire o1;
assign o1=mout[0]|mout[1];
fa6 da2(s4[5:0],{{2'b00,o1,f1[5:3]}},1'b0,f2[5:0],mout[2]);
assign p[11:0]={f2[5:0],f1[2:0],s1[2:0]};
endmodule
module vedic12(y,x,p);
input[11:0]x,y;
output[23:0]p;
wire[11:0]s1,s2,s3,s4;
wire[11:0]f0,f1,f2;
wire [5:0]mout;
vedic66 a1(y[5:0],x[5:0],s1[11:0]);
vedic66 a2(y[5:0],x[11:6],s2[11:0]);
vedic66 a3(y[11:6],x[5:0],s3[11:0]);
vedic66 a4(y[11:6],x[11:6],s4[11:0]);
fa12 da0(s3[11:0],s2[11:0],1'b0,f0[11:0],mout[0]);
fa12 da1(f0[11:0],{6'b000000,s1[11:6]},1'b0,f1[11:0],mout[1]);
wire o1;
assign o1=mout[0]|mout[1];
fa12 da2(s4[11:0],{{5'b00000,o1,f1[11:6]}},1'b0,f2[11:0],mout[2]);
assign p[23:0]={f2[11:0],f1[5:0],s1[5:0]};
endmodule
module vedic24(a,b,p);
input[22:0]a,b;
wire [23:0]x,y;
assign x[23:0]={1'b1,a[22:0]};
assign y[23:0]={1'b1,b[22:0]};
output[47:0]p;
wire[23:0]s1,s2,s3,s4;
wire[23:0]f0,f1,f2;
wire [5:0]mout;
vedic12 a1(y[11:0],x[11:0],s1[23:0]);
vedic12 a2(y[11:0],x[23:12],s2[23:0]);
vedic12 a3(y[23:12],x[11:0],s3[23:0]);
vedic12 a4(y[23:12],x[23:12],s4[23:0]);
fa24 da0(s3[23:0],s2[23:0],1'b0,f0[23:0],mout[0]);
fa24 da1(f0[23:0],{12'b000000000000,s1[23:12]},1'b0,f1[23:0],mout[1]);
wire o1;
assign o1=mout[0]|mout[1];
fa24 da2(s4[23:0],{{11'b00000000000,o1,f1[23:12]}},1'b0,f2[23:0],mout[2]);
assign p[47:0]={f2[23:0],f1[11:0],s1[11:0]};
endmodule

module dref47(inn,clk,rst,o);
input [47:0]inn;
input clk,rst;
//wire rst;
output [47:0]o;
reg [47:0]o;
always @(posedge clk)
begin 
if (rst)
begin
o<=48'b000000000000000000000000000000000000000000000000;
end
else
begin
o<=inn;
end 
end
endmodule
module nmux47 (input [47:0] in1, in2, input sel, output [47:0] out);
  genvar i;
  generate
    for (i = 0; i <= 47; i = i + 1) begin : gen_mux
      mux m (.in1(in1[i]), .in2(in2[i]), .sel(sel), .out(out[i]));
    end
  endgenerate
endmodule
module nmux31 (input [31:0] in1, in2, input sel, output [31:0] out);
  genvar i;
  generate
    for (i = 0; i <= 31; i = i + 1) begin : gen_mux
      mux m (.in1(in1[i]), .in2(in2[i]), .sel(sel), .out(out[i]));
    end
  endgenerate
endmodule

module nvlsi(in,clk,rst,oo1,sumw,acc,ft0);//normalizer circuit
input [47:0]in;
input rst;
wire aa;
assign aa=in[47];
input clk;
wire[47:0]o;
output[22:0]oo1;
assign oo1[22:0]=o[46:23];
wire[47:0] mu;
wire[47:0] mu1;
wire a;
assign mu1[47:0]={a,mu[47:1]};//{in,rreg[22:1]} {rreg[21:0],in}
wire [47:0]rnex1;
wire [47:0]rnex1a;
wire [47:0]rnex2;
wire [47:0]oo;
wire esel,ol;
wire coclk,clk1;
wire clkm;
wire sel;
output[7:0]sumw;
wire[7:0]sumw1;
wire[7:0]sumw2;
wire ft;
wire esel1;
output acc;
wire esel2,ed1,ed2;
wire ac;
wire mcout;
assign ac=o[46];
defl ad01(ac,clkm,rst,ed1);
defl ad02(ed1,clkm,rst,acc);
assign rnex1a[47:0]={rnex1[46:0],a};
nmux47 a1(mu,mu1,~sel,rnex1);
nmux47 a2(rnex1,rnex1a,sel,rnex2);
dref47 d1(rnex2,coclk,rst,oo);
nmux47 a3(in,oo,esel1,mu);
defl ad1(1'b1,clkm,rst,ol);
defl ad2(ol,clkm,rst,esel1);
assign o[47:0]=mu[47:0];
mux m8(in[46],1'b0,aa,ft);
mux m7(clk,1'b0,ft,clkm);
mux m1(clkm,1'b0,o[46],clk1);
mux m2(clk1,esel,aa,coclk);
mux m3(1'b0,1'b1,aa,a);
mux m4(1'b1,1'b0,aa,sel);
mux m6(clkm,1'b0,esel1,esel);
//mux m5(1'b0,clkm,esel,clk);
counte cc1(coclk,rst,sumw1);
adsu8 dfs(sumw1,8'b00000001,1'b1,sumw2,mcout);
smux8 sdf(sumw2,8'b00000000,ft,sumw);
output ft0;
defl adb1(ft,clk,rst,ft0);
endmodule



module ppvlsi(a,b,clk,rst,p);
input[31:0]a,b;
input clk,rst;
output[31:0]p;
wire[31:0]pq;
wire [47:0]pp1;
wire[22:0]oo1;
wire[7:0]sumw;
wire[7:0]saw1,saw2,sa1;
wire coh;
wire c1,c2;
wire coh2;
wire k1,k2,k3;
wire ac,acc,ft0;
assign coh=acc|ft0;
assign coh2=k1|k2;
assign k3=coh&~coh2&~rst;
wire nexx2;
wire nex1;
wire mcout;
ze  o1(a[31:0],32'b00000000000000000000000000000000,k1);
ze  o2(b[31:0],32'b00000000000000000000000000000000,k2);


mux zxq(1'b0,clk,rst,nex1);
assign nexx2=clk|nex1;

vedic24 aq1(a[22:0],b[22:0],pp1[47:0]);
nvlsi aq2(pp1[47:0],nexx2,rst,oo1,sumw,acc,ft0);
adsu8 sw1(a[30:23],b[30:23],1'b0,saw1,mcout);
adsu8 sw2(saw1,8'b10000001,1'b0,saw2,mcout);
adsu8 sw3(saw2,sumw,1'b0,sa1,mcout);
wire sign;
assign sign =a[31]^b[31];
assign pq={sign,sa1,oo1};
wire k4;
assign k4=rst|k3;

nmux31 mn(32'b00000000000000000000000000000000,pq,k4,p);
endmodule
