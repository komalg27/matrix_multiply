// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    wire [31:0] rdata; 
    wire [31:0] wdata;
    wire [BITS-1:0] count;

    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;
    
    //for matrix_multiply
    wire reset,execute, clk;
    wire [2:0]sel_in;
    wire [7:0]input_val;
    wire [1:0]sel_out;
    wire [16:0]result;
    
    //for matrix_multiply
    assign io_out[16:0] = result;
    assign io_oeb[16:0] = 17'b0;
    assign io_oeb[19] = 1'b0;
    
    assign io_in[37:30]=input_val;
    assign io_in[27:25]=sel_in;
    assign io_in[18:17]=sel_out;
    assign io_in[22]=execute;
    assign io_in[23]=reset;
    assign io_in[24]=clk;
    
    assign io_oeb[37:20]=18'b111111_111111_111111;
    assign io_oeb[18:17]=2'b11;

    // WB MI A
    assign valid = wbs_cyc_i && wbs_stb_i; 
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    assign wbs_dat_o = rdata;
    assign wdata = wbs_dat_i;

    // IO
    assign io_out = count;
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA
    assign la_data_out = {{(127-BITS){1'b0}}, count};
    // Assuming LA probes [63:32] are for controlling the count register  
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    
    
matrix_multiply k(
`ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
`endif
	.reset(reset),
	.execute(execute),
	.clk(clk),
    	.sel_in(sel_in),
    	.input_val(input_val),
    	.sel_out(sel_out),
    	.result(result)
);


endmodule




module matrix_multiply(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    input reset,execute, clk,
    input [2:0]sel_in,
    input [7:0]input_val,
    input [1:0]sel_out,
    output [16:0]result
    );
    reg [7:0]A[0:1][0:1];
    reg [7:0]B[0:1][0:1];
    reg [16:0]C[0:1][0:1];
    
    integer i,j,k; 
    wire [0:7]D;
    decoder_3x8 select_in (D, sel_in, !execute);
    
    always @(posedge clk, negedge reset)    
    begin
        if(!reset) begin
            {A[0][0],A[0][1],A[1][0],A[1][1]} <= 32'd0;
            {B[0][0],B[0][1],B[1][0],B[1][1]} <= 32'd0;
        end
        else begin
            A[0][0] <= D[0] ? input_val : A[0][0];
            A[0][1] <= D[1] ? input_val : A[0][1];
            A[1][0] <= D[2] ? input_val : A[1][0];
            A[1][1] <= D[3] ? input_val : A[1][1];
            B[0][0] <= D[4] ? input_val : B[0][0];
            B[0][1] <= D[5] ? input_val : B[0][1];
            B[1][0] <= D[6] ? input_val : B[1][0];
            B[1][1] <= D[7] ? input_val : B[1][1];
        end

    end
    always @(*)
        begin
            {C[0][0],C[0][1],C[1][0],C[1][1]} = 68'd0;
            
            for(i=0;i <2;i=i+1)
              for(j=0;j <2;j=j+1)
                for(k=0;k <2;k=k+1)
                C[i][j] = C[i][j] + (A[i][k] * B[k][j]);
               
        end
        
    reg [16:0] result1; 
    always @(*)
    begin case(sel_out)
       2'b00:   result1 <=C[0][0];
       2'b01:   result1 <=C[0][1];
       2'b10:   result1 <=C[1][0];
       2'b11:   result1 <=C[1][1];
       endcase
    end     
    assign result = {17{execute}}&result1;

endmodule

module decoder_3x8(
    output [0:7] D,
    input [2:0] S,
    input en
    );
    
    assign D[0] = !S[2] && !S[1] && !S[0] && en;
    assign D[1] = !S[2] && !S[1] && S[0] && en;
    assign D[2] = !S[2] && S[1] && !S[0] && en;
    assign D[3] = !S[2] && S[1] && S[0] && en;
    assign D[4] = S[2] && !S[1] && !S[0] && en;
    assign D[5] = S[2] && !S[1] && S[0] && en;
    assign D[6] = S[2] && S[1] && !S[0] && en;
    assign D[7] = S[2] && S[1] && S[0] && en;
    
endmodule
/*
    counter #(
        .BITS(BITS)
    ) counter(
        .clk(clk),
        .reset(rst),
        .ready(wbs_ack_o),
        .valid(valid),
        .rdata(rdata),
        .wdata(wbs_dat_i),
        .wstrb(wstrb),
        .la_write(la_write),
        .la_input(la_data_in[63:32]),
        .count(count)
    );

endmodule

module counter #(
    parameter BITS = 32
)(
    input clk,
    input reset,
    input valid,
    input [3:0] wstrb,
    input [BITS-1:0] wdata,
    input [BITS-1:0] la_write,
    input [BITS-1:0] la_input,
    output ready,
    output [BITS-1:0] rdata,
    output [BITS-1:0] count
);
    reg ready;
    reg [BITS-1:0] count;
    reg [BITS-1:0] rdata;

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            ready <= 0;
        end else begin
            ready <= 1'b0;
            if (~|la_write) begin
                count <= count + 1;
            end
            if (valid && !ready) begin
                ready <= 1'b1;
                rdata <= count;
                if (wstrb[0]) count[7:0]   <= wdata[7:0];
                if (wstrb[1]) count[15:8]  <= wdata[15:8];
                if (wstrb[2]) count[23:16] <= wdata[23:16];
                if (wstrb[3]) count[31:24] <= wdata[31:24];
            end else if (|la_write) begin
                count <= la_write & la_input;
            end
        end
    end

endmodule*/
`default_nettype wire
