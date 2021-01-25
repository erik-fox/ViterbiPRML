module top();
bit clock=1;
bit fail = 0;
bit in, reset;
wire out;

bit inputstream[] = '{1,0,1,1,0,0};  
bit p0[]          = '{1,1,0,0,0,1};
bit p1[]          = '{1,1,1,0,1,0};

vencoder v(clock, reset, in, out);

initial
forever #50 clock = ~clock;

initial
begin
@(negedge clock);
reset = 1;
@(negedge clock);
reset = 0;

foreach (inputstream[i])
begin
in = inputstream[i];
@(negedge clock);
if (out !== p0[i])
  begin
  $display("*** Error:  @ %t expected p0 = %b, observed %b ***",$time,p0[i],out);
  fail = 1;
  end
@(negedge clock);
if (out !== p1[i])
  begin
  $display("*** Error:  @ %t expected p1 = %b, observed %b ***",$time,p1[i],out);
  fail = 1;
  end
end

if (fail)
  $display("\n\n\n*** FAILED ***\n\n\n");
else
  $display("\n\n\n*** PASSSED ***\n\n\n");
  
$finish();
end
endmodule
