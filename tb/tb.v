
`timescale 1ns/100ps

module tb();

    reg clk;
    wire [7:0] gpio;

    initial clk = 0;

    always @*
        clk <= #5 !clk;


    initial begin
        $display("Start of simultion.");
		$dumpfile("waves.vcd");
		$dumpvars(0);
	
        repeat (1000) @(posedge clk);
        $display("Simulation finished.");
        $finish;
    end

    top u_top(
        .clk(clk),
        .gpio(gpio)
    );

endmodule

