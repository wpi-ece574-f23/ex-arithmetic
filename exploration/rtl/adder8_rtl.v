module adder(
	input  [7:0] a_in,
	input  [7:0] b_in,
	output [7:0] sum
);

   assign sum = a_in + b_in;

endmodule
