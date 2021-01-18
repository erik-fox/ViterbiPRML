module vdecoder(clock, reset, in, out, error);
input logic clock, in, reset;
output logic out, error;
reg slowclock=0;
always @ (posedge clock)
	slowclock<=~slowclock;

always @(negedge reset)
begin
	//set state back to zero
end

always@(posedge slowclock)
begin
always@(negedge slowclock)
begin
end
endmodule
