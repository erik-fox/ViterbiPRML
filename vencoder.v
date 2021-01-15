module vencoder(clock, reset, in, out);
input logic clock, in, reset;
output logic out;

reg [0:2]x=3'b000; 
reg slowclock=0;
//create slow clock
always @ (posedge clock)
	slowclock<=~slowclock;

always@(negedge slowclock)
begin
	out=x[0]^x[1];
	$display("p1 - %b", x[0]^x[1]);
end
//shift register of inputs
always@(posedge slowclock)
begin
	$display("State: %b",{in, x[0],x[1]});	
	x[0]<= in;
	x[1]<=x[0];
	x[2]<=x[1];
	out =  in^x[0]^x[1];
	$display("p0 - %b",in^x[0]^x[1]);
end

//async reset
always @(negedge reset)
begin
	{slowclock,x}=4'b000;   
	$display("Reset: State - %b In - %b", {x[0],x[1]}, in); 
end
endmodule
