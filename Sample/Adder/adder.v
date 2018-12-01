module adder(in0, in1, out);
  input in0, in1;
  output out;
  assign out = in0 + in1;
endmodule

module test;
  reg a, b;
  adder add(a, b, o);
  initial begin
    $monitor("a = ", a, ", b = ", b,", o = ", o);
    a = 0;
    b = 0;

    $dumpfile("adder.vcd");
    $dumpvars(0, test);

    #10
    a = 1;
    b = 0;
    #10
    a = 0;
    b = 1;
    #10
    a = 1;
    b = 1;
    #10
    $finish;
  end
endmodule

