

//mohamed sabry mahmoud shehab eldean >>>>>sec:17
//-----------counter  updown 0>>>>>7------------------

module UpDownCounter(clkup,switch,reset,pcount,full_flag,empty_flag,alarm);

  input clkup,switch,reset;
  output [3:0]pcount;
  //--------------outout  3bits the largest number is 7-------------
  output full_flag,empty_flag,alarm;
//---------------alarm turn on when count =0 and you decrease or count =7 and you increase---------
  reg [3:0]pcount=0;
  //---------reg because assign left hand of always---------
  reg alarm;
  reg full_flag=0;
  reg empty_flag=0;
 //------------ull_flag ,empty_flag and alarm >>>>>>>leds-------------

 //-------full_flag light when count =7 and empty_flag light when count=0 --------------- 
  always @(posedge clkup or  posedge reset)
  begin 
    if(reset)
      begin
        pcount<=0;
        full_flag<=0;
        empty_flag<=1;
         alarm<=0;
      end

    else if(switch==1)
    begin 
		if(clkup)
		begin
         if(pcount==7)
           begin
           alarm<=1;
           full_flag<=1;
            end
         else
          begin
             pcount<=pcount+1;
             alarm<=0; 
             empty_flag<=0;
           if(pcount==7)
               full_flag<=1;
           else
              full_flag<=0;
          end
		  end
      end
      else 
		begin 
        if(pcount==0)
          begin
          alarm<=1;
           empty_flag<=1;
           end
        else
        begin
          pcount<=pcount-1;
          alarm<=0; 
          full_flag<=0;
          if(pcount==0)
             empty_flag<=1;
          else
             empty_flag<=0;
         end
      end
  end
endmodule
//--------------------------------------
//----------end file------------------
module UpDownCounter_dutt();
reg clkup,switch,reset;
wire [3:0]pcount;
wire full_flag,empty_flag,alarm;

initial
begin
clkup=0;
switch=1;
reset=1; #100;
reset=0;
end
always 
#50 clkup=~clkup;
always
#900 switch=~switch;

UpDownCounter  kd (clkup,switch,reset,pcount,full_flag,empty_flag,alarm);
endmodule