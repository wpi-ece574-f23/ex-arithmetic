module serialadd (
    input logic a,
    input logic b,
    output logic s,
    input logic sync,
    input logic clk
);

    logic carry, q;

    always_ff @(posedge clk)
        if (sync)
            begin
                carry <= a & b;
                q <= a ^ b;
            end
        else
            begin
                q <= a ^ b ^ carry;
                carry <= (a & b) | (b & carry) | (carry & a);
            end

    assign s = q;

endmodule
