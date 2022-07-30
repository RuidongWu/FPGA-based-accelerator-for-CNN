`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 21:58:28
// Design Name: 
// Module Name: LAYER4
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


module LAYER4(
input ap_clk,
input ap_rst_n,

input  [127:0] a_Data_TDATA,
input   a_Data_TVALID,
output   a_Data_TREADY,

input  [15:0] weight_TDATA,
input   weight_TVALID,
output   weight_TREADY,

output  [7:0] pre_label_TDATA,
output   pre_label_TVALID,
input   pre_label_TREADY
);

wire[63:0] w_Data_TDATA;
wire w_Data_TVALID;
wire w_Data_TREADY;

wire[159:0] Bias_Data;


Layer4_FC U0(
.ap_clk           (ap_clk),
.ap_rst_n         (ap_rst_n),
.a_Data_TDATA     (a_Data_TDATA),
.a_Data_TVALID    (a_Data_TVALID),
.a_Data_TREADY    (a_Data_TREADY),
.w_Data_TDATA     (w_Data_TDATA),
.w_Data_TVALID    (w_Data_TVALID),
.w_Data_TREADY    (w_Data_TREADY),
.Bias_Data        (Bias_Data),
.pre_label_TDATA  (pre_label_TDATA),
.pre_label_TVALID (pre_label_TVALID),
.pre_label_TREADY (pre_label_TREADY)
);


Layer4_FC_Kernel U_W(
.ap_clk           (ap_clk),
.ap_rst_n         (ap_rst_n),
.fc_weight_TDATA  (weight_TDATA),
.fc_weight_TVALID (weight_TVALID),
.fc_weight_TREADY (weight_TREADY),
.w_Data_TDATA     (w_Data_TDATA),
.w_Data_TVALID    (w_Data_TVALID),
.w_Data_TREADY    (w_Data_TREADY),
.Bias_Data        (Bias_Data)
);

endmodule
