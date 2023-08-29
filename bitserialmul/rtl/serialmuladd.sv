module serialmuladd (
    input wire a,    // a operand
    input wire b,    // b operand
    input wire clk,
    input wire sync,
    input wire si,   // sum in
    output wire so   // sum out
);

    reg carry;
    reg sum;

    wire m;
    assign m = a & b;

    always_ff @(posedge clk)
        if (sync)
            begin
                sum <= m ^ si;
                carry <= m & si;
            end
        else
            begin
                sum <= m ^ si ^ carry;
                carry <= (m & si) | (si & carry) | (carry & m);
            end

    assign so = sum;

endmodule
