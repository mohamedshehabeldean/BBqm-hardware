
//mohamed sabry mahmoud shehab eldean >>>>>sec:17
module rom(pcount,tcount,wtime);
input [2:0] pcount;
input [1:0]tcount;
output wtime;
reg [7:0] wtime = 8'b00000000;
reg [4:0] temp;
//when tcount =0 wtime =0;else wtime=value.
//-------------the first three bit for pcount and last two bit for tcount -------------.
//---------wtime>>>>>>>>>>waiting time for everyone----------------- .
always @ (*)
begin 
temp<={pcount,tcount};
  case (temp)
	5'b00001:wtime<=8'b00000000;
	5'b00101:wtime<=8'b00000011;
	5'b01001:wtime<=8'b00000110;
	5'b01101:wtime<=8'b00001001;
	5'b10001:wtime<=8'b00001100;
	5'b10101:wtime<=8'b00001111;
	5'b11001:wtime<=8'b00010010;
	5'b11101:wtime<=8'b00010101;
	5'b00010:wtime<=8'b00000010;
	5'b00110:wtime<=8'b00000011;
	5'b01010:wtime<=8'b00000101;
	5'b01110:wtime<=8'b00000110;
	5'b10010:wtime<=8'b00001000;
	5'b10110:wtime<=8'b00001001;
	5'b11010:wtime<=8'b00001011;
	5'b11110:wtime<=8'b00001100;
	5'b00011:wtime<=8'b00000010;
	5'b00111:wtime<=8'b00000011;
	5'b01011:wtime<=8'b00000100;
	5'b01111:wtime<=8'b00000101;
	5'b10011:wtime<=8'b00000110;
	5'b10111:wtime<=8'b00000111;
	5'b11011:wtime<=8'b00001000;
	5'b11111:wtime<=8'b00001001;
	default:wtime<=8'b00000000;
	endcase
 end

  endmodule
//-------------------------------------------------
//--------endfile-----------------------------------
module rom_dutot();
reg [2:0]pcount;
reg [1:0]tcount;
wire[7:0]wtime;
initial
begin
pcount =3'b000;tcount=2'b00;#100;
pcount =3'b001;tcount=2'b00;#100;
pcount =3'b010;tcount=2'b00;#100;
pcount =3'b011;tcount=2'b00;#100;
pcount =3'b100;tcount=2'b00;#100;
pcount =3'b101;tcount=2'b00;#100;
pcount =3'b110;tcount=2'b00;#100;
pcount =3'b111;tcount=2'b00;#100;
pcount =3'b000;tcount=2'b01;#100;
pcount =3'b001;tcount=2'b01;#100;
pcount =3'b010;tcount=2'b01;#100;
pcount =3'b011;tcount=2'b01;#100;
pcount =3'b100;tcount=2'b01;#100;
pcount =3'b101;tcount=2'b01;#100;
pcount =3'b110;tcount=2'b01;#100;
pcount =3'b111;tcount=2'b01;#100;
pcount =3'b000;tcount=2'b10;#100;
pcount =3'b001;tcount=2'b10;#100;
pcount =3'b010;tcount=2'b10;#100;
pcount =3'b011;tcount=2'b10;#100;
pcount =3'b100;tcount=2'b10;#100;
pcount =3'b101;tcount=2'b10;#100;
pcount =3'b110;tcount=2'b10;#100;
pcount =3'b111;tcount=2'b10;#100;
pcount =3'b000;tcount=2'b11;#100;
pcount =3'b001;tcount=2'b11;#100;
pcount =3'b010;tcount=2'b11;#100;
pcount =3'b011;tcount=2'b11;#100;
pcount =3'b100;tcount=2'b11;#100;
pcount =3'b101;tcount=2'b11;#100;
pcount =3'b110;tcount=2'b11;#100;
pcount =3'b111;tcount=2'b11;#100;
end
rom store(pcount,tcount,wtime);
endmodule
