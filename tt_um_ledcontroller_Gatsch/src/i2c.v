// Copyright 2024 Mathias Garstenauer
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE−2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

`default_nettype none
`ifndef __i2c__
`define __i2c__

module i2c #(
	parameter ADDRESS = 7'h69	//default i2c address
)(
	input wire scl_i,			//scl input
	output wire scl_o,			//scl output (technically not implemented)
	input wire sda_i,			//sda input
	output wire sda_o,			//sda output
	input wire clk,				//internal clock
	input wire reset,			//chip reset
	output reg [7:0] address,	//register address spcified by i2c command
	output reg [7:0] data,		//i2c data
	output wire address_valid_o,//valid strobe for register address
	output wire data_valid_o,	//valid strobe for data
	output wire start,			//i2c start signal
	output wire stop			//i2c stop signal
);

	reg scl;
	reg last_scl;
	//generates edges from a delayed register
	wire scl_posedge = scl & ~last_scl;
	wire scl_negedge = ~scl & last_scl;
	reg scl_out;
	
	reg sda;
	reg last_sda;
	//generates edges from a delayed register
	wire sda_posedge = sda & ~last_sda;
	wire sda_negedge = ~sda & last_sda;
	reg sda_out;
	
	//generates the start and stop signals from the edges
	//and states of the input signals according to i2c
	wire start_signal = scl_i & sda_negedge;
	wire stop_signal = scl_i & sda_posedge;
	
	localparam Data_size = 8;
	//reg [Data_size-1:0]data;
	reg [3:0] data_cnt;
	reg data_valid;
	reg read;
	reg deviceaddressread;
	reg address_valid;
	
	//states are defined as localparam to increase readabilty
	localparam IDLE = 3'd0;
	localparam READADDRESS = 3'd1;
	localparam PREPACK = 3'd2;
	localparam ACK = 3'd3;
	localparam WRITE = 3'd4;
	reg [2:0] state, next_state;

	//the registers are updated each clock cylce with their new values
	always @(posedge clk) begin
		if (reset) begin
			state <= IDLE;
        end else begin
        	scl <= scl_i;
        	sda <= sda_i;
        	last_scl <= scl;
    		last_sda <= sda;
    		state <= next_state;
        end
    end
    
	always @(state, start_signal, stop_signal, scl_posedge, scl_negedge) begin
		//if a start signal occurs everything is set to its default value
		//and the read process can begin
		if (start_signal) begin
			data_cnt <= 4'b0000;
			data_valid <= 1'b0;
			sda_out <= 1'b1;
			scl_out <= 1'b1;
			address <= 8'b0;
			deviceaddressread <= 1'b0;
			address_valid <= 1'b0;
			next_state <= READADDRESS;
		//if a stop signal occurs the module switches to the IDLE state and waits
		end else if (stop_signal) begin
			next_state <= IDLE;
		end else begin
			case(state)
				//waits for a start condition to occur
				IDLE: begin
					data_cnt <= 4'b0000;
					data_valid <= 1'b0;
					sda_out <= 1'b1;
					scl_out <= 1'b1;
					next_state <= IDLE;
				end
				//reads the device address from the i2c bus and compares it with
				//the configured address
				//if it matches a acknowledgement is sent
				//this state also manges the register address
				READADDRESS: begin
					if (data_cnt < Data_size) begin
						if (scl_posedge) begin		//data is valid
							data <= data<<1;		//shift previous bits
							data[0] <= sda;			//read new bit from sda
							data_cnt <= data_cnt + 4'b0001;
						end
						next_state <= READADDRESS;
					end else if (!deviceaddressread) begin
						if (data[Data_size-1:1] == ADDRESS) begin //correct address
							read <= data[0];
							deviceaddressread <= 1'b1;
							next_state <= PREPACK;
						end else begin
							next_state <= IDLE;
						end
					end else begin					//register address was read
						address <= data;
						address_valid <= 1'b1;
						next_state <= PREPACK;
					end
				end
				//prepeares the acknowledge by setting the right output values
				PREPACK: begin
						if (scl_negedge) begin	//sda has to be low when scl goes high
							sda_out <= 1'b0;
							data_valid <= 1'b0;
							next_state <= ACK;
						end else begin
							next_state <= PREPACK;
						end
					
				end
				//acknowledges a sent byte then returns to the next state
				ACK: begin
					if (scl_negedge) begin
						sda_out <= 1'b1;
						data_cnt <= 4'b0;
						if (!address_valid) begin	//ACK is used for ever case
							next_state <= READADDRESS;
						end else if (read) begin
							next_state <= IDLE;
						end else begin
							next_state <= WRITE;
						end
					end else begin
						next_state <= ACK;
					end
				end
				//allows data to be read from the bus and saves it in a register
				WRITE: begin
					if (data_cnt < Data_size) begin
						if (scl_posedge) begin
							data <= data<<1;
							data[0] <= sda;
							data_cnt <= data_cnt + 4'b0001;
						end
						next_state <= WRITE;
					end else begin
						data_valid <= 1'b1;
						next_state <= PREPACK;
					end
				end
				default:
		    		next_state <= IDLE;
			endcase
		end
    	
    	
    end
    assign sda_o = sda_out;
    assign scl_o = scl_out;
    assign data_valid_o = data_valid;
    assign address_valid_o = address_valid;
    assign start = start_signal;
    assign stop = stop_signal;
endmodule
`endif
