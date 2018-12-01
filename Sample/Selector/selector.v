/*
module sel (ina, inb, sel, out);
assign out = (sel & ina) | (~sel & inb);
endmodule
*/

module sel(ina, inb, sel, out);
  input ina, inb, sel;
  output out;
  reg out;

  always@(ina or inb or sel)
  begin
    if(sel) out = inb;
    else out = ina;
  end
endmodule


module test;
 reg a, b, s;
  sel sel1(a, b, s, o);
  initial begin
    $monitor("a = ", a, ", b = ", b, ", s = ", s, ", o = ", o);
  a = 1;
  b = 0;
  s = 1;

$dumpfile("sel vcd");
$dumpvars(0, test);

  #10
  s = 0;
  #10
  $finish;

  end
endmodule

