
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