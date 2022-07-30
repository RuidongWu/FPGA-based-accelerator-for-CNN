// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Layer13_WriteAct,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu15eg-ffvb1156-2-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.945500,HLS_SYN_LAT=8196,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=111,HLS_SYN_LUT=590,HLS_VERSION=2018_3}" *)

module Layer13_WriteAct (
        ap_clk,
        ap_rst_n,
        ActDMA_V_TDATA,
        ActDMA_V_TVALID,
        ActDMA_V_TREADY,
        SyncSig_V,
        SyncSig_V_ap_vld,
        SyncSig_V_ap_ack,
        ActBuf_address0,
        ActBuf_ce0,
        ActBuf_we0,
        ActBuf_d0
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst_n;
input  [7:0] ActDMA_V_TDATA;
input   ActDMA_V_TVALID;
output   ActDMA_V_TREADY;
output   SyncSig_V;
output   SyncSig_V_ap_vld;
input   SyncSig_V_ap_ack;
output  [12:0] ActBuf_address0;
output   ActBuf_ce0;
output   ActBuf_we0;
output  [7:0] ActBuf_d0;

reg[12:0] ActBuf_address0;
reg ActBuf_ce0;
reg ActBuf_we0;

 reg    ap_rst_n_inv;
reg   [7:0] ActDMA_V_0_data_out;
wire    ActDMA_V_0_vld_in;
wire    ActDMA_V_0_vld_out;
wire    ActDMA_V_0_ack_in;
reg    ActDMA_V_0_ack_out;
reg   [7:0] ActDMA_V_0_payload_A;
reg   [7:0] ActDMA_V_0_payload_B;
reg    ActDMA_V_0_sel_rd;
reg    ActDMA_V_0_sel_wr;
wire    ActDMA_V_0_sel;
wire    ActDMA_V_0_load_A;
wire    ActDMA_V_0_load_B;
reg   [1:0] ActDMA_V_0_state;
wire    ActDMA_V_0_state_cmp_full;
reg    SyncSig_V_1_data_reg;
reg    SyncSig_V_1_vld_reg;
reg    SyncSig_V_1_vld_in;
reg    SyncSig_V_1_ack_in;
wire    SyncSig_V_1_ack_out;
reg    ActDMA_V_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state5;
reg    SyncSig_V_blk_n;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
wire   [2:0] t_V_2_fu_330_p3;
wire   [2:0] t_V_6_fu_560_p3;
wire   [2:0] t_V_fu_282_p3;
wire   [11:0] grp_fu_393_p2;
wire   [0:0] grp_fu_580_p2;
wire   [0:0] grp_fu_574_p2;
wire   [2:0] t_V_7_fu_485_p3;
wire   [8:0] grp_fu_358_p2;
wire   [11:0] grp_fu_457_p3;
reg   [0:0] exitcond_flatten4_reg_122;
wire    ap_CS_fsm_state1;
wire   [0:0] exitcond_flatten1_fu_586_p2;
reg   [0:0] exitcond1_reg_133;
reg   [8:0] t_V_s_reg_144;
reg   [2:0] t_V_1_reg_155;
reg   [11:0] indvar_flatten_reg_166;
reg   [2:0] t_V9_reg_177;
reg   [11:0] indvar_flatten1_reg_188;
reg   [0:0] exitcond_flatten5_reg_199;
wire   [0:0] exitcond_flatten3_fu_425_p2;
reg   [0:0] exitcond6_reg_210;
reg   [8:0] t_V_3_reg_221;
reg   [2:0] t_V_4_reg_232;
reg   [11:0] indvar_flatten2_reg_243;
reg   [2:0] t_V_5_reg_254;
reg   [11:0] indvar_flatten3_reg_265;
wire   [63:0] tmp_15_cast_fu_382_p1;
wire   [63:0] tmp_23_cast_fu_543_p1;
wire   [2:0] t_V_2_mid_fu_302_p3;
wire   [2:0] r_V_fu_310_p2;
wire   [0:0] not_exitcond_flatten_2_fu_290_p2;
wire   [0:0] exitcond_mid_fu_296_p2;
wire   [0:0] tmp_5_fu_471_p2;
wire   [0:0] exitcond5_mid_fu_451_p2;
wire   [2:0] c_V_fu_276_p2;
wire   [8:0] t_V_5_mid2_fu_477_p3;
wire   [4:0] tmp_8_fu_501_p3;
reg   [8:0] grp_fu_358_p0;
wire   [8:0] t_V_3_mid2_fu_322_p3;
wire   [5:0] tmp_s_fu_513_p2;
wire   [13:0] tmp_fu_364_p3;
wire   [14:0] tmp_14_cast_fu_372_p1;
wire   [14:0] tmp_6_cast_fu_493_p1;
wire   [14:0] tmp_1_fu_376_p2;
wire   [5:0] tmp_18_cast_fu_509_p1;
reg   [11:0] grp_fu_393_p0;
wire   [2:0] t_V_4_mid_fu_437_p3;
wire   [0:0] not_exitcond_flatten_fu_445_p2;
reg   [0:0] grp_fu_457_p0;
wire   [11:0] grp_fu_554_p2;
wire   [0:0] tmp_2_fu_316_p2;
wire   [2:0] c_V_1_fu_431_p2;
wire   [4:0] tmp_4_fu_346_p3;
wire   [5:0] tmp_11_cast_fu_354_p1;
wire   [5:0] tmp_7_cast_fu_342_p1;
wire   [5:0] tmp_6_fu_387_p2;
wire   [5:0] tmp_4_cast_fu_497_p1;
wire   [5:0] tmp_7_fu_519_p2;
wire   [13:0] tmp_10_fu_525_p3;
wire   [14:0] tmp_22_cast_fu_533_p1;
wire   [14:0] tmp_cast_fu_338_p1;
wire   [14:0] tmp_11_fu_537_p2;
reg   [11:0] grp_fu_554_p0;
wire   [2:0] r_V_1_fu_465_p2;
reg   [6:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ActDMA_V_0_sel_rd = 1'b0;
#0 ActDMA_V_0_sel_wr = 1'b0;
#0 ActDMA_V_0_state = 2'd0;
#0 SyncSig_V_1_data_reg = 1'b0;
#0 SyncSig_V_1_vld_reg = 1'b0;
#0 ap_CS_fsm = 7'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == ActDMA_V_0_ack_out) & (1'b1 == ActDMA_V_0_vld_out))) begin
            ActDMA_V_0_sel_rd <= ~ActDMA_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == ActDMA_V_0_ack_in) & (1'b1 == ActDMA_V_0_vld_in))) begin
            ActDMA_V_0_sel_wr <= ~ActDMA_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_0_state <= 2'd0;
    end else begin
        if ((((2'd2 == ActDMA_V_0_state) & (1'b0 == ActDMA_V_0_vld_in)) | ((2'd3 == ActDMA_V_0_state) & (1'b0 == ActDMA_V_0_vld_in) & (1'b1 == ActDMA_V_0_ack_out)))) begin
            ActDMA_V_0_state <= 2'd2;
        end else if ((((2'd1 == ActDMA_V_0_state) & (1'b0 == ActDMA_V_0_ack_out)) | ((2'd3 == ActDMA_V_0_state) & (1'b0 == ActDMA_V_0_ack_out) & (1'b1 == ActDMA_V_0_vld_in)))) begin
            ActDMA_V_0_state <= 2'd1;
        end else if (((~((1'b0 == ActDMA_V_0_vld_in) & (1'b1 == ActDMA_V_0_ack_out)) & ~((1'b0 == ActDMA_V_0_ack_out) & (1'b1 == ActDMA_V_0_vld_in)) & (2'd3 == ActDMA_V_0_state)) | ((2'd1 == ActDMA_V_0_state) & (1'b1 == ActDMA_V_0_ack_out)) | ((2'd2 == ActDMA_V_0_state) & (1'b1 == ActDMA_V_0_vld_in)))) begin
            ActDMA_V_0_state <= 2'd3;
        end else begin
            ActDMA_V_0_state <= 2'd2;
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
    if (((1'b0 == SyncSig_V_1_vld_reg) & (1'b1 == SyncSig_V_1_vld_in))) begin
        SyncSig_V_1_vld_reg <= 1'b1;
    end else if (((1'b0 == SyncSig_V_1_vld_in) & (1'b1 == SyncSig_V_1_ack_out) & (1'b1 == SyncSig_V_1_vld_reg))) begin
        SyncSig_V_1_vld_reg <= 1'b0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
        exitcond1_reg_133 <= grp_fu_580_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        exitcond1_reg_133 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        exitcond6_reg_210 <= grp_fu_580_p2;
    end else if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
        exitcond6_reg_210 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
        exitcond_flatten4_reg_122 <= grp_fu_574_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        exitcond_flatten4_reg_122 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        exitcond_flatten5_reg_199 <= grp_fu_574_p2;
    end else if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
        exitcond_flatten5_reg_199 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
        indvar_flatten1_reg_188 <= grp_fu_393_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        indvar_flatten1_reg_188 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        indvar_flatten2_reg_243 <= grp_fu_457_p3;
    end else if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
        indvar_flatten2_reg_243 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        indvar_flatten3_reg_265 <= grp_fu_393_p2;
    end else if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
        indvar_flatten3_reg_265 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
        indvar_flatten_reg_166 <= grp_fu_457_p3;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        indvar_flatten_reg_166 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V9_reg_177 <= t_V_fu_282_p3;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        t_V9_reg_177 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V_1_reg_155 <= t_V_2_fu_330_p3;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        t_V_1_reg_155 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        t_V_3_reg_221 <= grp_fu_358_p2;
    end else if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
        t_V_3_reg_221 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        t_V_4_reg_232 <= t_V_7_fu_485_p3;
    end else if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
        t_V_4_reg_232 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        t_V_5_reg_254 <= t_V_6_fu_560_p3;
    end else if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
        t_V_5_reg_254 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V_s_reg_144 <= grp_fu_358_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        t_V_s_reg_144 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ActDMA_V_0_load_A)) begin
        ActDMA_V_0_payload_A <= ActDMA_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ActDMA_V_0_load_B)) begin
        ActDMA_V_0_payload_B <= ActDMA_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == SyncSig_V_1_vld_reg) & (1'b1 == SyncSig_V_1_vld_in)) | ((1'b1 == SyncSig_V_1_ack_out) & (1'b1 == SyncSig_V_1_vld_in) & (1'b1 == SyncSig_V_1_vld_reg)))) begin
        SyncSig_V_1_data_reg <= 1'd1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ActBuf_address0 = tmp_23_cast_fu_543_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        ActBuf_address0 = tmp_15_cast_fu_382_p1;
    end else begin
        ActBuf_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5)) | ((1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2)))) begin
        ActBuf_ce0 = 1'b1;
    end else begin
        ActBuf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5)) | ((1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2)))) begin
        ActBuf_we0 = 1'b1;
    end else begin
        ActBuf_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5)) | ((1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2)))) begin
        ActDMA_V_0_ack_out = 1'b1;
    end else begin
        ActDMA_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ActDMA_V_0_sel)) begin
        ActDMA_V_0_data_out = ActDMA_V_0_payload_B;
    end else begin
        ActDMA_V_0_data_out = ActDMA_V_0_payload_A;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2))) begin
        ActDMA_V_TDATA_blk_n = ActDMA_V_0_state[1'd0];
    end else begin
        ActDMA_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == SyncSig_V_1_vld_reg) | ((1'b1 == SyncSig_V_1_ack_out) & (1'b1 == SyncSig_V_1_vld_reg)))) begin
        SyncSig_V_1_ack_in = 1'b1;
    end else begin
        SyncSig_V_1_ack_in = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state6)) | ((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state3)))) begin
        SyncSig_V_1_vld_in = 1'b1;
    end else begin
        SyncSig_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        SyncSig_V_blk_n = SyncSig_V_1_ack_in;
    end else begin
        SyncSig_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_fu_358_p0 = t_V_5_mid2_fu_477_p3;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_fu_358_p0 = t_V_3_mid2_fu_322_p3;
    end else begin
        grp_fu_358_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_fu_393_p0 = indvar_flatten3_reg_265;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_fu_393_p0 = indvar_flatten1_reg_188;
    end else begin
        grp_fu_393_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_fu_457_p0 = exitcond_flatten5_reg_199;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_fu_457_p0 = exitcond_flatten4_reg_122;
    end else begin
        grp_fu_457_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_fu_554_p0 = indvar_flatten2_reg_243;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_fu_554_p0 = indvar_flatten_reg_166;
    end else begin
        grp_fu_554_p0 = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state2 : begin
            if (((exitcond_flatten1_fu_586_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((exitcond_flatten1_fu_586_p2 == 1'd1) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((exitcond_flatten3_fu_425_p2 == 1'd0) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else if (((exitcond_flatten3_fu_425_p2 == 1'd1) & (1'b1 == ActDMA_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ActBuf_d0 = ActDMA_V_0_data_out;

assign ActDMA_V_0_ack_in = ActDMA_V_0_state[1'd1];

assign ActDMA_V_0_load_A = (~ActDMA_V_0_sel_wr & ActDMA_V_0_state_cmp_full);

assign ActDMA_V_0_load_B = (ActDMA_V_0_state_cmp_full & ActDMA_V_0_sel_wr);

assign ActDMA_V_0_sel = ActDMA_V_0_sel_rd;

assign ActDMA_V_0_state_cmp_full = ((ActDMA_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign ActDMA_V_0_vld_in = ActDMA_V_TVALID;

assign ActDMA_V_0_vld_out = ActDMA_V_0_state[1'd0];

assign ActDMA_V_TREADY = ActDMA_V_0_state[1'd1];

assign SyncSig_V = SyncSig_V_1_data_reg;

assign SyncSig_V_1_ack_out = SyncSig_V_ap_ack;

assign SyncSig_V_ap_vld = SyncSig_V_1_vld_reg;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign c_V_1_fu_431_p2 = (t_V_4_mid_fu_437_p3 + 3'd1);

assign c_V_fu_276_p2 = (t_V_2_mid_fu_302_p3 + 3'd1);

assign exitcond5_mid_fu_451_p2 = (not_exitcond_flatten_fu_445_p2 & exitcond1_reg_133);

assign exitcond_flatten1_fu_586_p2 = ((indvar_flatten1_reg_188 == 12'd4095) ? 1'b1 : 1'b0);

assign exitcond_flatten3_fu_425_p2 = ((indvar_flatten3_reg_265 == 12'd4095) ? 1'b1 : 1'b0);

assign exitcond_mid_fu_296_p2 = (not_exitcond_flatten_2_fu_290_p2 & exitcond6_reg_210);

assign grp_fu_358_p2 = (grp_fu_358_p0 + 9'd1);

assign grp_fu_393_p2 = (grp_fu_393_p0 + 12'd1);

assign grp_fu_457_p3 = ((grp_fu_457_p0[0:0] === 1'b1) ? 12'd1 : grp_fu_554_p2);

assign grp_fu_554_p2 = (grp_fu_554_p0 + 12'd1);

assign grp_fu_574_p2 = ((grp_fu_457_p3 == 12'd1024) ? 1'b1 : 1'b0);

assign grp_fu_580_p2 = ((grp_fu_358_p2 == 9'd256) ? 1'b1 : 1'b0);

assign not_exitcond_flatten_2_fu_290_p2 = (exitcond_flatten5_reg_199 ^ 1'd1);

assign not_exitcond_flatten_fu_445_p2 = (exitcond_flatten4_reg_122 ^ 1'd1);

assign r_V_1_fu_465_p2 = (t_V_5_reg_254 + 3'd1);

assign r_V_fu_310_p2 = (t_V9_reg_177 + 3'd1);

assign t_V_2_fu_330_p3 = ((exitcond5_mid_fu_451_p2[0:0] === 1'b1) ? c_V_fu_276_p2 : t_V_2_mid_fu_302_p3);

assign t_V_2_mid_fu_302_p3 = ((exitcond_flatten4_reg_122[0:0] === 1'b1) ? 3'd0 : t_V_1_reg_155);

assign t_V_3_mid2_fu_322_p3 = ((tmp_5_fu_471_p2[0:0] === 1'b1) ? 9'd0 : t_V_s_reg_144);

assign t_V_4_mid_fu_437_p3 = ((exitcond_flatten5_reg_199[0:0] === 1'b1) ? 3'd0 : t_V_4_reg_232);

assign t_V_5_mid2_fu_477_p3 = ((tmp_2_fu_316_p2[0:0] === 1'b1) ? 9'd0 : t_V_3_reg_221);

assign t_V_6_fu_560_p3 = ((exitcond_flatten5_reg_199[0:0] === 1'b1) ? r_V_1_fu_465_p2 : t_V_5_reg_254);

assign t_V_7_fu_485_p3 = ((exitcond_mid_fu_296_p2[0:0] === 1'b1) ? c_V_1_fu_431_p2 : t_V_4_mid_fu_437_p3);

assign t_V_fu_282_p3 = ((exitcond_flatten4_reg_122[0:0] === 1'b1) ? r_V_fu_310_p2 : t_V9_reg_177);

assign tmp_10_fu_525_p3 = {{tmp_7_fu_519_p2}, {8'd0}};

assign tmp_11_cast_fu_354_p1 = tmp_8_fu_501_p3;

assign tmp_11_fu_537_p2 = (tmp_22_cast_fu_533_p1 + tmp_cast_fu_338_p1);

assign tmp_14_cast_fu_372_p1 = tmp_fu_364_p3;

assign tmp_15_cast_fu_382_p1 = tmp_1_fu_376_p2;

assign tmp_18_cast_fu_509_p1 = tmp_4_fu_346_p3;

assign tmp_1_fu_376_p2 = (tmp_14_cast_fu_372_p1 + tmp_6_cast_fu_493_p1);

assign tmp_22_cast_fu_533_p1 = tmp_10_fu_525_p3;

assign tmp_23_cast_fu_543_p1 = tmp_11_fu_537_p2;

assign tmp_2_fu_316_p2 = (exitcond_mid_fu_296_p2 | exitcond_flatten5_reg_199);

assign tmp_4_cast_fu_497_p1 = t_V_7_fu_485_p3;

assign tmp_4_fu_346_p3 = {{t_V_6_fu_560_p3}, {2'd0}};

assign tmp_5_fu_471_p2 = (exitcond_flatten4_reg_122 | exitcond5_mid_fu_451_p2);

assign tmp_6_cast_fu_493_p1 = t_V_3_mid2_fu_322_p3;

assign tmp_6_fu_387_p2 = (tmp_18_cast_fu_509_p1 + 6'd16);

assign tmp_7_cast_fu_342_p1 = t_V_2_fu_330_p3;

assign tmp_7_fu_519_p2 = (tmp_6_fu_387_p2 + tmp_4_cast_fu_497_p1);

assign tmp_8_fu_501_p3 = {{t_V_fu_282_p3}, {2'd0}};

assign tmp_cast_fu_338_p1 = t_V_5_mid2_fu_477_p3;

assign tmp_fu_364_p3 = {{tmp_s_fu_513_p2}, {8'd0}};

assign tmp_s_fu_513_p2 = (tmp_11_cast_fu_354_p1 + tmp_7_cast_fu_342_p1);

endmodule //Layer13_WriteAct