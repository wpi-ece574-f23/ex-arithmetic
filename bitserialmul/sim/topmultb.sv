module topmultb;
    reg clk, rst;
    reg [7:0] a, b;
    wire [15:0] q;

    topmul dut(.a(a), .b(b), .q(q), .clk(clk), .rst(rst));

    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end

    initial begin
        $dumpfile("trace.vcd");
        $dumpvars(0, topmultb);

        rst = 1'b1;
        repeat (3) @(posedge clk);

        a = 8'd129;
        b = 8'd56;

        rst = 1'b0;

        repeat (100) begin
            $display("%d", q);
            @(posedge clk);
        end

        $finish;
    end
endmodule
