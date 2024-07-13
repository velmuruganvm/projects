
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
fadd_sub is the main program
assume clk=2*clkk if clk is 20 then clkk is 10
wirttern in quartus by velmurugan v.m
if any review please mail to velmuruganvm15in@gmail.com
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



module fadd_sub(inx1,iny1,ka,clkk,rst,resu,mecout22,zd1);
input[31:0]inx1,iny1;


//module vlsi(ka,clkk,rst,resu,mecout22,zd1);
//wire[31:0]inx1,iny1;
//assign inx1=32'b00111111100000000000000000000000;
//assign iny1=32'b01100001101111000111001100100010;

input clkk,rst;
wire clk;
input ka;
wire kaa,kas;
//mux zxqa(1'b0,clk,rst,kas);
output[31:0]resu;
wire [31:0]presu;
output mecout22;
wire cong,w;
output zd1;
wire xw;
assign xw=w|rst;

clkg a1(clkk,1'b0,clk);
dref1 ada(ka,clk,1'b0,kaa);
//pvlsi p1(inx1,iny1,ka,clk,clkk,rst,resu,mecout22,cong);
pvlsi p1(inx1,iny1,kaa,clk,clkk,rst,presu,mecout22,cong);
ze hj(presu[31:0],32'b00000000000000000000000000000000,w);
mux032 fin(presu,32'b00000000000000000000000000000000,xw,resu);
ze0 zsa(resu,32'b00000000000000000000000000000000,zd1);
endmodule

/*------------------------------------------------------------------------------------------------------------------------------------------------------------
supporting programs
----------------------------------------------------------------------------------------------------------------------------------------------*/





module ze0(a,b,w);
input[31:0]a,b;
wire[31:0]q;
output w;
wire ww;
assign q[31:0]=a[31:0]^b[31:0];
assign ww = q[0] | q[1] | q[2] | q[3] | q[4] | q[5] | q[6] | q[7] | q[8] | q[9] | q[10] | q[11] | q[12] | q[13] | q[14] | q[15] | q[16] | q[17] | q[18] | q[19] | q[20] | q[21] | q[22] | q[23] | q[24] | q[25] | q[26] | q[27] | q[28] | q[29] | q[30] |q[31];

assign w=~ww;
endmodule

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

module pvlsi(inx1,iny1,kaa,clk,clkk,rst,resu,mecout22,cong);
//module pvlsi(inx1,iny1,kaa,clk,clkk,rst,resu,mecout22,cong,presu);

input[31:0]inx1,iny1;
input clk,clkk,rst;
input kaa;
wire ka;
//assign ka=kaa&~rst;
assign ka=kaa;
output [31:0]resu;
output mecout22;
wire [31:0]pfin,pfin1;
wire [23:0]pn;
wire [23:0]fout1;
wire[7:0]exo;
wire [7:0]sa;
wire q7;
wire nex;
wire ow1,ow2;
wire wk;// xor sign bits

wire co1;//control shifting in normalizer
assign co1=~wk&mecout22|ow2;

assign ow2=~wk&ow1;
wire q5,q3;

wire [7:0]sumw;
wire sigm;
wire acc;
wire ft;
output cong;
assign cong=acc|ft;
wire [31:0]ppresu,zx1;
wire [31:0]presu;
wire wq1,wq2;
wire cwq;
assign cwq=wq1|wq2;
wire mcout;


wire [31:0]sy1,resu1;
wire sc=iny1[31]^ka;
assign sy1[31:0]={sc,iny1[30:0]};
wire mc;
wire nex1;
//wire nex2;//wire or output
wire nexxx;
wire nexx2;
assign nexxx=nexx2;
assign wk=inx1[31]^sc;
mux zxq(1'b0,clk,rst,nex1);
assign nexx2=nex|nex1;
//assign mecout22=mc&~rst;
assign mecout22=mc;
vlsis av (inx1,sy1,ka,clk,clkk,rst,q5,q3,pn[23:0],exo,mc,q7,nex,ow1,sigm);
anvlsi a2(pn[23:0],nexx2,rst,co1,fout1,sumw,acc,ft);
adsu8 a3(exo,sumw,wk,sa,mcout);
assign pfin1={sigm,sa[7:0],fout1[22:0]};
mux032 fd(inx1[31:0],sy1[31:0],wq1,zx1[31:0]);
ze zw1 (inx1[31:0],32'b00000000000000000000000000000000,wq1);
ze zw2 (iny1[31:0],32'b00000000000000000000000000000000,wq2);

wire cong1,cong1n;
assign cong1=cong|cwq;
assign cong1n=cong1&~rst;
mux032 fin0(pfin1,zx1[31:0],cwq,presu);
//wire hk,kh;
//ze z1(presu,31'b0000000000000000000000000000000,kh);
//assign hk=cong1|kh;
mux032 fin(32'b00000000000000000000000000000000,presu,cong1,resu);
//mux032 fina(resu1,32'b00000000000000000000000000000000,rst,resu);
endmodule


/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
assume clk=2*clkk if clk is 20 then clkk is 10
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


module mux(in1,in2,sel,out);
input in1,in2,sel;
output out;
wire a,b,c;
assign a=in2&sel;
assign b=~sel;
assign c=in1&b;
assign out=(a|c);
endmodule
module mux032(in1,in2,sel,out);
input[31:0]in2,in1;
input sel;
output[31:0]out;
mux m31(in1[31],in2[31],sel,out[31]);
mux m30(in1[30],in2[30],sel,out[30]);
mux m29(in1[29],in2[29],sel,out[29]);
mux m28(in1[28],in2[28],sel,out[28]);
mux m27(in1[27],in2[27],sel,out[27]);
mux m26(in1[26],in2[26],sel,out[26]);
mux m25(in1[25],in2[25],sel,out[25]);
mux m24(in1[24],in2[24],sel,out[24]);
mux m23(in1[23],in2[23],sel,out[23]);
mux m22(in1[22],in2[22],sel,out[22]);
mux m21(in1[21],in2[21],sel,out[21]);
mux m20(in1[20],in2[20],sel,out[20]);
mux m19(in1[19],in2[19],sel,out[19]);
mux m18(in1[18],in2[18],sel,out[18]);
mux m17(in1[17],in2[17],sel,out[17]);
mux m16(in1[16],in2[16],sel,out[16]);
mux m15(in1[15],in2[15],sel,out[15]);
mux m14(in1[14],in2[14],sel,out[14]);
mux m13(in1[13],in2[13],sel,out[13]);
mux m12(in1[12],in2[12],sel,out[12]);
mux m11(in1[11],in2[11],sel,out[11]);
mux m10(in1[10],in2[10],sel,out[10]);
mux m9(in1[9],in2[9],sel,out[9]);
mux m8(in1[8],in2[8],sel,out[8]);
mux m7(in1[7],in2[7],sel,out[7]);
mux m6(in1[6],in2[6],sel,out[6]);
mux m5(in1[5],in2[5],sel,out[5]);
mux m4(in1[4],in2[4],sel,out[4]);
mux m3(in1[3],in2[3],sel,out[3]);
mux m2(in1[2],in2[2],sel,out[2]);
mux m1(in1[1],in2[1],sel,out[1]);
mux m0(in1[0],in2[0],sel,out[0]);
endmodule

module mux23(in1,in2,sel,out);
input[25:0]in1;
input[25:0]in2;
input sel;
output[25:0]out;
//mux m32(in1[32],in2[32],sel,out[32]);
//mux m31(in1[31],in2[31],sel,out[31]);
//mux m30(in1[30],in2[30],sel,out[30]);
//mux m29(in1[29],in2[29],sel,out[29]);
//mux m28(in1[28],in2[28],sel,out[28]);
//mux m27(in1[27],in2[27],sel,out[27]);
//mux m26(in1[26],in2[26],sel,out[26]);
mux m25(in1[25],in2[25],sel,out[25]);
mux m24(in1[24],in2[24],sel,out[24]);
mux m23(in1[23],in2[23],sel,out[23]);
mux m22(in1[22],in2[22],sel,out[22]);
mux m21(in1[21],in2[21],sel,out[21]);
mux m20(in1[20],in2[20],sel,out[20]);
mux m19(in1[19],in2[19],sel,out[19]);
mux m18(in1[18],in2[18],sel,out[18]);
mux m17(in1[17],in2[17],sel,out[17]);
mux m16(in1[16],in2[16],sel,out[16]);
mux m15(in1[15],in2[15],sel,out[15]);
mux m14(in1[14],in2[14],sel,out[14]);
mux m13(in1[13],in2[13],sel,out[13]);
mux m12(in1[12],in2[12],sel,out[12]);
mux m11(in1[11],in2[11],sel,out[11]);
mux m10(in1[10],in2[10],sel,out[10]);
mux m9(in1[9],in2[9],sel,out[9]);
mux m8(in1[8],in2[8],sel,out[8]);
mux m7(in1[7],in2[7],sel,out[7]);
mux m6(in1[6],in2[6],sel,out[6]);
mux m5(in1[5],in2[5],sel,out[5]);
mux m4(in1[4],in2[4],sel,out[4]);
mux m3(in1[3],in2[3],sel,out[3]);
mux m2(in1[2],in2[2],sel,out[2]);
mux m1(in1[1],in2[1],sel,out[1]);
mux m0(in1[0],in2[0],sel,out[0]);
endmodule
module muxm23(in1,in2,sel,out,ow);
input[22:0]in1;
input[25:0]in2;
input sel;
output[25:0]out;
input ow;
wire ooz;
mux mw(1'b1,1'b0,ow,ooz);
//mux m31(1'b0,in2[32],sel,out[32]);
//mux m30(1'b0,in2[31],sel,out[31]);
//mux m29(1'b0,in2[30],sel,out[30]);
//mux m28(1'b0,in2[29],sel,out[29]);
//mux m27(1'b0,in2[28],sel,out[28]);
//mux m26(1'b0,in2[27],sel,out[27]);
//mux m25(1'b0,in2[26],sel,out[26]);
mux m24(1'b0,in2[25],sel,out[25]);
mux m23(ooz,in2[24],sel,out[24]);
mux m22(in1[22],in2[23],sel,out[23]);
mux m21(in1[21],in2[22],sel,out[22]);
mux m20(in1[20],in2[21],sel,out[21]);
mux m19(in1[19],in2[20],sel,out[20]);
mux m18(in1[18],in2[19],sel,out[19]);
mux m17(in1[17],in2[18],sel,out[18]);
mux m16(in1[16],in2[17],sel,out[17]);
mux m15(in1[15],in2[16],sel,out[16]);
mux m14(in1[14],in2[15],sel,out[15]);
mux m13(in1[13],in2[14],sel,out[14]);
mux m12(in1[12],in2[13],sel,out[13]);
mux m11(in1[11],in2[12],sel,out[12]);
mux m10(in1[10],in2[11],sel,out[11]);
mux m9(in1[9],in2[10],sel,out[10]);
mux m8(in1[8],in2[9],sel,out[9]);
mux m7(in1[7],in2[8],sel,out[8]);
mux m6(in1[6],in2[7],sel,out[7]);
mux m5(in1[5],in2[6],sel,out[6]);
mux m4(in1[4],in2[5],sel,out[5]);
mux m3(in1[3],in2[4],sel,out[4]);
mux m2(in1[2],in2[3],sel,out[3]);
mux m1(in1[1],in2[2],sel,out[2]);
mux m0(in1[0],in2[1],sel,out[1]);
mux m00(1'b0,in2[0],sel,out[0]);
endmodule
module unshift(x1,a,clk,rst,sel,selc,out,ow);//main shift module
input [22:0]x1;
input a,clk,rst,sel,selc,ow;
output[23:0]out;

wire[25:0] mu;
wire[25:0] mu1;
assign mu1[25:0]={a,mu[25:1]};//{in,rreg[22:1]} {rreg[21:0],in}

wire [25:0]rnex1;
wire [25:0]rnex1a;
wire [25:0]rnex2;
wire [25:0]oo;
assign rnex1a[25:0]={rnex1[24:0],a};
mux23 a1(mu,mu1,~sel,rnex1);
mux23 a2(rnex1,rnex1a,sel,rnex2);
dref d1(rnex2,clk,rst,oo);
muxm23 a3(x1,oo,selc,mu,ow);
assign out[23:0]=mu[23:0];
endmodule
module dref(inn,clk,rst,o);
input [25:0]inn;
input clk,rst;
//wire rst;
output [25:0]o;
reg [25:0]o;
always @(posedge clk)
begin 
if (rst)
begin
o<=25'b0000000000000000000000000;
end
else
begin
o<=inn;
end 
end
endmodule
module dref1(inn,clk,rst,o);
input inn;
input clk,rst;
//wire rst;
output o;
reg o;
always @(posedge clk)
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
/*//this is to test working of shift-module
module vlsi (x1,a,clk,rst,sel,selc,out);
input [22:0]x1;
input a,clk,rst,sel,selc;
output[22:0]out;
unshift mo (23'b10011101001010101010010,a,clk,rst,sel,selc,out);
endmodule
*/
//---------------------------------------------------------------------------
// clock generating module 
//---------------------------------------------------------------------------
module comp(am1,bm1,iou);// a should be higher value
input [7:0]am1;
input [7:0]bm1;
//output om1;
wire ou;
output iou;
wire fn1,fn2,fn3,fn4,fn5;
wire f1,f2,f3,f4,f5,f6,f7,f8;
wire f0;
assign f0=~(am1[0]^bm1[0]);

assign f1=~(am1[1]^bm1[1]);
assign f2=~(am1[2]^bm1[2]);
assign f3=~(am1[3]^bm1[3]);
assign f4=~(am1[4]^bm1[4]);
assign f5=~(am1[5]^bm1[5]);
assign f6=~(am1[6]^bm1[6]);
assign f7=~(am1[7]^bm1[7]);
wire [7:0]ai;
wire [7:0]l;
assign ai[0]=~am1[0];
assign ai[1]=~am1[1];
assign ai[2]=~am1[2];
assign ai[3]=~am1[3];
assign ai[4]=~am1[4];
assign ai[5]=~am1[5];
assign ai[6]=~am1[6];
assign ai[7]=~am1[7];

assign l[0]=bm1[7] & ai[7];
assign l[1]=f7&bm1[6] & ai[6];
assign l[2]=f7&f6&bm1[5] & ai[5];
assign l[3]=f7&f6&f5&bm1[4] & ai[4];
assign l[4]=f7&f6&f5&f4&bm1[3] & ai[3];
assign l[5]=f7&f6&f5&f4&f3&bm1[2] & ai[2];
assign l[6]=f7&f6&f5&f4&f3&f2&bm1[1] & ai[1];
assign l[7]=f7&f6&f5&f4&f3&f2&f1&bm1[0] & ai[0];
wire la1,la2,la3;
assign la1=~(l[0]|l[1]|l[2]|l[3]|l[4]|l[5]|l[6]|l[7]);
assign la3=la1;
assign iou=la3;																																	//assign l[1]=f3 & bm1[2] & ai[2];																																//assign l[2]=f3 & f2 & bm1[1] & ai[1];																																//assign l[3]=f3 & f2 & f1 & bm1[0] & ai[0]
endmodule

module vlsic(
//module fadd_sub(
    Clk,
    reset,
    UpOrDown,  
    sumw
    );
	 input Clk,reset,UpOrDown;
	 output [7:0]sumw;
   countem m1(Clk,reset,UpOrDown,sumw);
endmodule




module countem(clk,rst,upd,sumw);
input clk,rst,upd;
output [7:0]sumw;
wire [7:0]in1,in2;
wire mcout;
adsu8 a1(in1,8'b00000001,upd,in2,mcout);
dref18 a2(in2,clk,rst,in1);
assign sumw=in1;
endmodule


module subm (ba1,clkk,upd,oz
,sumv
);
//module check (ba1,clkk,upd,oz
//,sumv
//);
wire [7:0]inp;
input [7:0]ba1;
input clkk,upd;
output oz;
output [7:0]sumv ;//for checking
wire rst;
comp c1(inp[7:0],ba1[7:0],rst);
vlsic a2(clkk,rst,upd,inp[7:0]);
assign oz=rst;
assign sumv[7:0]=inp[7:0];  //for checking
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
//fsm

module fsm
 (
  input rst,
  input clk,
  input x,
  output sy
);
wire a,aa,b,c,d,e,f,d1,d2,y1,y2;
wire sd1,sd2,sd3,sd4,sd5,sd6;
wire my;
wire reset,rst1;
assign reset=rst1|rst;
mux am1(x,1'b0,reset,a);
dref1 ad1(d1,clk,reset,y1);
dref1 rd1(sy,clk,reset,rst1);
dref1 ad2(d2,clk,reset,y2);
assign sd1=y1&~y2&~a;
assign sd2=y2&~y1&~a;
assign sd3=a&~y1&~y2;
wire sd7;
assign sd7=a&y2&~y1;

assign sd4=y1&a&~y2;
assign sd5=y1&~y2&~a;
assign sd6=y1&y2&~a;
wire mq,mq1;
wire y3,y4;
assign mq=y2&y1&~a;
assign mq1=y3&y4&~a;
assign my=mq1|mq;
assign d1=sd1|sd2;
assign d2=sd3|sd4|sd5|sd6|sd7;

dref1 bd1(y1,clk,reset,y3);
dref1 bd2(y2,clk,reset,y4);
mux am2(my,1'b0,reset,sy);
endmodule

module conm ( clk,set, reset, q);
input  clk;
  input  set;
  input reset;
  output  q;

  reg q;

  always @(posedge clk) begin
    if (set)
      q <= 1'b1;
    else if (reset)
      q <= 1'b0;
  end

endmodule
module cmux8(in1,in2,sel,out);
input[7:0]in1;
input[7:0]in2;
input sel;
output[7:0]out;
mux m7(in1[7],in2[7],sel,out[7]);
mux m6(in1[6],in2[6],sel,out[6]);
mux m5(in1[5],in2[5],sel,out[5]);
mux m4(in1[4],in2[4],sel,out[4]);
mux m3(in1[3],in2[3],sel,out[3]);
mux m2(in1[2],in2[2],sel,out[2]);
mux m1(in1[1],in2[1],sel,out[1]);
mux m0(in1[0],in2[0],sel,out[0]);
endmodule
///



module cge(im,clk,clkk,rst,upd,mou,q3,q5,nex1,q7,ow1);
//module vlsi(im,clk,clkk,rst,upd,mou,out,q1,q0,c1,out1,rstt,copo1,q2,q3,cop,copo3,q4,q5,c2,copo4,c3,c4,q6,q7,op2,nex);
input[7:0]im;
input clk,clkk,rst,upd;
output mou;
output nex1;
output q3,q5,q7;
output ow1;

//
wire out1,rstt;
wire[7:0]summ;
wire out;
wire q1;
wire q0;
wire[7:0]c1;
wire [7:0]c2;
wire [7:0]c3;
wire cop;

wire ow;



assign ow1=~ow;
wire [7:0]imm;
wire we;
assign we=q7|ow1;
wire df;

wire m1;
wire er;
assign er=q5^ow1;
wire op1;
wire mout;
//output copo1,copo2,copo3,copo4;//cop output
wire copo1,copo3,copo4;//cop output
wire q2;
wire q4;
wire [7:0]c4;
wire op2;
//
wire q6;
//
assign df=copo1;

//
assign cop=out;//copy out
//assign mout=copo4;
mux ma1a1(1'b1,1'b0,rstt,out1);
subm s1(c1,clk,upd,rstt,summ[7:0]);
mux mm1(out1,1'b0,clk,out); // very long clock signal
fsm fs0(rst,clkk,out,q0);
conm ma1(clkk,q0,rst,q1); //s1
cmux8 cm1(8'b00000001,c2,q1,c1);
mux m2(cop,1'b0,~q1,copo1);// donot change invert position
//
fsm f1(rst,clkk,copo1,q2);
conm ma2(clkk,q2,rst,q3); //s1
//mux m3(copo1,1'b0,q3,copo2);
//
//take copo1
mux m4(copo1,1'b0,~q3,copo3);
cmux8 cm2(8'b00000001,c3,q3,c2);
//
fsm f2(rst,clkk,copo3,q4);
conm ma3(clkk,q4,rst,q5); //s2
//
mux m5(copo1,1'b0,~q5,copo4);//can be q5 or q4
expr wes(8'b00000000,im,ow);
cmux8 cm24(im,8'b00011010,ow1,imm);
cmux8 cm3(imm,c4,q5,c3);


//
wire copo5;
assign copo5=copo4;
fsm ff2(rst,clkk,copo5,q6);
conm mad3(clkk,q6,rst,q7); //s3

cmux8 cm224(8'b00011010,8'b00000000,we,c4);

//

mux m50(df,1'b0,er,m1);
defl dfg(1'b1,clkk,rst,op1);
mux mw(m1,op1,ow1,op2);

//mux mi(mm,1'b0,q3,m1);//can be q5 or q4
assign mou=op2;
wire nex,mq;
assign nex=copo3;
mux mw0a(1'b1,q5,~ow1,mq);
mux mw1a(1'b0,nex,mq,nex1);
endmodule

/*---------------------------------------------------------------------------------------------------------------------//
clock cycle generator finished take copo4 and q3
-----------------------------------------------------------------------------------------------------------------------*/
module cges(in,im,clk,clkk,rst,out,q3,q5,q7,nex,ow1);//cges
input[22:0]in;
input[7:0]im;
input clk,clkk,rst;
output[23:0]out;
output q5,q3,q7,nex;
wire mout;
output ow1;
wire sel;
cge c1(im,clk,clkk,rst,1'b0,mout,q3,q5,nex,q7,ow1);//(im,clk,clkk,rst,upd,mou,q3,q5,nex,q7);
unshift u1(in,1'b0,mout,rst,sel,q3,out,ow1);
endmodule

/*------------------------------------------------------------------------------------------------------------
clock generate and shift has been finished waveform 1 to check it //fadd_sub//cges//
--------------------------------------------------------------------------------------------------------------*/
module muxs (
  input wire a,
  input wire b,
  input wire select,
  output wire out_a,
  output wire out_b
);

  // Connect the inputs and outputs
  assign out_a = (b & select) | (a & ~select);
  assign out_b = (a & select) | (b & ~select);

endmodule

module mux32 (
  input wire [31:0] in1,
  input wire [31:0] in2,
  input wire sel,
  output wire [31:0] out1,
  output wire [31:0] out2
);
  genvar i;
  generate
    for (i = 0; i <= 31; i = i + 1) begin : gen_muxs
      muxs m (
        .a(in1[i]),
        .b(in2[i]),
        .select(sel),
        .out_a(out1[i]),
        .out_b(out2[i])
      );
    end
  endgenerate
endmodule

module mux023 (
  input wire [23:0] in1,
  input wire [23:0] in2,
  input wire sel,
  output wire [23:0] out1,
  output wire [23:0] out2
);
  genvar i;
  generate
    for (i = 0; i <= 23; i = i + 1) begin : gen_muxs
      muxs m (
        .a(in1[i]),
        .b(in2[i]),
        .select(sel),
        .out_a(out1[i]),
        .out_b(out2[i])
      );
    end
  endgenerate
endmodule


module comp22(
  input [22:0] am1,
  input [22:0] bm1,
  output wire iou
);//b should be greater value
  wire [22:0] ai;
  wire [22:0] l;
  wire f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22 ;
  assign f0 = ~(am1[0] ^ bm1[0]);
  assign f1 = ~(am1[1] ^ bm1[1]);
  assign f2 = ~(am1[2] ^ bm1[2]);
  assign f3 = ~(am1[3] ^ bm1[3]);
  assign f4 = ~(am1[4] ^ bm1[4]);
  assign f5 = ~(am1[5] ^ bm1[5]);
  assign f6 = ~(am1[6] ^ bm1[6]);
  assign f7 = ~(am1[7] ^ bm1[7]);
  assign f8 = ~(am1[8] ^ bm1[8]);
  assign f9 = ~(am1[9] ^ bm1[9]);
  assign f10 = ~(am1[10] ^ bm1[10]);
  assign f11 = ~(am1[11] ^ bm1[11]);
  assign f12 = ~(am1[12] ^ bm1[12]);
  assign f13 = ~(am1[13] ^ bm1[13]);
  assign f14 = ~(am1[14] ^ bm1[14]);
  assign f15 = ~(am1[15] ^ bm1[15]);
  assign f16 = ~(am1[16] ^ bm1[16]);
  assign f17 = ~(am1[17] ^ bm1[17]);
  assign f18 = ~(am1[18] ^ bm1[18]);
  assign f19 = ~(am1[19] ^ bm1[19]);
  assign f20 = ~(am1[20] ^ bm1[20]);
  assign f21 = ~(am1[21] ^ bm1[21]);
  assign f22 = ~(am1[22] ^ bm1[22]);
  assign ai[0] = ~am1[0];
  assign ai[1] = ~am1[1];
  assign ai[2] = ~am1[2];
  assign ai[3] = ~am1[3];
  assign ai[4] = ~am1[4];
  assign ai[5] = ~am1[5];
  assign ai[6] = ~am1[6];
  assign ai[7] = ~am1[7];
  assign ai[8] = ~am1[8];
  assign ai[9] = ~am1[9];
  assign ai[10] = ~am1[10];
  assign ai[11] = ~am1[11];
  assign ai[12] = ~am1[12];
  assign ai[13] = ~am1[13];
  assign ai[14] = ~am1[14];
  assign ai[15] = ~am1[15];
  assign ai[16] = ~am1[16];
  assign ai[17] = ~am1[17];
  assign ai[18] = ~am1[18];
  assign ai[19] = ~am1[19];
  assign ai[20] = ~am1[20];
  assign ai[21] = ~am1[21];
  assign ai[22] = ~am1[22];
assign l[0]=bm1[22] & ai[22];
assign l[1]=f22&bm1[21] & ai[21];
assign l[2]=f22&f21&bm1[20] & ai[20];
assign l[3]=f22&f21&f20&bm1[19] & ai[19];
assign l[4]=f22&f21&f20&f19&bm1[18] & ai[18];
assign l[5]=f22&f21&f20&f19&f18&bm1[17] & ai[17];
assign l[6]=f22&f21&f20&f19&f18&f17&bm1[16] & ai[16];
assign l[7]=f22&f21&f20&f19&f18&f17&f16&bm1[15] & ai[15];
assign l[8]=f22&f21&f20&f19&f18&f17&f16&f15&bm1[14] & ai[14];
assign l[9]=f22&f21&f20&f19&f18&f17&f16&f15&f14&bm1[13] & ai[13];
assign l[10]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&bm1[12] & ai[12];
assign l[11]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&bm1[11] & ai[11];
assign l[12]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&bm1[10] & ai[10];
assign l[13]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&bm1[9] & ai[9];
assign l[14]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&bm1[8] & ai[8];
assign l[15]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&bm1[7] & ai[7];
assign l[16]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&f7&bm1[6] & ai[6];
assign l[17]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&f7&f6&bm1[5] & ai[5];
assign l[18]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&f7&f6&f5&bm1[4] & ai[4];
assign l[19]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&f7&f6&f5&f4&bm1[3] & ai[3];
assign l[20]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&f7&f6&f5&f4&f3&bm1[2] & ai[2];
assign l[21]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&f7&f6&f5&f4&f3&f2&bm1[1] & ai[1];
assign l[22]=f22&f21&f20&f19&f18&f17&f16&f15&f14&f13&f12&f11&f10&f9&f8&f7&f6&f5&f4&f3&f2&f1&bm1[0] & ai[0];
wire la1;
assign la1 = ~(l[0] | l[1] | l[2] | l[3] | l[4] | l[5] | l[6] | l[7] | l[8] | l[9] | l[10] | l[11] | l[12] | l[13] | l[14] | l[15] | l[16] | l[17] | l[18] | l[19] | l[20] | l[21] | l[22]);
//assign la3=la1;
assign iou=~la1;
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
module smux8 (input [7:0] in1, in2, input sel, output [7:0]out);
  genvar i;
  generate
    for (i = 0; i <= 7; i = i + 1) begin : gen_mux
      mux m (.in1(in1[i]), .in2(in2[i]), .sel(sel), .out(out[i]));
    end
  endgenerate
endmodule

module smux (input [22:0] in1, in2, input sel, output [22:0] out);
  genvar i;
  generate
    for (i = 0; i <= 22; i = i + 1) begin : gen_mux
      mux m (.in1(in1[i]), .in2(in2[i]), .sel(sel), .out(out[i]));
    end
  endgenerate
endmodule



module smux23i (input [23:0] in1, in2, input sel, output [23:0] out);
  genvar i;
  generate
    for (i = 0; i <= 22; i = i + 1) begin : gen_mux
      mux m (in1[i], ~in2[i], sel, out[i]);
    end
  endgenerate

  mux m11 (in1[23], ~in2[23], sel, out[23]);
endmodule




//






module smux23 (input [23:0] in1, in2, input sel, output [23:0] out);
  genvar i;
  generate
    for (i = 0; i <= 22; i = i + 1) begin : gen_mux
      mux m (.in1(in1[i]), .in2(in2[i]), .sel(sel), .out(out[i]));
    end
  endgenerate
endmodule
module adsu23(x1, y1, k, sa, mcout);
  input [23:0] x1, y1;
  input k;
  output [23:0] sa;
  output mcout;
  wire [23:0] y1;
  wire [23:0] s;
  wire [23:0] cout;
faa fa1(x1[0], {y1[0]^k}, k, s[0], cout[0]);
  // Generate block to handle the loop
  genvar j;
  generate
    for (j = 1; j <= 23; j = j + 1) begin : sas
      faa fa_inst(x1[j], y1[j] ^ k, cout[j-1], s[j], cout[j]);
    end
  endgenerate

  assign sa = s;
  assign mcout = cout[23];//cout[23]
endmodule

//module fadd_subk(inx1,iny1,clk,clkk,rst,ka,fout1,q3,q5);


//module vclsi(inx1,iny1,clk,clkk,rst,ka,fout1,q3,q5,outms1,outms2,outms3,fout0,q7,nex,ow1);
//module fadd_sub(inx1,iny1,clk,clkk,rst,cgein);
module bvlsi(inx1,iny1,ka,clk,clkk,rst,q5,q3,fout1,exo,mecouto,q7,nex,ow1,wuxr,wr,sigm);
input[31:0]inx1,iny1;
wire [31:0]x1,y1;
wire iou,selm;
input clk,clkk,rst;
wire [7:0]fout;
wire [7:0]fout2;
wire [7:0]cgein;
wire [22:0]o1;
wire [23:0]fout0;
output [23:0]fout1;
input ka;
output [7:0]exo;
output q7,nex,ow1;
//wire [23:0]outms;
wire [23:0]outms;
output q5,q3;
//
//
//wire [23:0]outq1;
wire [23:0]outq1;

//
wire [23:0]outms1;

//
wire [23:0]sa1;
//
wire [23:0]outms2;
//output [23:0]outms2;
wire [23:0]sa0;
//
wire [23:0]sa2;

//wire [23:0]sa3;
wire [23:0]sa3;
wire [23:0]ma1;
wire gsel;
assign gsel={x1[31]|y1[31]};
wire mcout8,mecout,mecouti,mecout022;
wire [22:0]outnms;
//
wire b;
wire [23:0]outms3;
wire [23:0]saa0;
//output [23:0]outms3;
wire kaa;
assign kaa=x1[31]^y1[31];
output wr;
output wuxr;
output mecouto;
assign mecouto=mecout022;
//output [23:0]outms1;
//

//output wum;
assign outq1={1'b1,outnms};
//conm mazz3(clkkk,wuxr,rst,wum);
mux wwu (1'b1,1'b0,mecout022,wuxr);
assign wr=kaa&wuxr&fout0[22];//fout0[22]
//assign wr=kaa|wuxr|fout0[22];
comp22 xq(inx1[22:0],iny1[22:0],iou);
mux32 az(inx1[31:0],iny1[31:0],iou,x1[31:0],y1[31:0]);//x1 will come as highest
comp ma (x1[30:23],y1[30:23],selm);//a should be higher value to get 1
smux8 fou ( x1[30:23],y1[30:23],~selm,fout[7:0]);
smux8 fou1 (x1[30:23],y1[30:23],selm,fout2[7:0]);
adsu8 f1(fout[7:0],fout2[7:0],1'b1,cgein,mcout8);
smux sm (x1[22:0],y1[22:0],selm,o1[22:0]);
cges cgea1(o1[22:0],cgein,clk,clkk,rst,outms[23:0],q3,q5,q7,nex,ow1);
smux bi22(x1[22:0],y1[22:0],~selm,outnms[22:0]);

// constant
wire ssa1,ssa2,sab0;
mux zo10 (1'b0,1'b1,kaa,ssa1);
assign sa1={23'b00000000000000000000000,ssa1};
smux23i s231(outms[23:0],outms[23:0],kaa,outms1);
//
adsu23 ad231(outms1,sa1,1'b0,sa0, mecout);
//
//mux zo11 (1'b0,1'b1,y1[31],ssa2);
//assign sa2={23'b00000000000000000000000,ssa2};
//smux23i s21(outq1,outq1,y1[31],outms2);
////
//adsu23 ad21(outms2,sa2,1'b0,sa3,mecout);
//dd
adsu23 yj(outq1,sa0,mecout,fout0[23:0],mecout022);
//
mux zo12 (1'b0,1'b1,wr,sab0);
assign saa0={23'b00000000000000000000000,sab0};
smux23i s232(fout0[23:0],fout0[23:0],wr,outms3);
//
adsu23 ad232(outms3,saa0,1'b0,fout1,mecouti);
assign exo=fout[7:0];

wire sig3,sig4;
output sigm;
muxs si2(x1[31],y1[31],~selm,sig3,sig4);
mux si1m(sig3,x1[31],ow1,sigm);

endmodule

module vlsis(inx1,iny1,ka,clk,clkk,rst,q5,q3,fout1,exo,mecout22,q7,nex,ow1,sigm);
input[31:0]inx1,iny1;
input clk,clkk,rst;
output [23:0]fout1;
output q7,nex;
output ow1;
output q5,q3;
input ka;
wire wuxr,wr;
wire ssa1;
output [7:0]exo;
output mecout22;
wire [23:0]fout0;
output sigm;
bvlsi v(inx1,iny1,ka,clk,clkk,rst,q5,q3,fout0[23:0],exo[7:0],mecout22,q7,nex,ow1,wuxr,wr,sigm);//(inx1,iny1,ka,clk,clkk,rst,q5,q3,fout1,exo,q7,nex,ow1,wuxr,wr);
mux co (fout0[23],~fout0[23],ow1,ssa1);
assign fout1[23:0]={ssa1,fout0[22:0]};
//bvlsi v(32'b01000010101101011011110101110001,32'b11000001001100001100110011001101,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//90.87 -11.05
//bvlsi v(32'b01000010100111111010001111011000,32'b11000001001100001100110011001101,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//79.82 -11.05
//bvlsi v(32'b01000010100010011000101000111101,32'b11000001001100001100110011001101,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//68.77 -11.05
//bvlsi v(32'b01000010111100111100110011001101,32'b11000001001100001100110011001101,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//121.90 -11.05 01000001010000001111010111000011
//bvlsi v(32'b01000001010000001111010111000011,32'b01000001001100001100110011001101,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//12.06 -11.05
//bvlsi v(32'b01000001101110001110000101001000,32'b11000001001100001100110011001101,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);
//bvlsi v(32'b01000001101110001110000101001000,32'b11000001100110000010100011110110,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//-19.02 +23.11
//bvlsi v(32'b01000010010100010111000010100100,32'b11000010010001000111101011100001,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//53.36 -49.12
//bvlsi v(32'b01000010101100101110011001100110,32'b01000010101000100000101000111101,ka,clk,clkk,rst,q5,q3,fout1,q7,nex,ow1,fout0,wuxr,wr);//89.45 -81.02
endmodule




module expr(a,b,o);
input [7:0]a,b;
output o;
wire q,w,e,r,t,y,u,i;
assign q=a[7]^b[7];
assign w=a[6]^b[6];
assign e=a[5]^b[5];
assign r=a[4]^b[4];
assign t=a[3]^b[3];
assign y=a[2]^b[2];
assign u=a[1]^b[1];
assign i=a[0]^b[0];
assign o={q|w|e|r|t|y|u|i};
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
module dref23(inn,clk,rst,o);
input [23:0]inn;
input clk,rst;
//wire rst;
output [23:0]o;
reg [23:0]o;
always @(posedge clk)
begin 
if (rst)
begin
o<=24'b000000000000000000000000;
end
else
begin
o<=inn;
end 
end
endmodule



module nmux23(in1,in2,sel,out);
input[23:0]in1;
input[23:0]in2;
input sel;
output[23:0]out;
mux m23(in1[23],in2[23],sel,out[23]);
mux m22(in1[22],in2[22],sel,out[22]);
mux m21(in1[21],in2[21],sel,out[21]);
mux m20(in1[20],in2[20],sel,out[20]);
mux m19(in1[19],in2[19],sel,out[19]);
mux m18(in1[18],in2[18],sel,out[18]);
mux m17(in1[17],in2[17],sel,out[17]);
mux m16(in1[16],in2[16],sel,out[16]);
mux m15(in1[15],in2[15],sel,out[15]);
mux m14(in1[14],in2[14],sel,out[14]);
mux m13(in1[13],in2[13],sel,out[13]);
mux m12(in1[12],in2[12],sel,out[12]);
mux m11(in1[11],in2[11],sel,out[11]);
mux m10(in1[10],in2[10],sel,out[10]);
mux m9(in1[9],in2[9],sel,out[9]);
mux m8(in1[8],in2[8],sel,out[8]);
mux m7(in1[7],in2[7],sel,out[7]);
mux m6(in1[6],in2[6],sel,out[6]);
mux m5(in1[5],in2[5],sel,out[5]);
mux m4(in1[4],in2[4],sel,out[4]);
mux m3(in1[3],in2[3],sel,out[3]);
mux m2(in1[2],in2[2],sel,out[2]);
mux m1(in1[1],in2[1],sel,out[1]);
mux m0(in1[0],in2[0],sel,out[0]);
endmodule



//module vlsi(in,clk,rst,aa,o,sumw);//normalizer circuit

module anvlsi(in,clk,rst,aa,o,sumw,acc,ft0);//normalizer circuit anvlsi
input [23:0]in;
input rst,aa;
input clk;
output[23:0]o;
wire a;
wire[23:0] mu;
wire[23:0] mu1;
assign mu1[23:0]={a,mu[23:1]};//{in,rreg[22:1]} {rreg[21:0],in}
wire [23:0]rnex1;
wire [23:0]rnex1a;
wire [23:0]rnex2;
wire [23:0]oo;
wire esel,ol;
wire coclk,clk1;
wire clkm;
wire sel;
output[7:0]sumw;
wire[7:0]sumw1;
wire[7:0]sumw2;
wire ft;
wire ac;
wire esel1;
output acc;
wire accx,dd,dda;
wire esel2,ed1,ed2;
assign ac=o[23];
defl ad01(ac,clkm,rst,ed1);
defl ad02(ed1,clkm,rst,accx);

assign rnex1a[23:0]={rnex1[22:0],a};
nmux23 a1(mu,mu1,~sel,rnex1);
nmux23 a2(rnex1,rnex1a,sel,rnex2);
dref23 d1(rnex2,coclk,rst,oo);
nmux23 a3(in,oo,esel1,mu);
defl ad1(1'b1,clkm,rst,ol);
defl ad2(ol,clkm,rst,esel1);
//defl ade(esel1,clkm,rst,esel2);
assign o[23:0]=mu[23:0];


//
//wire ass,as;
//
//
//assign ass=(in[23]&aa);
//assign as=~ass;
//mux m9(as,1'b1,~esel1,sd);

//
mux m8(in[23],1'b0,aa,ft);
mux m7(clk,1'b0,ft,clkm);
mux m1(clkm,1'b0,o[23],clk1);
mux m2(clk1,esel,aa,coclk);
mux m3(1'b0,1'b1,aa,a);
wire mcout;
mux m4(1'b1,1'b0,aa,sel);
mux m6(clkm,1'b0,esel1,esel);
//mux m5(1'b0,clkm,esel,clk);
counte cc1(coclk,rst,sumw1);
adsu8  jk(sumw1,8'b00000001,1'b1,sumw2,mcout);
smux8 hj(sumw2,8'b00000000,ft,sumw);
output ft0;
//output xft;
//assign xft=ft;
defl adb1(ft,clk,rst,ft0);

assign acc=dd|accx;
zde  dfd(8'b00010110,sumw,dda);
conm dds(clk,dda,rst,dd);
endmodule



//
module counte(clk,rst,sumw);
input clk,rst;
output [7:0]sumw;
wire mcout;
wire [7:0]in1,in2;
adsu8 a1(in1,8'b00000001,1'b0,in2,mcout);
dref18 a2(in2,clk,rst,in1);
assign sumw=in1;
endmodule



module clkg (clk,rst,q);
input clk;
input rst;
output q;
wire o;
wire oo;
assign oo=~o;
defl d1(oo,clk,rst,o);
assign q=o;
endmodule


module ze(a,b,w);
input[31:0]a,b;
wire[31:0]q;
output w;
wire ww;
assign q[30:0]=a[30:0]^b[30:0];
assign ww = q[0] | q[1] | q[2] | q[3] | q[4] | q[5] | q[6] | q[7] | q[8] | q[9] | q[10] | q[11] | q[12] | q[13] | q[14] | q[15] | q[16] | q[17] | q[18] | q[19] | q[20] | q[21] | q[22] | q[23] | q[24] | q[25] | q[26] | q[27] | q[28] | q[29] | q[30];

assign w=~ww;
endmodule

module zde(a,b,w);
input[7:0]a,b;
wire[7:0]q;
output w;
wire ww;
assign q[7:0]=a[7:0]^b[7:0];
assign ww = q[0] | q[1] | q[2] | q[3] | q[4] | q[5] | q[6] | q[7];
assign w=~ww;
endmodule



/*=======================================###################################################################################################==========================
this is 32 floating bit multiplier writern in quartus software.
if you have any reviews on this code please mail to velmuruganvm15in@gmail.com. 
writen by vekmurugan v.m
this multiplier is modified to accomodate adders and multipliers specially for cordic algorithm
if you want change only for multiplier please do so ........


=======================================###################################################################################################==========================*/
module fmult(a,b,clk,rst,p,zd1);
//module vlsi(a,b,clk,rst,p,zd1);
input[31:0]a,b;
input clk,rst;
output[31:0]p;
wire pw;
output zd1;
wire zm1;
wire za1,za2,za3,za4;
ppvlsi a1(a,b,clk,rst,p);
ze0 zsa2(a,32'b00000000000000000000000000000000,za1);
ze0 zsa3(b,32'b00000000000000000000000000000000,za2);
ze0 zsa1(p,32'b00000000000000000000000000000000,zm1);
assign za3=za1|za2;
mux wwu (zm1,1'b0,za3,zd1);
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

//===================================================================================================================
module cordicn10(a,b,c,clk,rst,vr,o1,o2,o3,lcont);
//module cordicn10(clk,rst,vr,o1,o2,o3,lcont,x1,y1,zz1,x2,y2,zz21,x3,y3,zz31,x4,y4,zz41,x5,y5,zz51,x6,y6,zz61,x7,y7,zz71,x8,y8,zz81,x9,y9,zz91);
input[31:0]a,b,c;
input vr;
wire  clkk,selvr;
assign selvr=vr;
////==========================================================================
////for cordic
// 
//assign a=32'b00111111000110110010001011010001;
//assign b=32'b00000000000000000000000000000000;
//assign c=32'b01000010001100111001100110011010;
////
//////============================================================================
//////44.90=01000010001100111001100110011010;
//////46.12=01000010001110000111101011100001;
//////56.72=01000010011000101110000101001000;
////==========================================================================
//
////==========================================================================
////for atan
// 
//assign a=32'b00111111100000000000000000000000;
//assign b=32'b01000010001100111001100110011010;
//assign c=32'b00000000000000000000000000000000;
//
////==========================================================================
output[31:0]o1,o2,o3;
input clk,rst;
assign clkk=clk;
wire [31:0]si3,wh1,wh2;
//output[31:0]x1,y1,zz1,x2,y2,zz21,x3,y3,zz31,x4,y4,zz41,x5,y5,zz51,x6,y6,zz61,x7,y7,zz71,x8,y8,zz81,x9,y9,zz91;
wire zd1;
output lcont;
//==========================================================================

mux032 a1 (c,b,selvr,wh1);
mux032 a2(32'b00111100100011101110011110100111,32'b00111111100000000000000000000000,selvr,wh2);
fmult m1(wh1,wh2,clk,rst,si3,zd1);

wire zd00;
ze0 zsa00(si3,32'b00000000000000000000000000000000,zd00);
//=====================================================================================
wire sic11,sic12,sic13;
wire xzo0;
mux mx11(si3[31],1'b1,zd00,xzo0);
wire szco,szao,szbo;

mux mcz11(1'b1,1'b0,selvr,szao);
mux mcz21(1'b0,1'b1,selvr,szbo);
mux mcz31(1'b1,1'b0,selvr,szco);
assign sic11={xzo0^szao};
assign sic12={xzo0^szbo};
assign sic13={xzo0^szco};

wire[31:0]x01,y01;
wire[31:0]x1,y1;
wire zp1,zp2;
wire zs1,zs2;
wire [31:0]wx1,wx1c;
wire rdst;
wire mecout22;
assign rdst=rst|zd1|zd00;
mux032 a21(b,si3,selvr,wx1);
fmult ma11(wx1,32'b00111111100000000000000000000000,clk,rdst,y01,zp1);
wire rsts1;
assign rsts1=zp1|rst|zd1;
fadd_sub fa12(a,y01,sic11,clkk,rsts1,x1,mecout22,zs1);


fmult ma13(a,32'b00111111100000000000000000000000,clk,rst,x01,zp2);
wire rsts2;
assign rsts2=zp2|rst|zd1|zd00;
fadd_sub fa14(wx1,x01,sic12,clkk,rsts2,y1,mecout22,zs2);
wire rsts3;
assign rsts3=zd1|rst|zd00;
wire za1;
wire [31:0]zz1;
mux032 a21c(si3,c,selvr,wx1c);
fadd_sub fa15(wx1c,32'b00111111010010010000111111011011,sic13,clkk,rsts3,zz1,mecout22,za1);
wire frc1;
assign frc1=zs2|za1|zs1;

wire zd10;
ze0 zsa10(zz1,32'b00000000000000000000000000000000,zd10);

////========================================================================================================

wire sic21,sic22,sic23;
wire xzo2,xzp2;
mux mxx21(zz1[31],y1[31],selvr,xzp2);
mux mx21(xzp2,1'b1,zd10,xzo2);
assign sic21={xzo2^szao};
assign sic22={xzo2^szbo};
assign sic23={xzo2^szco};

wire[31:0]x11,y11;
wire[31:0]x2,y2;
wire zp21,zp22;
wire zs21,zs22;
wire cs21,cs22;
assign cs21=zs1|zs2|frc1;
assign cs22=zs2|zs1|frc1;
fmult ma21(y1,32'b00111111000000000000000000000000,clk,cs21,y11,zp21);
wire rsts21;
assign rsts21=zp21|rst|frc1;
fadd_sub fa22(x1,y11,sic21,clkk,rsts21,x2,mecout22,zs21);


fmult ma23(x1,32'b00111111000000000000000000000000,clk,cs22,x11,zp22);
wire rsts22;
assign rsts22=zp22|rst|frc1;
fadd_sub fa24(y1,x11,sic22,clkk,rsts22,y2,mecout22,zs22);
wire rsts23;
assign rsts23=za1|rst|frc1;
wire za21;
wire [31:0]zz21;
fadd_sub fa25(zz1,32'b00111110111011010110001100111000,sic23,clkk,rsts23,zz21,mecout22,za21);
wire frc2;
assign frc2=zs22|za21|zs21;


wire zd20;
ze0 zsa20(zz21,32'b00000000000000000000000000000000,zd20);

//========================================================================================================


//========================================================================================================

wire sic31,sic32,sic33;
wire xzo3,xzp3;
mux mxx31(zz21[31],y2[31],selvr,xzp3);
mux mx31(xzp3,1'b1,zd20,xzo3);
assign sic31={xzo3^szao};
assign sic32={xzo3^szbo};
assign sic33={xzo3^szco};

wire[31:0]x31,y31;
wire[31:0]x3,y3;

wire zp31,zp32;
wire zs31,zs32;
wire cs31,cs32;
assign cs31=zs22|frc2;
assign cs32=zs21|frc2;

fmult ma31(y2,32'b00111110100000000000000000000000,clk,cs31,y31,zp31);
wire rsts31;
assign rsts31=zp31|rst|frc2;
fadd_sub fa32(x2,y31,sic31,clkk,rsts31,x3,mecout22,zs31);


fmult ma33(x2,32'b00111110100000000000000000000000,clk,cs32,x31,zp32);
wire rsts32;
assign rsts32=zp32|rst|frc2;
fadd_sub fa34(y2,x31,sic32,clkk,rsts32,y3,mecout22,zs32);
wire rsts33;
assign rsts33=za21|rst|frc2;
wire za31;
wire [31:0]zz31;
fadd_sub fa35(zz21,32'b00111110011110101101101110110000,sic33,clkk,rsts33,zz31,mecout22,za31);
wire frc3;
assign frc3=zs32|za31|zs31;

wire zd30;
ze0 zsa30(zz31,32'b00000000000000000000000000000000,zd30);

//========================================================================================================


//========================================================================================================

wire sic41,sic42,sic43;
wire xzo4,xzp4;
mux mxx41(zz31[31],y3[31],selvr,xzp4);

mux mx41(xzp4,1'b1,zd30,xzo4);
assign sic41={xzo4^szao};
assign sic42={xzo4^szbo};
assign sic43={xzo4^szco};

wire[31:0]x41,y41;
wire[31:0]x4,y4;

wire zp41,zp42;
wire zs41,zs42;
wire cs41,cs42;
assign cs41=zs32|frc3;
assign cs42=zs31|frc3;

fmult ma41(y3,32'b00111110000000000000000000000000,clk,cs41,y41,zp41);
wire rsts41;
assign rsts41=zp41|rst|frc3;
fadd_sub fa42(x3,y41,sic41,clkk,rsts41,x4,mecout22,zs41);


fmult ma43(x3,32'b00111110000000000000000000000000,clk,cs42,x41,zp42);
wire rsts42;
assign rsts42=zp42|rst|frc3;
fadd_sub fa44(y3,x41,sic42,clkk,rsts42,y4,mecout22,zs42);
wire rsts43;
assign rsts43=za31|rst|frc3;
wire za41;
wire [31:0]zz41;
fadd_sub fa45(zz31,32'b00111101111111101010110111010101,sic43,clkk,rsts43,zz41,mecout22,za41);
wire frc4;
wire zd40;
assign frc4=zs42|za41|zs41;
ze0 zsa40(zz41,32'b00000000000000000000000000000000,zd40);
////========================================================================================================

wire sic51,sic52,sic53;
wire xzo5,xzp5;
mux mxx51(zz41[31],y4[31],selvr,xzp5);

mux mx51(xzp5,1'b1,zd40,xzo5);
assign sic51={xzo5^szao};
assign sic52={xzo5^szbo};
assign sic53={xzo5^szco};

wire[31:0]x51,y51;
wire[31:0]x5,y5;

wire zp51,zp52;
wire zs51,zs52;
wire cs51,cs52;
assign cs51=zs42|frc4;
assign cs52=zs41|frc4;

fmult ma51(y4,32'b00111101100000000000000000000000,clk,cs51,y51,zp51);
wire rsts51;
assign rsts51=zp51|rst|frc4;
fadd_sub fa52(x4,y51,sic51,clkk,rsts51,x5,mecout22,zs51);


fmult ma53(x4,32'b00111101100000000000000000000000,clk,cs52,x51,zp52);
wire rsts52;
assign rsts52=zp52|rst|frc4;
fadd_sub fa54(y4,x51,sic52,clkk,rsts52,y5,mecout22,zs52);
wire rsts53;
assign rsts53=za41|rst|frc4;
wire za51;
wire [31:0]zz51;
fadd_sub fa55(zz41,32'b00111101011111111010101011011110,sic53,clkk,rsts53,zz51,mecout22,za51);
wire frc5;
wire zd50;
assign frc5=zs52|za51|zs51;
ze0 zsa50(zz51,32'b00000000000000000000000000000000,zd50);
//
////========================================================================================================

wire sic61,sic62,sic63;
wire xzo6,xzp6;
mux mxx61(zz51[31],y5[31],selvr,xzp6);

mux mx61(xzp6,1'b1,zd50,xzo6);
assign sic61={xzo6^szao};
assign sic62={xzo6^szbo};
assign sic63={xzo6^szco};

wire[31:0]x61,y61;
wire[31:0]x6,y6;

wire zp61,zp62;
wire zs61,zs62;
wire cs61,cs62;
assign cs61=zs52|frc5;
assign cs62=zs51|frc5;

fmult ma61(y5,32'b00111101000000000000000000000000,clk,cs61,y61,zp61);
wire rsts61;
assign rsts61=zp61|rst|frc5;
fadd_sub fa62(x5,y61,sic61,clkk,rsts61,x6,mecout22,zs61);
fmult ma63(x5,32'b00111101000000000000000000000000,clk,cs62,x61,zp62);
wire rsts62;
assign rsts62=zp62|rst|frc5;
fadd_sub fa64(y5,x61,sic62,clkk,rsts62,y6,mecout22,zs62);
wire rsts63;
assign rsts63=za51|rst|frc5;
wire za61;
wire [31:0]zz61;
fadd_sub fa65(zz51,32'b00111100111111111110101010101110,sic63,clkk,rsts63,zz61,mecout22,za61);
wire frc6;
wire zd60;
assign frc6=zs62|za61|zs61;
ze0 zsa60(zz61,32'b00000000000000000000000000000000,zd60);
////=================================================================================================================

wire sic71,sic72,sic73;
wire xzo7,xzp7;
mux mxx71(zz61[31],y6[31],selvr,xzp7);

mux mx71(xzp7,1'b1,zd60,xzo7);
assign sic71={xzo7^szao};
assign sic72={xzo7^szbo};
assign sic73={xzo7^szco};

wire[31:0]x71,y71;
wire[31:0]x7,y7;

wire zp71,zp72;
wire zs71,zs72;
wire cs71,cs72;
assign cs71=zs62|frc6;
assign cs72=zs61|frc6;

fmult ma71(y6,32'b00111100100000000000000000000000,clk,cs71,y71,zp71);
wire rsts71;
assign rsts71=zp71|rst|frc6;
fadd_sub fa72(x6,y71,sic71,clkk,rsts71,x7,mecout22,zs71);
fmult ma73(x6,32'b00111100100000000000000000000000,clk,cs72,x71,zp72);
wire rsts72;
assign rsts72=zp72|rst|frc6;
fadd_sub fa74(y6,x71,sic72,clkk,rsts72,y7,mecout22,zs72);
wire rsts73;
assign rsts73=za61|rst|frc6;
wire za71;
wire [31:0]zz71;
fadd_sub fa75(zz61,32'b00111100011111111111101010101011,sic73,clkk,rsts73,zz71,mecout22,za71);
wire frc7;
wire zd70;
assign frc7=zs72|za71|zs71;
ze0 zsa70(zz71,32'b00000000000000000000000000000000,zd70);


wire sic81,sic82,sic83;
wire xzo8,xzp8;
mux mxx81(zz71[31],y7[31],selvr,xzp8);

mux mx81(xzp8,1'b1,zd70,xzo8);
assign sic81={xzo8^szao};
assign sic82={xzo8^szbo};
assign sic83={xzo8^szco};

wire[31:0]x81,y81;
wire[31:0]x8,y8;

wire zp81,zp82;
wire zs81,zs82;
wire cs81,cs82;
assign cs81=zs72|frc7;
assign cs82=zs71|frc7;

fmult ma81(y7,32'b00111100000000000000000000000000,clk,cs81,y81,zp81);
wire rsts81;
assign rsts81=zp81|rst|frc7;
fadd_sub fa82(x7,y81,sic81,clkk,rsts81,x8,mecout22,zs81);
fmult ma83(x7,32'b00111100000000000000000000000000,clk,cs82,x81,zp82);
wire rsts82;
assign rsts82=zp82|rst|frc7;
fadd_sub fa84(y7,x81,sic82,clkk,rsts82,y8,mecout22,zs82);
wire rsts83;
assign rsts83=za71|rst|frc7;
wire za81;
wire [31:0]zz81;
fadd_sub fa85(zz71,32'b00111011111111111111111010101011,sic83,clkk,rsts83,zz81,mecout22,za81);
wire frc8;
wire zd80;
assign frc8=zs82|za81|zs81;
ze0 zsa80(zz81,32'b00000000000000000000000000000000,zd80);
//////=================================================================================================================
wire sic91,sic92,sic93;
wire xzo9,xzp9;
mux mxx91(zz81[31],y8[31],selvr,xzp9);

mux mx91(xzp9,1'b1,zd80,xzo9);
assign sic91={xzo9^szao};
assign sic92={xzo9^szbo};
assign sic93={xzo9^szco};

wire[31:0]x91,y91;
wire[31:0]x9,y9;

wire zp91,zp92;
wire zs91,zs92;
wire cs91,cs92;
assign cs91=zs82|frc8;
assign cs92=zs81|frc8;

fmult ma91(y8,32'b00111011011111111111111110101011,clk,cs91,y91,zp91);
wire rsts91;
assign rsts91=zp91|rst|frc8;
fadd_sub fa92(x8,y91,sic91,clkk,rsts91,x9,mecout22,zs91);
fmult ma93(x8,32'b00111011011111111111111110101011,clk,cs92,x91,zp92);
wire rsts92;
assign rsts92=zp92|rst|frc8;
fadd_sub fa94(y8,x91,sic92,clkk,rsts92,y9,mecout22,zs92);
wire rsts93;
assign rsts93=za81|rst|frc8;
wire za91;
wire [31:0]zz91;
fadd_sub fa95(zz81,32'b00111011100000000000000000000000,sic93,clkk,rsts93,zz91,mecout22,za91);
wire frc9;
wire zd90;
assign frc9=zs92|za91|zs91;
ze0 zsa90(zz91,32'b00000000000000000000000000000000,zd90);

//////=================================================================================================================

wire sic101,sic102,sic103;
wire xzo10,xzp10;
mux mxx101(zz91[31],y9[31],selvr,xzp10);

mux mx101(xzp10,1'b1,zd90,xzo10);
assign sic101={xzo10^szao};
assign sic102={xzo10^szbo};
assign sic103={xzo10^szco};

wire[31:0]x101,y101;
wire[31:0]x10,y10;

wire zp101,zp102;
wire zs101,zs102;
wire cs101,cs102;
assign cs101=zs92|frc9;
assign cs102=zs91|frc9;

fmult ma101(y9,32'b00111010111111111111111111101011,clk,cs101,y101,zp101);
wire rsts101;
assign rsts101=zp101|rst|frc9;
fadd_sub fa102(x9,y101,sic101,clkk,rsts101,x10,mecout22,zs101);
fmult ma103(x9,32'b00111010111111111111111111101011,clk,cs102,x101,zp102);
wire rsts102;
assign rsts102=zp102|rst|frc9;
fadd_sub fa104(y9,x101,sic102,clkk,rsts102,y10,mecout22,zs102);
wire rsts103;
assign rsts103=za91|rst|frc9;
wire za101;
wire [31:0]zz101;
fadd_sub fa105(zz91,32'b00111011000000000000000000000000,sic103,clkk,rsts103,zz101,mecout22,za101);
wire frc10;
wire zd100;
assign frc10=zs102|za101|zs101;
ze0 zsa100(zz101,32'b00000000000000000000000000000000,zd100);

////=================================================================================================================


assign lcont=frc10|frc9|frc8|frc7|frc6|frc5|frc4|frc3|frc2|frc1;
mux032 fin1(32'b00000000000000000000000000000000,x10,~lcont,o1);
mux032 fin2(32'b00000000000000000000000000000000,y10,~lcont,o2);
mux032 fin3(32'b00000000000000000000000000000000,zz101,~lcont,o3);

////========================================================================================================
endmodule

//assign inx1=32'b10111101100001111111011011001010;
//assign iny1=32'b00111101011111111010101011011110;
