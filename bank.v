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
output reg[26:0] balance;
reg[26:0] balanceR;
reg[26:0] deduction;

always @(posedge clk)
begin
	if (b100)
		deduction <= 100;
	else if (b50)
		deduction <= 50;
	else if (b10)
		deduction <= 10;
	else if (b1)
		deduction <= 1;
	else
		deduction <= 0;
end

always @(posedge clk)
begin
	 balance <= balanceR;
    if(rst)
	 begin
        balanceR <= 100;
		  balance <= balanceR;
		end
    else if(randNum1 == randNum2 && randNum2 == randNum3 && randNum3 == randNum4)
    begin
        if(b1)
            balanceR <= balanceR + 1;
        else if(b10)
            balanceR <= balanceR + 10;
        else if(b50)
            balanceR <= balanceR + 50;
        else if(b100)
            balanceR <= balanceR + 100;
    end
	 else
		begin
			balanceR <= balanceR - deduction;
		end
end

endmodule




