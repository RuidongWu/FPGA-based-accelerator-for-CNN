// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Layer2_WriteBRAM,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xazu3eg-sfvc784-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.352000,HLS_SYN_LAT=344,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=170,HLS_SYN_LUT=336,HLS_VERSION=2018_3}" *)

module Layer2_WriteBRAM (
        ap_clk,
        ap_rst_n,
        feature_Data_TDATA,
        feature_Data_TVALID,
        feature_Data_TREADY,
        f_Data_address0,
        f_Data_ce0,
        f_Data_we0,
        f_Data_d0,
        full_flag,
        full_flag_ap_vld,
        full_flag_ap_ack
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_pp0_stage0 = 7'd2;
parameter    ap_ST_fsm_state4 = 7'd4;
parameter    ap_ST_fsm_state5 = 7'd8;
parameter    ap_ST_fsm_pp1_stage0 = 7'd16;
parameter    ap_ST_fsm_state8 = 7'd32;
parameter    ap_ST_fsm_state9 = 7'd64;

input   ap_clk;
input   ap_rst_n;
input  [63:0] feature_Data_TDATA;
input   feature_Data_TVALID;
output   feature_Data_TREADY;
output  [8:0] f_Data_address0;
output   f_Data_ce0;
output   f_Data_we0;
output  [63:0] f_Data_d0;
output   full_flag;
output   full_flag_ap_vld;
input   full_flag_ap_ack;

reg[8:0] f_Data_address0;
reg f_Data_ce0;
reg f_Data_we0;

 reg    ap_rst_n_inv;
reg   [63:0] feature_Data_0_data_out;
wire    feature_Data_0_vld_in;
wire    feature_Data_0_vld_out;
wire    feature_Data_0_ack_in;
reg    feature_Data_0_ack_out;
reg   [63:0] feature_Data_0_payload_A;
reg   [63:0] feature_Data_0_payload_B;
reg    feature_Data_0_sel_rd;
reg    feature_Data_0_sel_wr;
wire    feature_Data_0_sel;
wire    feature_Data_0_load_A;
wire    feature_Data_0_load_B;
reg   [1:0] feature_Data_0_state;
wire    feature_Data_0_state_cmp_full;
reg    full_flag_1_data_reg;
reg    full_flag_1_data_in;
reg    full_flag_1_vld_reg;
reg    full_flag_1_vld_in;
reg    full_flag_1_ack_in;
wire    full_flag_1_ack_out;
reg    feature_Data_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] exitcond5_fu_145_p2;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter0;
wire    ap_block_pp1_stage0;
wire   [0:0] exitcond3_fu_162_p2;
reg    full_flag_blk_n;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
reg   [7:0] i_reg_107;
reg   [8:0] i1_reg_118;
reg   [7:0] p_1_rec_reg_129;
reg    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg    ap_block_state6_pp1_stage0_iter0;
wire    ap_block_state7_pp1_stage0_iter1;
reg    ap_block_pp1_stage0_11001;
wire   [7:0] i_1_fu_151_p2;
wire   [7:0] p_rec_fu_168_p2;
wire   [8:0] i_2_fu_179_p2;
wire    ap_CS_fsm_state1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
reg    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state6;
reg    ap_enable_reg_pp1_iter1;
wire   [63:0] p_0_rec_cast_fu_157_p1;
wire   [63:0] tmp_2_fu_174_p1;
reg   [6:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp1;
wire    ap_enable_pp1;

// power-on initialization
initial begin
#0 feature_Data_0_sel_rd = 1'b0;
#0 feature_Data_0_sel_wr = 1'b0;
#0 feature_Data_0_state = 2'd0;
#0 full_flag_1_data_reg = 1'b0;
#0 full_flag_1_vld_reg = 1'b0;
#0 ap_CS_fsm = 7'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
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
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state1)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state6) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state6))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state6);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        feature_Data_0_sel_rd <= 1'b0;
    end else begin
        if (((feature_Data_0_ack_out == 1'b1) & (feature_Data_0_vld_out == 1'b1))) begin
            feature_Data_0_sel_rd <= ~feature_Data_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        feature_Data_0_sel_wr <= 1'b0;
    end else begin
        if (((feature_Data_0_ack_in == 1'b1) & (feature_Data_0_vld_in == 1'b1))) begin
            feature_Data_0_sel_wr <= ~feature_Data_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        feature_Data_0_state <= 2'd0;
    end else begin
        if ((((feature_Data_0_state == 2'd2) & (feature_Data_0_vld_in == 1'b0)) | ((feature_Data_0_state == 2'd3) & (feature_Data_0_vld_in == 1'b0) & (feature_Data_0_ack_out == 1'b1)))) begin
            feature_Data_0_state <= 2'd2;
        end else if ((((feature_Data_0_state == 2'd1) & (feature_Data_0_ack_out == 1'b0)) | ((feature_Data_0_state == 2'd3) & (feature_Data_0_ack_out == 1'b0) & (feature_Data_0_vld_in == 1'b1)))) begin
            feature_Data_0_state <= 2'd1;
        end else if (((~((feature_Data_0_vld_in == 1'b0) & (feature_Data_0_ack_out == 1'b1)) & ~((feature_Data_0_ack_out == 1'b0) & (feature_Data_0_vld_in == 1'b1)) & (feature_Data_0_state == 2'd3)) | ((feature_Data_0_state == 2'd1) & (feature_Data_0_ack_out == 1'b1)) | ((feature_Data_0_state == 2'd2) & (feature_Data_0_vld_in == 1'b1)))) begin
            feature_Data_0_state <= 2'd3;
        end else begin
            feature_Data_0_state <= 2'd2;
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
    if (((exitcond3_fu_162_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        i1_reg_118 <= i_2_fu_179_p2;
    end else if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        i1_reg_118 <= 9'd169;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond5_fu_145_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_reg_107 <= i_1_fu_151_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        i_reg_107 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond3_fu_162_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        p_1_rec_reg_129 <= p_rec_fu_168_p2;
    end else if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        p_1_rec_reg_129 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((feature_Data_0_load_A == 1'b1)) begin
        feature_Data_0_payload_A <= feature_Data_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((feature_Data_0_load_B == 1'b1)) begin
        feature_Data_0_payload_B <= feature_Data_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((((full_flag_1_vld_reg == 1'b0) & (full_flag_1_vld_in == 1'b1)) | ((full_flag_1_ack_out == 1'b1) & (full_flag_1_vld_in == 1'b1) & (full_flag_1_vld_reg == 1'b1)))) begin
        full_flag_1_data_reg <= full_flag_1_data_in;
    end
end

always @ (*) begin
    if ((exitcond5_fu_145_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond3_fu_162_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state6 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state6 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0))) begin
        f_Data_address0 = tmp_2_fu_174_p1;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        f_Data_address0 = p_0_rec_cast_fu_157_p1;
    end else begin
        f_Data_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)) | ((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        f_Data_ce0 = 1'b1;
    end else begin
        f_Data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((exitcond3_fu_162_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)) | ((exitcond5_fu_145_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        f_Data_we0 = 1'b1;
    end else begin
        f_Data_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((exitcond3_fu_162_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)) | ((exitcond5_fu_145_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        feature_Data_0_ack_out = 1'b1;
    end else begin
        feature_Data_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((feature_Data_0_sel == 1'b1)) begin
        feature_Data_0_data_out = feature_Data_0_payload_B;
    end else begin
        feature_Data_0_data_out = feature_Data_0_payload_A;
    end
end

always @ (*) begin
    if ((((exitcond3_fu_162_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0)) | ((exitcond5_fu_145_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        feature_Data_TDATA_blk_n = feature_Data_0_state[1'd0];
    end else begin
        feature_Data_TDATA_blk_n = 1'b1;
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
    if ((1'b1 == ap_CS_fsm_state8)) begin
        full_flag_1_data_in = 1'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        full_flag_1_data_in = 1'd1;
    end else begin
        full_flag_1_data_in = 'bx;
    end
end

always @ (*) begin
    if ((((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state8)) | ((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state4)))) begin
        full_flag_1_vld_in = 1'b1;
    end else begin
        full_flag_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        full_flag_blk_n = full_flag_1_ack_in;
    end else begin
        full_flag_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((exitcond5_fu_145_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((exitcond5_fu_145_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((exitcond3_fu_162_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((exitcond3_fu_162_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((full_flag_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd6];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((exitcond5_fu_145_p2 == 1'd0) & (feature_Data_0_vld_out == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((exitcond5_fu_145_p2 == 1'd0) & (feature_Data_0_vld_out == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp1_stage0_11001 = ((exitcond3_fu_162_p2 == 1'd0) & (feature_Data_0_vld_out == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp1_stage0_subdone = ((exitcond3_fu_162_p2 == 1'd0) & (feature_Data_0_vld_out == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter0 = ((exitcond5_fu_145_p2 == 1'd0) & (feature_Data_0_vld_out == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_pp1_stage0_iter0 = ((exitcond3_fu_162_p2 == 1'd0) & (feature_Data_0_vld_out == 1'b0));
end

assign ap_block_state7_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign exitcond3_fu_162_p2 = ((p_1_rec_reg_129 == 8'd169) ? 1'b1 : 1'b0);

assign exitcond5_fu_145_p2 = ((i_reg_107 == 8'd169) ? 1'b1 : 1'b0);

assign f_Data_d0 = feature_Data_0_data_out;

assign feature_Data_0_ack_in = feature_Data_0_state[1'd1];

assign feature_Data_0_load_A = (feature_Data_0_state_cmp_full & ~feature_Data_0_sel_wr);

assign feature_Data_0_load_B = (feature_Data_0_state_cmp_full & feature_Data_0_sel_wr);

assign feature_Data_0_sel = feature_Data_0_sel_rd;

assign feature_Data_0_state_cmp_full = ((feature_Data_0_state != 2'd1) ? 1'b1 : 1'b0);

assign feature_Data_0_vld_in = feature_Data_TVALID;

assign feature_Data_0_vld_out = feature_Data_0_state[1'd0];

assign feature_Data_TREADY = feature_Data_0_state[1'd1];

assign full_flag = full_flag_1_data_reg;

assign full_flag_1_ack_out = full_flag_ap_ack;

assign full_flag_ap_vld = full_flag_1_vld_reg;

assign i_1_fu_151_p2 = (i_reg_107 + 8'd1);

assign i_2_fu_179_p2 = (i1_reg_118 + 9'd1);

assign p_0_rec_cast_fu_157_p1 = i_reg_107;

assign p_rec_fu_168_p2 = (p_1_rec_reg_129 + 8'd1);

assign tmp_2_fu_174_p1 = i1_reg_118;

endmodule //Layer2_WriteBRAM
