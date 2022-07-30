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

input[7:0] feature_TDATA,
input feature_TVALID,
output feature_TREADY,

input[15:0] weight_TDATA,
input weight_TVALID,
output weight_TREADY,

output  [255:0] d_Data_TDATA,
output   d_Data_TVALID,
input   d_Data_TREADY
);

wire full_flag, full_flag_ap_vld, full_flag_ap_ack;

wire[8:0] wf_addr;
wire[31:0] wf_d;
wire wf_ce;
wire wf_we;

Layer1_WriteBRAM U0(
.ap_clk              (ap_clk),
.ap_rst_n            (ap_rst_n),
.feature_TDATA       (feature_TDATA),
.feature_TVALID      (feature_TVALID),
.feature_TREADY      (feature_TREADY),
.f_Data_address0     (wf_addr),
.f_Data_ce0          (wf_ce),
.f_Data_we0          (wf_we),
.f_Data_d0           (wf_d),
.full_flag           (full_flag),
.full_flag_ap_vld    (full_flag_ap_vld),
.full_flag_ap_ack    (full_flag_ap_ack)
);

wire[8:0] rf_addr;
wire[31:0] rf_q;
wire rf_ce;

wire[31:0] a_Data_TDATA;
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

wire[511:0] c_Data_TDATA;
wire c_Data_TVALID, c_Data_TREADY;

MAC_Tree_4x4x1 U_MAC(
.ap_clk        (ap_clk),
.ap_rst_n      (ap_rst_n),
.a_Data_TDATA  (a_Data_TDATA),
.a_Data_TVALID (a_Data_TVALID),
.a_Data_TREADY (a_Data_TREADY),
.b_Data_TDATA  (b_Data_TDATA),
.b_Data_TVALID (b_Data_TVALID),
.b_Data_TREADY (b_Data_TREADY),
.c_Data_TDATA  (c_Data_TDATA),
.c_Data_TVALID (c_Data_TVALID),
.c_Data_TREADY (c_Data_TREADY)//c_Data_TREADY
);
/*
ila_0 UI (
.clk(ap_clk), // input wire clk
.probe0(a_Data_TVALID), // input wire [0:0]  probe0  
.probe1(a_Data_TREADY), // input wire [0:0]  probe1
.probe2(a_Data_TDATA)  // input wire [31:0]  probe2 
);
*/



ACC_Array_16 U_ACC(
.ap_clk         (ap_clk),
.ap_rst_n       (ap_rst_n),
.c_Data_TDATA   (c_Data_TDATA),
.c_Data_TVALID  (c_Data_TVALID),
.c_Data_TREADY  (c_Data_TREADY),
.Bias_Data      (Bias_Data),
.d_Data_TDATA   (d_Data_TDATA),
.d_Data_TVALID  (d_Data_TVALID),
.d_Data_TREADY  (d_Data_TREADY)
);

L1_BRAM F0 (
.clka(ap_clk),    // input wire clka
.ena(wf_ce),      // input wire ena
.wea(wf_we),      // input wire [0 : 0] wea
.addra(wf_addr),  // input wire [8 : 0] addra
.dina(wf_d),    // input wire [31 : 0] dina
.clkb(ap_clk),    // input wire clkb
.enb(rf_ce),      // input wire enb
.addrb(rf_addr),  // input wire [8 : 0] addrb
.doutb(rf_q)  // output wire [31 : 0] doutb
);

endmodule
