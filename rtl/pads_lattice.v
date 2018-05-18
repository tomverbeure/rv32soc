
module pad_inout(
    inout   pad,
    input   pad_ena,
    input   to_pad,
    output  from_pad
    );

	SB_IO #(
		.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	) u_io_buf (
		.PACKAGE_PIN(pad),
		.OUTPUT_ENABLE(pad_ena),
		.D_OUT_0(to_pad),
		.D_IN_0(from_pad)
	);

endmodule

module pad_in(
    input   pad,
    output  from_pad
    );

	SB_IO #(
		.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	) u_io_buf (
		.PACKAGE_PIN(pad),
		.OUTPUT_ENABLE(1'b0),
		.D_OUT_0(1'b0),
		.D_IN_0(from_pad)
	);

endmodule

module pad_out(
    output  pad,
    input   to_pad
    );

	SB_IO #(
		.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	) u_io_buf (
		.PACKAGE_PIN(pad),
		.OUTPUT_ENABLE(1'b1),
		.D_OUT_0(to_pad),
		.D_IN_0()
	);


endmodule
