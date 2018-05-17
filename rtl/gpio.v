
`include "top_defines.vh"

`default_nettype none

module gpio
    #(
        parameter NR_GPIOS  = 8
    ) (
        input               clk,
        input               reset_,

        input               mem_sel,
        input               mem_valid,
        output reg          mem_ready,
        input               mem_wr,
        input      [11:0]   mem_addr,
        input      [31:0]   mem_wdata,
        output reg [31:0]   mem_rdata,

        output reg [NR_GPIOS-1:0]   gpio_oe,
        output reg [NR_GPIOS-1:0]   gpio_do,
        input      [NR_GPIOS-1:0]   gpio_di
    );

    always @(posedge clk) begin
        if (mem_valid && !mem_ready) begin
            case({mem_addr[5:2],2'd0})
                `GPIO_CONFIG_ADDR:   gpio_oe     <= mem_wdata[NR_GPIOS-1:0];
                `GPIO_DOUT_ADDR:     gpio_do     <= mem_wdata[NR_GPIOS-1:0];
                `GPIO_DOUT_SET_ADDR: gpio_do     <= gpio_do |  mem_wdata[NR_GPIOS-1:0];
                `GPIO_DOUT_CLR_ADDR: gpio_do     <= gpio_do & ~mem_wdata[NR_GPIOS-1:0];
            endcase
        end

        mem_ready <= mem_valid;
    end

    always @(*) begin
        mem_rdata = 32'd0;

        if (mem_valid) begin
            case({mem_addr[5:2],2'd0})
                `GPIO_CONFIG_ADDR: mem_rdata = gpio_oe;
                `GPIO_DOUT_ADDR:   mem_rdata = gpio_do;
                `GPIO_DIN_ADDR:    mem_rdata = gpio_di;
            endcase
        end
    end

endmodule
