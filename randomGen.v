`timescale 1ns / 1ps

module randomGen (clk, stop, reset, randNum);

input clk;
input stop;
input reset;
output wire [3:0] randNum;
reg [3:0] rand;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        rand <= 4'b1111;
    end
    else if (stop == 0)
    begin
        rand[0] <= rand[3]^rand[2];
        rand[3:1] <= rand[2:0];
    end
end

assign randNum = rand[3:0] % 10; 

endmodule
