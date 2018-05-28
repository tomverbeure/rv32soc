
module icicle_wrapper(
    input             clk,
    input             resetn,

    output reg        mem_valid,
    output reg        mem_instr,
    input             mem_ready,

    output reg [31:0] mem_addr,
    output reg [31:0] mem_wdata,
    output reg [ 3:0] mem_wstrb,
    input      [31:0] mem_rdata, 

    input      [31:0] irq
    );

    wire [31:0]     instr_address;
    wire            instr_read;
    reg  [31:0]     instr_read_value;
    reg             instr_ready;

    wire [31:0]     data_address;
    wire            data_read;
    wire            data_write;
    reg  [31:0]     data_read_value;
    wire [3:0]      data_write_mask;
    wire [31:0]     data_write_value;
    reg             data_ready;

    wire [63:0]     cycle;

    rv32 rv32 (
        .clk(clk),
        .reset_(resetn),

        /* instruction memory bus */
        .instr_address_out(instr_address),
        .instr_read_out(instr_read),
        .instr_read_value_in(instr_read_value),
        .instr_ready_in(instr_ready),

        /* data memory bus */
        .data_address_out(data_address),
        .data_read_out(data_read),
        .data_write_out(data_write),
        .data_read_value_in(data_read_value),
        .data_write_mask_out(data_write_mask),
        .data_write_value_out(data_write_value),
        .data_ready_in(data_ready),

        .cycle_out(cycle)
    );

    always @* begin
        if (data_read | data_write) begin
            mem_valid       = 1'b1;
            mem_instr       = 1'b0;

            mem_addr        = data_address;
            mem_wstrb       = {4{data_write}} & data_write_mask;
            mem_wdata       = data_write_value;

            data_ready      = mem_ready;
            instr_ready     = 1'b0;
        end
        else begin
            mem_valid       = instr_read;
            mem_instr       = 1'b1;

            mem_addr        = instr_address;
            mem_wstrb       = 4'd0;
            mem_wdata       = 32'd0;

            instr_ready     = mem_ready;
            data_ready      = 1'b0;
        end

        instr_read_value    = mem_rdata;
        data_read_value     = mem_rdata;
    end

endmodule

