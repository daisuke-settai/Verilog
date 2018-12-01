module sm(a, b, state, clk, rst);
input a, b;
output [1:0] state;
inout clk, rst;
reg [1:0] state, nextstate;

always @(posedge clk) begin
  state = nextstate;
end

always @(a or b) begin
  nextstate = state;
  if(({a,b} == 2’b00) || ({a,b} == 2’b11) 
    begin 
      nextstate = state;
    end
  else
    begin case(state)
      2’b00: if(a) nextstate = 2’b01; 
      2’b01: begin
              if(a) nextstate = 2’b11;
              if(b) nextstate = 2’b00; 
             end
      2’b11: if(b) nextstte = 2’01; 
    end
end

always @(rst) begin
  state = 2'b00;
  nextstate = 2'b00;
end

endmodule

module test;
reg a, b, clk, rst;
wire [1:0] state;
sm sm1(a,b, state, clk, rst);

always beg
