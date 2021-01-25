module vencoder (clock, reset, in, out);
input logic clock, in, reset;
output logic out;

logic a,b,c;

logic q;

wire qb;

always_ff @(posedge clock or posedge reset)
        if(reset)
                q<='0;
        else
                q<=qb;

assign qb =~q;

always_ff @(posedge q or posedge reset)
begin
        if (reset)
        begin
                a<='0;
                b<='0;
                c<='0;
        end
        else
        begin
                a<=in;
                b<=a;
                c<=b;
        end
end


assign out = ((a^b) & qb)|((a^b^c)&q);

endmodule
