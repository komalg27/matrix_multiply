module m_tb();
reg clk, reset,execute;
reg [2:0]sel_in;
reg [7:0]input_val;
reg [1:0]sel_out;
wire [16:0]result;

new F (.sel_in(sel_in),.input_val(input_val),.clk(clk),.reset(reset),.execute(execute),.result(result),.sel_out(sel_out));
initial reset=1'b1;
initial #1 reset = 1'b0;
always #2 reset= 1'b1;
initial execute=1'b0;
always #56 execute = 1'b1;
initial clk=1'b0;
always #3 clk=~clk;

initial
begin

#7 sel_in=3'b000;input_val=8'b00000001;
#6 sel_in=3'b001; input_val=8'b00000010;
#6 sel_in=3'b010; input_val=8'b00000000;
#6 sel_in=3'b011; input_val=8'b00000011;
#6 sel_in=3'b100; input_val=8'b00000011;
#6 sel_in=3'b101; input_val=8'b00000001;
#6 sel_in=3'b110; input_val=8'b00000010;
#6 sel_in=3'b111; input_val=8'b00000001;

end
 
initial
begin

#55 sel_out=2'b00;
#7 sel_out=2'b01;
#7 sel_out=2'b10;
#7 sel_out=2'b11;
#17 $finish;
end

endmodule
