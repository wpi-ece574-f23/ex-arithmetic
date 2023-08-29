`timescale 1ns/1ps

module addertb;

   reg clk, reset;

   always #5 clk = ~clk;

   initial begin
      clk = 0;
      #5;
      reset = 1;
      #12;
      reset = 0;
   end

   logic [7:0] a, b;
   logic [7:0] sum;
   adder DUT (
	      .a_in(a),
	      .b_in(b),
	      .sum(sum)
	      );

   int 		cycles, delta, n;
   initial cycles = 0;
   always @(posedge clk)
     cycles = cycles + 1;
   
   initial begin
      a = 8'b0;
      b = 8'b0;
      
      $dumpfile("trace.vcd");
      $dumpvars(0, addertb);
      
      @(negedge reset);

      for (n = 0; n < 1024; n = n + 1) begin
         a = $random;
         b = $random;
	 
	 @(posedge clk);	   
	 $display("a %x b %x m %x OK? %d", a, b, sum, (a + b) == sum);
      end

      $finish;
   end

endmodule
