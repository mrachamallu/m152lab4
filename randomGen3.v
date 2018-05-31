`timescale 1ns / 1ps

module randomGen3 (clk, stop, reset, randNum);

input clk;
input stop;
input reset;
output[3:0] randNum;
reg [6:0] rand;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        rand <= 7'b1111111;
    end
    else if (stop == 0)
    begin
        rand[0] <= rand[6]^rand[5];
        rand[6:1] <= rand[5:0];
    end
end

assign randNum = rand[6:0] % 10; 

endmodule
