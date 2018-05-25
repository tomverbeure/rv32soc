
module vexriscv_wrapper(
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

    wire        iBus_cmd_valid;
    reg         iBus_cmd_ready;
    wire [31:0] iBus_cmd_payload_pc;
    reg         iBus_rsp_ready;
    wire        iBus_rsp_error;
    wire [31:0] iBus_rsp_inst;
    wire        dBus_cmd_valid;
    reg         dBus_cmd_ready;
    wire        dBus_cmd_payload_wr;
    wire [31:0] dBus_cmd_payload_address;
    wire [31:0] dBus_cmd_payload_data;
    wire [1:0]  dBus_cmd_payload_size;
    reg         dBus_rsp_ready;
    wire        dBus_rsp_error;
    wire [31:0] dBus_rsp_data;

    VexRiscv u_vexriscv(
        .clk(clk),
        .reset(!resetn),

        .iBus_cmd_valid(iBus_cmd_valid),
        .iBus_cmd_ready(iBus_cmd_ready),
        .iBus_cmd_payload_pc(iBus_cmd_payload_pc),

        .iBus_rsp_ready(iBus_rsp_ready),
        .iBus_rsp_error(iBus_rsp_error),
        .iBus_rsp_inst(iBus_rsp_inst),

        .dBus_cmd_valid(dBus_cmd_valid),
        .dBus_cmd_ready(dBus_cmd_ready),
        .dBus_cmd_payload_wr(dBus_cmd_payload_wr),
        .dBus_cmd_payload_address(dBus_cmd_payload_address),
        .dBus_cmd_payload_data(dBus_cmd_payload_data),
        .dBus_cmd_payload_size(dBus_cmd_payload_size),

        .dBus_rsp_ready(dBus_rsp_ready),
        .dBus_rsp_error(dBus_rsp_error),
        .dBus_rsp_data(dBus_rsp_data)
    );

    reg dBus_cmd_ready_p1;
    reg iBus_cmd_ready_p1;

    always @(posedge clk) begin
        dBus_cmd_ready_p1  <= dBus_cmd_ready & !dBus_cmd_payload_wr;
        dBus_rsp_ready     <= dBus_cmd_ready_p1;

        iBus_cmd_ready_p1  <= iBus_cmd_ready;
        iBus_rsp_ready     <= iBus_cmd_ready_p1;

        if (!resetn) begin
            dBus_cmd_ready_p1  <= 1'b0;
            dBus_rsp_ready     <= 1'b0;

            iBus_cmd_ready_p1  <= 1'b0;
            iBus_rsp_ready     <= 1'b0;
        end
    end

    assign iBus_rsp_inst    = mem_rdata;
    assign dBus_rsp_data    = mem_rdata;

    assign iBus_rsp_error   = 1'b0;
    assign dBus_rsp_error   = 1'b0;

    always @* begin
        dBus_cmd_ready  = 1'b0;
        iBus_cmd_ready  = 1'b0;

        if (dBus_cmd_valid) begin
            mem_valid       = 1'b1;
            mem_instr       = 1'b0;

            mem_addr        = { dBus_cmd_payload_address[31:2], 2'b00 };
            mem_wstrb       = !dBus_cmd_payload_wr          ? 4'd0  :
                              dBus_cmd_payload_size == 2'd0 ? (4'b0001 << dBus_cmd_payload_address[1:0]) :
                              dBus_cmd_payload_size == 2'd1 ? (4'b0011 << (dBus_cmd_payload_address[1]<<1)) :
                              dBus_cmd_payload_size == 2'd2 ?  4'b1111 :
                                                               4'b1111 ;
            mem_wdata       = dBus_cmd_payload_data;

            dBus_cmd_ready  = 1'b1;
        end
        else begin
            mem_valid       = iBus_cmd_valid;
            mem_instr       = 1'b1;

            mem_addr        = { iBus_cmd_payload_pc[31:2], 2'b00 };
            mem_wstrb       = 4'd0;
            mem_wdata       = 32'd0;

            iBus_cmd_ready  = iBus_cmd_valid;
        end
    end

endmodule

