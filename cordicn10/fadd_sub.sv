

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
fadd_sub is the main program
assume clk=2*clkk if clk is 20 then clkk is 10
wirttern in quartus by velmurugan v.m
if any review please mail to velmuruganvm15in@gmail.com
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//============================================================================================================================================
module fadd_sub(inx1,iny1,ka,clk,rst,resu,mecout22,zd1);
input[31:0]inx1,iny1;
input ka,clk,rst;
output[31:0]resu;
output mecout22;
output zd1;
funas f1(inx1,iny1,ka,clk,rst,resu,mecout22,zd1);
endmodule
//=============================================================================================================================================
module funas(inx1,iny1,ka,clkk,rst,resu,mecout22,zd1);
input[31:0]inx1,iny1;
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


//module mux(in1,in2,sel,out);
//input in1,in2,sel;
//output out;
//wire a,b,c;
//assign a=in2&sel;
//assign b=~sel;
//assign c=in1&b;
//assign out=(a|c);
//endmodule

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




