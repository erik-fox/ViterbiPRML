module vdecoder(clock, reset, in, out, error);
input logic clock, in, reset;
output logic out, error;
reg slowclock=0;
reg [0:1] state= 2'b00;
reg [0:1] x=2'b00;
always @ (posedge clock)
	slowclock<=~slowclock;

always @( posedge slowclock)
begin
	
	case(state)
		2'b00:
			begin
			if(x==2'b01 || x==2'b10)
				error=1;
			else
			begin
				error=0;
				if(x==2'b00)
				begin
					out=1'b0;
				end
				else
					out=1'b1;	
			end
			end
		2'b10:begin
			if(x==2'b01 || x==2'b10)
				error=1;
			else
			begin
				error=0;
				if(x==2'b00)
					out=1'b1;
				else
					out=1'b0;	
			end
			end
		2'b11:begin
			if(x==2'b00 || x==2'b11)
				error=1;
			else
			begin
				error=0;
				if(x==2'b01)
					out=1'b1;
				else
					out=1'b0;	
			end
			end
		2'b01:begin
			if(x==2'b00 || x==2'b11)
				error=1;
			else
			begin
				error=0;
				if(x==2'b01)
					out=1'b0;
				else
					out=1'b1;	
			end
			end

	endcase
	
	state={out,state[0]};
end

always @(negedge reset)
begin
	//set state back to zero
	state<=2'b00;
	x<=2'b00;
	slowclock<=0;
end
//take inputs
always@(posedge clock)
begin
	x[0]<= in;
	x[1]<= x[0];
end
endmodule
