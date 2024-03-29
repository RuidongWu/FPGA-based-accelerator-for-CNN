// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="ACC_Array_16,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xazu3eg-sfvc784-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.091750,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2327,HLS_SYN_LUT=2221,HLS_VERSION=2018_3}" *)

module ACC_Array_16 (
        ap_clk,
        ap_rst_n,
        c_Data_TDATA,
        c_Data_TVALID,
        c_Data_TREADY,
        Bias_Data,
        d_Data_TDATA,
        d_Data_TVALID,
        d_Data_TREADY
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst_n;
input  [511:0] c_Data_TDATA;
input   c_Data_TVALID;
output   c_Data_TREADY;
input  [63:0] Bias_Data;
output  [255:0] d_Data_TDATA;
output   d_Data_TVALID;
input   d_Data_TREADY;

 reg    ap_rst_n_inv;
reg   [511:0] c_Data_0_data_out;
wire    c_Data_0_vld_in;
wire    c_Data_0_vld_out;
wire    c_Data_0_ack_in;
reg    c_Data_0_ack_out;
reg   [511:0] c_Data_0_payload_A;
reg   [511:0] c_Data_0_payload_B;
reg    c_Data_0_sel_rd;
reg    c_Data_0_sel_wr;
wire    c_Data_0_sel;
wire    c_Data_0_load_A;
wire    c_Data_0_load_B;
reg   [1:0] c_Data_0_state;
wire    c_Data_0_state_cmp_full;
reg   [255:0] d_Data_1_data_out;
reg    d_Data_1_vld_in;
wire    d_Data_1_vld_out;
wire    d_Data_1_ack_in;
wire    d_Data_1_ack_out;
reg   [255:0] d_Data_1_payload_A;
reg   [255:0] d_Data_1_payload_B;
reg    d_Data_1_sel_rd;
reg    d_Data_1_sel_wr;
wire    d_Data_1_sel;
wire    d_Data_1_load_A;
wire    d_Data_1_load_B;
reg   [1:0] d_Data_1_state;
wire    d_Data_1_state_cmp_full;
reg   [7:0] cnt;
reg   [31:0] d_t_0;
reg   [31:0] d_t_1;
reg   [31:0] d_t_2;
reg   [31:0] d_t_3;
reg   [31:0] d_t_4;
reg   [31:0] d_t_5;
reg   [31:0] d_t_6;
reg   [31:0] d_t_7;
reg   [31:0] d_t_8;
reg   [31:0] d_t_9;
reg   [31:0] d_t_10;
reg   [31:0] d_t_11;
reg   [31:0] d_t_12;
reg   [31:0] d_t_13;
reg   [31:0] d_t_14;
reg   [31:0] d_t_15;
reg    c_Data_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_pp0_stage0;
wire   [0:0] tmp_fu_371_p2;
wire   [0:0] tmp_1_fu_505_p2;
reg    d_Data_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] tmp_reg_1440;
reg   [0:0] tmp_1_reg_1444;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] tmp_reg_1440_pp0_iter1_reg;
reg   [0:0] tmp_1_reg_1444_pp0_iter1_reg;
reg    ap_predicate_op42_read_state1;
reg    ap_predicate_op94_read_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg    ap_predicate_op206_write_state2;
reg    ap_block_state2_io;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_predicate_op217_write_state3;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_11001;
reg   [15:0] tmp_26_reg_1448;
reg   [15:0] tmp_6_1_reg_1453;
reg   [15:0] tmp_6_2_reg_1458;
reg   [15:0] tmp_6_3_reg_1463;
reg   [15:0] tmp_6_4_reg_1468;
reg   [15:0] tmp_6_5_reg_1473;
reg   [15:0] tmp_6_6_reg_1478;
reg   [15:0] tmp_6_7_reg_1483;
reg   [15:0] tmp_6_8_reg_1488;
reg   [15:0] tmp_6_9_reg_1493;
reg   [15:0] tmp_6_s_reg_1498;
reg   [15:0] tmp_6_10_reg_1503;
reg   [15:0] tmp_6_11_reg_1508;
reg   [15:0] tmp_6_12_reg_1513;
reg   [15:0] tmp_6_13_reg_1518;
reg   [15:0] tmp_6_14_reg_1523;
wire   [255:0] tmp_27_fu_1419_p17;
reg    ap_block_pp0_stage0_subdone;
wire   [7:0] tmp_8_94_fu_707_p2;
wire   [31:0] tmp_s_fu_515_p2;
wire   [31:0] tmp_6_fu_1155_p2;
wire   [31:0] tmp_1_80_fu_527_p2;
wire   [31:0] tmp_14_0_1_fu_1189_p2;
wire   [31:0] tmp_2_81_fu_539_p2;
wire   [31:0] tmp_14_0_2_fu_1223_p2;
wire   [31:0] tmp_3_82_fu_551_p2;
wire   [31:0] tmp_14_0_3_fu_1257_p2;
wire   [31:0] tmp_4_83_fu_563_p2;
wire   [31:0] tmp_14_1_fu_1269_p2;
wire   [31:0] tmp_5_84_fu_575_p2;
wire   [31:0] tmp_14_1_1_fu_1281_p2;
wire   [31:0] tmp_6_85_fu_587_p2;
wire   [31:0] tmp_14_1_2_fu_1293_p2;
wire   [31:0] tmp_7_86_fu_599_p2;
wire   [31:0] tmp_14_1_3_fu_1305_p2;
wire   [31:0] tmp_8_fu_611_p2;
wire   [31:0] tmp_14_2_fu_1317_p2;
wire   [31:0] tmp_9_87_fu_623_p2;
wire   [31:0] tmp_14_2_1_fu_1329_p2;
wire   [31:0] tmp_s_88_fu_635_p2;
wire   [31:0] tmp_14_2_2_fu_1341_p2;
wire   [31:0] tmp_10_89_fu_647_p2;
wire   [31:0] tmp_14_2_3_fu_1353_p2;
wire   [31:0] tmp_11_90_fu_659_p2;
wire   [31:0] tmp_14_3_fu_1365_p2;
wire   [31:0] tmp_12_91_fu_671_p2;
wire   [31:0] tmp_14_3_1_fu_1377_p2;
wire   [31:0] tmp_13_92_fu_683_p2;
wire   [31:0] tmp_14_3_2_fu_1389_p2;
wire   [31:0] tmp_14_93_fu_695_p2;
wire   [31:0] tmp_14_3_3_fu_1401_p2;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] tmp_60_fu_511_p1;
wire   [31:0] grp_fu_217_p4;
wire   [31:0] grp_fu_227_p4;
wire   [31:0] grp_fu_237_p4;
wire   [31:0] grp_fu_247_p4;
wire   [31:0] grp_fu_257_p4;
wire   [31:0] grp_fu_267_p4;
wire   [31:0] grp_fu_277_p4;
wire   [31:0] grp_fu_287_p4;
wire   [31:0] grp_fu_297_p4;
wire   [31:0] grp_fu_307_p4;
wire   [31:0] grp_fu_317_p4;
wire   [31:0] grp_fu_327_p4;
wire   [31:0] grp_fu_337_p4;
wire   [31:0] grp_fu_347_p4;
wire   [31:0] grp_fu_357_p4;
wire   [27:0] tmp_2_fu_381_p1;
wire   [27:0] tmp_59_fu_725_p1;
wire   [27:0] tmp_25_fu_729_p2;
wire   [27:0] tmp_3_fu_389_p1;
wire   [27:0] tmp_24_cast_fu_745_p4;
wire   [27:0] tmp_4_1_fu_755_p2;
wire   [27:0] tmp_28_fu_397_p1;
wire   [27:0] tmp_25_cast_fu_771_p4;
wire   [27:0] tmp_4_2_fu_781_p2;
wire   [27:0] tmp_44_fu_405_p1;
wire   [27:0] tmp_26_cast_fu_797_p4;
wire   [27:0] tmp_4_3_fu_807_p2;
wire   [27:0] tmp_45_fu_413_p1;
wire   [27:0] tmp_27_cast_fu_823_p4;
wire   [27:0] tmp_4_4_fu_833_p2;
wire   [27:0] tmp_46_fu_421_p1;
wire   [27:0] tmp_28_cast_fu_849_p4;
wire   [27:0] tmp_4_5_fu_859_p2;
wire   [27:0] tmp_47_fu_429_p1;
wire   [27:0] tmp_29_cast_fu_875_p4;
wire   [27:0] tmp_4_6_fu_885_p2;
wire   [27:0] tmp_48_fu_437_p1;
wire   [27:0] tmp_30_cast_fu_901_p4;
wire   [27:0] tmp_4_7_fu_911_p2;
wire   [27:0] tmp_49_fu_445_p1;
wire   [27:0] tmp_31_cast_fu_927_p4;
wire   [27:0] tmp_4_8_fu_937_p2;
wire   [27:0] tmp_50_fu_453_p1;
wire   [27:0] tmp_32_cast_fu_953_p4;
wire   [27:0] tmp_4_9_fu_963_p2;
wire   [27:0] tmp_51_fu_461_p1;
wire   [27:0] tmp_33_cast_fu_979_p4;
wire   [27:0] tmp_4_s_fu_989_p2;
wire   [27:0] tmp_52_fu_469_p1;
wire   [27:0] tmp_34_cast_fu_1005_p4;
wire   [27:0] tmp_4_10_fu_1015_p2;
wire   [27:0] tmp_53_fu_477_p1;
wire   [27:0] tmp_35_cast_fu_1031_p4;
wire   [27:0] tmp_4_11_fu_1041_p2;
wire   [27:0] tmp_54_fu_485_p1;
wire   [27:0] tmp_36_cast_fu_1057_p4;
wire   [27:0] tmp_4_12_fu_1067_p2;
wire   [27:0] tmp_55_fu_493_p1;
wire   [27:0] tmp_37_cast_fu_1083_p4;
wire   [27:0] tmp_4_13_fu_1093_p2;
wire   [27:0] tmp_56_fu_501_p1;
wire   [27:0] tmp_38_cast_fu_1109_p4;
wire   [27:0] tmp_4_14_fu_1119_p2;
wire   [15:0] tmp_57_fu_1135_p1;
wire   [19:0] tmp_4_fu_1139_p3;
wire   [31:0] tmp_58_fu_1151_p1;
wire  signed [31:0] tmp_111_cast_fu_1147_p1;
wire   [15:0] tmp_9_fu_1167_p4;
wire   [19:0] tmp_11_0_1_fu_1177_p3;
wire  signed [31:0] tmp_11_0_1_cast_fu_1185_p1;
wire   [15:0] tmp_23_fu_1201_p4;
wire   [19:0] tmp_11_0_2_fu_1211_p3;
wire  signed [31:0] tmp_11_0_2_cast_fu_1219_p1;
wire   [15:0] tmp_24_fu_1235_p4;
wire   [19:0] tmp_11_0_3_fu_1245_p3;
wire  signed [31:0] tmp_11_0_3_cast_fu_1253_p1;
reg   [0:0] ap_NS_fsm;
wire    ap_reset_idle_pp0;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_280;

// power-on initialization
initial begin
#0 c_Data_0_sel_rd = 1'b0;
#0 c_Data_0_sel_wr = 1'b0;
#0 c_Data_0_state = 2'd0;
#0 d_Data_1_sel_rd = 1'b0;
#0 d_Data_1_sel_wr = 1'b0;
#0 d_Data_1_state = 2'd0;
#0 cnt = 8'd0;
#0 d_t_0 = 32'd0;
#0 d_t_1 = 32'd0;
#0 d_t_2 = 32'd0;
#0 d_t_3 = 32'd0;
#0 d_t_4 = 32'd0;
#0 d_t_5 = 32'd0;
#0 d_t_6 = 32'd0;
#0 d_t_7 = 32'd0;
#0 d_t_8 = 32'd0;
#0 d_t_9 = 32'd0;
#0 d_t_10 = 32'd0;
#0 d_t_11 = 32'd0;
#0 d_t_12 = 32'd0;
#0 d_t_13 = 32'd0;
#0 d_t_14 = 32'd0;
#0 d_t_15 = 32'd0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        c_Data_0_sel_rd <= 1'b0;
    end else begin
        if (((c_Data_0_ack_out == 1'b1) & (c_Data_0_vld_out == 1'b1))) begin
            c_Data_0_sel_rd <= ~c_Data_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        c_Data_0_sel_wr <= 1'b0;
    end else begin
        if (((c_Data_0_ack_in == 1'b1) & (c_Data_0_vld_in == 1'b1))) begin
            c_Data_0_sel_wr <= ~c_Data_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        c_Data_0_state <= 2'd0;
    end else begin
        if ((((c_Data_0_vld_in == 1'b0) & (c_Data_0_state == 2'd2)) | ((c_Data_0_vld_in == 1'b0) & (c_Data_0_state == 2'd3) & (c_Data_0_ack_out == 1'b1)))) begin
            c_Data_0_state <= 2'd2;
        end else if ((((c_Data_0_ack_out == 1'b0) & (c_Data_0_state == 2'd1)) | ((c_Data_0_ack_out == 1'b0) & (c_Data_0_state == 2'd3) & (c_Data_0_vld_in == 1'b1)))) begin
            c_Data_0_state <= 2'd1;
        end else if (((~((c_Data_0_vld_in == 1'b0) & (c_Data_0_ack_out == 1'b1)) & ~((c_Data_0_ack_out == 1'b0) & (c_Data_0_vld_in == 1'b1)) & (c_Data_0_state == 2'd3)) | ((c_Data_0_state == 2'd1) & (c_Data_0_ack_out == 1'b1)) | ((c_Data_0_state == 2'd2) & (c_Data_0_vld_in == 1'b1)))) begin
            c_Data_0_state <= 2'd3;
        end else begin
            c_Data_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        d_Data_1_sel_rd <= 1'b0;
    end else begin
        if (((d_Data_1_ack_out == 1'b1) & (d_Data_1_vld_out == 1'b1))) begin
            d_Data_1_sel_rd <= ~d_Data_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        d_Data_1_sel_wr <= 1'b0;
    end else begin
        if (((d_Data_1_ack_in == 1'b1) & (d_Data_1_vld_in == 1'b1))) begin
            d_Data_1_sel_wr <= ~d_Data_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        d_Data_1_state <= 2'd0;
    end else begin
        if ((((d_Data_1_state == 2'd2) & (d_Data_1_vld_in == 1'b0)) | ((d_Data_1_state == 2'd3) & (d_Data_1_vld_in == 1'b0) & (d_Data_1_ack_out == 1'b1)))) begin
            d_Data_1_state <= 2'd2;
        end else if ((((d_Data_1_state == 2'd3) & (d_Data_1_ack_out == 1'b0) & (d_Data_1_vld_in == 1'b1)) | ((d_Data_1_state == 2'd1) & (d_Data_1_ack_out == 1'b0)))) begin
            d_Data_1_state <= 2'd1;
        end else if ((((d_Data_1_state == 2'd2) & (d_Data_1_vld_in == 1'b1)) | (~((d_Data_1_vld_in == 1'b0) & (d_Data_1_ack_out == 1'b1)) & ~((d_Data_1_ack_out == 1'b0) & (d_Data_1_vld_in == 1'b1)) & (d_Data_1_state == 2'd3)) | ((d_Data_1_state == 2'd1) & (d_Data_1_ack_out == 1'b1)))) begin
            d_Data_1_state <= 2'd3;
        end else begin
            d_Data_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            cnt <= 8'd1;
        end else if (((tmp_1_fu_505_p2 == 1'd1) & (tmp_fu_371_p2 == 1'd0))) begin
            cnt <= 8'd0;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            cnt <= tmp_8_94_fu_707_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_0 <= tmp_6_fu_1155_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_0 <= tmp_s_fu_515_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_1 <= tmp_14_0_1_fu_1189_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_1 <= tmp_1_80_fu_527_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_10 <= tmp_14_2_2_fu_1341_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_10 <= tmp_s_88_fu_635_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_11 <= tmp_14_2_3_fu_1353_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_11 <= tmp_10_89_fu_647_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_12 <= tmp_14_3_fu_1365_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_12 <= tmp_11_90_fu_659_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_13 <= tmp_14_3_1_fu_1377_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_13 <= tmp_12_91_fu_671_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_14 <= tmp_14_3_2_fu_1389_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_14 <= tmp_13_92_fu_683_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_15 <= tmp_14_3_3_fu_1401_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_15 <= tmp_14_93_fu_695_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_2 <= tmp_14_0_2_fu_1223_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_2 <= tmp_2_81_fu_539_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_3 <= tmp_14_0_3_fu_1257_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_3 <= tmp_3_82_fu_551_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_4 <= tmp_14_1_fu_1269_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_4 <= tmp_4_83_fu_563_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_5 <= tmp_14_1_1_fu_1281_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_5 <= tmp_5_84_fu_575_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_6 <= tmp_14_1_2_fu_1293_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_6 <= tmp_6_85_fu_587_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_7 <= tmp_14_1_3_fu_1305_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_7 <= tmp_7_86_fu_599_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_8 <= tmp_14_2_fu_1317_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_8 <= tmp_8_fu_611_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_280)) begin
        if ((tmp_fu_371_p2 == 1'd1)) begin
            d_t_9 <= tmp_14_2_1_fu_1329_p2;
        end else if (((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0))) begin
            d_t_9 <= tmp_9_87_fu_623_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((c_Data_0_load_A == 1'b1)) begin
        c_Data_0_payload_A <= c_Data_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((c_Data_0_load_B == 1'b1)) begin
        c_Data_0_payload_B <= c_Data_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((d_Data_1_load_A == 1'b1)) begin
        d_Data_1_payload_A <= tmp_27_fu_1419_p17;
    end
end

always @ (posedge ap_clk) begin
    if ((d_Data_1_load_B == 1'b1)) begin
        d_Data_1_payload_B <= tmp_27_fu_1419_p17;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_371_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_1_reg_1444 <= tmp_1_fu_505_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_1_reg_1444_pp0_iter1_reg <= tmp_1_reg_1444;
        tmp_reg_1440 <= tmp_fu_371_p2;
        tmp_reg_1440_pp0_iter1_reg <= tmp_reg_1440;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_1_fu_505_p2 == 1'd1) & (tmp_fu_371_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_26_reg_1448 <= {{tmp_25_fu_729_p2[27:12]}};
        tmp_6_10_reg_1503 <= {{tmp_4_10_fu_1015_p2[27:12]}};
        tmp_6_11_reg_1508 <= {{tmp_4_11_fu_1041_p2[27:12]}};
        tmp_6_12_reg_1513 <= {{tmp_4_12_fu_1067_p2[27:12]}};
        tmp_6_13_reg_1518 <= {{tmp_4_13_fu_1093_p2[27:12]}};
        tmp_6_14_reg_1523 <= {{tmp_4_14_fu_1119_p2[27:12]}};
        tmp_6_1_reg_1453 <= {{tmp_4_1_fu_755_p2[27:12]}};
        tmp_6_2_reg_1458 <= {{tmp_4_2_fu_781_p2[27:12]}};
        tmp_6_3_reg_1463 <= {{tmp_4_3_fu_807_p2[27:12]}};
        tmp_6_4_reg_1468 <= {{tmp_4_4_fu_833_p2[27:12]}};
        tmp_6_5_reg_1473 <= {{tmp_4_5_fu_859_p2[27:12]}};
        tmp_6_6_reg_1478 <= {{tmp_4_6_fu_885_p2[27:12]}};
        tmp_6_7_reg_1483 <= {{tmp_4_7_fu_911_p2[27:12]}};
        tmp_6_8_reg_1488 <= {{tmp_4_8_fu_937_p2[27:12]}};
        tmp_6_9_reg_1493 <= {{tmp_4_9_fu_963_p2[27:12]}};
        tmp_6_s_reg_1498 <= {{tmp_4_s_fu_989_p2[27:12]}};
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

assign ap_reset_idle_pp0 = 1'b0;

always @ (*) begin
    if ((((ap_predicate_op94_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_predicate_op42_read_state1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((tmp_fu_371_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        c_Data_0_ack_out = 1'b1;
    end else begin
        c_Data_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((c_Data_0_sel == 1'b1)) begin
        c_Data_0_data_out = c_Data_0_payload_B;
    end else begin
        c_Data_0_data_out = c_Data_0_payload_A;
    end
end

always @ (*) begin
    if ((((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0) & (1'b1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((tmp_1_fu_505_p2 == 1'd1) & (tmp_fu_371_p2 == 1'd0) & (1'b1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((tmp_fu_371_p2 == 1'd1) & (1'b1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        c_Data_TDATA_blk_n = c_Data_0_state[1'd0];
    end else begin
        c_Data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((d_Data_1_sel == 1'b1)) begin
        d_Data_1_data_out = d_Data_1_payload_B;
    end else begin
        d_Data_1_data_out = d_Data_1_payload_A;
    end
end

always @ (*) begin
    if (((ap_predicate_op206_write_state2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        d_Data_1_vld_in = 1'b1;
    end else begin
        d_Data_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_1_reg_1444_pp0_iter1_reg == 1'd1) & (tmp_reg_1440_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((tmp_1_reg_1444 == 1'd1) & (tmp_reg_1440 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        d_Data_TDATA_blk_n = d_Data_1_state[1'd1];
    end else begin
        d_Data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((d_Data_1_ack_in == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b1 == 1'b1) & (((c_Data_0_vld_out == 1'b0) & (ap_predicate_op94_read_state1 == 1'b1)) | ((c_Data_0_vld_out == 1'b0) & (ap_predicate_op42_read_state1 == 1'b1)) | ((tmp_fu_371_p2 == 1'd1) & (c_Data_0_vld_out == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter2 == 1'b1) & ((d_Data_1_ack_in == 1'b0) | (1'b1 == ap_block_state3_io))) | ((1'b1 == ap_block_state2_io) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b1 == 1'b1) & (((c_Data_0_vld_out == 1'b0) & (ap_predicate_op94_read_state1 == 1'b1)) | ((c_Data_0_vld_out == 1'b0) & (ap_predicate_op42_read_state1 == 1'b1)) | ((tmp_fu_371_p2 == 1'd1) & (c_Data_0_vld_out == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter2 == 1'b1) & ((d_Data_1_ack_in == 1'b0) | (1'b1 == ap_block_state3_io))) | ((1'b1 == ap_block_state2_io) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b1 == 1'b1) & (((c_Data_0_vld_out == 1'b0) & (ap_predicate_op94_read_state1 == 1'b1)) | ((c_Data_0_vld_out == 1'b0) & (ap_predicate_op42_read_state1 == 1'b1)) | ((tmp_fu_371_p2 == 1'd1) & (c_Data_0_vld_out == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (((c_Data_0_vld_out == 1'b0) & (ap_predicate_op94_read_state1 == 1'b1)) | ((c_Data_0_vld_out == 1'b0) & (ap_predicate_op42_read_state1 == 1'b1)) | ((tmp_fu_371_p2 == 1'd1) & (c_Data_0_vld_out == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = ((d_Data_1_ack_in == 1'b0) & (ap_predicate_op206_write_state2 == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((d_Data_1_ack_in == 1'b0) & (ap_predicate_op217_write_state3 == 1'b1));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (d_Data_1_ack_in == 1'b0);
end

always @ (*) begin
    ap_condition_280 = ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_op206_write_state2 = ((tmp_1_reg_1444 == 1'd1) & (tmp_reg_1440 == 1'd0));
end

always @ (*) begin
    ap_predicate_op217_write_state3 = ((tmp_1_reg_1444_pp0_iter1_reg == 1'd1) & (tmp_reg_1440_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op42_read_state1 = ((tmp_1_fu_505_p2 == 1'd0) & (tmp_fu_371_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op94_read_state1 = ((tmp_1_fu_505_p2 == 1'd1) & (tmp_fu_371_p2 == 1'd0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign c_Data_0_ack_in = c_Data_0_state[1'd1];

assign c_Data_0_load_A = (~c_Data_0_sel_wr & c_Data_0_state_cmp_full);

assign c_Data_0_load_B = (c_Data_0_state_cmp_full & c_Data_0_sel_wr);

assign c_Data_0_sel = c_Data_0_sel_rd;

assign c_Data_0_state_cmp_full = ((c_Data_0_state != 2'd1) ? 1'b1 : 1'b0);

assign c_Data_0_vld_in = c_Data_TVALID;

assign c_Data_0_vld_out = c_Data_0_state[1'd0];

assign c_Data_TREADY = c_Data_0_state[1'd1];

assign d_Data_1_ack_in = d_Data_1_state[1'd1];

assign d_Data_1_ack_out = d_Data_TREADY;

assign d_Data_1_load_A = (~d_Data_1_sel_wr & d_Data_1_state_cmp_full);

assign d_Data_1_load_B = (d_Data_1_state_cmp_full & d_Data_1_sel_wr);

assign d_Data_1_sel = d_Data_1_sel_rd;

assign d_Data_1_state_cmp_full = ((d_Data_1_state != 2'd1) ? 1'b1 : 1'b0);

assign d_Data_1_vld_out = d_Data_1_state[1'd0];

assign d_Data_TDATA = d_Data_1_data_out;

assign d_Data_TVALID = d_Data_1_state[1'd0];

assign grp_fu_217_p4 = {{c_Data_0_data_out[63:32]}};

assign grp_fu_227_p4 = {{c_Data_0_data_out[95:64]}};

assign grp_fu_237_p4 = {{c_Data_0_data_out[127:96]}};

assign grp_fu_247_p4 = {{c_Data_0_data_out[159:128]}};

assign grp_fu_257_p4 = {{c_Data_0_data_out[191:160]}};

assign grp_fu_267_p4 = {{c_Data_0_data_out[223:192]}};

assign grp_fu_277_p4 = {{c_Data_0_data_out[255:224]}};

assign grp_fu_287_p4 = {{c_Data_0_data_out[287:256]}};

assign grp_fu_297_p4 = {{c_Data_0_data_out[319:288]}};

assign grp_fu_307_p4 = {{c_Data_0_data_out[351:320]}};

assign grp_fu_317_p4 = {{c_Data_0_data_out[383:352]}};

assign grp_fu_327_p4 = {{c_Data_0_data_out[415:384]}};

assign grp_fu_337_p4 = {{c_Data_0_data_out[447:416]}};

assign grp_fu_347_p4 = {{c_Data_0_data_out[479:448]}};

assign grp_fu_357_p4 = {{c_Data_0_data_out[511:480]}};

assign tmp_10_89_fu_647_p2 = (grp_fu_317_p4 + d_t_11);

assign tmp_111_cast_fu_1147_p1 = $signed(tmp_4_fu_1139_p3);

assign tmp_11_0_1_cast_fu_1185_p1 = $signed(tmp_11_0_1_fu_1177_p3);

assign tmp_11_0_1_fu_1177_p3 = {{tmp_9_fu_1167_p4}, {4'd0}};

assign tmp_11_0_2_cast_fu_1219_p1 = $signed(tmp_11_0_2_fu_1211_p3);

assign tmp_11_0_2_fu_1211_p3 = {{tmp_23_fu_1201_p4}, {4'd0}};

assign tmp_11_0_3_cast_fu_1253_p1 = $signed(tmp_11_0_3_fu_1245_p3);

assign tmp_11_0_3_fu_1245_p3 = {{tmp_24_fu_1235_p4}, {4'd0}};

assign tmp_11_90_fu_659_p2 = (grp_fu_327_p4 + d_t_12);

assign tmp_12_91_fu_671_p2 = (grp_fu_337_p4 + d_t_13);

assign tmp_13_92_fu_683_p2 = (grp_fu_347_p4 + d_t_14);

assign tmp_14_0_1_fu_1189_p2 = ($signed(grp_fu_217_p4) + $signed(tmp_11_0_1_cast_fu_1185_p1));

assign tmp_14_0_2_fu_1223_p2 = ($signed(grp_fu_227_p4) + $signed(tmp_11_0_2_cast_fu_1219_p1));

assign tmp_14_0_3_fu_1257_p2 = ($signed(grp_fu_237_p4) + $signed(tmp_11_0_3_cast_fu_1253_p1));

assign tmp_14_1_1_fu_1281_p2 = ($signed(grp_fu_257_p4) + $signed(tmp_11_0_1_cast_fu_1185_p1));

assign tmp_14_1_2_fu_1293_p2 = ($signed(grp_fu_267_p4) + $signed(tmp_11_0_2_cast_fu_1219_p1));

assign tmp_14_1_3_fu_1305_p2 = ($signed(grp_fu_277_p4) + $signed(tmp_11_0_3_cast_fu_1253_p1));

assign tmp_14_1_fu_1269_p2 = ($signed(grp_fu_247_p4) + $signed(tmp_111_cast_fu_1147_p1));

assign tmp_14_2_1_fu_1329_p2 = ($signed(grp_fu_297_p4) + $signed(tmp_11_0_1_cast_fu_1185_p1));

assign tmp_14_2_2_fu_1341_p2 = ($signed(grp_fu_307_p4) + $signed(tmp_11_0_2_cast_fu_1219_p1));

assign tmp_14_2_3_fu_1353_p2 = ($signed(grp_fu_317_p4) + $signed(tmp_11_0_3_cast_fu_1253_p1));

assign tmp_14_2_fu_1317_p2 = ($signed(grp_fu_287_p4) + $signed(tmp_111_cast_fu_1147_p1));

assign tmp_14_3_1_fu_1377_p2 = ($signed(grp_fu_337_p4) + $signed(tmp_11_0_1_cast_fu_1185_p1));

assign tmp_14_3_2_fu_1389_p2 = ($signed(grp_fu_347_p4) + $signed(tmp_11_0_2_cast_fu_1219_p1));

assign tmp_14_3_3_fu_1401_p2 = ($signed(grp_fu_357_p4) + $signed(tmp_11_0_3_cast_fu_1253_p1));

assign tmp_14_3_fu_1365_p2 = ($signed(grp_fu_327_p4) + $signed(tmp_111_cast_fu_1147_p1));

assign tmp_14_93_fu_695_p2 = (grp_fu_357_p4 + d_t_15);

assign tmp_1_80_fu_527_p2 = (grp_fu_217_p4 + d_t_1);

assign tmp_1_fu_505_p2 = ((cnt == 8'd8) ? 1'b1 : 1'b0);

assign tmp_23_fu_1201_p4 = {{Bias_Data[47:32]}};

assign tmp_24_cast_fu_745_p4 = {{c_Data_0_data_out[59:32]}};

assign tmp_24_fu_1235_p4 = {{Bias_Data[63:48]}};

assign tmp_25_cast_fu_771_p4 = {{c_Data_0_data_out[91:64]}};

assign tmp_25_fu_729_p2 = (tmp_2_fu_381_p1 + tmp_59_fu_725_p1);

assign tmp_26_cast_fu_797_p4 = {{c_Data_0_data_out[123:96]}};

assign tmp_27_cast_fu_823_p4 = {{c_Data_0_data_out[155:128]}};

assign tmp_27_fu_1419_p17 = {{{{{{{{{{{{{{{{tmp_6_14_reg_1523}, {tmp_6_13_reg_1518}}, {tmp_6_12_reg_1513}}, {tmp_6_11_reg_1508}}, {tmp_6_10_reg_1503}}, {tmp_6_s_reg_1498}}, {tmp_6_9_reg_1493}}, {tmp_6_8_reg_1488}}, {tmp_6_7_reg_1483}}, {tmp_6_6_reg_1478}}, {tmp_6_5_reg_1473}}, {tmp_6_4_reg_1468}}, {tmp_6_3_reg_1463}}, {tmp_6_2_reg_1458}}, {tmp_6_1_reg_1453}}, {tmp_26_reg_1448}};

assign tmp_28_cast_fu_849_p4 = {{c_Data_0_data_out[187:160]}};

assign tmp_28_fu_397_p1 = d_t_2[27:0];

assign tmp_29_cast_fu_875_p4 = {{c_Data_0_data_out[219:192]}};

assign tmp_2_81_fu_539_p2 = (grp_fu_227_p4 + d_t_2);

assign tmp_2_fu_381_p1 = d_t_0[27:0];

assign tmp_30_cast_fu_901_p4 = {{c_Data_0_data_out[251:224]}};

assign tmp_31_cast_fu_927_p4 = {{c_Data_0_data_out[283:256]}};

assign tmp_32_cast_fu_953_p4 = {{c_Data_0_data_out[315:288]}};

assign tmp_33_cast_fu_979_p4 = {{c_Data_0_data_out[347:320]}};

assign tmp_34_cast_fu_1005_p4 = {{c_Data_0_data_out[379:352]}};

assign tmp_35_cast_fu_1031_p4 = {{c_Data_0_data_out[411:384]}};

assign tmp_36_cast_fu_1057_p4 = {{c_Data_0_data_out[443:416]}};

assign tmp_37_cast_fu_1083_p4 = {{c_Data_0_data_out[475:448]}};

assign tmp_38_cast_fu_1109_p4 = {{c_Data_0_data_out[507:480]}};

assign tmp_3_82_fu_551_p2 = (grp_fu_237_p4 + d_t_3);

assign tmp_3_fu_389_p1 = d_t_1[27:0];

assign tmp_44_fu_405_p1 = d_t_3[27:0];

assign tmp_45_fu_413_p1 = d_t_4[27:0];

assign tmp_46_fu_421_p1 = d_t_5[27:0];

assign tmp_47_fu_429_p1 = d_t_6[27:0];

assign tmp_48_fu_437_p1 = d_t_7[27:0];

assign tmp_49_fu_445_p1 = d_t_8[27:0];

assign tmp_4_10_fu_1015_p2 = (tmp_52_fu_469_p1 + tmp_34_cast_fu_1005_p4);

assign tmp_4_11_fu_1041_p2 = (tmp_53_fu_477_p1 + tmp_35_cast_fu_1031_p4);

assign tmp_4_12_fu_1067_p2 = (tmp_54_fu_485_p1 + tmp_36_cast_fu_1057_p4);

assign tmp_4_13_fu_1093_p2 = (tmp_55_fu_493_p1 + tmp_37_cast_fu_1083_p4);

assign tmp_4_14_fu_1119_p2 = (tmp_56_fu_501_p1 + tmp_38_cast_fu_1109_p4);

assign tmp_4_1_fu_755_p2 = (tmp_3_fu_389_p1 + tmp_24_cast_fu_745_p4);

assign tmp_4_2_fu_781_p2 = (tmp_28_fu_397_p1 + tmp_25_cast_fu_771_p4);

assign tmp_4_3_fu_807_p2 = (tmp_44_fu_405_p1 + tmp_26_cast_fu_797_p4);

assign tmp_4_4_fu_833_p2 = (tmp_45_fu_413_p1 + tmp_27_cast_fu_823_p4);

assign tmp_4_5_fu_859_p2 = (tmp_46_fu_421_p1 + tmp_28_cast_fu_849_p4);

assign tmp_4_6_fu_885_p2 = (tmp_47_fu_429_p1 + tmp_29_cast_fu_875_p4);

assign tmp_4_7_fu_911_p2 = (tmp_48_fu_437_p1 + tmp_30_cast_fu_901_p4);

assign tmp_4_83_fu_563_p2 = (grp_fu_247_p4 + d_t_4);

assign tmp_4_8_fu_937_p2 = (tmp_49_fu_445_p1 + tmp_31_cast_fu_927_p4);

assign tmp_4_9_fu_963_p2 = (tmp_50_fu_453_p1 + tmp_32_cast_fu_953_p4);

assign tmp_4_fu_1139_p3 = {{tmp_57_fu_1135_p1}, {4'd0}};

assign tmp_4_s_fu_989_p2 = (tmp_51_fu_461_p1 + tmp_33_cast_fu_979_p4);

assign tmp_50_fu_453_p1 = d_t_9[27:0];

assign tmp_51_fu_461_p1 = d_t_10[27:0];

assign tmp_52_fu_469_p1 = d_t_11[27:0];

assign tmp_53_fu_477_p1 = d_t_12[27:0];

assign tmp_54_fu_485_p1 = d_t_13[27:0];

assign tmp_55_fu_493_p1 = d_t_14[27:0];

assign tmp_56_fu_501_p1 = d_t_15[27:0];

assign tmp_57_fu_1135_p1 = Bias_Data[15:0];

assign tmp_58_fu_1151_p1 = c_Data_0_data_out[31:0];

assign tmp_59_fu_725_p1 = c_Data_0_data_out[27:0];

assign tmp_5_84_fu_575_p2 = (grp_fu_257_p4 + d_t_5);

assign tmp_60_fu_511_p1 = c_Data_0_data_out[31:0];

assign tmp_6_85_fu_587_p2 = (grp_fu_267_p4 + d_t_6);

assign tmp_6_fu_1155_p2 = ($signed(tmp_58_fu_1151_p1) + $signed(tmp_111_cast_fu_1147_p1));

assign tmp_7_86_fu_599_p2 = (grp_fu_277_p4 + d_t_7);

assign tmp_8_94_fu_707_p2 = (8'd1 + cnt);

assign tmp_8_fu_611_p2 = (grp_fu_287_p4 + d_t_8);

assign tmp_9_87_fu_623_p2 = (grp_fu_297_p4 + d_t_9);

assign tmp_9_fu_1167_p4 = {{Bias_Data[31:16]}};

assign tmp_fu_371_p2 = ((cnt == 8'd0) ? 1'b1 : 1'b0);

assign tmp_s_88_fu_635_p2 = (grp_fu_307_p4 + d_t_10);

assign tmp_s_fu_515_p2 = (tmp_60_fu_511_p1 + d_t_0);

endmodule //ACC_Array_16
