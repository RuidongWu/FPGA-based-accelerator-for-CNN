// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Layer1_ReadBRAM,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xazu3eg-sfvc784-1-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.677000,HLS_SYN_LAT=474,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=915,HLS_SYN_LUT=552,HLS_VERSION=2018_3}" *)

module Layer1_ReadBRAM (
        ap_clk,
        ap_rst_n,
        full_flag,
        full_flag_ap_vld,
        full_flag_ap_ack,
        f_Data_address0,
        f_Data_ce0,
        f_Data_q0,
        a_Data_TDATA,
        a_Data_TVALID,
        a_Data_TREADY
);

parameter    ap_ST_fsm_state1 = 9'd1;
parameter    ap_ST_fsm_pp0_stage0 = 9'd2;
parameter    ap_ST_fsm_pp0_stage1 = 9'd4;
parameter    ap_ST_fsm_pp0_stage2 = 9'd8;
parameter    ap_ST_fsm_state7 = 9'd16;
parameter    ap_ST_fsm_pp1_stage0 = 9'd32;
parameter    ap_ST_fsm_pp1_stage1 = 9'd64;
parameter    ap_ST_fsm_pp1_stage2 = 9'd128;
parameter    ap_ST_fsm_state13 = 9'd256;

input   ap_clk;
input   ap_rst_n;
input   full_flag;
input   full_flag_ap_vld;
output   full_flag_ap_ack;
output  [5:0] f_Data_address0;
output   f_Data_ce0;
input  [223:0] f_Data_q0;
output  [207:0] a_Data_TDATA;
output   a_Data_TVALID;
input   a_Data_TREADY;

reg full_flag_ap_ack;
reg[5:0] f_Data_address0;
reg f_Data_ce0;

 reg    ap_rst_n_inv;
reg   [207:0] a_Data_1_data_in;
reg   [207:0] a_Data_1_data_out;
reg    a_Data_1_vld_in;
wire    a_Data_1_vld_out;
wire    a_Data_1_ack_in;
wire    a_Data_1_ack_out;
reg   [207:0] a_Data_1_payload_A;
reg   [207:0] a_Data_1_payload_B;
reg    a_Data_1_sel_rd;
reg    a_Data_1_sel_wr;
wire    a_Data_1_sel;
wire    a_Data_1_load_A;
wire    a_Data_1_load_B;
reg   [1:0] a_Data_1_state;
wire    a_Data_1_state_cmp_full;
reg    full_flag_blk_n;
(* fsm_encoding = "none" *) reg   [8:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state7;
reg    a_Data_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage1;
reg   [0:0] exitcond_flatten_reg_342;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_flatten_reg_342_pp0_iter1_reg;
wire    ap_CS_fsm_pp1_stage1;
reg    ap_enable_reg_pp1_iter0;
wire    ap_block_pp1_stage1;
reg   [0:0] exitcond_flatten8_reg_376;
wire    ap_CS_fsm_pp1_stage2;
wire    ap_block_pp1_stage2;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter1;
wire    ap_block_pp1_stage0;
reg   [0:0] exitcond_flatten8_reg_376_pp1_iter1_reg;
reg   [6:0] indvar_flatten_reg_116;
reg   [4:0] rc_reg_127;
reg   [1:0] k_reg_138;
reg   [6:0] indvar_flatten6_reg_149;
reg   [5:0] rc3_reg_160;
reg   [1:0] k4_reg_171;
reg   [207:0] reg_202;
wire    ap_block_state3_pp0_stage1_iter0;
reg    ap_block_state3_io;
wire    ap_block_state6_pp0_stage1_iter1;
reg    ap_block_state6_io;
reg    ap_block_pp0_stage1_11001;
wire    ap_block_state9_pp1_stage1_iter0;
reg    ap_block_state9_io;
wire    ap_block_state12_pp1_stage1_iter1;
reg    ap_block_state12_io;
reg    ap_block_pp1_stage1_11001;
reg   [207:0] reg_207;
wire   [0:0] exitcond_flatten_fu_212_p2;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
reg    ap_block_state5_io;
reg    ap_block_pp0_stage0_11001;
wire   [6:0] indvar_flatten_next_fu_218_p2;
reg   [6:0] indvar_flatten_next_reg_346;
wire   [1:0] k_mid2_fu_230_p3;
reg   [1:0] k_mid2_reg_351;
wire   [4:0] rc_mid2_fu_244_p3;
reg   [4:0] rc_mid2_reg_356;
wire   [207:0] tmp_5_fu_267_p1;
wire   [1:0] k_1_fu_272_p2;
reg   [1:0] k_1_reg_371;
wire    ap_block_state4_pp0_stage2_iter0;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage2_11001;
wire   [0:0] exitcond_flatten8_fu_277_p2;
wire    ap_block_state8_pp1_stage0_iter0;
wire    ap_block_state11_pp1_stage0_iter1;
reg    ap_block_state11_io;
reg    ap_block_pp1_stage0_11001;
wire   [6:0] indvar_flatten_next7_fu_283_p2;
reg   [6:0] indvar_flatten_next7_reg_380;
wire   [1:0] k4_mid2_fu_295_p3;
reg   [1:0] k4_mid2_reg_385;
wire   [5:0] rc3_mid2_fu_309_p3;
reg   [5:0] rc3_mid2_reg_390;
wire   [207:0] tmp_9_fu_332_p1;
wire   [1:0] k_2_fu_337_p2;
reg   [1:0] k_2_reg_405;
wire    ap_block_state10_pp1_stage2_iter0;
reg    ap_block_state10_io;
reg    ap_block_pp1_stage2_11001;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_block_pp0_stage2_subdone;
reg    ap_block_pp0_stage1_subdone;
reg    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state8;
reg    ap_block_pp1_stage2_subdone;
reg    ap_block_pp1_stage1_subdone;
reg   [6:0] ap_phi_mux_indvar_flatten_phi_fu_120_p4;
reg   [4:0] ap_phi_mux_rc_phi_fu_131_p4;
reg   [1:0] ap_phi_mux_k_phi_fu_142_p4;
reg   [6:0] ap_phi_mux_indvar_flatten6_phi_fu_153_p4;
reg   [5:0] ap_phi_mux_rc3_phi_fu_164_p4;
reg   [1:0] ap_phi_mux_k4_phi_fu_175_p4;
wire   [63:0] tmp_1_fu_262_p1;
wire   [63:0] tmp_4_fu_327_p1;
wire    ap_block_pp0_stage1_01001;
wire    ap_block_pp0_stage2_01001;
wire    ap_block_pp0_stage0_01001;
wire    ap_block_pp1_stage1_01001;
wire    ap_block_pp1_stage2_01001;
wire    ap_block_pp1_stage0_01001;
wire   [0:0] exitcond_fu_224_p2;
wire   [4:0] rc_s_fu_238_p2;
wire   [4:0] k_cast7_fu_252_p1;
wire   [4:0] tmp_fu_256_p2;
wire   [0:0] exitcond1_fu_289_p2;
wire   [5:0] rc_1_fu_303_p2;
wire   [5:0] k4_cast6_fu_317_p1;
wire   [5:0] tmp_3_fu_321_p2;
reg   [8:0] ap_NS_fsm;
wire    ap_CS_fsm_state13;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp1;
wire    ap_enable_pp1;

// power-on initialization
initial begin
#0 a_Data_1_sel_rd = 1'b0;
#0 a_Data_1_sel_wr = 1'b0;
#0 a_Data_1_state = 2'd0;
#0 ap_CS_fsm = 9'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        a_Data_1_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == a_Data_1_ack_out) & (1'b1 == a_Data_1_vld_out))) begin
            a_Data_1_sel_rd <= ~a_Data_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        a_Data_1_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == a_Data_1_ack_in) & (1'b1 == a_Data_1_vld_in))) begin
            a_Data_1_sel_wr <= ~a_Data_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        a_Data_1_state <= 2'd0;
    end else begin
        if ((((2'd2 == a_Data_1_state) & (1'b0 == a_Data_1_vld_in)) | ((2'd3 == a_Data_1_state) & (1'b0 == a_Data_1_vld_in) & (1'b1 == a_Data_1_ack_out)))) begin
            a_Data_1_state <= 2'd2;
        end else if ((((2'd1 == a_Data_1_state) & (1'b0 == a_Data_1_ack_out)) | ((2'd3 == a_Data_1_state) & (1'b0 == a_Data_1_ack_out) & (1'b1 == a_Data_1_vld_in)))) begin
            a_Data_1_state <= 2'd1;
        end else if (((~((1'b0 == a_Data_1_vld_in) & (1'b1 == a_Data_1_ack_out)) & ~((1'b0 == a_Data_1_ack_out) & (1'b1 == a_Data_1_vld_in)) & (2'd3 == a_Data_1_state)) | ((2'd1 == a_Data_1_state) & (1'b1 == a_Data_1_ack_out)) | ((2'd2 == a_Data_1_state) & (1'b1 == a_Data_1_vld_in)))) begin
            a_Data_1_state <= 2'd3;
        end else begin
            a_Data_1_state <= 2'd2;
        end
    end
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
        end else if (((1'b1 == ap_CS_fsm_state1) & (full_flag_ap_vld == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (full_flag_ap_vld == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state8) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state7) & (full_flag_ap_vld == 1'b1))) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if ((((1'b0 == ap_block_pp1_stage2_subdone) & (1'b1 == ap_CS_fsm_pp1_stage2)) | ((1'b0 == ap_block_pp1_stage1_subdone) & (1'b1 == ap_CS_fsm_pp1_stage1)))) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if (((1'b1 == ap_CS_fsm_state7) & (full_flag_ap_vld == 1'b1))) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        indvar_flatten6_reg_149 <= indvar_flatten_next7_reg_380;
    end else if (((1'b1 == ap_CS_fsm_state7) & (full_flag_ap_vld == 1'b1))) begin
        indvar_flatten6_reg_149 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_116 <= indvar_flatten_next_reg_346;
    end else if (((1'b1 == ap_CS_fsm_state1) & (full_flag_ap_vld == 1'b1))) begin
        indvar_flatten_reg_116 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        k4_reg_171 <= k_2_reg_405;
    end else if (((1'b1 == ap_CS_fsm_state7) & (full_flag_ap_vld == 1'b1))) begin
        k4_reg_171 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        k_reg_138 <= k_1_reg_371;
    end else if (((1'b1 == ap_CS_fsm_state1) & (full_flag_ap_vld == 1'b1))) begin
        k_reg_138 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        rc3_reg_160 <= rc3_mid2_reg_390;
    end else if (((1'b1 == ap_CS_fsm_state7) & (full_flag_ap_vld == 1'b1))) begin
        rc3_reg_160 <= 6'd28;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rc_reg_127 <= rc_mid2_reg_356;
    end else if (((1'b1 == ap_CS_fsm_state1) & (full_flag_ap_vld == 1'b1))) begin
        rc_reg_127 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == a_Data_1_load_A)) begin
        a_Data_1_payload_A <= a_Data_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == a_Data_1_load_B)) begin
        a_Data_1_payload_B <= a_Data_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        exitcond_flatten8_reg_376 <= exitcond_flatten8_fu_277_p2;
        exitcond_flatten8_reg_376_pp1_iter1_reg <= exitcond_flatten8_reg_376;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exitcond_flatten_reg_342 <= exitcond_flatten_fu_212_p2;
        exitcond_flatten_reg_342_pp0_iter1_reg <= exitcond_flatten_reg_342;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        indvar_flatten_next7_reg_380 <= indvar_flatten_next7_fu_283_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_next_reg_346 <= indvar_flatten_next_fu_218_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten8_fu_277_p2 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        k4_mid2_reg_385 <= k4_mid2_fu_295_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        k_1_reg_371 <= k_1_fu_272_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage2_11001) & (1'b1 == ap_CS_fsm_pp1_stage2) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        k_2_reg_405 <= k_2_fu_337_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_212_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        k_mid2_reg_351 <= k_mid2_fu_230_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten8_fu_277_p2 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        rc3_mid2_reg_390 <= rc3_mid2_fu_309_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_212_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        rc_mid2_reg_356 <= rc_mid2_fu_244_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage1_11001) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage1)) | ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        reg_202 <= {{f_Data_q0[215:8]}};
        reg_207 <= {{f_Data_q0[223:16]}};
    end
end

always @ (*) begin
    if (((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage1_01001) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage1))) begin
        a_Data_1_data_in = tmp_9_fu_332_p1;
    end else if ((((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage0_01001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0)) | ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        a_Data_1_data_in = reg_207;
    end else if ((((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage2_01001) & (1'b1 == ap_CS_fsm_pp1_stage2) & (ap_enable_reg_pp1_iter0 == 1'b1)) | ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage2_01001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        a_Data_1_data_in = reg_202;
    end else if (((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage1_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        a_Data_1_data_in = tmp_5_fu_267_p1;
    end else begin
        a_Data_1_data_in = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == a_Data_1_sel)) begin
        a_Data_1_data_out = a_Data_1_payload_B;
    end else begin
        a_Data_1_data_out = a_Data_1_payload_A;
    end
end

always @ (*) begin
    if ((((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0)) | ((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage2_11001) & (1'b1 == ap_CS_fsm_pp1_stage2) & (ap_enable_reg_pp1_iter0 == 1'b1)) | ((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == ap_block_pp1_stage1_11001) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage1)) | ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        a_Data_1_vld_in = 1'b1;
    end else begin
        a_Data_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((exitcond_flatten8_reg_376 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0)) | ((exitcond_flatten8_reg_376 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage2) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage2)) | ((exitcond_flatten8_reg_376_pp1_iter1_reg == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage1) & (1'b0 == ap_block_pp1_stage1)) | ((exitcond_flatten8_reg_376 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage1) & (1'b0 == ap_block_pp1_stage1)) | ((exitcond_flatten_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((exitcond_flatten_reg_342 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2)) | ((exitcond_flatten_reg_342_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1)) | ((exitcond_flatten_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1)))) begin
        a_Data_TDATA_blk_n = a_Data_1_state[1'd1];
    end else begin
        a_Data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((exitcond_flatten_fu_212_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond_flatten8_fu_277_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state8 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state8 = 1'b0;
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
    if (((exitcond_flatten8_reg_376 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0))) begin
        ap_phi_mux_indvar_flatten6_phi_fu_153_p4 = indvar_flatten_next7_reg_380;
    end else begin
        ap_phi_mux_indvar_flatten6_phi_fu_153_p4 = indvar_flatten6_reg_149;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten_phi_fu_120_p4 = indvar_flatten_next_reg_346;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_120_p4 = indvar_flatten_reg_116;
    end
end

always @ (*) begin
    if (((exitcond_flatten8_reg_376 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0))) begin
        ap_phi_mux_k4_phi_fu_175_p4 = k_2_reg_405;
    end else begin
        ap_phi_mux_k4_phi_fu_175_p4 = k4_reg_171;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_k_phi_fu_142_p4 = k_1_reg_371;
    end else begin
        ap_phi_mux_k_phi_fu_142_p4 = k_reg_138;
    end
end

always @ (*) begin
    if (((exitcond_flatten8_reg_376 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0))) begin
        ap_phi_mux_rc3_phi_fu_164_p4 = rc3_mid2_reg_390;
    end else begin
        ap_phi_mux_rc3_phi_fu_164_p4 = rc3_reg_160;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_rc_phi_fu_131_p4 = rc_mid2_reg_356;
    end else begin
        ap_phi_mux_rc_phi_fu_131_p4 = rc_reg_127;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0))) begin
        f_Data_address0 = tmp_4_fu_327_p1;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        f_Data_address0 = tmp_1_fu_262_p1;
    end else begin
        f_Data_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        f_Data_ce0 = 1'b1;
    end else begin
        f_Data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (full_flag_ap_vld == 1'b1)) | ((1'b1 == ap_CS_fsm_state7) & (full_flag_ap_vld == 1'b1)))) begin
        full_flag_ap_ack = 1'b1;
    end else begin
        full_flag_ap_ack = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) | (1'b1 == ap_CS_fsm_state7))) begin
        full_flag_blk_n = full_flag_ap_vld;
    end else begin
        full_flag_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (full_flag_ap_vld == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_flatten_fu_212_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if (((exitcond_flatten_fu_212_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b0)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (full_flag_ap_vld == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_pp1_stage0 : begin
            if ((~((exitcond_flatten8_fu_277_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1) & (ap_enable_reg_pp1_iter1 == 1'b0)) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage1;
            end else if (((exitcond_flatten8_fu_277_p2 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1) & (ap_enable_reg_pp1_iter1 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_pp1_stage1 : begin
            if ((~((1'b0 == ap_block_pp1_stage1_subdone) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage1) & (ap_enable_reg_pp1_iter0 == 1'b0)) & (1'b0 == ap_block_pp1_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage2;
            end else if (((1'b0 == ap_block_pp1_stage1_subdone) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage1) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage1;
            end
        end
        ap_ST_fsm_pp1_stage2 : begin
            if ((1'b0 == ap_block_pp1_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage2;
            end
        end
        ap_ST_fsm_state13 : begin
            if (((1'b1 == a_Data_1_ack_in) & (a_Data_1_state[1'd0] == 1'b0) & (1'b1 == ap_CS_fsm_state13))) begin
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

assign a_Data_1_ack_in = a_Data_1_state[1'd1];

assign a_Data_1_ack_out = a_Data_TREADY;

assign a_Data_1_load_A = (~a_Data_1_sel_wr & a_Data_1_state_cmp_full);

assign a_Data_1_load_B = (a_Data_1_state_cmp_full & a_Data_1_sel_wr);

assign a_Data_1_sel = a_Data_1_sel_rd;

assign a_Data_1_state_cmp_full = ((a_Data_1_state != 2'd1) ? 1'b1 : 1'b0);

assign a_Data_1_vld_out = a_Data_1_state[1'd0];

assign a_Data_TDATA = a_Data_1_data_out;

assign a_Data_TVALID = a_Data_1_state[1'd0];

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp1_stage1 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_pp1_stage2 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((1'b1 == ap_block_state5_io) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((1'b1 == ap_block_state5_io) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_11001 = (((1'b1 == ap_block_state6_io) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b1 == ap_block_state3_io) & (ap_enable_reg_pp0_iter0 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = (((1'b1 == ap_block_state6_io) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b1 == ap_block_state3_io) & (ap_enable_reg_pp0_iter0 == 1'b1)));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_11001 = ((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = ((1'b1 == ap_block_state4_io) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp1_stage0_11001 = ((1'b1 == ap_block_state11_io) & (ap_enable_reg_pp1_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp1_stage0_subdone = ((1'b1 == ap_block_state11_io) & (ap_enable_reg_pp1_iter1 == 1'b1));
end

assign ap_block_pp1_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage1_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp1_stage1_11001 = (((1'b1 == ap_block_state12_io) & (ap_enable_reg_pp1_iter1 == 1'b1)) | ((1'b1 == ap_block_state9_io) & (ap_enable_reg_pp1_iter0 == 1'b1)));
end

always @ (*) begin
    ap_block_pp1_stage1_subdone = (((1'b1 == ap_block_state12_io) & (ap_enable_reg_pp1_iter1 == 1'b1)) | ((1'b1 == ap_block_state9_io) & (ap_enable_reg_pp1_iter0 == 1'b1)));
end

assign ap_block_pp1_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage2_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp1_stage2_11001 = ((1'b1 == ap_block_state10_io) & (ap_enable_reg_pp1_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp1_stage2_subdone = ((1'b1 == ap_block_state10_io) & (ap_enable_reg_pp1_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_state10_io = ((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state10_pp1_stage2_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state11_io = ((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state11_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state12_io = ((exitcond_flatten8_reg_376_pp1_iter1_reg == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state12_pp1_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_io = ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_io = ((exitcond_flatten_reg_342 == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state5_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_io = ((exitcond_flatten_reg_342_pp0_iter1_reg == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state6_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state9_io = ((exitcond_flatten8_reg_376 == 1'd0) & (1'b0 == a_Data_1_ack_in));
end

assign ap_block_state9_pp1_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign exitcond1_fu_289_p2 = ((ap_phi_mux_k4_phi_fu_175_p4 == 2'd3) ? 1'b1 : 1'b0);

assign exitcond_flatten8_fu_277_p2 = ((ap_phi_mux_indvar_flatten6_phi_fu_153_p4 == 7'd78) ? 1'b1 : 1'b0);

assign exitcond_flatten_fu_212_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_120_p4 == 7'd78) ? 1'b1 : 1'b0);

assign exitcond_fu_224_p2 = ((ap_phi_mux_k_phi_fu_142_p4 == 2'd3) ? 1'b1 : 1'b0);

assign indvar_flatten_next7_fu_283_p2 = (ap_phi_mux_indvar_flatten6_phi_fu_153_p4 + 7'd1);

assign indvar_flatten_next_fu_218_p2 = (ap_phi_mux_indvar_flatten_phi_fu_120_p4 + 7'd1);

assign k4_cast6_fu_317_p1 = k4_mid2_fu_295_p3;

assign k4_mid2_fu_295_p3 = ((exitcond1_fu_289_p2[0:0] === 1'b1) ? 2'd0 : ap_phi_mux_k4_phi_fu_175_p4);

assign k_1_fu_272_p2 = (2'd1 + k_mid2_reg_351);

assign k_2_fu_337_p2 = (2'd1 + k4_mid2_reg_385);

assign k_cast7_fu_252_p1 = k_mid2_fu_230_p3;

assign k_mid2_fu_230_p3 = ((exitcond_fu_224_p2[0:0] === 1'b1) ? 2'd0 : ap_phi_mux_k_phi_fu_142_p4);

assign rc3_mid2_fu_309_p3 = ((exitcond1_fu_289_p2[0:0] === 1'b1) ? rc_1_fu_303_p2 : ap_phi_mux_rc3_phi_fu_164_p4);

assign rc_1_fu_303_p2 = (6'd1 + ap_phi_mux_rc3_phi_fu_164_p4);

assign rc_mid2_fu_244_p3 = ((exitcond_fu_224_p2[0:0] === 1'b1) ? rc_s_fu_238_p2 : ap_phi_mux_rc_phi_fu_131_p4);

assign rc_s_fu_238_p2 = (5'd1 + ap_phi_mux_rc_phi_fu_131_p4);

assign tmp_1_fu_262_p1 = tmp_fu_256_p2;

assign tmp_3_fu_321_p2 = (k4_cast6_fu_317_p1 + rc3_mid2_fu_309_p3);

assign tmp_4_fu_327_p1 = tmp_3_fu_321_p2;

assign tmp_5_fu_267_p1 = f_Data_q0[207:0];

assign tmp_9_fu_332_p1 = f_Data_q0[207:0];

assign tmp_fu_256_p2 = (k_cast7_fu_252_p1 + rc_mid2_fu_244_p3);

endmodule //Layer1_ReadBRAM
