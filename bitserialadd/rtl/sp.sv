module sp (
    input logic as,
    input logic sync,
    input logic clk,
    output logic [7:0] a
);

    logic [7:0] ra;

    always_ff @(posedge clk)
        ra <= {as, ra[7:1]};

    assign a = sync ? ra : 8'b0;

endmodule
