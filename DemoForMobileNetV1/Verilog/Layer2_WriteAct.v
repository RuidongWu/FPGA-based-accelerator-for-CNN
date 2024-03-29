// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Layer2_WriteAct,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu15eg-ffvb1156-2-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.822000,HLS_SYN_LAT=65730,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=101,HLS_SYN_LUT=340,HLS_VERSION=2018_3}" *)

module Layer2_WriteAct (
        ap_clk,
        ap_rst_n,
        ActDMA_V_V_TDATA,
        ActDMA_V_V_TVALID,
        ActDMA_V_V_TREADY,
        SyncSig_V,
        SyncSig_V_ap_vld,
        SyncSig_V_ap_ack,
        ActBuf_Data_V_address0,
        ActBuf_Data_V_ce0,
        ActBuf_Data_V_we0,
        ActBuf_Data_V_d0
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst_n;
input  [7:0] ActDMA_V_V_TDATA;
input   ActDMA_V_V_TVALID;
output   ActDMA_V_V_TREADY;
output   SyncSig_V;
output   SyncSig_V_ap_vld;
input   SyncSig_V_ap_ack;
output  [10:0] ActBuf_Data_V_address0;
output   ActBuf_Data_V_ce0;
output   ActBuf_Data_V_we0;
output  [31:0] ActBuf_Data_V_d0;

reg ActBuf_Data_V_ce0;
reg ActBuf_Data_V_we0;

 reg    ap_rst_n_inv;
reg   [7:0] ActDMA_V_V_0_data_out;
wire    ActDMA_V_V_0_vld_in;
wire    ActDMA_V_V_0_vld_out;
wire    ActDMA_V_V_0_ack_in;
reg    ActDMA_V_V_0_ack_out;
reg   [7:0] ActDMA_V_V_0_payload_A;
reg   [7:0] ActDMA_V_V_0_payload_B;
reg    ActDMA_V_V_0_sel_rd;
reg    ActDMA_V_V_0_sel_wr;
wire    ActDMA_V_V_0_sel;
wire    ActDMA_V_V_0_load_A;
wire    ActDMA_V_V_0_load_B;
reg   [1:0] ActDMA_V_V_0_state;
wire    ActDMA_V_V_0_state_cmp_full;
reg    SyncSig_V_1_data_reg;
reg    SyncSig_V_1_vld_reg;
reg    SyncSig_V_1_vld_in;
reg    SyncSig_V_1_ack_in;
wire    SyncSig_V_1_ack_out;
reg    ActDMA_V_V_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg    SyncSig_V_blk_n;
wire    ap_CS_fsm_state7;
wire   [0:0] demorgan_fu_337_p2;
wire    ap_CS_fsm_state8;
reg   [0:0] demorgan_reg_404;
wire   [0:0] tmp_fu_343_p2;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire   [2:0] t_V_3_mid2_fu_213_p3;
reg   [2:0] t_V_3_mid2_reg_354;
wire   [6:0] t_V_fu_205_p3;
reg   [6:0] t_V_reg_360;
reg   [7:0] reg_366;
wire   [2:0] t_V_3_fu_309_p3;
reg    ap_block_state7_io;
reg   [7:0] tmp_V_1_reg_371;
reg   [7:0] tmp_V_2_reg_376;
wire   [2:0] t_V_5_fu_239_p2;
wire   [7:0] indvar_flatten_next_fu_279_p2;
wire   [0:0] exitcond_fu_291_p2;
wire   [5:0] p_Val2_s_fu_199_p2;
reg   [5:0] p_Val2_s_reg_399;
wire    ap_CS_fsm_state2;
reg   [2:0] t_V6_reg_125;
wire    ap_CS_fsm_state1;
reg    ap_block_state8_io;
reg   [5:0] p_Val2_5_reg_137;
reg   [0:0] exitcond4_reg_149;
wire   [0:0] exitcond_flatten_fu_285_p2;
reg   [2:0] t_V_s_reg_160;
reg   [6:0] t_V_1_reg_171;
reg   [7:0] indvar_flatten1_reg_182;
wire   [63:0] tmp_15_cast_fu_259_p1;
wire   [6:0] c_V_fu_193_p2;
wire   [8:0] tmp_3_fu_264_p3;
wire   [9:0] tmp_s_fu_274_p2;
wire   [11:0] tmp_cast_fu_224_p1;
wire   [11:0] tmp_14_cast_fu_245_p3;
wire   [11:0] tmp_1_fu_253_p2;
wire   [9:0] tmp_9_cast_fu_221_p1;
wire   [9:0] tmp_10_cast_fu_235_p1;
wire   [4:0] tmp_4_fu_317_p4;
wire   [0:0] tmp_5_fu_327_p2;
wire   [2:0] rRow_V_fu_297_p2;
wire   [0:0] tmp_6_fu_333_p1;
wire   [0:0] icmp_fu_303_p2;
reg   [9:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ActDMA_V_V_0_sel_rd = 1'b0;
#0 ActDMA_V_V_0_sel_wr = 1'b0;
#0 ActDMA_V_V_0_state = 2'd0;
#0 SyncSig_V_1_data_reg = 1'b0;
#0 SyncSig_V_1_vld_reg = 1'b0;
#0 ap_CS_fsm = 10'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == ActDMA_V_V_0_ack_out) & (1'b1 == ActDMA_V_V_0_vld_out))) begin
            ActDMA_V_V_0_sel_rd <= ~ActDMA_V_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == ActDMA_V_V_0_ack_in) & (1'b1 == ActDMA_V_V_0_vld_in))) begin
            ActDMA_V_V_0_sel_wr <= ~ActDMA_V_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_V_0_state <= 2'd0;
    end else begin
        if ((((2'd2 == ActDMA_V_V_0_state) & (1'b0 == ActDMA_V_V_0_vld_in)) | ((2'd3 == ActDMA_V_V_0_state) & (1'b0 == ActDMA_V_V_0_vld_in) & (1'b1 == ActDMA_V_V_0_ack_out)))) begin
            ActDMA_V_V_0_state <= 2'd2;
        end else if ((((2'd1 == ActDMA_V_V_0_state) & (1'b0 == ActDMA_V_V_0_ack_out)) | ((2'd3 == ActDMA_V_V_0_state) & (1'b0 == ActDMA_V_V_0_ack_out) & (1'b1 == ActDMA_V_V_0_vld_in)))) begin
            ActDMA_V_V_0_state <= 2'd1;
        end else if (((~((1'b0 == ActDMA_V_V_0_vld_in) & (1'b1 == ActDMA_V_V_0_ack_out)) & ~((1'b0 == ActDMA_V_V_0_ack_out) & (1'b1 == ActDMA_V_V_0_vld_in)) & (2'd3 == ActDMA_V_V_0_state)) | ((2'd1 == ActDMA_V_V_0_state) & (1'b1 == ActDMA_V_V_0_ack_out)) | ((2'd2 == ActDMA_V_V_0_state) & (1'b1 == ActDMA_V_V_0_vld_in)))) begin
            ActDMA_V_V_0_state <= 2'd3;
        end else begin
            ActDMA_V_V_0_state <= 2'd2;
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
    if (((exitcond_flatten_fu_285_p2 == 1'd0) & (1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
        exitcond4_reg_149 <= exitcond_fu_291_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        exitcond4_reg_149 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_285_p2 == 1'd0) & (1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
        indvar_flatten1_reg_182 <= indvar_flatten_next_fu_279_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten1_reg_182 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_343_p2 == 1'd0) & (1'b0 == ap_block_state8_io) & (1'b1 == ap_CS_fsm_state8))) begin
        p_Val2_5_reg_137 <= p_Val2_s_reg_399;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        p_Val2_5_reg_137 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state7) & (1'b0 == ap_block_state7_io))) begin
        reg_366 <= t_V_3_fu_309_p3;
    end else if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
        reg_366 <= ActDMA_V_V_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_343_p2 == 1'd0) & (1'b0 == ap_block_state8_io) & (1'b1 == ap_CS_fsm_state8))) begin
        t_V6_reg_125 <= reg_366;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        t_V6_reg_125 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_285_p2 == 1'd0) & (1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
        t_V_1_reg_171 <= t_V_reg_360;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        t_V_1_reg_171 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_285_p2 == 1'd0) & (1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
        t_V_s_reg_160 <= t_V_5_fu_239_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        t_V_s_reg_160 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ActDMA_V_V_0_load_A)) begin
        ActDMA_V_V_0_payload_A <= ActDMA_V_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ActDMA_V_V_0_load_B)) begin
        ActDMA_V_V_0_payload_B <= ActDMA_V_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b1 == SyncSig_V_1_ack_out) & (1'b1 == SyncSig_V_1_vld_in) & (1'b1 == SyncSig_V_1_vld_reg)) | ((1'b0 == SyncSig_V_1_vld_reg) & (1'b1 == SyncSig_V_1_vld_in)))) begin
        SyncSig_V_1_data_reg <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state7) & (1'b0 == ap_block_state7_io))) begin
        demorgan_reg_404 <= demorgan_fu_337_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_Val2_s_reg_399 <= p_Val2_s_fu_199_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
        t_V_3_mid2_reg_354 <= t_V_3_mid2_fu_213_p3;
        t_V_reg_360 <= t_V_fu_205_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state4))) begin
        tmp_V_1_reg_371 <= ActDMA_V_V_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
        tmp_V_2_reg_376 <= ActDMA_V_V_0_data_out;
    end
end

always @ (*) begin
    if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
        ActBuf_Data_V_ce0 = 1'b1;
    end else begin
        ActBuf_Data_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
        ActBuf_Data_V_we0 = 1'b1;
    end else begin
        ActBuf_Data_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6)) | ((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5)) | ((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state4)) | ((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3)))) begin
        ActDMA_V_V_0_ack_out = 1'b1;
    end else begin
        ActDMA_V_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ActDMA_V_V_0_sel)) begin
        ActDMA_V_V_0_data_out = ActDMA_V_V_0_payload_B;
    end else begin
        ActDMA_V_V_0_data_out = ActDMA_V_V_0_payload_A;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        ActDMA_V_V_TDATA_blk_n = ActDMA_V_V_0_state[1'd0];
    end else begin
        ActDMA_V_V_TDATA_blk_n = 1'b1;
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
    if ((((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state9)) | ((tmp_fu_343_p2 == 1'd1) & (1'b0 == ap_block_state8_io) & (1'b1 == ap_CS_fsm_state8)) | ((demorgan_fu_337_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state7) & (1'b0 == ap_block_state7_io)))) begin
        SyncSig_V_1_vld_in = 1'b1;
    end else begin
        SyncSig_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state9) | ((tmp_fu_343_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) | ((demorgan_reg_404 == 1'd0) & (1'b1 == ap_CS_fsm_state8)) | ((demorgan_fu_337_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state7)))) begin
        SyncSig_V_blk_n = SyncSig_V_1_ack_in;
    end else begin
        SyncSig_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((exitcond_flatten_fu_285_p2 == 1'd0) & (1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if (((exitcond_flatten_fu_285_p2 == 1'd1) & (1'b1 == ActDMA_V_V_0_vld_out) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (1'b0 == ap_block_state7_io))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((tmp_fu_343_p2 == 1'd1) & (1'b0 == ap_block_state8_io) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else if (((tmp_fu_343_p2 == 1'd0) & (1'b0 == ap_block_state8_io) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ActBuf_Data_V_address0 = tmp_15_cast_fu_259_p1;

assign ActBuf_Data_V_d0 = {{{{ActDMA_V_V_0_data_out}, {tmp_V_2_reg_376}}, {tmp_V_1_reg_371}}, {reg_366}};

assign ActDMA_V_V_0_ack_in = ActDMA_V_V_0_state[1'd1];

assign ActDMA_V_V_0_load_A = (~ActDMA_V_V_0_sel_wr & ActDMA_V_V_0_state_cmp_full);

assign ActDMA_V_V_0_load_B = (ActDMA_V_V_0_state_cmp_full & ActDMA_V_V_0_sel_wr);

assign ActDMA_V_V_0_sel = ActDMA_V_V_0_sel_rd;

assign ActDMA_V_V_0_state_cmp_full = ((ActDMA_V_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign ActDMA_V_V_0_vld_in = ActDMA_V_V_TVALID;

assign ActDMA_V_V_0_vld_out = ActDMA_V_V_0_state[1'd0];

assign ActDMA_V_V_TREADY = ActDMA_V_V_0_state[1'd1];

assign SyncSig_V = SyncSig_V_1_data_reg;

assign SyncSig_V_1_ack_out = SyncSig_V_ap_ack;

assign SyncSig_V_ap_vld = SyncSig_V_1_vld_reg;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state7_io = ((demorgan_fu_337_p2 == 1'd0) & (1'b0 == SyncSig_V_1_ack_in));
end

always @ (*) begin
    ap_block_state8_io = (((tmp_fu_343_p2 == 1'd1) & (1'b0 == SyncSig_V_1_ack_in)) | ((demorgan_reg_404 == 1'd0) & (1'b0 == SyncSig_V_1_ack_in)));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign c_V_fu_193_p2 = (t_V_1_reg_171 + 7'd1);

assign demorgan_fu_337_p2 = (tmp_6_fu_333_p1 | icmp_fu_303_p2);

assign exitcond_flatten_fu_285_p2 = ((indvar_flatten1_reg_182 == 8'd255) ? 1'b1 : 1'b0);

assign exitcond_fu_291_p2 = ((t_V_5_fu_239_p2 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_fu_303_p2 = ((tmp_4_fu_317_p4 == 5'd0) ? 1'b1 : 1'b0);

assign indvar_flatten_next_fu_279_p2 = (indvar_flatten1_reg_182 + 8'd1);

assign p_Val2_s_fu_199_p2 = (p_Val2_5_reg_137 + 6'd1);

assign rRow_V_fu_297_p2 = (3'd1 + t_V6_reg_125);

assign t_V_3_fu_309_p3 = ((tmp_5_fu_327_p2[0:0] === 1'b1) ? 3'd0 : rRow_V_fu_297_p2);

assign t_V_3_mid2_fu_213_p3 = ((exitcond4_reg_149[0:0] === 1'b1) ? 3'd0 : t_V_s_reg_160);

assign t_V_5_fu_239_p2 = (t_V_3_mid2_reg_354 + 3'd1);

assign t_V_fu_205_p3 = ((exitcond4_reg_149[0:0] === 1'b1) ? c_V_fu_193_p2 : t_V_1_reg_171);

assign tmp_10_cast_fu_235_p1 = tmp_3_fu_264_p3;

assign tmp_14_cast_fu_245_p3 = {{tmp_s_fu_274_p2}, {2'd0}};

assign tmp_15_cast_fu_259_p1 = tmp_1_fu_253_p2;

assign tmp_1_fu_253_p2 = (tmp_cast_fu_224_p1 + tmp_14_cast_fu_245_p3);

assign tmp_3_fu_264_p3 = {{t_V6_reg_125}, {6'd0}};

assign tmp_4_fu_317_p4 = {{p_Val2_5_reg_137[5:1]}};

assign tmp_5_fu_327_p2 = ((rRow_V_fu_297_p2 == 3'd6) ? 1'b1 : 1'b0);

assign tmp_6_fu_333_p1 = p_Val2_5_reg_137[0:0];

assign tmp_9_cast_fu_221_p1 = t_V_reg_360;

assign tmp_cast_fu_224_p1 = t_V_3_mid2_reg_354;

assign tmp_fu_343_p2 = ((p_Val2_5_reg_137 == 6'd63) ? 1'b1 : 1'b0);

assign tmp_s_fu_274_p2 = (tmp_9_cast_fu_221_p1 + tmp_10_cast_fu_235_p1);

endmodule //Layer2_WriteAct
