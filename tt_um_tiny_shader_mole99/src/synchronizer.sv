// SPDX-FileCopyrightText: © 2022 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module synchronizer #(
    parameter int FF_COUNT = 3
) (
    input  logic clk,
    input  logic reset_n,
    input  logic in,
    output logic out
);

    reg [FF_COUNT-1:0] pipe;

    always_ff @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            pipe <= '0;
        end else begin
            pipe <= {pipe[FF_COUNT-2:0], in};
        end
    end
    
    assign out = pipe[FF_COUNT-1];

endmodule
