
module pll(
    input  wire osc_clk,
    output wire clk
    );

`ifdef 0
    wire locked;

SB_PLL40_PAD #(
        .FEEDBACK_PATH("SIMPLE"),
        .DIVR(4'b0100),     // DIVR =  4
        .DIVF(7'b0111111),  // DIVF = 31
        .DIVQ(3'b101),      // DIVQ =  5
        .FILTER_RANGE(3'b010)   // FILTER_RANGE = 2
    ) u_sb_pll40_pad (
        .LOCK(locked),
        .RESETB(1'b1),
        .BYPASS(1'b0),
        .PACKAGEPIN(osc_clk),
//        .PLLOUTGLOBAL(clk)
        .PLLOUTCORE(clk)
        );

`endif

    reg [1:0] cntr;

    always @(posedge osc_clk)
        cntr <= cntr + 1;

    assign clk = cntr[1];

endmodule
