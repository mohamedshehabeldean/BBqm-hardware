//mohamed sabry mahmoud shehab eldean >>>>>sec:17
/* 
 Module Name: clock_divider
 Description: Clock divider works to divide the FPGA Clock to 1 Hz. 
FPGA clock is 50 MHz >>>>>>>>>>>1 s
              x  mhz >>>>>>>>>>>1/1000 s
    x=250000
250 thousand  for One duty cycle and 250 thousand for Zero duty cycle >>>100 thousand for debouncing
*/
//###############################################################################
// ---------------------------  clock divider  ------------------------------- //
module clock_divider (clk, reset, slow_CLK);
// -------------------------- Inputs Declarations ---------------------------- //
input clk, reset;
// ------------------------- Outputs Declarations ---------------------------- //
output  slow_CLK;
// --------------------------- Wire Declarations ----------------------------- // 
// ---------------------------- Reg Declarations ----------------------------- //
reg slow_CLK;
reg [17:0] count;
// ------------------------- Instantiation Modules --------------------------- //
// --------------------------------------------------------------------------- //
// --------------------------------------------------------------------------- //
// ----------------------- Combinational Logic  ------------------------------ //
// ----------------------- Sequential  Logic  -------------------------------- //
always @(posedge clk or posedge reset)
	begin
		if(reset) // reset the counter circuit to initial (zero)
			begin
				count <= 0;
				slow_CLK<= 0;
			end
		else
			begin
				if(count < 250_000)
//250000>>100000 for debouncing
					count <= count + 1; // count 250 thousand 
				else 
					begin
						slow_CLK = ~slow_CLK; // toggle the clk high\low
						count <= 0;
					end
			end
	end		
// --------------------------------------------------------------------------- //
endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //
module clock_divider_dut();
reg clk, reset;
wire slow_CLK;
initial
begin
clk=0;
reset=1;#100
reset=0;
end
always 
#100 clk=~clk;
clock_divider kd (clk, reset, slow_CLK);
endmodule