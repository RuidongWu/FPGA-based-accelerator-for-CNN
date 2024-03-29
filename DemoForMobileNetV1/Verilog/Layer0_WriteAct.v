// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Layer0_WriteAct,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu15eg-ffvb1156-2-i,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.024000,HLS_SYN_LAT=16770,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=105,HLS_SYN_LUT=232,HLS_VERSION=2018_3}" *)

module Layer0_WriteAct (
        ap_clk,
        ap_rst_n,
        ActDMA_V_Data_V_TDATA,
        ActDMA_V_Data_V_TVALID,
        ActDMA_V_Data_V_TREADY,
        SyncSig_V,
        SyncSig_V_ap_vld,
        SyncSig_V_ap_ack,
        ActBuf_Data_V_address0,
        ActBuf_Data_V_ce0,
        ActBuf_Data_V_we0,
        ActBuf_Data_V_d0
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
input  [31:0] ActDMA_V_Data_V_TDATA;
input   ActDMA_V_Data_V_TVALID;
output   ActDMA_V_Data_V_TREADY;
output   SyncSig_V;
output   SyncSig_V_ap_vld;
input   SyncSig_V_ap_ack;
output  [9:0] ActBuf_Data_V_address0;
output   ActBuf_Data_V_ce0;
output   ActBuf_Data_V_we0;
output  [31:0] ActBuf_Data_V_d0;

reg ActBuf_Data_V_ce0;
reg ActBuf_Data_V_we0;

 reg    ap_rst_n_inv;
reg   [31:0] ActDMA_V_Data_V_0_data_out;
wire    ActDMA_V_Data_V_0_vld_in;
wire    ActDMA_V_Data_V_0_vld_out;
wire    ActDMA_V_Data_V_0_ack_in;
reg    ActDMA_V_Data_V_0_ack_out;
reg   [31:0] ActDMA_V_Data_V_0_payload_A;
reg   [31:0] ActDMA_V_Data_V_0_payload_B;
reg    ActDMA_V_Data_V_0_sel_rd;
reg    ActDMA_V_Data_V_0_sel_wr;
wire    ActDMA_V_Data_V_0_sel;
wire    ActDMA_V_Data_V_0_load_A;
wire    ActDMA_V_Data_V_0_load_B;
reg   [1:0] ActDMA_V_Data_V_0_state;
wire    ActDMA_V_Data_V_0_state_cmp_full;
reg    SyncSig_V_1_data_reg;
reg    SyncSig_V_1_vld_reg;
reg    SyncSig_V_1_vld_in;
reg    SyncSig_V_1_ack_in;
wire    SyncSig_V_1_ack_out;
reg    ActDMA_V_Data_V_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state3;
reg    SyncSig_V_blk_n;
wire    ap_CS_fsm_state4;
wire   [0:0] demorgan_fu_222_p2;
wire    ap_CS_fsm_state5;
reg   [0:0] demorgan_reg_252;
wire   [0:0] exitcond1_fu_176_p2;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
wire   [6:0] t_V_2_fu_159_p2;
wire   [6:0] p_Val2_s_fu_137_p2;
reg   [6:0] p_Val2_s_reg_244;
wire    ap_CS_fsm_state2;
wire   [2:0] t_V_fu_194_p3;
reg   [2:0] t_V_reg_247;
reg    ap_block_state4_io;
reg   [2:0] t_V3_reg_102;
wire    ap_CS_fsm_state1;
reg    ap_block_state5_io;
reg   [6:0] p_Val2_2_reg_114;
reg   [6:0] t_V_s_reg_126;
wire   [0:0] exitcond_fu_228_p2;
wire   [63:0] tmp_10_cast_fu_165_p1;
wire   [9:0] tmp_5_fu_147_p3;
wire   [10:0] tmp_s_fu_170_p2;
wire   [10:0] tmp_7_cast_fu_143_p1;
wire   [10:0] tmp_8_cast_fu_155_p1;
wire   [5:0] tmp_fu_202_p4;
wire   [0:0] tmp_3_fu_212_p2;
wire   [2:0] rRow_V_fu_182_p2;
wire   [0:0] tmp_1_fu_218_p1;
wire   [0:0] icmp_fu_188_p2;
reg   [6:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ActDMA_V_Data_V_0_sel_rd = 1'b0;
#0 ActDMA_V_Data_V_0_sel_wr = 1'b0;
#0 ActDMA_V_Data_V_0_state = 2'd0;
#0 SyncSig_V_1_data_reg = 1'b0;
#0 SyncSig_V_1_vld_reg = 1'b0;
#0 ap_CS_fsm = 7'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_Data_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == ActDMA_V_Data_V_0_ack_out) & (1'b1 == ActDMA_V_Data_V_0_vld_out))) begin
            ActDMA_V_Data_V_0_sel_rd <= ~ActDMA_V_Data_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_Data_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == ActDMA_V_Data_V_0_ack_in) & (1'b1 == ActDMA_V_Data_V_0_vld_in))) begin
            ActDMA_V_Data_V_0_sel_wr <= ~ActDMA_V_Data_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ActDMA_V_Data_V_0_state <= 2'd0;
    end else begin
        if ((((2'd2 == ActDMA_V_Data_V_0_state) & (1'b0 == ActDMA_V_Data_V_0_vld_in)) | ((2'd3 == ActDMA_V_Data_V_0_state) & (1'b0 == ActDMA_V_Data_V_0_vld_in) & (1'b1 == ActDMA_V_Data_V_0_ack_out)))) begin
            ActDMA_V_Data_V_0_state <= 2'd2;
        end else if ((((2'd1 == ActDMA_V_Data_V_0_state) & (1'b0 == ActDMA_V_Data_V_0_ack_out)) | ((2'd3 == ActDMA_V_Data_V_0_state) & (1'b0 == ActDMA_V_Data_V_0_ack_out) & (1'b1 == ActDMA_V_Data_V_0_vld_in)))) begin
            ActDMA_V_Data_V_0_state <= 2'd1;
        end else if (((~((1'b0 == ActDMA_V_Data_V_0_vld_in) & (1'b1 == ActDMA_V_Data_V_0_ack_out)) & ~((1'b0 == ActDMA_V_Data_V_0_ack_out) & (1'b1 == ActDMA_V_Data_V_0_vld_in)) & (2'd3 == ActDMA_V_Data_V_0_state)) | ((2'd1 == ActDMA_V_Data_V_0_state) & (1'b1 == ActDMA_V_Data_V_0_ack_out)) | ((2'd2 == ActDMA_V_Data_V_0_state) & (1'b1 == ActDMA_V_Data_V_0_vld_in)))) begin
            ActDMA_V_Data_V_0_state <= 2'd3;
        end else begin
            ActDMA_V_Data_V_0_state <= 2'd2;
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
    if (((exitcond1_fu_176_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_io))) begin
        p_Val2_2_reg_114 <= p_Val2_s_reg_244;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        p_Val2_2_reg_114 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond1_fu_176_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_io))) begin
        t_V3_reg_102 <= t_V_reg_247;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        t_V3_reg_102 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_228_p2 == 1'd0) & (1'b1 == ActDMA_V_Data_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
        t_V_s_reg_126 <= t_V_2_fu_159_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        t_V_s_reg_126 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ActDMA_V_Data_V_0_load_A)) begin
        ActDMA_V_Data_V_0_payload_A <= ActDMA_V_Data_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ActDMA_V_Data_V_0_load_B)) begin
        ActDMA_V_Data_V_0_payload_B <= ActDMA_V_Data_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == SyncSig_V_1_vld_reg) & (1'b1 == SyncSig_V_1_vld_in)) | ((1'b1 == SyncSig_V_1_ack_out) & (1'b1 == SyncSig_V_1_vld_in) & (1'b1 == SyncSig_V_1_vld_reg)))) begin
        SyncSig_V_1_data_reg <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_io))) begin
        demorgan_reg_252 <= demorgan_fu_222_p2;
        t_V_reg_247 <= t_V_fu_194_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p_Val2_s_reg_244 <= p_Val2_s_fu_137_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ActDMA_V_Data_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
        ActBuf_Data_V_ce0 = 1'b1;
    end else begin
        ActBuf_Data_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ActDMA_V_Data_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
        ActBuf_Data_V_we0 = 1'b1;
    end else begin
        ActBuf_Data_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ActDMA_V_Data_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
        ActDMA_V_Data_V_0_ack_out = 1'b1;
    end else begin
        ActDMA_V_Data_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ActDMA_V_Data_V_0_sel)) begin
        ActDMA_V_Data_V_0_data_out = ActDMA_V_Data_V_0_payload_B;
    end else begin
        ActDMA_V_Data_V_0_data_out = ActDMA_V_Data_V_0_payload_A;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ActDMA_V_Data_V_TDATA_blk_n = ActDMA_V_Data_V_0_state[1'd0];
    end else begin
        ActDMA_V_Data_V_TDATA_blk_n = 1'b1;
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
    if ((((1'b1 == SyncSig_V_1_ack_in) & (1'b1 == ap_CS_fsm_state6)) | ((exitcond1_fu_176_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_io)) | ((demorgan_fu_222_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_io)))) begin
        SyncSig_V_1_vld_in = 1'b1;
    end else begin
        SyncSig_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | ((exitcond1_fu_176_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) | ((demorgan_reg_252 == 1'd0) & (1'b1 == ap_CS_fsm_state5)) | ((demorgan_fu_222_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)))) begin
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
            if (((exitcond_fu_228_p2 == 1'd0) & (1'b1 == ActDMA_V_Data_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if (((exitcond_fu_228_p2 == 1'd1) & (1'b1 == ActDMA_V_Data_V_0_vld_out) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_io))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((exitcond1_fu_176_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_io))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else if (((exitcond1_fu_176_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_io))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
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

assign ActBuf_Data_V_address0 = tmp_10_cast_fu_165_p1;

assign ActBuf_Data_V_d0 = ActDMA_V_Data_V_0_data_out;

assign ActDMA_V_Data_V_0_ack_in = ActDMA_V_Data_V_0_state[1'd1];

assign ActDMA_V_Data_V_0_load_A = (~ActDMA_V_Data_V_0_sel_wr & ActDMA_V_Data_V_0_state_cmp_full);

assign ActDMA_V_Data_V_0_load_B = (ActDMA_V_Data_V_0_state_cmp_full & ActDMA_V_Data_V_0_sel_wr);

assign ActDMA_V_Data_V_0_sel = ActDMA_V_Data_V_0_sel_rd;

assign ActDMA_V_Data_V_0_state_cmp_full = ((ActDMA_V_Data_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign ActDMA_V_Data_V_0_vld_in = ActDMA_V_Data_V_TVALID;

assign ActDMA_V_Data_V_0_vld_out = ActDMA_V_Data_V_0_state[1'd0];

assign ActDMA_V_Data_V_TREADY = ActDMA_V_Data_V_0_state[1'd1];

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
    ap_block_state4_io = ((demorgan_fu_222_p2 == 1'd0) & (1'b0 == SyncSig_V_1_ack_in));
end

always @ (*) begin
    ap_block_state5_io = (((exitcond1_fu_176_p2 == 1'd1) & (1'b0 == SyncSig_V_1_ack_in)) | ((demorgan_reg_252 == 1'd0) & (1'b0 == SyncSig_V_1_ack_in)));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign demorgan_fu_222_p2 = (tmp_1_fu_218_p1 | icmp_fu_188_p2);

assign exitcond1_fu_176_p2 = ((p_Val2_2_reg_114 == 7'd127) ? 1'b1 : 1'b0);

assign exitcond_fu_228_p2 = ((t_V_s_reg_126 == 7'd127) ? 1'b1 : 1'b0);

assign icmp_fu_188_p2 = ((tmp_fu_202_p4 == 6'd0) ? 1'b1 : 1'b0);

assign p_Val2_s_fu_137_p2 = (p_Val2_2_reg_114 + 7'd1);

assign rRow_V_fu_182_p2 = (3'd1 + t_V3_reg_102);

assign t_V_2_fu_159_p2 = (t_V_s_reg_126 + 7'd1);

assign t_V_fu_194_p3 = ((tmp_3_fu_212_p2[0:0] === 1'b1) ? 3'd0 : rRow_V_fu_182_p2);

assign tmp_10_cast_fu_165_p1 = tmp_s_fu_170_p2;

assign tmp_1_fu_218_p1 = p_Val2_2_reg_114[0:0];

assign tmp_3_fu_212_p2 = ((rRow_V_fu_182_p2 == 3'd6) ? 1'b1 : 1'b0);

assign tmp_5_fu_147_p3 = {{t_V3_reg_102}, {7'd0}};

assign tmp_7_cast_fu_143_p1 = t_V_s_reg_126;

assign tmp_8_cast_fu_155_p1 = tmp_5_fu_147_p3;

assign tmp_fu_202_p4 = {{p_Val2_2_reg_114[6:1]}};

assign tmp_s_fu_170_p2 = (tmp_7_cast_fu_143_p1 + tmp_8_cast_fu_155_p1);

endmodule //Layer0_WriteAct
