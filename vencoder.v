module vencoder(clock, reset, in, out);
input logic clock, in, reset;
output logic out;

reg [0:2]x=3'b000; 
reg slowclock=0;
//create slow clock
always @ (posedge clock)
	slowclock<=~slowclock;

//shift register of inputs
always@(posedge slowclock)
begin
	x[0]<=in; 
	x[1]<=x[0];
	x[2]<=x[1];
end

assign out = ((x[0]^x[1]^x[2])&& slowclock) || ((~slowclock)&&(x[0]^x[1]));


//async reset
always @(posedge reset)
begin
	{slowclock,x}=4'b000;   
end
endmodule
