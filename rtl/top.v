
`include "top_defines.vh"

`default_nettype none

module top(
    input clk,

    inout [7:0] gpio
    );

    wire reset_;
    reg [2:0] reset_vec_;
    initial reset_vec_ = 0;
    always @(posedge clk) begin
        reset_vec_  <= { reset_vec_[1:0], 1'b1 };
    end
    assign reset_ = reset_vec_[2];

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
