module sp (
    input logic as,
    input logic sync,
    input logic clk,
    output logic [15:0] a
);

    logic [15:0] ra;

    always_ff @(posedge clk)
        ra <= {as, ra[15:1]};

    assign a = sync ? ra : 16'b0;

endmodule
