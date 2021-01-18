module vdecoder(clock, reset, in, out, error);
input logic clock, in, reset;
output logic out, error;
reg slowclock=0;
reg [0:1] state;
reg [0:1] x=2'b00;
always @ (posedge clock)
	slowclock<=~slowclock;

always @( posedge slowclock)
begin
	case(state)
		2'b00:
			if(x==2'b01 || x==2'b10)
				error=1;
			else
				error=0;
		2'b10:
			if(x==2'b01 || x==2'b10)
				error=1;
			else
				error=0;
		2'b11:
			if(x==2'b00 || x==2'b11)
				error=1;
			else
				error=0;
		2'b01:
			if(x==2'b00 || x==2'b11)
				error=1;
			else
				error=0;

	endcase
	out= (((~state[0])&&x[1])||(state[0]&& (~x[1])))&&(~error);
end

always @(negedge reset)
begin
	//set state back to zero
	state=2'b00;
	slowclock=0;
end
// change state
always@(posedge slowclock)
begin
	state[0]<=x[0];
	state[1]<=x[1];	
end
//take inputs
always@(posedge clock)
begin
	x[0]<= in;
	x[1]<= x[0];
end
endmodule
