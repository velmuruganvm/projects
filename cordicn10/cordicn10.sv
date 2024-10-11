`include "./fadd_sub.sv"
`include "./fmult.sv"

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
