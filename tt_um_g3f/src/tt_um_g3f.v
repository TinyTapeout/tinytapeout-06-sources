/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_g3f (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.

    g3f c1 (.SE(uio_in[7]), .Qa(uio_out[5]), .Qb(uio_out[4]), .Qc(uio_out[3]), .P0(uio_out[2]), .P1(uio_out[1]), .P2(uio_out[0]));

    assign uio_oe = 8'b 00111111;
    assign uio_out[7:6] = 2'b00;
    assign uo_out[7:0] = 8'b00000000;
endmodule
