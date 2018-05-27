
module picorv32_wrapper(
    input             clk,
    input             reset_,

    output reg        mem_cmd_valid,
    input             mem_cmd_ready,
    output reg        mem_cmd_instr,
    output reg        mem_cmd_wr,
    output reg [31:0] mem_cmd_addr,
    output reg [31:0] mem_cmd_wdata,
    output reg [ 3:0] mem_cmd_be,

    input             mem_rsp_ready,
    input      [31:0] mem_rsp_rdata, 

    input      [31:0] irq
    );

    parameter [31:0] PROGADDR_RESET             = 32'h 0000_0000;
    parameter [31:0] PROGADDR_IRQ               = 32'h 0000_0010;
    parameter integer BARREL_SHIFTER            = 1;
    parameter integer COMPRESSED_ISA            = 0;
    parameter integer ENABLE_MUL                = 1;
    parameter integer ENABLE_FAST_MUL           = 1;
    parameter integer ENABLE_DIV                = 1;
    parameter integer ENABLE_IRQ                = 0;
    parameter integer ENABLE_IRQ_QREGS          = 0;
    parameter integer ENABLE_IRQ_TIMER          = 0;
    parameter integer ENABLE_COUNTERS           = 0;
    parameter integer ENABLE_COUNTERS64         = 0;
    parameter integer TWO_STAGE_SHIFT           = 0;
    parameter integer CATCH_MISALIGN            = 0;
    parameter integer CATCH_ILLINSN             = 0;

    wire        pico_mem_valid;
    reg         pico_mem_instr;
    reg         pico_mem_ready;
    wire [31:0] pico_mem_addr;
    wire [3:0]  pico_mem_wstrb;
    wire [31:0] pico_mem_wdata;
    wire [31:0] pico_mem_rdata;

    picorv32 #(
        .PROGADDR_RESET(PROGADDR_RESET),
        .PROGADDR_IRQ(PROGADDR_IRQ),
        .COMPRESSED_ISA(COMPRESSED_ISA),
        .ENABLE_MUL(ENABLE_MUL),
        .ENABLE_FAST_MUL(ENABLE_FAST_MUL),
        .ENABLE_DIV(ENABLE_DIV),
        .ENABLE_IRQ(ENABLE_IRQ),
        .ENABLE_IRQ_QREGS(ENABLE_IRQ_QREGS),
        .ENABLE_COUNTERS(ENABLE_COUNTERS),
        .ENABLE_COUNTERS64(ENABLE_COUNTERS64),
        .BARREL_SHIFTER(BARREL_SHIFTER),
        .TWO_STAGE_SHIFT(TWO_STAGE_SHIFT),
        .CATCH_MISALIGN(CATCH_MISALIGN),
        .CATCH_ILLINSN(CATCH_ILLINSN),
        .ENABLE_IRQ_TIMER(ENABLE_IRQ_TIMER)
    ) 
    u_picorv32 (
        .clk(clk),
        .resetn(reset_),

        .mem_valid(pico_mem_valid),
        .mem_instr(pico_mem_instr),
        .mem_ready(pico_mem_ready),
        .mem_addr (pico_mem_addr),
        .mem_wdata(pico_mem_wdata),
        .mem_wstrb(pico_mem_wstrb),
        .mem_rdata(pico_mem_rdata),

        .irq(irq)
    );

    wire pico_mem_wr;
    assign pico_mem_wr = |pico_mem_wstrb;

    assign mem_cmd_instr = pico_mem_instr;
    assign mem_cmd_wr    = pico_mem_wr;
    assign mem_cmd_be    = pico_mem_wstrb;
    assign mem_cmd_addr  = pico_mem_addr;
    assign mem_cmd_wdata = pico_mem_wdata;

    assign pico_mem_rdata   = mem_rsp_rdata;

    reg mem_rd_ongoing, mem_rd_ongoing_nxt;
    reg mem_wr_ongoing, mem_wr_ongoing_nxt;

    always @(*) begin
        mem_cmd_valid       = 1'b0;
        mem_wr_ongoing_nxt  = mem_wr_ongoing;
        mem_rd_ongoing_nxt  = mem_rd_ongoing;
        pico_mem_ready      = 1'b0;

        if (!mem_rd_ongoing && !mem_wr_ongoing) begin
            mem_cmd_valid       = pico_mem_valid;
            mem_rd_ongoing_nxt  = pico_mem_valid && !pico_mem_wr;
            mem_wr_ongoing_nxt  = pico_mem_valid &&  pico_mem_wr && !mem_cmd_ready;

            pico_mem_ready      = mem_cmd_ready && pico_mem_wr;
        end
        else if (mem_wr_ongoing) begin
            if (mem_cmd_ready) begin
                pico_mem_ready      = 1'b1;
                mem_wr_ongoing_nxt  = 1'b0;
            end
        end
        else if (mem_rd_ongoing) begin
            if (mem_rsp_ready) begin
                pico_mem_ready      = 1'b1;
                mem_rd_ongoing_nxt  = 1'b0;
            end
        end
    end

    always @(posedge clk) begin
        mem_rd_ongoing  <= mem_rd_ongoing_nxt;
        mem_wr_ongoing  <= mem_wr_ongoing_nxt;

        if (!reset_) begin
            mem_rd_ongoing  <= 1'b0;
            mem_wr_ongoing  <= 1'b0;
        end
    end

endmodule

