module vencoder(clock, reset, in, out);
input logic clock, in, reset;
output logic out;

reg [0:2]x=3'b000; 
reg slowclock=0;
//create slow clock
always @ (posedge clock)
	slowclock<=~slowclock;
initial
begin
	$monitor("register = %b", x);
end

always@(negedge slowclock)
begin
	out=x[0]^x[1];
	$display("negedge out = %b", out);
end
//shift register of inputs
always@(posedge slowclock)
begin
	x[0]<= in;
	x[1]<=x[0];
	x[2]<=x[1];
	$display("in %b x[0] %b x[1]" , in,x[0],x[1]); 
	out =  in^x[0]^x[1];
	$display(" posedge out - %b",out);
end

//async reset
always @(reset)
	{slowclock,x}=4'b000;    

endmodule
