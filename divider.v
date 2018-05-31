`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:54 05/21/2018 
// Design Name: 
// Module Name:    divider 
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
module divider(clk, clk50HzW, clk700HzW
    );

input clk;
reg clk700Hz;
reg clk50Hz;
reg cntr50Hz;
reg cntr700Hz; 
output wire clk50HzW;
output wire clk700HzW;
assign clk700HzW = clk700Hz;
assign clk50HzW = clk50Hz;


always @ (posedge(clk))
begin
	if(cntr700Hz == 71000) begin
		cntr700Hz = 0;
		clk700Hz = ~clk700Hz;
	end
	else begin
		cntr700Hz = cntr700Hz + 1;
	end
end


always @ (posedge(clk))
begin
	if(cntr50Hz == 1000000) begin
		cntr50Hz = 0;
		clk50Hz = ~clk50Hz;
	end
	else begin
		cntr50Hz = cntr50Hz + 1;
	end
end


endmodule
