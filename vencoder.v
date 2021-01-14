module vencoder(clock, reset, in, out);
input logic clock, in, reset;
output logic out;

reg [0:2]x; 
reg slowclock;
//create slow clock
always @ (posedge clock)
	slowclock<=~slowclock;

//combinational logic with blocking assignments into the output
//po
always @ (posedge slowclock)//is this working with the updated data from reg shift?
begin
	out=x[0]^x[1];
end
//p1
always @ (negedge slowclock)     
begin
	out=x[0]^x[1]^x[2];
end
//shift register of inputs
always@(posedge slowclock)
begin
	x[0]<= in;
	x[1]<=x[0];
	x[2]<=x[1];
end

//async reset
always @(reset)
	{slowclock,x}=4'b000;    

endmodule
