
//mohamed sabry mahmoud shehab eldean >>>>>sec:17
//this module  flip flop for ssolving debouncing problem 
//clock>>>>clock divider>>>>slowclock>>>>flipflop>>>>counter

module ff(clk,d,q);
  input clk , d;
  output reg q;
  always @(posedge clk) 
      q<=d;
endmodule
//----------------------------------------
//------endfile---------------------------
module ff_dut();
reg d;
reg clk;
// Outputs
wire q;
initial begin
d = 0;
clk = 0;
end
always 
#50 clk=~clk;

always 
#100 d=~d;
ff f (clk,d,q);
endmodule