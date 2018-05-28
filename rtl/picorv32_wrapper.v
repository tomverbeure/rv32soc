`include "soc_picorv32_settings.v"

module picorv32_wrapper(
    input             clk,
    input             reset_,

    output reg        mem_cmd_valid,
    input             mem_cmd_ready,
    output            mem_cmd_instr,
    output            mem_cmd_wr,
    output     [31:0] mem_cmd_addr,
    output     [31:0] mem_cmd_wdata,
    output     [ 3:0] mem_cmd_be,

    input             mem_rsp_ready,
    input      [31:0] mem_rsp_rdata, 

    input      [31:0] irq
    );

    parameter [31:0] PROGADDR_RESET             = 32'h 0000_0000;
    parameter [31:0] PROGADDR_IRQ               = 32'h 0000_0010;
    parameter integer BARREL_SHIFTER            = `BARREL_SHIFTER;
    parameter integer COMPRESSED_ISA            = `COMPRESSED_ISA;
    parameter integer ENABLE_MUL                = `ENABLE_MUL;
    parameter integer ENABLE_FAST_MUL           = `ENABLE_FAST_MUL;
    parameter integer ENABLE_DIV                = `ENABLE_DIV;
    parameter integer ENABLE_IRQ                = `ENABLE_IRQ;
    parameter integer ENABLE_COUNTERS           = `ENABLE_COUNTERS;
    parameter integer ENABLE_COUNTERS64         = `ENABLE_COUNTERS64;
    parameter integer ENABLE_REGS_DUALPORT      = `ENABLE_REGS_DUALPORT;
    parameter integer CATCH_MISALIGN            = `CATCH_MISALIGN;
    parameter integer CATCH_ILLINSN             = `CATCH_ILLINSN;
    parameter integer ENABLE_IRQ_QREGS          = 0;
    parameter integer ENABLE_IRQ_TIMER          = 0;
    parameter integer TWO_STAGE_SHIFT           = 0;

    wire        pico_mem_valid;
    wire        pico_mem_instr;
    reg         pico_mem_ready;
    wire [31:0] pico_mem_addr;
    wire [3:0]  pico_mem_wstrb;
    wire [31:0] pico_mem_wdata;
    wire [31:0] pico_mem_rdata;

`ifndef SYNTHESIS
    initial begin
        $display("Pico settigns:");
        $display("BARREL_SHIFTER        = %1d", BARREL_SHIFTER);
        $display("COMPRESSED_ISA        = %1d", COMPRESSED_ISA);
        $display("ENABLE_MUL            = %1d", ENABLE_MUL);
        $display("ENABLE_FAST_MUL       = %1d", ENABLE_FAST_MUL);
        $display("ENABLE_DIV            = %1d", ENABLE_DIV);
        $display("ENABLE_IRQ            = %1d", ENABLE_IRQ);
        $display("ENABLE_COUNTERS       = %1d", ENABLE_COUNTERS);
        $display("ENABLE_COUNTERS64     = %1d", ENABLE_COUNTERS64);
        $display("ENABLE_REGS_DUALPORT  = %1d", ENABLE_REGS_DUALPORT);
        $display("CATCH_MISALIGN        = %1d", CATCH_MISALIGN);
        $display("CATCH_ILLINSN         = %1d", CATCH_ILLINSN);
        $display("ENABLE_IRQ_QREGS      = %1d", 0);
        $display("ENABLE_IRQ_TIMER      = %1d", 0);
        $display("TWO_STAGE_SHIFT       = %1d", 0);
    end
`endif

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
        .ENABLE_REGS_DUALPORT(ENABLE_REGS_DUALPORT),
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

