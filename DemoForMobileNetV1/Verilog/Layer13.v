

module Layer13
(
input   ap_clk,
input   ap_rst_n,

input  [7:0] ActDMA_V_V_TDATA,
input   ActDMA_V_V_TVALID,
output   ActDMA_V_V_TREADY,

input  [31:0] WeightDMA_V_V_TDATA,
input   WeightDMA_V_V_TVALID,
output   WeightDMA_V_V_TREADY,

output  [7:0] reluRes_V_V_TDATA,
output   reluRes_V_V_TVALID,
input   reluRes_V_V_TREADY
);

//Sync signal for WriteAct and PE
wire   SyncSig_V;
wire   SyncSig_V_ap_vld;
wire   SyncSig_V_ap_ack;


//Write ActBuf BRAM Ports.
wire  [12:0] ActBuf_Data_V_address1;
wire   ActBuf_Data_V_ce1;
wire   ActBuf_Data_V_we1;
wire  [7:0] ActBuf_Data_V_d1;

Layer13_WriteAct U_Write13(
.ap_clk                  (ap_clk                ),
.ap_rst_n                (ap_rst_n              ),
.ActDMA_V_TDATA     (ActDMA_V_V_TDATA      ),
.ActDMA_V_TVALID    (ActDMA_V_V_TVALID     ),
.ActDMA_V_TREADY    (ActDMA_V_V_TREADY     ),
.SyncSig_V               (SyncSig_V             ),
.SyncSig_V_ap_vld        (SyncSig_V_ap_vld      ),
.SyncSig_V_ap_ack        (SyncSig_V_ap_ack      ),
.ActBuf_address0    (ActBuf_Data_V_address1),
.ActBuf_ce0         (ActBuf_Data_V_ce1     ),
.ActBuf_we0         (ActBuf_Data_V_we1     ),
.ActBuf_d0          (ActBuf_Data_V_d1      )
);

//Read ActBuf BRAM Ports.
wire  [12:0] ActBuf_Data_V_address0;
wire   ActBuf_Data_V_ce0;
wire  [7:0] ActBuf_Data_V_q0;

Layer13_PE_0 PE_13(
.ap_clk                   (ap_clk                   ),
.ap_rst_n                 (ap_rst_n                 ),
.WeightDMA_V_V_TDATA      (WeightDMA_V_V_TDATA      ),
.WeightDMA_V_V_TVALID     (WeightDMA_V_V_TVALID     ),
.WeightDMA_V_V_TREADY     (WeightDMA_V_V_TREADY     ),
.SyncSig_V                (SyncSig_V                ),
.SyncSig_V_ap_vld         (SyncSig_V_ap_vld         ),
.SyncSig_V_ap_ack         (SyncSig_V_ap_ack         ),
.ActBuf_address0     (ActBuf_Data_V_address0   ),
.ActBuf_ce0          (ActBuf_Data_V_ce0        ),
.ActBuf_q0           (ActBuf_Data_V_q0         ),
.reluRes_V_V_TDATA        (reluRes_V_V_TDATA        ),
.reluRes_V_V_TVALID       (reluRes_V_V_TVALID       ),
.reluRes_V_V_TREADY       (reluRes_V_V_TREADY       )
);


Block_RAM #(.DWIDTH(8), .AWIDTH(13), .MEM_SIZE(8192))
BRAM_13(
//Read Ports
.addr0  (ActBuf_Data_V_address0),
.ce0    (ActBuf_Data_V_ce0),
.q0     (ActBuf_Data_V_q0),
//Write Ports
.addr1  (ActBuf_Data_V_address1),
.ce1    (ActBuf_Data_V_ce1),
.d1     (ActBuf_Data_V_d1),
.q1     (),
.we1    (ActBuf_Data_V_we1),
.clk    (ap_clk)
);

endmodule

