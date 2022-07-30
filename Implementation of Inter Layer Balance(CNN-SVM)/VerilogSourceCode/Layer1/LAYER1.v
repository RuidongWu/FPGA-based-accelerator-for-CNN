`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 10:24:30
// Design Name: 
// Module Name: LAYER2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LAYER1(
input ap_clk,
input ap_rst_n,

input[31:0] feature_TDATA,
input feature_TVALID,
output feature_TREADY,

input[15:0] weight_TDATA,
input weight_TVALID,
output weight_TREADY,

output  [415:0] d0_Data_TDATA,
output   d0_Data_TVALID,
input   d0_Data_TREADY,

output  [415:0] d1_Data_TDATA,
output   d1_Data_TVALID,
input   d1_Data_TREADY,

output  [415:0] d2_Data_TDATA,
output   d2_Data_TVALID,
input   d2_Data_TREADY,

output  [415:0] d3_Data_TDATA,
output   d3_Data_TVALID,
input   d3_Data_TREADY
);

wire full_flag, full_flag_ap_vld, full_flag_ap_ack;

wire[5:0] wf_addr;
wire[223:0] wf_d;
wire wf_ce;
wire wf_we;

Layer1_WriteBRAM U0(
.ap_clk              (ap_clk),
.ap_rst_n            (ap_rst_n),
.feature_Data_TDATA  (feature_TDATA),
.feature_Data_TVALID (feature_TVALID),
.feature_Data_TREADY (feature_TREADY),
.f_Data_address0     (wf_addr),
.f_Data_ce0          (wf_ce),
.f_Data_we0          (wf_we),
.f_Data_d0           (wf_d),
.full_flag           (full_flag),
.full_flag_ap_vld    (full_flag_ap_vld),
.full_flag_ap_ack    (full_flag_ap_ack)
);

wire[5:0] rf_addr;
wire[223:0] rf_q;
wire rf_ce;

wire[207:0] a_Data_TDATA;
wire a_Data_TVALID, a_Data_TREADY;

Layer1_ReadBRAM U1(
.ap_clk           (ap_clk),
.ap_rst_n         (ap_rst_n),
.full_flag        (full_flag),
.full_flag_ap_vld (full_flag_ap_vld),
.full_flag_ap_ack (full_flag_ap_ack),
.f_Data_address0  (rf_addr),
.f_Data_ce0       (rf_ce),
.f_Data_q0        (rf_q),
.a_Data_TDATA     (a_Data_TDATA),
.a_Data_TVALID    (a_Data_TVALID),
.a_Data_TREADY    (a_Data_TREADY)//
);

wire[63:0] b_Data_TDATA;
wire b_Data_TVALID, b_Data_TREADY;
wire[63:0] Bias_Data;

Layer1_Kernel U_KER(
.ap_clk        (ap_clk),
.ap_rst_n      (ap_rst_n),
.weight_TDATA  (weight_TDATA),
.weight_TVALID (weight_TVALID),
.weight_TREADY (weight_TREADY),
.b_Data_TDATA  (b_Data_TDATA),
.b_Data_TVALID (b_Data_TVALID),
.b_Data_TREADY (b_Data_TREADY),//b_Data_TREADY
.Bias_Data     (Bias_Data)
);

wire[831:0] c0_Data_TDATA, c1_Data_TDATA, c2_Data_TDATA, c3_Data_TDATA;
wire c0_Data_TVALID, c1_Data_TVALID, c2_Data_TVALID, c3_Data_TVALID;
wire c0_Data_TREADY, c1_Data_TREADY, c2_Data_TREADY, c3_Data_TREADY;

Layer1_MAC_Tree_26x4x1 U_MAC(
.ap_clk        (ap_clk),
.ap_rst_n      (ap_rst_n),
.a_Data_TDATA  (a_Data_TDATA),
.a_Data_TVALID (a_Data_TVALID),
.a_Data_TREADY (a_Data_TREADY),
.b_Data_TDATA  (b_Data_TDATA),
.b_Data_TVALID (b_Data_TVALID),
.b_Data_TREADY (b_Data_TREADY),
.c0_Data_TDATA (c0_Data_TDATA),
.c0_Data_TVALID(c0_Data_TVALID),
.c0_Data_TREADY(c0_Data_TREADY),
.c1_Data_TDATA (c1_Data_TDATA),
.c1_Data_TVALID(c1_Data_TVALID),
.c1_Data_TREADY(c1_Data_TREADY),
.c2_Data_TDATA (c2_Data_TDATA),
.c2_Data_TVALID(c2_Data_TVALID),
.c2_Data_TREADY(c2_Data_TREADY),
.c3_Data_TDATA (c3_Data_TDATA),
.c3_Data_TVALID(c3_Data_TVALID),
.c3_Data_TREADY(c3_Data_TREADY)
);
/*
ila_0 UI (
.clk(ap_clk), // input wire clk
.probe0(a_Data_TVALID), // input wire [0:0]  probe0  
.probe1(a_Data_TREADY), // input wire [0:0]  probe1 
.probe2(b_Data_TVALID), // input wire [0:0]  probe2 
.probe3(b_Data_TREADY), // input wire [0:0]  probe3
.probe4(), // input wire [0:0]  probe4 d_Data_TVALID
.probe5() // input wire [0:0]  probe5 d_Data_TREADY
);
*/

Layer1_ACC_Array_26x4 U_ACC(
.ap_clk         (ap_clk),
.ap_rst_n       (ap_rst_n),
.c0_Data_TDATA  (c0_Data_TDATA),
.c0_Data_TVALID (c0_Data_TVALID),
.c0_Data_TREADY (c0_Data_TREADY),
.c1_Data_TDATA  (c1_Data_TDATA),
.c1_Data_TVALID (c1_Data_TVALID),
.c1_Data_TREADY (c1_Data_TREADY),
.c2_Data_TDATA  (c2_Data_TDATA),
.c2_Data_TVALID (c2_Data_TVALID),
.c2_Data_TREADY (c2_Data_TREADY),
.c3_Data_TDATA  (c3_Data_TDATA),
.c3_Data_TVALID (c3_Data_TVALID),
.c3_Data_TREADY (c3_Data_TREADY),
.Bias_Data      (Bias_Data),
.d0_Data_TDATA  (d0_Data_TDATA),
.d0_Data_TVALID (d0_Data_TVALID),
.d0_Data_TREADY (d0_Data_TREADY),
.d1_Data_TDATA  (d1_Data_TDATA),
.d1_Data_TVALID (d1_Data_TVALID),
.d1_Data_TREADY (d1_Data_TREADY),
.d2_Data_TDATA  (d2_Data_TDATA),
.d2_Data_TVALID (d2_Data_TVALID),
.d2_Data_TREADY (d2_Data_TREADY),
.d3_Data_TDATA  (d3_Data_TDATA),
.d3_Data_TVALID (d3_Data_TVALID),
.d3_Data_TREADY (d3_Data_TREADY)
);

L1_BRAM F0 (
.clka(ap_clk),    // input wire clka
.ena(wf_ce),      // input wire ena
.wea(wf_we),      // input wire [0 : 0] wea
.addra(wf_addr),  // input wire [5 : 0] addra
.dina(wf_d),    // input wire [223 : 0] dina
.clkb(ap_clk),    // input wire clkb
.enb(rf_ce),      // input wire enb
.addrb(rf_addr),  // input wire [5 : 0] addrb
.doutb(rf_q)  // output wire [223 : 0] doutb
);

endmodule
