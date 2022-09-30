module counter_to_decoder(clkup,switch,reset,tcount,clk,pcount,wtime1,wtime2,full_flag,empty_flag,alarm);
//input are all input in project
//output are all output in project
input clkup,switch,reset,clk;
input [1:0]tcount;
//number of bits of tailer is two
//pcount is counter appear on seven seg
output full_flag,empty_flag,alarm;
output [6:0]pcount,wtime1,wtime2;
wire slow_CLK;
wire up1;
wire [7:0]wtime;
wire [3:0]count;
 clock_divider clk0(clk,reset,slow_CLK);
 ff f1(slow_CLK,clkup,up1);
 UpDownCounter counter1(up1,switch,reset,count,full_flag,empty_flag,alarm);
 rom rom1(count,tcount,wtime);
 decoder_7seg decode1(count[3],count[2],count[1],count[0],pcount[6],pcount[5],pcount[4],pcount[3],pcount[2],pcount[1],pcount[0]);
 decoder_7seg decode2(wtime[3],wtime[2],wtime[1],wtime[0],wtime1[6],wtime1[5],wtime1[4],wtime1[3],wtime1[2],wtime1[1],wtime1[0]);
 decoder_7seg decode3(wtime[7],wtime[6],wtime[5],wtime[4],wtime2[6],wtime2[5],wtime2[4],wtime2[3],wtime2[2],wtime2[1],wtime2[0]);




endmodule
//---------end file-------------------
//-----------------------------------