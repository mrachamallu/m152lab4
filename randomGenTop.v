`timescale 1ns / 1ps

module randomGenTop (clk, reset, stopInt, randNum1, randNum2, randNum3, randNum4);

input clk;
input reset;
input stopInt;
output wire [3:0] randNum1;
output wire [3:0] randNum2;
output wire [3:0] randNum3;
output wire [3:0] randNum4;

//reg [3:0] randN1;
//reg [3:0] randN2;
//reg [3:0] randN3;
//reg [3:0] randN4;
reg [26:0] cntr1;
reg [26:0] cntr2;
reg [26:0] cntr3;
reg [26:0] cntr4;

reg stop1;
reg stop2;
reg stop3;
reg stop4;
//reg finalStop;


//assign randNum1 = randN1;
//assign randNum2 = randN2;
//assign randNum3 = randN3;
//assign randNum4 = randN4;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cntr1 <= 0;
        cntr2 <= 0;
        cntr3 <= 0;
        cntr4 <= 0;
        stop1 <= 0;
        stop2 <= 0;
        stop3 <= 0;
        stop4 <= 0;
    end
    else if (stopInt == 0)
    begin
        stop1 <= 0;
        stop2 <= 0;
        stop3 <= 0;
        stop4 <= 0;
        cntr1 <= 0;
        cntr2 <= 0;
        cntr3 <= 0;
        cntr4 <= 0;
    end
    else if(stopInt == 1)
    begin  
       // if(finalStop == 0)
       // begin  
            if(cntr1 != 10 && cntr2 == 0 && cntr3 == 0 && cntr4 == 0)
                cntr1 <= cntr1 + 1;
            else if(cntr1 == 10 && cntr2 != 10 && cntr3 == 0 && cntr4 == 0)
				begin
                cntr2 <= cntr2 + 1;
                stop1 <= 1;
				end
            else if(cntr1 == 10 && cntr2 == 10 && cntr3 != 10 && cntr4 == 0)
				begin
                cntr3 <= cntr3 + 1;
                stop2 <= 1; 
				end
            else if(cntr1 == 10 && cntr2 == 10 && cntr3 == 10 && cntr4 != 10)
				begin
                cntr4 <= cntr4 + 1;  
                stop3 <= 1; 
				end
            else if(cntr1 == 10 && cntr2 == 10 && cntr3 == 10 && cntr4 == 10)
            begin
                stop4 <= 1;
                cntr1 <= 0;
                cntr2 <= 0; 
                cntr3 <= 0;
                cntr4 <= 0;
            end      
      //  end  
    end
end    

randomGen randomGen(
    .clk(clk), 
    .stop(stop1), 
    .reset(reset), 
    .randNum(randNum1)
    );
randomGen1 randomGen1(
    .clk(clk), 
    .stop(stop2), 
    .reset(reset), 
    .randNum(randNum2)
    );
randomGen2 randomGen2(
    .clk(clk), 
    .stop(stop3), 
    .reset(reset), 
    .randNum(randNum3)
    );
randomGen3 randomGen3(
    .clk(clk), 
    .stop(stop4), 
    .reset(reset), 
    .randNum(randNum4)
    );



endmodule