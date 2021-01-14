module top();
reg clock, reset, input;
wire output;

parameter TRUE   = 1'b1;
parameter FALSE  = 1'b0;
parameter CLOCK_CYCLE  = 20;
parameter CLOCK_WIDTH  = CLOCK_CYCLE/2;
parameter IDLE_CLOCKS  = 2;


//
// Create free running clock
//

initial
begin
Clock = FALSE;
forever #CLOCK_WIDTH Clock = ~Clock;
end

//
// Generate Clear signal for two cycles
//

initial
begin
Clear = TRUE;
repeat (IDLE_CLOCKS) @(negedge Clock);
Clear = FALSE;
end
//
// Generate stimulus after waiting for reset
//

initial
begin

//
// Generate stimulus after waiting for reset
//


initial
begin
$monitor("output = %b", output);
end

initial
begin

repeat (6) @(posedge Clock); input = 1'b0;   // 00
repeat (6) @(posedge Clock); input = 1'b1;   // 11
repeat (6) @(posedge Clock); input = 1'b1;   // 00
repeat (6) @(posedge Clock); input = 1'b1;   // 10
repeat (6) @(posedge Clock); input = 1'b0;   // 01
repeat (6) @(posedge Clock); input = 1'b1;   // 01
repeat (6) @(posedge Clock); input = 1'b0;   // 11
repeat (6) @(posedge Clock); input = 1'b0;   // 10
repeat (6) @(posedge Clock); input = 1'b0;   // 00

$stop;
end


endmodule



$stop;
end


endmodule


