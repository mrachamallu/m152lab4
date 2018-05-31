`timescale 1ns / 1ps

module randomGen2 (clk, stop, reset, randNum);

input clk;
input stop;
input reset;
output[3:0] randNum;
reg [5:0] rand;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        rand <= 6'b111111;
    end
    else if (stop == 0)
    begin
        rand[0] <= rand[5]^rand[4];
        rand[4:1] <= rand[4:0];
    end
end

assign randNum = rand[5:0] % 10; 

endmodule
