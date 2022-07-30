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


module LAYER2(
input ap_clk,
input ap_rst_n,

input[63:0] feature_TDATA,
input feature_TVALID,
output feature_TREADY,

input[15:0] weight_TDATA,
input weight_TVALID,
output weight_TREADY,

output  [511:0] d_Data_TDATA,
output   d_Data_TVALID,
input   d_Data_TREADY
);

wire full_flag, full_flag_ap_vld, full_flag_ap_ack;

wire[6:0] wf_addr;
wire[255:0] wf_d;
wire wf_ce;
wire wf_we;

Layer2_WriteSingleBRAM U0(
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

wire[6:0] rf_addr;
wire[255:0] rf_q;
wire rf_ce;

wire[255:0] a_Data_TDATA;
wire a_Data_TVALID, a_Data_TREADY;

Layer2_ReadSingleBRAM U1(
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

wire[511:0] b_Data_TDATA;
wire b_Data_TVALID, b_Data_TREADY;
wire[127:0] Bias_Data;

Layer2_Kernel U_KER(
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

wire[1023:0] c_Data_TDATA;
wire c_Data_TVALID, c_Data_TREADY;

Layer2_MAC_Tree_4x4x8 U_MAC(
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
.probe2(b_Data_TVALID), // input wire [0:0]  probe2 
.probe3(b_Data_TREADY), // input wire [0:0]  probe3
.probe4(a_Data_TDATA[31:16]),
.probe5(b_Data_TDATA[31:16])
);
*/

Layer2_ACC_Array_4x8 U_ACC(
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

L2_BRAM F0 (
.clka(ap_clk),    // input wire clka
.ena(wf_ce),      // input wire ena
.wea(wf_we),      // input wire [0 : 0] wea
.addra(wf_addr),  // input wire [6 : 0] addra
.dina(wf_d),    // input wire [255 : 0] dina
.clkb(ap_clk),    // input wire clkb
.enb(rf_ce),      // input wire enb
.addrb(rf_addr),  // input wire [6 : 0] addrb
.doutb(rf_q)  // output wire [255 : 0] doutb
);

endmodule
