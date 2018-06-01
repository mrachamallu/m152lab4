module bank(clk, b1, b10, b50, b100, randNum1, randNum2, randNum3, randNum4, rst, balance);

input clk;
input b1; //the switches
input b10;
input b50;
input b100;
input [3:0] randNum1;
input [3:0] randNum2;
input [3:0] randNum3;
input [3:0] randNum4;
input rst;
output wire[26:0] balance;
reg[26:0] balanceR;

always @(posedge clk)
begin
	 balance = balanceR;
    if(rst)
        balanceR = 100;
    else if(randNum1 == randNum2 && randNum2 == randNum3 && randNum3 == randNum4)
    begin
        if(b1)
            balanceR = balanceR + 1;
        else if(b10)
            balanceR = balanceR + 10;
        else if(b50)
            balanceR = balanceR + 50;
        else if(b100)
            balanceR = balanceR + 100;
    end
end

endmodule




