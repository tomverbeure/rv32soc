
`timescale 1ns/100ps
`default_nettype none

module soc
    #(
        parameter integer LOCAL_RAM_SIZE_KB = 8,
        parameter integer NR_GPIOS          = 8
    ) (
        input wire  clk,
        input wire  reset_,
    
        output [NR_GPIOS-1:0]   gpio_oe,
        output [NR_GPIOS-1:0]   gpio_do,
        input  [NR_GPIOS-1:0]   gpio_di
    );

    parameter [31:0] PROGADDR_RESET     = 32'h 0000_0000;
    parameter [31:0] PROGADDR_IRQ       = 32'h 0000_0010;
    parameter integer BARREL_SHIFTER    = 1;
    parameter integer COMPRESSED_ISA    = 1;
    parameter integer enaBLE_MUL        = 1;
    parameter integer enaBLE_FAST_MUL   = 1;
    parameter integer enaBLE_DIV        = 1;
    parameter integer enaBLE_IRQ        = 1;
    parameter integer enaBLE_IRQ_QREGS  = 0;

    wire        mem_cmd_valid;
    wire        mem_cmd_ready;
    wire        mem_cmd_instr;
    wire        mem_cmd_wr;
    wire [31:0] mem_cmd_addr;
    wire [31:0] mem_cmd_wdata;
    wire [3:0]  mem_cmd_be;
    wire        mem_rsp_ready;
    wire [31:0] mem_rsp_rdata;

    wire [31:0] irq;
    assign irq = 32'd0;

    reg mem_rsp_ready_local_ram;
    reg [31:0] mem_rsp_rdata_local_ram;

    wire mem_rsp_ready_gpio;
    wire [31:0] mem_rsp_rdata_gpio;

    reg mem_rsp_ready_void;


`ifdef USE_PICORV32
    picorv32_wrapper
`endif
`ifdef USE_ICICLE
    icicle_wrapper
`endif
`ifdef USE_VEXRISCV
    vexriscv_wrapper
`endif
    cpu (
        .clk            (clk),
        .reset_         (reset_),
        .mem_cmd_valid  (mem_cmd_valid),
        .mem_cmd_ready  (mem_cmd_ready),
        .mem_cmd_wr     (mem_cmd_wr),
        .mem_cmd_instr  (mem_cmd_instr),
        .mem_cmd_addr   (mem_cmd_addr),
        .mem_cmd_wdata  (mem_cmd_wdata),
        .mem_cmd_be     (mem_cmd_be),
        .mem_rsp_ready  (mem_rsp_ready),
        .mem_rsp_rdata  (mem_rsp_rdata),
        .irq            (irq        )
    );

`ifndef SYNTHESIS
    initial
        $timeformat(-9,2,"ns",15);

    always @(posedge clk) begin
        if (reset_ != 1'b0) begin
            if (   (mem_cmd_valid === 1'bx)
                || (mem_cmd_valid && mem_cmd_ready ===1'bx)
                || (mem_cmd_valid && mem_cmd_ready && 
                        (   mem_cmd_instr === 1'bx 
                         || mem_cmd_wr === 1'bx
                         || mem_cmd_be === 1'bx
                        ))
                || (mem_rsp_ready === 1'bx)
                || (mem_rsp_ready && (^mem_rsp_rdata === 1'bx))
                )
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

    wire mem_cmd_sel_local_ram, mem_cmd_sel_gpio, mem_cmd_sel_void;
    reg mem_cmd_sel_local_ram_reg, mem_cmd_sel_gpio_reg, mem_cmd_sel_void_reg;

    assign mem_cmd_sel_local_ram = mem_cmd_addr < (LOCAL_RAM_SIZE_KB * 1024);
    assign mem_cmd_sel_gpio      = mem_cmd_addr[31:12] == 20'hf0000;
    assign mem_cmd_sel_void     = !mem_cmd_sel_local_ram && !mem_cmd_sel_gpio; 

    always @(posedge clk) begin

        if (mem_cmd_valid) begin
            mem_cmd_sel_local_ram_reg <= mem_cmd_sel_local_ram;
            mem_cmd_sel_gpio_reg      <= mem_cmd_sel_gpio;
            mem_cmd_sel_void_reg      <= mem_cmd_sel_void;
        end

        if (!reset_) begin
            mem_cmd_sel_local_ram_reg <= 1'b0;
            mem_cmd_sel_gpio_reg      <= 1'b0;
            mem_cmd_sel_void_reg      <= 1'b0;
        end
    end

    // For now, we don't have any slaves that can stall a write
    assign mem_cmd_ready    = 1'b1;

    assign mem_rsp_rdata = mem_cmd_sel_local_ram_reg ? mem_rsp_rdata_local_ram   : 
                           mem_cmd_sel_gpio_reg      ? mem_rsp_rdata_gpio        : 
                                                       32'd0;

    assign mem_rsp_ready = mem_cmd_sel_local_ram_reg ? mem_rsp_ready_local_ram   :
                           mem_cmd_sel_gpio_reg      ? mem_rsp_ready_gpio        :
                                                       mem_rsp_ready_void;

    always @(posedge clk) begin
        mem_rsp_ready_void  <= mem_cmd_valid & !mem_cmd_wr && mem_cmd_sel_void;

        if (!reset_) begin
            mem_rsp_ready_void  <= 1'b0;
        end
    end

    //============================================================
    // LOCAL RAM
    //============================================================
  
    localparam local_ram_addr_bits = 11;
    wire [31:0] local_ram_rdata;

    reg mem_rsp_ready_local_ram_p1;

    always @(posedge clk) begin
        mem_rsp_ready_local_ram_p1 <= mem_cmd_valid & !mem_cmd_wr & mem_cmd_sel_local_ram;
        mem_rsp_ready_local_ram    <= mem_rsp_ready_local_ram_p1;

        mem_rsp_rdata_local_ram        <= local_ram_rdata;

        if (!reset_) begin
            mem_rsp_ready_local_ram     <= 1'b0;
            mem_rsp_ready_local_ram_p1  <= 1'b0;
        end
    end

    wire [3:0] local_ram_wr; 
    wire local_ram_rd;
    assign local_ram_wr = (mem_cmd_valid && mem_cmd_sel_local_ram &&  mem_cmd_wr) ? mem_cmd_be : 4'b0;
    assign local_ram_rd = (mem_cmd_valid && mem_cmd_sel_local_ram && !mem_cmd_wr);


	picosoc_mem #(.WORDS(LOCAL_RAM_SIZE_KB * 256)) memory (
		.clk(clk),
		.wr(local_ram_wr),
		.rd(local_ram_rd),
		.addr(mem_cmd_addr[local_ram_addr_bits-1:2]),
		.wdata(mem_cmd_wdata),
		.rdata(local_ram_rdata)
	);

    //============================================================
    // GPIO
    //============================================================


    gpio #(.NR_GPIOS(8)) u_gpio(
        .clk        (clk),
        .reset_     (reset_),

        .mem_cmd_sel    (mem_cmd_sel_gpio),
        .mem_cmd_valid  (mem_cmd_valid),
        .mem_cmd_wr     (mem_cmd_wr),
        .mem_cmd_addr   (mem_cmd_addr[11:0]),
        .mem_cmd_wdata  (mem_cmd_wdata),

        .mem_rsp_ready  (mem_rsp_ready_gpio),
        .mem_rsp_rdata  (mem_rsp_rdata_gpio),

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

//`ifdef XILIN
//module picosoc_mem #(
//	parameter integer WORDS = 256
//) (
//	input                           clk,
//	input      [3:0]                wr,
//    input                           rd,
//	input      [11:0]               addr,
//	input      [31:0]               wdata,
//	output     [31:0]               rdata
//);
//
//    rv32_program_ram_2048x8 u_ram0 (
//        .clka       (clk),
//        .ena        (1'b1),
//        .wea        (wr[0]),
//        .addra      (addr),
//        .dina       (wdata[7:0]),
//        .douta      (rdata[7:0])
//    );
//
//    rv32_program_ram_2048x8 u_ram1 (
//        .clka       (clk),
//        .ena        (1'b1),
//        .wea        (wr[1]),
//        .addra      (addr),
//        .dina       (wdata[15:8]),
//        .douta      (rdata[15:8])
//    );
//
//    rv32_program_ram_2048x8 u_ram2 (
//        .clka       (clk),
//        .ena        (1'b1),
//        .wea        (wr[2]),
//        .addra      (addr),
//        .dina       (wdata[23:16]),
//        .douta      (rdata[23:16])
//    );
//
//    rv32_program_ram_2048x8 u_ram3 (
//        .clka       (clk),
//        .ena        (1'b1),
//        .wea        (wr[3]),
//        .addra      (addr),
//        .dina       (wdata[31:24]),
//        .douta      (rdata[31:24])
//    );
//
//endmodule
//`elsif MEM32
//module picosoc_mem #(
//	parameter integer WORDS = 256
//) (
//	input                           clk,
//	input      [3:0]                wr,
//    input                           rd,
//	input      [11:0]               addr,
//	input      [31:0]               wdata,
//	output reg [31:0]               rdata
//);
//	reg [31:0] mem [0:WORDS-1];
//
//    initial begin
//        $readmemh("progmem.hex", mem);
//    end
//
//	always @(posedge clk) begin
//        if (rd)    rdata <= mem[addr];
//		if (wr[0]) mem[addr][ 7: 0] <= wdata[ 7: 0];
//		if (wr[1]) mem[addr][15: 8] <= wdata[15: 8];
//		if (wr[2]) mem[addr][23:16] <= wdata[23:16];
//		if (wr[3]) mem[addr][31:24] <= wdata[31:24];
//	end
//
//endmodule
//`else
module picosoc_mem #(
	parameter integer WORDS = 256
) (
	input                           clk,
	input      [3:0]                wr,
    input                           rd,
	input      [10:0]               addr,
	input      [31:0]               wdata,
	output reg [31:0]               rdata
);
	reg [7:0] mem0 [0:WORDS-1];
	reg [7:0] mem1 [0:WORDS-1];
	reg [7:0] mem2 [0:WORDS-1];
	reg [7:0] mem3 [0:WORDS-1];

    initial begin
        $readmemh("progmem0.hex", mem0);
        $readmemh("progmem1.hex", mem1);
        $readmemh("progmem2.hex", mem2);
        $readmemh("progmem3.hex", mem3);
    end

	always @(posedge clk) begin
        if (rd)    rdata <= { mem3[addr], mem2[addr], mem1[addr], mem0[addr] };
		if (wr[0]) mem0[addr] <= wdata[ 7: 0];
		if (wr[1]) mem1[addr] <= wdata[15: 8];
		if (wr[2]) mem2[addr] <= wdata[23:16];
		if (wr[3]) mem3[addr] <= wdata[31:24];
	end

endmodule
//`endif
