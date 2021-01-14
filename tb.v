module top();
reg  reset=0, in, Clock;
wire out;
parameter SIMTIME = 10000;
parameter TRUE   = 1'b1;
parameter FALSE  = 1'b0;
parameter CLOCK_CYCLE  = 20;
parameter CLOCK_WIDTH  = CLOCK_CYCLE/2;

vencoder v0(Clock, reset, in, out);
//
// Create free running clock
//

initial
begin
Clock = FALSE;
forever #CLOCK_WIDTH Clock = ~Clock;
end

initial
begin
$monitor("output = %b", out);
end

always@ (negedge Clock)
begin
	in=$urandom();
	$display("input = %b",in);
end

always
begin
	#SIMTIME
	$stop;
end

endmodule




