`timescale 1ns / 1ps

module debouncer(btnP, btnR, clk, pause, rst);

input btnP;
input btnR;
input clk;
output wire pause;
output wire rst;
reg pauseR;
//////Pause/////////////////////////////////////
wire apse_i;
wire pse;
reg [1:0] apse_ff;

assign pause = pauseR;
initial begin
	pauseR <= 0;
end

assign apse_i = btnP;
assign pse = apse_ff[0];

always @ (posedge clk or posedge apse_i) begin
	if (apse_i)
		apse_ff <= 2'b11;
	else
		apse_ff <= {1'b0, apse_ff[1]};
end

always @ (posedge pse) begin
	pauseR <= !pauseR;
end
//////////////////////////////////////////////////

//////Reset/////////////////////////////////////
wire arst_i;
//wire rst;
reg [1:0] arst_ff;

assign arst_i = btnR;
//assign rst = arst_ff[0];
assign rst = arst_ff[0];

always @ (posedge clk or posedge arst_i) begin
	if (arst_i)
		arst_ff <= 2'b11;
	else
		arst_ff <= {1'b0, arst_ff[1]};
end

endmodule