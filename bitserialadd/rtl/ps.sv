module ps (
    input logic [7:0] a,
    input logic sync,
    input logic clk,
    output logic as
);

    logic [7:0] ra;

    always_ff @(posedge clk)
        if (sync)
            ra <= a;
        else
            ra <= {1'b0, ra[7:1]};

    assign as = ra[0];

endmodule
