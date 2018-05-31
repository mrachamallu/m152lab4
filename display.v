`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:44 05/21/2018 
// Design Name: 
// Module Name:    display 
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
module display(clk, num1, num2, num3, num4, seg, an);

input wire clk;
input [3:0] num1;
input [3:0] num2;
input [3:0] num3;
input [3:0] num4;
reg [3:0] number;
output reg [7:0] seg;
output reg [3:0] an;
reg [1:0] activating_counter;

/*always @(posedge clk) //increment activating counter using 700Hz clock
begin
	if (rst == 1)
	begin
    
	end
	if(activating_counter == 2'b11)
		activating_counter = 2'b00;
	else
	activating_counter = activating_counter + 1;
end
*/
always @(posedge clk) //select which part of the code to display
begin
	case(activating_counter)
	2'b00: begin
		an = 4'b0111; //min10
		number = num1;
        activating_counter = 2'b01;
	end
	2'b01: begin
		an = 4'b1011;
		number = num2;
       activating_counter = 2'b10;
	end
	2'b10: begin
		an = 4'b1101;
		number = num3;
        activating_counter = 2'b11;
	end
	2'b11: begin
		an = 4'b1110;
		number = num4;
        activating_counter = 2'b00;
	end
	endcase
end

always @(*)
begin
	case(number)
	4'b0000: seg = 8'b11000000; //0
	4'b0001: seg = 8'b11111001; //1
	4'b0010: seg = 8'b10100100; //2
	4'b0011: seg = 8'b10110000; //3
	4'b0100: seg = 8'b10011001; //4
	4'b0101: seg = 8'b10010010; //5
	4'b0110: seg = 8'b10000010; //6
	4'b0111: seg = 8'b11111000; //7
	4'b1000: seg = 8'b10000000; //8
	4'b1001: seg = 8'b10010000; //9
//	5'b01010: seg = 8'b11000111; //L
//	5'b01011: seg = 8'b11000000; //O
//	5'b01011: seg = 8'b10010010; //S
//	5'b01100: seg = 8'b10000110; //E
//	5'b01101: seg = 8'b10011001; //Y
//	5'b01110: seg = 8'b10001000; //A
	4'b1111: seg = 8'b11111111; //display nothing
	endcase
end


endmodule
