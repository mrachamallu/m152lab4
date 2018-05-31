`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:39 05/25/2018 
// Design Name: 
// Module Name:    bank 
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
/*module bankDisplay( topMid, topR, topL, botR, botL, botMid, mid );

output [1:0] topMid;
output [1:0] topR;
output [1:0] topL;
output [1:0] botR;
output [1:0] botL;
output [1:0] botMid;
output [1:0] mid;
reg [3:0] num = 0;
//for each number 0-9, determine which segment on 7-seg display to light up
case(num)
	4'b0000:
		begin
			topMid = 1;
			topR = 1;
			topL = 1;
			botR = 1;
			botL = 1; 
			botMid = 1;
		end
	4'b0001:
		begin
			topR = 1;
			botR = 1;
		end
	4'b0010:
		begin
			topMid = 1;
			topR = 1;
			mid = 1;
			botL = 1; 
			botMid = 1;
		end
	endcase
endmodule
*/