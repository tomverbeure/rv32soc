
`timescale 1ns/100ps

module tb();

    reg clk;

    initial clk = 0;

    always @*
        clk <= #5 !clk;

    initial begin
        $display("Start of simultion.");
		$dumpfile("waves.vcd");
		$dumpvars(0);
	
        repeat (10000) @(posedge clk);
        $display("Simulation finished.");
        $finish;
    end

    wire led1, led2, i2c_sda, i2c_scl;

    top u_top(
        .clk(clk),
        .led1(led1),
        .led2(led2),
        .i2c_scl(i2c_scl),
        .i2c_sda(i2c_sda)
    );

endmodule

