module topaddtb;
    reg clk, rst;
    reg [7:0] a, b, c, d;
    wire [7:0] q;

    topadd dut(.a(a), .b(b), .c(c), .d(d), .q(q), .clk(clk), .rst(rst));

    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end

    initial begin
        $dumpfile("trace.vcd");
        $dumpvars(0, topaddtb);

        rst = 1'b1;
        repeat (3) @(posedge clk);

        a = 8'd1;
        b = 8'd2;
        c = 8'd3;
        d = 8'd4;

        rst = 1'b0;

        repeat (50) begin
            $display("%d", q);
            @(posedge clk);
        end

        $finish;
    end
endmodule
