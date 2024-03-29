// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Layer1_WriteBRAM,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xazu3eg-sfvc784-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.352000,HLS_SYN_LAT=1964,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=93,HLS_SYN_LUT=281,HLS_VERSION=2018_3}" *)

module Layer1_WriteBRAM (
        ap_clk,
        ap_rst_n,
        feature_TDATA,
        feature_TVALID,
        feature_TREADY,
        f_Data_address0,
        f_Data_ce0,
        f_Data_we0,
        f_Data_d0,
        full_flag,
        full_flag_ap_vld,
        full_flag_ap_ack
);

parameter    ap_ST_fsm_state1 = 13'd1;
parameter    ap_ST_fsm_state2 = 13'd2;
parameter    ap_ST_fsm_state3 = 13'd4;
parameter    ap_ST_fsm_state4 = 13'd8;
parameter    ap_ST_fsm_state5 = 13'd16;
parameter    ap_ST_fsm_state6 = 13'd32;
parameter    ap_ST_fsm_state7 = 13'd64;
parameter    ap_ST_fsm_state8 = 13'd128;
parameter    ap_ST_fsm_state9 = 13'd256;
parameter    ap_ST_fsm_state10 = 13'd512;
parameter    ap_ST_fsm_state11 = 13'd1024;
parameter    ap_ST_fsm_state12 = 13'd2048;
parameter    ap_ST_fsm_state13 = 13'd4096;

input   ap_clk;
input   ap_rst_n;
input  [7:0] feature_TDATA;
input   feature_TVALID;
output   feature_TREADY;
output  [8:0] f_Data_address0;
output   f_Data_ce0;
output   f_Data_we0;
output  [31:0] f_Data_d0;
output   full_flag;
output   full_flag_ap_vld;
input   full_flag_ap_ack;

reg[8:0] f_Data_address0;
reg f_Data_ce0;
reg f_Data_we0;
reg[31:0] f_Data_d0;

 reg    ap_rst_n_inv;
reg   [7:0] feature_0_data_out;
wire    feature_0_vld_in;
wire    feature_0_vld_out;
wire    feature_0_ack_in;
reg    feature_0_ack_out;
reg   [7:0] feature_0_payload_A;
reg   [7:0] feature_0_payload_B;
reg    feature_0_sel_rd;
reg    feature_0_sel_wr;
wire    feature_0_sel;
wire    feature_0_load_A;
wire    feature_0_load_B;
reg   [1:0] feature_0_state;
wire    feature_0_state_cmp_full;
reg    full_flag_1_data_reg;
reg    full_flag_1_data_in;
reg    full_flag_1_vld_reg;
reg    full_flag_1_vld_in;
reg    full_flag_1_ack_in;
wire    full_flag_1_ack_out;
reg    feature_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [12:0] ap_CS_fsm;
wire    ap_CS_fsm_state2;
wire   [0:0] exitcond6_fu_134_p2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state8;
wire   [0:0] exitcond1_fu_164_p2;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state11;
reg    full_flag_blk_n;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state13;
reg   [7:0] reg_122;
reg    ap_block_state2;
reg    ap_block_state2_io;
reg    ap_block_state8;
reg    ap_block_state8_io;
reg   [7:0] reg_126;
reg   [7:0] reg_130;
wire   [7:0] i_1_fu_140_p2;
reg   [7:0] i_1_reg_197;
wire   [31:0] tmp_2_fu_151_p5;
wire   [31:0] tmp_3_fu_175_p5;
wire   [8:0] i_2_fu_188_p2;
reg   [8:0] i_2_reg_225;
reg   [7:0] i_reg_98;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state6;
reg   [8:0] i1_reg_110;
wire    ap_CS_fsm_state12;
wire   [63:0] tmp_fu_146_p1;
wire   [63:0] tmp_1_fu_170_p1;
reg   [12:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 feature_0_sel_rd = 1'b0;
#0 feature_0_sel_wr = 1'b0;
#0 feature_0_state = 2'd0;
#0 full_flag_1_data_reg = 1'b0;
#0 full_flag_1_vld_reg = 1'b0;
#0 ap_CS_fsm = 13'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        feature_0_sel_rd <= 1'b0;
    end else begin
        if (((feature_0_ack_out == 1'b1) & (feature_0_vld_out == 1'b1))) begin
            feature_0_sel_rd <= ~feature_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        feature_0_sel_wr <= 1'b0;
    end else begin
        if (((feature_0_ack_in == 1'b1) & (feature_0_vld_in == 1'b1))) begin
            feature_0_sel_wr <= ~feature_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        feature_0_state <= 2'd0;
    end else begin
        if ((((feature_0_state == 2'd2) & (feature_0_vld_in == 1'b0)) | ((feature_0_state == 2'd3) & (feature_0_vld_in == 1'b0) & (feature_0_ack_out == 1'b1)))) begin
            feature_0_state <= 2'd2;
        end else if ((((feature_0_state == 2'd1) & (feature_0_ack_out == 1'b0)) | ((feature_0_state == 2'd3) & (feature_0_ack_out == 1'b0) & (feature_0_vld_in == 1'b1)))) begin
            feature_0_state <= 2'd1;
        end else if (((~((feature_0_vld_in == 1'b0) & (feature_0_ack_out == 1'b1)) & ~((feature_0_ack_out == 1'b0) & (feature_0_vld_in == 1'b1)) & (feature_0_state == 2'd3)) | ((feature_0_state == 2'd1) & (feature_0_ack_out == 1'b1)) | ((feature_0_state == 2'd2) & (feature_0_vld_in == 1'b1)))) begin
            feature_0_state <= 2'd3;
        end else begin
            feature_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((full_flag_1_vld_reg == 1'b0) & (full_flag_1_vld_in == 1'b1))) begin
        full_flag_1_vld_reg <= 1'b1;
    end else if (((full_flag_1_vld_in == 1'b0) & (full_flag_1_ack_out == 1'b1) & (full_flag_1_vld_reg == 1'b1))) begin
        full_flag_1_vld_reg <= 1'b0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        i1_reg_110 <= i_2_reg_225;
    end else if (((1'b1 == ap_CS_fsm_state7) & (full_flag_1_ack_in == 1'b1))) begin
        i1_reg_110 <= 9'd196;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        i_reg_98 <= i_1_reg_197;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        i_reg_98 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((feature_0_load_A == 1'b1)) begin
        feature_0_payload_A <= feature_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((feature_0_load_B == 1'b1)) begin
        feature_0_payload_B <= feature_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((((full_flag_1_vld_reg == 1'b0) & (full_flag_1_vld_in == 1'b1)) | ((full_flag_1_ack_out == 1'b1) & (full_flag_1_vld_in == 1'b1) & (full_flag_1_vld_reg == 1'b1)))) begin
        full_flag_1_data_reg <= full_flag_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | ((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
        i_1_reg_197 <= i_1_fu_140_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
        i_2_reg_225 <= i_2_fu_188_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((~((1'b1 == ap_block_state8_io) | ((exitcond1_fu_164_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond1_fu_164_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state8)) | (~((1'b1 == ap_block_state2_io) | ((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond6_fu_134_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        reg_122 <= feature_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if ((((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state9)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state3)))) begin
        reg_126 <= feature_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if ((((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state10)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state4)))) begin
        reg_130 <= feature_0_data_out;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        f_Data_address0 = tmp_1_fu_170_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        f_Data_address0 = tmp_fu_146_p1;
    end else begin
        f_Data_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state6) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state11)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state5)))) begin
        f_Data_ce0 = 1'b1;
    end else begin
        f_Data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        f_Data_d0 = tmp_3_fu_175_p5;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        f_Data_d0 = tmp_2_fu_151_p5;
    end else begin
        f_Data_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state11)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state5)))) begin
        f_Data_we0 = 1'b1;
    end else begin
        f_Data_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state11)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state10)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state9)) | (~((1'b1 == ap_block_state8_io) | ((exitcond1_fu_164_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond1_fu_164_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state8)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state4)) | ((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state3)) | (~((1'b1 == ap_block_state2_io) | ((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond6_fu_134_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        feature_0_ack_out = 1'b1;
    end else begin
        feature_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((feature_0_sel == 1'b1)) begin
        feature_0_data_out = feature_0_payload_B;
    end else begin
        feature_0_data_out = feature_0_payload_A;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((exitcond1_fu_164_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state8)) | ((exitcond6_fu_134_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        feature_TDATA_blk_n = feature_0_state[1'd0];
    end else begin
        feature_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((full_flag_1_vld_reg == 1'b0) | ((full_flag_1_ack_out == 1'b1) & (full_flag_1_vld_reg == 1'b1)))) begin
        full_flag_1_ack_in = 1'b1;
    end else begin
        full_flag_1_ack_in = 1'b0;
    end
end

always @ (*) begin
    if ((~((exitcond1_fu_164_p2 == 1'd0) & (feature_0_vld_out == 1'b0)) & (exitcond1_fu_164_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8))) begin
        full_flag_1_data_in = 1'd0;
    end else if ((~((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0)) & (exitcond6_fu_134_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        full_flag_1_data_in = 1'd1;
    end else begin
        full_flag_1_data_in = 'bx;
    end
end

always @ (*) begin
    if (((~((1'b1 == ap_block_state8_io) | ((exitcond1_fu_164_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond1_fu_164_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) | (~((1'b1 == ap_block_state2_io) | ((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond6_fu_134_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        full_flag_1_vld_in = 1'b1;
    end else begin
        full_flag_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state7) | ((exitcond1_fu_164_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) | ((exitcond6_fu_134_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        full_flag_blk_n = full_flag_1_ack_in;
    end else begin
        full_flag_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond6_fu_134_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else if ((~((1'b1 == ap_block_state2_io) | ((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond6_fu_134_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (full_flag_1_ack_in == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if ((~((1'b1 == ap_block_state8_io) | ((exitcond1_fu_164_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond1_fu_164_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else if ((~((1'b1 == ap_block_state8_io) | ((exitcond1_fu_164_p2 == 1'd0) & (feature_0_vld_out == 1'b0))) & (exitcond1_fu_164_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((feature_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state13 : begin
            if (((1'b1 == ap_CS_fsm_state13) & (full_flag_1_ack_in == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state2 = ((exitcond6_fu_134_p2 == 1'd0) & (feature_0_vld_out == 1'b0));
end

always @ (*) begin
    ap_block_state2_io = ((exitcond6_fu_134_p2 == 1'd1) & (full_flag_1_ack_in == 1'b0));
end

always @ (*) begin
    ap_block_state8 = ((exitcond1_fu_164_p2 == 1'd0) & (feature_0_vld_out == 1'b0));
end

always @ (*) begin
    ap_block_state8_io = ((exitcond1_fu_164_p2 == 1'd1) & (full_flag_1_ack_in == 1'b0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign exitcond1_fu_164_p2 = ((i1_reg_110 == 9'd392) ? 1'b1 : 1'b0);

assign exitcond6_fu_134_p2 = ((i_reg_98 == 8'd196) ? 1'b1 : 1'b0);

assign feature_0_ack_in = feature_0_state[1'd1];

assign feature_0_load_A = (feature_0_state_cmp_full & ~feature_0_sel_wr);

assign feature_0_load_B = (feature_0_state_cmp_full & feature_0_sel_wr);

assign feature_0_sel = feature_0_sel_rd;

assign feature_0_state_cmp_full = ((feature_0_state != 2'd1) ? 1'b1 : 1'b0);

assign feature_0_vld_in = feature_TVALID;

assign feature_0_vld_out = feature_0_state[1'd0];

assign feature_TREADY = feature_0_state[1'd1];

assign full_flag = full_flag_1_data_reg;

assign full_flag_1_ack_out = full_flag_ap_ack;

assign full_flag_ap_vld = full_flag_1_vld_reg;

assign i_1_fu_140_p2 = (i_reg_98 + 8'd1);

assign i_2_fu_188_p2 = (i1_reg_110 + 9'd1);

assign tmp_1_fu_170_p1 = i1_reg_110;

assign tmp_2_fu_151_p5 = {{{{feature_0_data_out}, {reg_130}}, {reg_126}}, {reg_122}};

assign tmp_3_fu_175_p5 = {{{{feature_0_data_out}, {reg_130}}, {reg_126}}, {reg_122}};

assign tmp_fu_146_p1 = i_reg_98;

endmodule //Layer1_WriteBRAM
