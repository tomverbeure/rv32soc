
`include "top_defines.vh"

`default_nettype none

module top(
    input clk,

    output led1,
    output led2,

    inout  i2c_sda,
    inout  i2c_scl
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

    // pad_inout u_gpio[7:0] (.pad(gpio), .pad_ena(gpio_oe), .to_pad(gpio_do), .from_pad(gpio_di));

    assign gpio_di[1:0] = 0;
    assign gpio_di[4:7] = 0;

    pad_out u_led1 (.pad(led1), .to_pad(gpio_do[0]) );
    pad_out u_led2 (.pad(led2), .to_pad(gpio_do[1]) );

    wire i2c_scl_oe, i2c_sda_oe;
    assign i2c_scl_oe = gpio_oe[2] && !gpio_do[2];
    assign i2c_sda_oe = gpio_oe[3] && !gpio_do[3];

    pad_inout u_i2c_scl (.pad(i2c_scl), .pad_ena(i2c_scl_oe), .to_pad(1'b0), .from_pad(gpio_di[2]));
    pad_inout u_i2c_sda (.pad(i2c_sda), .pad_ena(i2c_sda_oe), .to_pad(1'b0), .from_pad(gpio_di[3]));

endmodule
