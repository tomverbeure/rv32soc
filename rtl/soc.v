
`timescale 1ns/100ps
`default_nettype none

module soc(
    input wire  clk,
    input wire  reset_,

    output [NR_GPIOS-1:0]   gpio_oe,
    output [NR_GPIOS-1:0]   gpio_do,
    input  [NR_GPIOS-1:0]   gpio_di
    );

    parameter integer LOCAL_RAM_SIZE_KB = 8;
    parameter integer NR_GPIOS          = 8;

    parameter [31:0] STACKADDR          = LOCAL_RAM_SIZE_KB * 1024;
    parameter [31:0] PROGADDR_RESET     = 32'h 0000_0000;
    parameter [31:0] PROGADDR_IRQ       = 32'h 0000_0010;
    parameter integer BARREL_SHIFTER    = 1;
    parameter integer COMPRESSED_ISA    = 1;
    parameter integer ENABLE_MUL        = 1;
    parameter integer ENABLE_FAST_MUL   = 0;
    parameter integer ENABLE_DIV        = 1;
    parameter integer ENABLE_IRQ        = 1;
    parameter integer ENABLE_IRQ_QREGS  = 0;

    wire mem_valid;
    wire mem_instr;
    wire mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0]  mem_wstrb;
    wire [31:0] mem_rdata;

    wire [31:0] irq;
    assign irq = 32'd0;

//    picorv32 #(
//        .STACKADDR(STACKADDR),
//        .PROGADDR_RESET(PROGADDR_RESET),
//        .PROGADDR_IRQ(PROGADDR_IRQ),
//        .BARREL_SHIFTER(BARREL_SHIFTER),
//        .COMPRESSED_ISA(COMPRESSED_ISA),
//        .ENABLE_MUL(ENABLE_MUL),
//        .ENABLE_FAST_MUL(ENABLE_FAST_MUL),
//        .ENABLE_DIV(ENABLE_DIV),
//        .ENABLE_IRQ(1),
//        .ENABLE_IRQ_QREGS(0)
//    ) 
    icicle_wrapper
    cpu (
        .clk         (clk        ),
        .resetn      (reset_     ),
        .mem_valid   (mem_valid  ),
        .mem_instr   (mem_instr  ),
        .mem_ready   (mem_ready  ),
        .mem_addr    (mem_addr   ),
        .mem_wdata   (mem_wdata  ),
        .mem_wstrb   (mem_wstrb  ),
        .mem_rdata   (mem_rdata  ),
        .irq         (irq        )
    );

`ifndef SYNTHESIS
    initial
        $timeformat(-9,2,"ns",15);

    always @(posedge clk) begin
        if (reset_ != 1'b0) begin
            if (mem_valid === 1'bx 
                || (mem_valid && mem_ready ===1'bx)
                || (mem_valid && mem_ready && (^mem_rdata === 1'bx)))
            begin
                $display("%t: %m has X on cpu bus. Aborting.", $time);
                $finish;
            end
        end
    end
`endif

    //============================================================
    // Address decoder and data multiplexer
    //============================================================

    wire mem_wr = |mem_wstrb;

    wire mem_sel_local_ram, mem_sel_gpio;

    assign mem_sel_local_ram = mem_addr < (LOCAL_RAM_SIZE_KB * 1024);
    assign mem_sel_gpio      = mem_addr[31:12] == 20'hf0000;

    assign mem_rdata = mem_sel_local_ram    ? mem_rdata_local_ram   : 
                       mem_sel_gpio         ? mem_rdata_gpio        : 
                                              32'd0;

    assign mem_ready = mem_sel_local_ram    ? mem_ready_local_ram   :
                       mem_sel_gpio         ? mem_ready_gpio        :
                                              mem_ready_void;

    reg mem_ready_void;
    always @(posedge clk) begin
        mem_ready_void  <= mem_valid & !mem_ready_void;

        if (!reset_) begin
            mem_ready_void  <= 1'b0;
        end
    end

    //============================================================
    // LOCAL RAM
    //============================================================

    reg mem_ready_local_ram;
    wire [31:0] mem_rdata_local_ram;

    always @(posedge clk) begin
        mem_ready_local_ram <= mem_valid & mem_sel_local_ram & !mem_ready_local_ram;

        if (!reset_) begin
            mem_ready_local_ram  <= 1'b0;
        end
    end

    wire [3:0] local_ram_wr; 
    wire local_ram_rd;
    assign local_ram_wr = (mem_valid && mem_sel_local_ram & !mem_ready_local_ram) ? mem_wstrb : 4'b0;
    assign local_ram_rd = (mem_valid && mem_sel_local_ram & !mem_ready_local_ram & !(|mem_wstrb));

    localparam local_ram_addr_bits = $clog2(LOCAL_RAM_SIZE_KB * 1024);

	picosoc_mem #(.WORDS(LOCAL_RAM_SIZE_KB * 256)) memory (
		.clk(clk),
		.wr(local_ram_wr),
		.rd(local_ram_rd),
		.addr(mem_addr[local_ram_addr_bits-1:2]),
		.wdata(mem_wdata),
		.rdata(mem_rdata_local_ram)
	);

    //============================================================
    // GPIO
    //============================================================

    wire mem_ready_gpio;
    wire [31:0] mem_rdata_gpio;

    gpio #(.NR_GPIOS(8)) u_gpio(
        .clk        (clk),
        .reset_     (reset_),

        .mem_sel  (mem_sel_gpio),
        .mem_valid(mem_valid),
        .mem_ready(mem_ready_gpio),
        .mem_wr   (mem_wr),
        .mem_addr (mem_addr[11:0]),
        .mem_wdata(mem_wdata),
        .mem_rdata(mem_rdata_gpio),

        .gpio_oe(gpio_oe),
        .gpio_do(gpio_do),
        .gpio_di(gpio_di)
    );


endmodule

module picosoc_regs (
	input clk, wen,
	input  [5:0] waddr,
	input  [5:0] raddr1,
	input  [5:0] raddr2,
	input  [31:0] wdata,
	output [31:0] rdata1,
	output [31:0] rdata2
);
	reg [31:0] regs [0:31];

	always @(posedge clk)
		if (wen) regs[waddr[4:0]] <= wdata;

	assign rdata1 = regs[raddr1[4:0]];
	assign rdata2 = regs[raddr2[4:0]];
endmodule

module picosoc_mem #(
	parameter integer WORDS = 256
) (
	input                           clk,
	input      [3:0]                wr,
    input                           rd,
	input      [$clog2(WORDS)-1:0]  addr,
	input      [31:0]               wdata,
	output reg [31:0]               rdata
);
	reg [31:0] mem [0:WORDS-1];

    initial begin
        $readmemh("progmem.hex", mem);
    end

	always @(posedge clk) begin
        if (rd)    rdata <= mem[addr];
		if (wr[0]) mem[addr][ 7: 0] <= wdata[ 7: 0];
		if (wr[1]) mem[addr][15: 8] <= wdata[15: 8];
		if (wr[2]) mem[addr][23:16] <= wdata[23:16];
		if (wr[3]) mem[addr][31:24] <= wdata[31:24];
	end

endmodule

