`timescale 1ns / 1ps

module randomGen1 (clk, stop, reset, randNum);

input clk;
input stop;
input reset;
output[3:0] randNum;
reg [4:0] rand;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        rand <= 5'b11111;
    end
    else if (stop == 0)
    begin
        rand[0] <= rand[4]^rand[3];
        rand[4:1] <= rand[3:0];
    end
end

assign randNum = rand[4:0] % 10; 

endmodule
