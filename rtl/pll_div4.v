
module pll(
    input  wire osc_clk,
    output wire clk
    );

    reg [1:0] cntr;

    always @(posedge osc_clk)
        cntr <= cntr + 1;

    assign clk = cntr[1];

endmodule
