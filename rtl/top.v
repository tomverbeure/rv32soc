
`include "top_defines.vh"

`default_nettype none

module top(
    input clk,

    inout [7:0] gpio
    );

    wire reset_;

    reset_gen u_reset_gen( .clk(clk), .reset_(reset_) );

    wire [7:0] gpio_oe;
    wire [7:0] gpio_do;
    wire [7:0] gpio_di;

    soc #(.NR_GPIOS(8)) u_soc(
        .clk(clk),
        .reset_(reset_),

       .gpio_oe(gpio_oe),
       .gpio_do(gpio_do),
       .gpio_di(gpio_di)
    );

    pad_inout u_gpio[7:0] (.pad(gpio), .pad_ena(gpio_oe), .to_pad(gpio_do), .from_pad(gpio_di));

endmodule
