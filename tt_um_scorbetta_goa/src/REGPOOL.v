// Generated by  grogu  starting from JINJA templated  MODULE_TEMPLATE_NATIVE.v  file

`default_nettype none

`include "REGPOOL.vh"

// Native interface based design for large and distributed register files (used in conjunction with
// the SCI configuration ring)
module REGPOOL (
    // Clock and reset
    input wire CLK,
    input wire RSTN,
    // Register interface
    input wire WREQ,
    input wire [3:0] WADDR,
    input wire [7:0] WDATA,
    output wire WACK,
    input wire RREQ,
    input wire [3:0] RADDR,
    output wire [7:0] RDATA,
    output wire RVALID,
    // Register bundles
    output wire [7:0] HWIF_OUT_WEIGHT_0,
    output wire [7:0] HWIF_OUT_WEIGHT_1,
    output wire [7:0] HWIF_OUT_BIAS,
    output wire [7:0] HWIF_OUT_VALUE_IN,
    output wire [7:0] HWIF_OUT_CTRL,
    input wire [7:0] HWIF_IN_STATUS,
    input wire [7:0] HWIF_IN_RESULT,
    input wire [7:0] HWIF_IN_MULT_RESULT,
    input wire [7:0] HWIF_IN_ADD_RESULT,
    input wire [7:0] HWIF_IN_BIAS_ADD_RESULT
);

    reg rvalid;
    reg [7:0] rdata;
    reg wack;

    // Instantiate registers and declare their own signals. From a Software perspective, i.e. access
    // via the AXI4 Lite interface, Configuration registers are Write-only while Status and Delta
    // registers are Read-only

    // WEIGHT_0: Input weight 0
    reg weight_0_wreq;
    wire [7:0] weight_0_value_out;
    RW_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    WEIGHT_0_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .WEN        (weight_0_wreq),
        .VALUE_IN   (WDATA),
        .VALUE_OUT  (weight_0_value_out)
    );
        
    // WEIGHT_1: Input weight 1
    reg weight_1_wreq;
    wire [7:0] weight_1_value_out;
    RW_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    WEIGHT_1_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .WEN        (weight_1_wreq),
        .VALUE_IN   (WDATA),
        .VALUE_OUT  (weight_1_value_out)
    );
        
    // BIAS: Input bias
    reg bias_wreq;
    wire [7:0] bias_value_out;
    RW_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    BIAS_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .WEN        (bias_wreq),
        .VALUE_IN   (WDATA),
        .VALUE_OUT  (bias_value_out)
    );
        
    // VALUE_IN: New value in. Depends on CTRL.LOAD_IN
    reg value_in_wreq;
    wire [7:0] value_in_value_out;
    RW_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    VALUE_IN_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .WEN        (value_in_wreq),
        .VALUE_IN   (WDATA),
        .VALUE_OUT  (value_in_value_out)
    );
        
    // CTRL: Control register
    reg ctrl_wreq;
    wire [7:0] ctrl_value_out;
    RW_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (1)
    )
    CTRL_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .WEN        (ctrl_wreq),
        .VALUE_IN   (WDATA),
        .VALUE_OUT  (ctrl_value_out)
    );
        
    // STATUS: Core status register
    wire [7:0] status_value_in;
    wire [7:0] status_value_out;
    RO_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    STATUS_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .VALUE_IN   (status_value_in),
        .VALUE_OUT  (status_value_out)
    );
        
    // RESULT: Activation function result
    wire [7:0] result_value_in;
    wire [7:0] result_value_out;
    RO_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    RESULT_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .VALUE_IN   (result_value_in),
        .VALUE_OUT  (result_value_out)
    );
        
    // MULT_RESULT: Fixed-point multiplication result
    wire [7:0] mult_result_value_in;
    wire [7:0] mult_result_value_out;
    RO_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    MULT_RESULT_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .VALUE_IN   (mult_result_value_in),
        .VALUE_OUT  (mult_result_value_out)
    );
        
    // ADD_RESULT: Fixed-point addition result
    wire [7:0] add_result_value_in;
    wire [7:0] add_result_value_out;
    RO_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    ADD_RESULT_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .VALUE_IN   (add_result_value_in),
        .VALUE_OUT  (add_result_value_out)
    );
        
    // BIAS_ADD_RESULT: Fixed-point addition w/ bias result
    wire [7:0] bias_add_result_value_in;
    wire [7:0] bias_add_result_value_out;
    RO_REG #(
        .DATA_WIDTH (8),
        .HAS_RESET  (0)
    )
    BIAS_ADD_RESULT_REG (
        .CLK        (CLK),
        .RSTN       (RSTN),
        .VALUE_IN   (bias_add_result_value_in),
        .VALUE_OUT  (bias_add_result_value_out)
    );
        
    // Write decoder
    always @(posedge CLK) begin
        wack <= 1'b0;
        weight_0_wreq <= 1'b0;
        weight_1_wreq <= 1'b0;
        bias_wreq <= 1'b0;
        value_in_wreq <= 1'b0;
        ctrl_wreq <= 1'b0;

        if(WREQ) begin
            wack <= 1'b1;

            case(WADDR)
               `WEIGHT_0_OFFSET : begin weight_0_wreq <= 1'b1; end
               `WEIGHT_1_OFFSET : begin weight_1_wreq <= 1'b1; end
               `BIAS_OFFSET : begin bias_wreq <= 1'b1; end
               `VALUE_IN_OFFSET : begin value_in_wreq <= 1'b1; end
               `CTRL_OFFSET : begin ctrl_wreq <= 1'b1; end
            endcase
        end
    end

    // Create Read strobe from Read request edge
    always @(posedge CLK) begin
        rvalid <= RREQ;
    end

    // Read decoder
    always @(*) begin
        case(RADDR)
            `WEIGHT_0_OFFSET : begin rdata = weight_0_value_out; end
            `WEIGHT_1_OFFSET : begin rdata = weight_1_value_out; end
            `BIAS_OFFSET : begin rdata = bias_value_out; end
            `VALUE_IN_OFFSET : begin rdata = value_in_value_out; end
            `CTRL_OFFSET : begin rdata = ctrl_value_out; end
            `STATUS_OFFSET : begin rdata = status_value_out; end
            `RESULT_OFFSET : begin rdata = result_value_out; end
            `MULT_RESULT_OFFSET : begin rdata = mult_result_value_out; end
            `ADD_RESULT_OFFSET : begin rdata = add_result_value_out; end
            `BIAS_ADD_RESULT_OFFSET : begin rdata = bias_add_result_value_out; end
            default : begin rdata = {8{1'b1}}; end
        endcase
    end

    // Pinout
    assign RVALID   = rvalid;
    assign RDATA    = rdata;
    assign WACK     = wack;

    // Compose and decompose CSR bundle data. Control registers (those written by the Software and
    // read by the Hardware) are put over the  HWIF_OUT_*  ports; Status registers (those written by
    // the Hardware and read by the Software) are get over the  HWIF_IN_*  ports
    assign HWIF_OUT_WEIGHT_0 = weight_0_value_out;
    assign HWIF_OUT_WEIGHT_1 = weight_1_value_out;
    assign HWIF_OUT_BIAS = bias_value_out;
    assign HWIF_OUT_VALUE_IN = value_in_value_out;
    assign HWIF_OUT_CTRL = ctrl_value_out;
    assign status_value_in = HWIF_IN_STATUS;
    assign result_value_in = HWIF_IN_RESULT;
    assign mult_result_value_in = HWIF_IN_MULT_RESULT;
    assign add_result_value_in = HWIF_IN_ADD_RESULT;
    assign bias_add_result_value_in = HWIF_IN_BIAS_ADD_RESULT;
endmodule

`default_nettype wire