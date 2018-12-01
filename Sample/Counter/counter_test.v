module test;
  reg rst, clk;
  wire [3:0]  out;
  counter count (clk, rst, out);
  always begin
    clk <= 1;
    #1;
    clk <=0;
    #1;
  end

  initial begin
    $monitor("out=", out);
    $dumpfile("counter.vcd");
    $dumpvars(0, test);
    rst = 0;
    #10;
    rst = 1;
    #5;
    rst = 0;
    #10;
    $finish;
  end
endmodule

