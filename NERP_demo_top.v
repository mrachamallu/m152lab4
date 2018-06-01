`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:25 03/19/2013 
// Design Name: 
// Module Name:    NERP_demo_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NERP_demo_top(
	input wire clk,			//master clock = 50MHz
	input wire clr,			//right-most pushbutton for reset
	//input [7:0] sw, //to test with switch
    input btnR, //reset
    input btnP, //pause
    //money amounts
    input b1,
    input b10,
    input b50,
    input b100,
	output wire [6:0] seg,	//7-segment display LEDs
	output wire [3:0] an,	//7-segment display anode enable
	output wire dp,			//7-segment display decimal point
	output wire [2:0] vgaRed,	//red vga output - 3 bits
	output wire [2:0] vgaGreen,//green vga output - 3 bits
	output wire [1:0] vgaBlue,	//blue vga output - 2 bits
	output wire hsync,		//horizontal sync out
	output wire vsync			//vertical sync out
	);

	//wire sign = sw[1];
	
	//bank display
wire [1:0] topMid;
wire [1:0] topR;
wire [1:0] topL;
wire [1:0] botR;
wire [1:0] botL;
wire [1:0] botMid;
wire [1:0] mid;	
wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;
wire [3:0] num4;

wire [26:0] balance;

wire rst; //reset
wire pause; //pause

//wire clk50HzW;
//wire clk700HzW;
	
// 7-segment clock interconnect
wire segclk;

// VGA display clock interconnect
wire dclk;

wire slotclk;

// disable the 7-segment decimal points
assign dp = 1;

// generate 7-segment clock & display clock
clockdiv U1(
	.clk(clk),
	.clr(clr),
	.segclk(segclk),
	.dclk(dclk),
	.slotclk(slotclk)
	);

// 7-segment display controller
/*segdisplay U2(
	.segclk(segclk),
	.clr(clr),
	.seg(seg),
	.an(an)
	); */
	/*
bankDisplay bankDisplay(
	.topMid(topMid), 
	.topR(topR), 
	.topL(topL), 
	.botR(botR), 
	.botL(botL), 
	.botMid(botMid), 
	.mid(mid)
	);
	*/
// VGA controller
vga640x480 U3(
	.topMid(sign),
	.dclk(dclk),
	.clr(clr),
	.balance(balance),
	.hsync(hsync),
	.vsync(vsync),
	.red(vgaRed),
	.green(vgaGreen),
	.blue(vgaBlue)
	);

//divider divider(clk, clk50HzW, clk700HzW
  //  );
    
debouncer debouncer(
    .btnP(btnP),
    .btnR(btnR),
    .clk(clk),
    .pause(pause),
    .rst(rst)
    );
    
display display(
    .clk(segclk), 
    .num1(num1), 
    .num2(num2), 
    .num3(num3), 
    .num4(num4), 
    .seg(seg), 
    .an(an)
    );
 
randomGenTop randomGenTop(
    .clk (slotclk), 
    .reset (rst),
    .stopInt (pause), 
    .randNum1 (num1), 
    .randNum2 (num2), 
    .randNum3 (num3), 
    .randNum4 (num4) 
    ); 


bank bank(
	.clk(clk), 
	.b1(b1), 
	.b10(b10), 
	.b50(b50), 
	.b100(b100), 
	.randNum1(num1), 
	.randNum2(num2), 
	.randNum3(num3), 
	.randNum4(num4), 
	.rst(rst), 
	.balance(balance)
	);

endmodule
