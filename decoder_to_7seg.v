
/* AUTHOR(S):  Course Instructors 
mohamed sabry mahmoud shehab eldean>>>sec:17
Dr. Ahmed Shalaby, Dr. Fatam Saker,
 Eng. Aya Hatem, Eng Mostafa , Eng. Aya Abdel-Hamid, Eng. Miada, Eng. Abdu-Allah 
 Project: CS222: Computer Architecture Labs //   
 Module Name : decoder_7seg
 Description: seven segment decoder using logic equations 
A seven-segment display decoder takes a 4-bit data input A, B, C, D 
and produces seven outputs to control light-emitting diodes to display
a digit from 0 to 9.  
*/
//###############################################################################
// --------------------------  decoder_7seg    ------------------------------- //
module decoder_7seg (A, B, C, D, led_a, led_b, led_c, led_d, led_e, led_f, led_g);
// -------------------------- Inputs Declarations ---------------------------- //
input A, B, C, D;
// ------------------------- Outputs Declarations ---------------------------- //
output led_a, led_b, led_c, led_d, led_e, led_f, led_g;
// --------------------------- Wire Declarations ----------------------------- // 
// ---------------------------- Reg Declarations ----------------------------- //
// ------------------------- Instantiation Modules --------------------------- //
// --------------------------------------------------------------------------- //
// --------------------------------------------------------------------------- //
// ----------------------- Combinational Logic  ------------------------------ //
/* Be aware that the leds are common anode  */
assign led_a = ~(A | C | B&D | ~B&~D);
assign led_b = ~(~B | ~C&~D | C&D);
assign led_c = ~(B | ~C | D);
assign led_d = ~(~B&~D | C&~D | B&~C&D | ~B&C |A);
assign led_e = ~(~B&~D | C&~D);
assign led_f = ~(A | ~C&~D | B&~C | B&~D);
assign led_g = ~(A | B&~C | ~B&C | C&~D);
// ----------------------- Sequential  Logic  -------------------------------- //
// --------------------------------------------------------------------------- //
endmodule
// ----------------------------- End of File --------------------------------- //
// --------------------------------------------------------------------------- //

module decoder_7seg_dut();
reg A ,B ,C, D;
wire led_a,led_b,led_c,led_d,led_e,led_f,led_g;
initial
begin
A=0;B=0;C=0;D=0;#100;
A=0;B=0;C=0;D=1;#100;
A=0;B=0;C=1;D=0;#100;
A=0;B=0;C=1;D=1;#100;
A=0;B=1;C=0;D=0;#100;
A=0;B=1;C=0;D=1;#100;
A=0;B=1;C=1;D=0;#100;
A=0;B=1;C=1;D=1;#100;
A=1;B=0;C=0;D=0;#100;
A=1;B=0;C=0;D=1;#100;
end
decoder_7seg pp (A,B,C,D,led_a,led_b,led_c,led_d,led_e,led_f,led_g);

endmodule