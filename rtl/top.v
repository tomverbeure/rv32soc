
`include "top_defines.vh"

`default_nettype none

module top(
    input osc_clk,

    output led1,
    output led2,
    output led3,

    inout  i2c_sda,
    inout  i2c_scl
    );

    wire clk;
    wire reset_;

    pll u_pll(.osc_clk(osc_clk), .clk(clk) );
    reset_gen u_reset_gen( .clk(clk), .reset_(reset_) );

    wire [7:0] gpio_oe;
    wire [7:0] gpio_do;
    wire [7:0] gpio_di;

    wire mem_valid;

    soc #(.NR_GPIOS(8)) u_soc(
        .clk(clk),
        .reset_(reset_),

        .gpio_oe(gpio_oe),
        .gpio_do(gpio_do),
        .gpio_di(gpio_di)
    );

    // pad_inout u_gpio[7:0] (.pad(gpio), .pad_ena(gpio_oe), .to_pad(gpio_do), .from_pad(gpio_di));

    assign gpio_di[1:0] = 0;
    assign gpio_di[7:4] = 0;

    pad_out u_led1 (.pad(led1), .to_pad(gpio_do[0]) );
    pad_out u_led2 (.pad(led2), .to_pad(gpio_do[1]) );

    wire i2c_scl_oe, i2c_sda_oe;
    assign i2c_scl_oe = gpio_oe[2] && !gpio_do[2];
    assign i2c_sda_oe = gpio_oe[3] && !gpio_do[3];

    pad_inout u_i2c_scl (.pad(i2c_scl), .pad_ena(i2c_scl_oe), .to_pad(1'b0), .from_pad(gpio_di[2]));
    pad_inout u_i2c_sda (.pad(i2c_sda), .pad_ena(i2c_sda_oe), .to_pad(1'b0), .from_pad(gpio_di[3]));

    reg [24:0] clk_cntr;
    initial clk_cntr = 0;
    always @(posedge clk) begin
        clk_cntr <= clk_cntr + 1;
    end
    pad_out u_led3 (.pad(led3), .to_pad(clk_cntr[23]) );

`ifdef LED4
    reg [24:0] osc_cntr;
    always @(posedge osc_clk) begin
        osc_cntr <= osc_cntr + 1;
    end
    pad_out u_led4 (.pad(led4), .to_pad(osc_cntr[23]) );
`endif


endmodule
