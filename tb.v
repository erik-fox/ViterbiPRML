module top();
reg  reset=0, in=1, Clock, slow=0;
wire out;

parameter SIMTIME = 1000;
parameter TRUE   = 1'b1;
parameter FALSE  = 1'b0;
parameter CLOCK_CYCLE  = 20;
parameter CLOCK_WIDTH  = CLOCK_CYCLE/2;

reg [0:1]x=2'b00; 
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
	$display("tb Output - %b",out);
end
always @(negedge slow)
begin
	in = $urandom();
end

initial
begin
	#5
		reset=1'b0;
	#50
		reset=1'b1;
	#65	
		reset=1'b0;
	#75
		reset=1'b1;
	#85
		reset=1'b0;
	#7
		reset=1'b1;
	#83
		reset=1'b0;
	#50
		reset=1'b1;
	#65	
		reset=1'b0;
	#75
		reset=1'b1;
	#85
		reset=1'b0;
	#7
		reset=1'b1;
	#83
		reset=1'b0;
end

always
begin
	#SIMTIME
	$stop;
end

endmodule


