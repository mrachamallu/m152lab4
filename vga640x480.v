`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
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
module vga640x480(
	input wire topMid,
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	input wire [26:0] balance,
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue	//blue vga output
	);
//assign sign = topMid;
// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;
reg sign01;
reg sign02;
reg sign03;
reg sign04;
reg sign05;
reg sign06;
reg sign07;
reg sign11;
reg sign12;
reg sign13;
reg sign14;
reg sign15;
reg sign16;
reg sign17;
reg sign21;
reg sign22;
reg sign23;
reg sign24;
reg sign25;
reg sign26;
reg sign27;
reg sign31;
reg sign32;
reg sign33;
reg sign34;
reg sign35;
reg sign36;
reg sign37;
reg sign41;
reg sign42;
reg sign43;
reg sign44;
reg sign45;
reg sign46;
reg sign47;
reg thousands;
reg hundreds;
reg tens;
reg ones;
//reg [26:0] balanceI = balance;

always @(posedge dclk)
begin
	thousands <= (balance / 1000);
	hundreds <= (balance % 1000) / 100;
	tens <= (balance % 1000 % 100) / 10;
	ones <= (balance % 1000 % 100 % 10);
	case(thousands)
		4'b0000: 
		begin
			sign04 = 0; //0
			sign01 = 1;
			sign02 = 1;
			sign03 = 1;
			sign05 = 1;
			sign06 = 1;
			sign07 = 1;
		end
    	4'b0001: 
		begin
			sign01 = 0;
			sign02 = 0;
			sign03 = 1;
			sign04 = 0;
			sign05 = 0;
			sign06 = 1;
			sign07 = 0;
		end
    	4'b0010: 
		begin
			sign01 = 1;
			sign02 = 0;
			sign03 = 1;
			sign04 = 1;
			sign05 = 1;
			sign06 = 0;
			sign07 = 1;
		end
    	4'b0011: 
		begin
			sign01 = 1;
			sign02 = 0;
			sign03 = 1;
			sign04 = 1;
			sign05 = 0;
			sign06 = 1;
			sign07 = 1;
		end
    	4'b0100: 
		begin
			sign01 = 0;
			sign02 = 1;
			sign03 = 1;
			sign04 = 1;
			sign05 = 0;
			sign06 = 1;
			sign07 = 1;
		end
    	4'b0101: 
		begin
			sign01 = 1;
			sign02 = 1;
			sign03 = 0;
			sign04 = 1;
			sign05 = 0;
			sign06 = 1;
			sign07 = 1;
		end
    	4'b0110: 
		begin
			sign01 = 1;
			sign02 = 1;
			sign03 = 0;
			sign04 = 1;
			sign05 = 1;
			sign06 = 1;
			sign07 = 1;
		end
    	4'b0111: 
		begin
			sign01 = 1;
			sign02 = 0;
			sign03 = 1;
			sign04 = 0;
			sign05 = 0;
			sign06 = 1;
			sign07 = 0;
		end
    	4'b1000:
		begin
			sign01 = 0;
			sign02 = 1;
			sign03 = 1;
			sign04 = 1;
			sign05 = 0;
			sign06 = 1;
			sign07 = 1; 
		end
    	4'b1001: 
		begin
			sign01 = 1;
			sign02 = 1;
			sign03 = 1;
			sign04 = 1;
			sign05 = 0;
			sign06 = 1;
			sign07 = 0;
		end
	endcase
	case(hundreds)
		4'b0000: 
		begin
			sign14 = 0; //0
			sign11 = 1;
			sign12 = 1;
			sign13 = 1;
			sign15 = 1;
			sign16 = 1;
			sign17 = 1;
		end
    	4'b0001: 
		begin
			sign11 = 0;
			sign12 = 0;
			sign13 = 1;
			sign14 = 0;
			sign15 = 0;
			sign16 = 1;
			sign17 = 0;
		end
    	4'b0010: 
		begin
			sign11 = 1;
			sign12 = 0;
			sign13 = 1;
			sign14 = 1;
			sign15 = 1;
			sign16 = 0;
			sign17 = 1;
		end
    	4'b0011: 
		begin
			sign11 = 1;
			sign12 = 0;
			sign13 = 1;
			sign14 = 1;
			sign15 = 0;
			sign16 = 1;
			sign17 = 1;
		end
    	4'b0100: 
		begin
			sign11 = 0;
			sign12 = 1;
			sign13 = 1;
			sign14 = 1;
			sign15 = 0;
			sign16 = 1;
			sign17 = 1;
		end
    	4'b0101: 
		begin
			sign11 = 1;
			sign12 = 1;
			sign13 = 0;
			sign14 = 1;
			sign15 = 0;
			sign16 = 1;
			sign17 = 1;
		end
    	4'b0110: 
		begin
			sign11 = 1;
			sign12 = 1;
			sign13 = 0;
			sign14 = 1;
			sign15 = 1;
			sign16 = 1;
			sign17 = 1;
		end
    	4'b0111: 
		begin
			sign11 = 1;
			sign12 = 0;
			sign13 = 1;
			sign14 = 0;
			sign15 = 0;
			sign16 = 1;
			sign17 = 0;
		end
    	4'b1000:
		begin
			sign11 = 0;
			sign12 = 1;
			sign13 = 1;
			sign14 = 1;
			sign15 = 0;
			sign16 = 1;
			sign17 = 1; 
		end
    	4'b1001: 
		begin
			sign11 = 1;
			sign12 = 1;
			sign13 = 1;
			sign14 = 1;
			sign15 = 0;
			sign16 = 1;
			sign17 = 0;
		end
	endcase
	case(tens)
		4'b0000: 
		begin
			sign24 = 0; //0
			sign21 = 1;
			sign22 = 1;
			sign23 = 1;
			sign25 = 1;
			sign26 = 1;
			sign27 = 1;
		end
    	4'b0001: 
		begin
			sign21 = 0;
			sign22 = 0;
			sign23 = 1;
			sign24 = 0;
			sign25 = 0;
			sign26 = 1;
			sign27 = 0;
		end
    	4'b0010: 
		begin
			sign21 = 1;
			sign22 = 0;
			sign23 = 1;
			sign24 = 1;
			sign25 = 1;
			sign26 = 0;
			sign27 = 1;
		end
    	4'b0011: 
		begin
			sign21 = 1;
			sign22 = 0;
			sign23 = 1;
			sign24 = 1;
			sign25 = 0;
			sign26 = 1;
			sign27 = 1;
		end
    	4'b0100: 
		begin
			sign21 = 0;
			sign22 = 1;
			sign23 = 1;
			sign24 = 1;
			sign25 = 0;
			sign26 = 1;
			sign27 = 1;
		end
    	4'b0101: 
		begin
			sign21 = 1;
			sign22 = 1;
			sign23 = 0;
			sign24 = 1;
			sign25 = 0;
			sign26 = 1;
			sign27 = 1;
		end
    	4'b0110: 
		begin
			sign21 = 1;
			sign22 = 1;
			sign23 = 0;
			sign24 = 1;
			sign25 = 1;
			sign26 = 1;
			sign27 = 1;
		end
    	4'b0111: 
		begin
			sign21 = 1;
			sign22 = 0;
			sign23 = 1;
			sign24 = 0;
			sign25 = 0;
			sign26 = 1;
			sign27 = 0;
		end
    	4'b1000:
		begin
			sign21 = 0;
			sign22 = 1;
			sign23 = 1;
			sign24 = 1;
			sign25 = 0;
			sign26 = 1;
			sign27 = 1; 
		end
    	4'b1001: 
		begin
			sign21 = 1;
			sign22 = 1;
			sign23 = 1;
			sign24 = 1;
			sign25 = 0;
			sign26 = 1;
			sign27 = 0;
		end
	endcase
	case(ones)
		4'b0000: 
		begin
			sign34 = 0; //0
			sign31 = 1;
			sign32 = 1;
			sign33 = 1;
			sign35 = 1;
			sign36 = 1;
			sign37 = 1;
		end
    	4'b0001: 
		begin
			sign31 = 0;
			sign32 = 0;
			sign33 = 1;
			sign34 = 0;
			sign35 = 0;
			sign36 = 1;
			sign37 = 0;
		end
    	4'b0010: 
		begin
			sign31 = 1;
			sign32 = 0;
			sign33 = 1;
			sign34 = 1;
			sign35 = 1;
			sign36 = 0;
			sign37 = 1;
		end
    	4'b0011: 
		begin
			sign31 = 1;
			sign32 = 0;
			sign33 = 1;
			sign34 = 1;
			sign35 = 0;
			sign36 = 1;
			sign37 = 1;
		end
    	4'b0100: 
		begin
			sign31 = 0;
			sign32 = 1;
			sign33 = 1;
			sign34 = 1;
			sign35 = 0;
			sign36 = 1;
			sign37 = 1;
		end
    	4'b0101: 
		begin
			sign31 = 1;
			sign32 = 1;
			sign33 = 0;
			sign34 = 1;
			sign35 = 0;
			sign36 = 1;
			sign37 = 1;
		end
    	4'b0110: 
		begin
			sign01 = 1;
			sign02 = 1;
			sign03 = 0;
			sign04 = 1;
			sign05 = 1;
			sign06 = 1;
			sign07 = 1;
		end
    	4'b0111: 
		begin
			sign31 = 1;
			sign32 = 0;
			sign33 = 1;
			sign34 = 0;
			sign35 = 0;
			sign36 = 1;
			sign37 = 0;
		end
    	4'b1000:
		begin
			sign31 = 0;
			sign32 = 1;
			sign33 = 1;
			sign34 = 1;
			sign35 = 0;
			sign36 = 1;
			sign37 = 1; 
		end
    	4'b1001: 
		begin
			sign31 = 1;
			sign32 = 1;
			sign33 = 1;
			sign34 = 1;
			sign35 = 0;
			sign36 = 1;
			sign37 = 0;
		end
	endcase
	//win and lose
	if (thousands == 0 && hundreds == 0 && tens == 0 && ones == 0)
	begin
		sign01 = 0; //U
		sign02 = 1;
		sign03 = 1;
		sign04 = 0;
		sign05 = 1;
		sign06 = 1;
		sign07 = 1;

		sign11 = 1; //r
		sign12 = 1;
		sign13 = 0;
		sign14 = 0;
		sign15 = 1;
		sign16 = 0;
		sign17 = 0;

		sign21 = 0; //b
		sign22 = 1;
		sign23 = 0;
		sign24 = 1;
		sign25 = 1;
		sign26 = 1;
		sign27 = 1; 

		sign31 = 1; //r
		sign32 = 1;
		sign33 = 0;
		sign34 = 0;
		sign35 = 1;
		sign36 = 0;
		sign37 = 0;
	end

/*
	if (thousands == 0 && hundreds == 0 && tens == 0 && ones == 0)
	begin
		sign01 = 0; //L
		sign02 = 1;
		sign03 = 0;
		sign04 = 0;
		sign05 = 1;
		sign06 = 0;
		sign07 = 1;

		sign11 = 1; //O
		sign12 = 1;
		sign13 = 1;
		sign14 = 0;
		sign15 = 1;
		sign16 = 1;
		sign17 = 1;

		sign21 = 1; //S
		sign22 = 1;
		sign23 = 0;
		sign24 = 1;
		sign25 = 0;
		sign26 = 1;
		sign27 = 1; 

		sign31 = 1; //E
		sign32 = 1;
		sign33 = 0;
		sign34 = 1;
		sign35 = 1;
		sign36 = 0;
		sign37 = 1;	
	end */

	if (thousands == 1)
	begin
		sign01 = 0; //first half of W
		sign02 = 1;
		sign03 = 1;
		sign04 = 0;
		sign05 = 1;
		sign06 = 1;
		sign07 = 1;	

		sign11 = 0; //second half of W
		sign12 = 1;
		sign13 = 1;
		sign14 = 0;
		sign15 = 1;
		sign16 = 1;
		sign17 = 1;	

		sign21 = 0; //I
		sign22 = 0;
		sign23 = 1;
		sign24 = 0;
		sign25 = 0;
		sign26 = 1;
		sign27 = 0; 

		sign31 = 1; //n
		sign32 = 1;
		sign33 = 1;
		sign34 = 0;
		sign35 = 1;
		sign36 = 1;
		sign37 = 0;						
end

	

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =
always @(*)
begin
	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
		// now display different colors every 80 pixels
		// while we're within the active horizontal range
		// -----------------



		////////////////////////////
		////////thousand's digit////////
		///////////////////////////

		// display white bar
		//top middle
		if (hc >= hbp && hc < (hbp+80) && vc >= (vbp+255) && vc < (vbp+260) && (sign01 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
		//top left
		else if (hc >= hbp && hc < (hbp+5) && vc >= (vbp+260) && vc < (vbp+335) && (sign02 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end	
		//top right
		else if (hc >= (hbp+75) && hc < (hbp+80) && vc >= (vbp+260) && vc < (vbp+335) && (sign03 > 0))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end	
		//middle
		else if (hc >= hbp && hc < (hbp+80) && vc >= (vbp+335) && vc < (vbp+340)&& (sign04 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
		//bottome left
		else if (hc >= hbp && hc < (hbp+5) && vc >= (vbp+340) && vc < (vbp+415)&& (sign05 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end	
		//bottome right
		else if (hc >= (hbp+75) && hc < (hbp+80) && vc >= (vbp+340) && vc < (vbp+415)&& (sign06 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end			
		//bottom middle
		else if (hc >= hbp && hc < (hbp+80) && vc >= (vbp+415) && vc < (vbp+420)&& (sign07 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end

		//////////////////////////////////////////////////
		///////////////hundred's digit///////////////////////
		/////////////////////////////////////////////////
		// display yellow bar
		//top middle
		else if (hc >= (hbp+80) && hc < (hbp+160) && vc >= (vbp+255) && vc < (vbp+260)&& (sign11 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end
		//top left
		else if (hc >= (hbp+80) && hc < (hbp+80+5) && vc >= (vbp+260) && vc < (vbp+335)&& (sign12 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end	
		//top right
		else if (hc >= (hbp+155) && hc < (hbp+160) && vc >= (vbp+260) && vc < (vbp+335)&& (sign13 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end		
		//middle
		else if (hc >= (hbp+80) && hc < (hbp+160) && vc >= (vbp+335) && vc < (vbp+340)&& (sign14 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end	
		//bottom left
		else if (hc >= (hbp+80) && hc < (hbp+80+5) && vc >= (vbp+340) && vc < (vbp+415)&& (sign15 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end
		//bottom right
		else if (hc >= (hbp+155) && hc < (hbp+160) && vc >= (vbp+340) && vc < (vbp+415)&& (sign16 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end	
		//bottom middle
		else if (hc >= (hbp+80) && hc < (hbp+160) && vc >= (vbp+415) && vc < (vbp+420)&& (sign17 > 0) )
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end							

		//////////////////////////////////////
		////////tens digit///////////////////
		//////////////////////////////////////

		// display cyan bar
		//top middle
		else if (hc >= (hbp+160) && hc < (hbp+240) && vc >= (vbp+255) && vc < (vbp+260)&& (sign21 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end
		//top left
		else if (hc >= (hbp+160) && hc < (hbp+160+5)  && vc >= (vbp+260) && vc < (vbp+335)&& (sign22 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end	
		//top right
		else if (hc >= (hbp+235) && hc < (hbp+240)  && vc >= (vbp+260) && vc < (vbp+335)&& (sign23 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end				
		//middle
		else if (hc >= (hbp+160) && hc < (hbp+240) && vc >= (vbp+335) && vc < (vbp+340)&& (sign24 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end		
		//bottom left
		else if (hc >= (hbp+160) && hc < (hbp+160+5) && vc >= (vbp+340) && vc < (vbp+415)&& (sign25 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end			
		//bottom right
		else if (hc >= (hbp+235) && hc < (hbp+240) && vc >= (vbp+340) && vc < (vbp+415)&& (sign26 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end			
		//bottom middle
		else if (hc >= (hbp+160) && hc < (hbp+240) && vc >= (vbp+415) && vc < (vbp+420)&& (sign27 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end		
        ///////////////////////////////
        /////////////ones digit///////
        ///////////////////////////////
		// display green bar
        //top middle
		else if (hc >= (hbp+240) && hc < (hbp+320)&& vc >= (vbp+255) && vc < (vbp+260)&& (sign31 > 0))
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end
        //top left
 		else if (hc >= (hbp+240) && hc < (hbp+240+5) && vc >= (vbp+260) && vc < (vbp+335) && (sign32 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end
        //top right
 		else if (hc >= (hbp+315) && hc < (hbp+320)  && vc >= (vbp+260) && vc < (vbp+335) && (sign33 > 0))
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end 
        //middle
		else if (hc >= (hbp+240) && hc < (hbp+320) && vc >= (vbp+335) && vc < (vbp+340) && (sign34 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end  
        //bottom left
 		else if (hc >= (hbp+240) && hc < (hbp+240+5) && vc >= (vbp+340) && vc < (vbp+415) && (sign35 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end   
        //bottom right
  		else if (hc >= (hbp+315) && hc < (hbp+320) && vc >= (vbp+340) && vc < (vbp+415) && (sign36 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end 
        //bottom middle
		else if (hc >= (hbp+240) && hc < (hbp+320) && vc >= (vbp+415) && vc < (vbp+420)&& (sign37 > 0) )
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end          
        
        /////////////////////////////////////
        ////////ones digit//////////////////
        /////////////////////////////////////
		// display magenta bar
        //top middle
		else if (hc >= (hbp+320) && hc < (hbp+400) && vc >= (vbp+255) && vc < (vbp+260)&& (sign41 > 0) )
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end
        //top left
		else if (hc >= (hbp+320) && hc < (hbp+325) && vc >= (vbp+260) && vc < (vbp+335) && (sign42 > 0) )
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end
        //top right
 		else if (hc >= (hbp+395) && hc < (hbp+400) && vc >= (vbp+260) && vc < (vbp+335) && (sign43 > 0) )
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end       
        // middle
		else if (hc >= (hbp+320) && hc < (hbp+400) && vc >= (vbp+335) && vc < (vbp+340) && (sign44 > 0) )
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end
        //bottom left
 		else if (hc >= (hbp+320) && hc < (hbp+325) && vc >= (vbp+340) && vc < (vbp+415) && (sign45 > 0) )
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end    
        //bottom right
  		else if (hc >= (hbp+395) && hc < (hbp+400) && vc >= (vbp+340) && vc < (vbp+415) && (sign46 > 0) )
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end          
        //bottom middle
		else if (hc >= (hbp+320) && hc < (hbp+400) && vc >= (vbp+415) && vc < (vbp+420) && (sign47 > 0) )
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end   
/*        
		// display red bar
		else if (hc >= (hbp+400) && hc < (hbp+480))
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b00;
		end
		// display blue bar
		else if (hc >= (hbp+480) && hc < (hbp+560))
		begin
			red = 3'b000;
			green = 3'b000;
			blue = 2'b11;
		end
		// display black bar
		else if (hc >= (hbp+560) && hc < (hbp+640))
		begin
			red = 3'b000;
			green = 3'b000;
			blue = 2'b00;
		end
		// we're outside active horizontal range so display black
		else
		begin
			red = 0;
			green = 0;
			blue = 0;
		end
        */
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule
