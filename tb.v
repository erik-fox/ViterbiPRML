module top();
reg  reset=0, in=1, Clock;
wire out=0;
parameter SIMTIME = 1000;
parameter TRUE   = 1'b1;
parameter FALSE  = 1'b0;
parameter CLOCK_CYCLE  = 20;
parameter CLOCK_WIDTH  = CLOCK_CYCLE/2;
reg slow=0;
vencoder v0(Clock, reset, in, out);
//
// Create free running clock
//

initial
begin
Clock = FALSE;
forever #CLOCK_WIDTH Clock = ~Clock;
end

always @(posedge Clock)
begin
	slow=~slow;
end
always @(negedge slow)
begin
	in = $urandom();
end

always
begin
	#SIMTIME
	$stop;
end

endmodule


