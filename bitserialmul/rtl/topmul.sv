module topmul (
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [15:0] q,
    input wire clk,
    input wire rst
);

    reg [15:0] ctl;

    wire ctl0, ctl1, ctl2, ctl3;

    always_ff @(posedge clk)
        if (rst)
            ctl <= 16'b1;
        else
            ctl <= {ctl[14:0], ctl[15]};

    assign ctl0 = ctl[0];
    assign ctl1 = ctl[1];
    assign ctl2 = ctl[2];
    assign ctl3 = ctl[3];

    wire as, qs;
    ps ps1(.a({8'b0, a}), .sync(ctl0), .clk(clk), .as(as));

    wire [7:0] sum;
    assign sum[7] = 1'b0;

    serialmuladd M7(.a(as), .b(b[7]), .clk(clk), .sync(ctl1), .si(sum[7]), .so(sum[6]));
    serialmuladd M6(.a(as), .b(b[6]), .clk(clk), .sync(ctl1), .si(sum[6]), .so(sum[5]));
    serialmuladd M5(.a(as), .b(b[5]), .clk(clk), .sync(ctl1), .si(sum[5]), .so(sum[4]));
    serialmuladd M4(.a(as), .b(b[4]), .clk(clk), .sync(ctl1), .si(sum[4]), .so(sum[3]));
    serialmuladd M3(.a(as), .b(b[3]), .clk(clk), .sync(ctl1), .si(sum[3]), .so(sum[2]));
    serialmuladd M2(.a(as), .b(b[2]), .clk(clk), .sync(ctl1), .si(sum[2]), .so(sum[1]));
    serialmuladd M1(.a(as), .b(b[1]), .clk(clk), .sync(ctl1), .si(sum[1]), .so(sum[0]));
    serialmuladd M0(.a(as), .b(b[0]), .clk(clk), .sync(ctl1), .si(sum[0]), .so(qs));

    sp sp1(.as(qs), .sync(ctl2), .clk(clk), .a(q));

endmodule
