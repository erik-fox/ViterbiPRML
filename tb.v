module top();
reg  reset=0, in=0, Clock, slow=0, error=0;
wire out, decoded;

parameter TRUE   = 1'b1;
parameter FALSE  = 1'b0;
parameter CLOCK_CYCLE  = 20;
parameter CLOCK_WIDTH  = CLOCK_CYCLE/2;

vencoder v0(Clock, reset, in, out);
vdecoder d0(Clock, reset, out,decoded, error);

initial
begin
	$monitor("clock %b slowclock %b vencoder input %b vencoder output %b vdecoder output %b reset %b error %b",Clock, slow, in,out, decoded, reset, error);
end

initial
begin
Clock = FALSE;
forever #CLOCK_WIDTH Clock = ~Clock;
end



always @(posedge Clock)
begin
	slow=~slow;
end
initial
begin
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b01;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b01;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b10;
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	repeat (1) @ (negedge slow); {in,reset} =2'b11;
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	repeat (1) @ (negedge slow); {in,reset} =2'b00;
	$stop;
end

endmodule


