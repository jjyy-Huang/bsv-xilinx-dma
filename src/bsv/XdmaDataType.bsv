typedef 16      PCIE_LANES;

typedef 512     XDMA_AXIS_DATA_WIDTH;
typedef 1       XMDA_C2H_CH_NUMS;
typedef 1       XMDA_H2C_CH_NUMS;

typedef 8       XDMA_CH_STATUS_WIDTH;
typedef Bit#(XDMA_CH_STATUS_WIDTH)  XdmaChStatus;

typedef 1       XDMA_USR_IRQ_WIDTH;
typedef 3       XDMA_MSI_VEC_WIDTH;

typedef Bit#(XDMA_USR_IRQ_WIDTH) XdmaUsrIrq;
typedef Bit#(XDMA_MSI_VEC_WIDTH) XdmaMsiVec;

typedef 64      XDMA_DSC_BYPASS_ADDR_WIDTH;
typedef 28      XDMA_DSC_BYPASS_LEN;
typedef 16      XDMA_DSC_BYPASS_CTL_WIDTH;

typedef 19      XDMA_CFG_MGMT_ADDR_WIDTH;
typedef 32      XDMA_CFG_MGMT_DATA_WIDTH;

typedef Bit#(XDMA_CFG_MGMT_ADDR_WIDTH)              XdmaCfgMgmtAddr;
typedef Bit#(XDMA_CFG_MGMT_DATA_WIDTH)              XdmaCfgMgmtData;
typedef Bit#(TDiv#(XDMA_CFG_MGMT_DATA_WIDTH, 8))    XdmaCfgMgmtByteEna;

typedef 26      XDMA_PIPE_CMD_WIDTH;
typedef 84      XDMA_PIPE_DATA_WIDTH;

typedef Bit#(XDMA_PIPE_CMD_WIDTH)  XdmaPipeCmd;
typedef Bit#(XDMA_PIPE_DATA_WIDTH) XdmaPipeData;

typedef 32 AXILITE_ADDR_WIDTH;
typedef 32 AXILITE_DATA_WIDTH;
typedef 2  AXILITE_RESP_WIDTH;
typedef 3  AXILITE_PROT_WIDTH;
typedef 1  AXILITE_STRB_WIDTH;

typedef Bit#(AXILITE_ADDR_WIDTH) XdmaAxiLiteAddr;
typedef Bit#(AXILITE_DATA_WIDTH) XdmaAxiLiteData;
typedef Bit#(AXILITE_RESP_WIDTH) XdmaAxiLiteResp;
typedef Bit#(AXILITE_PROT_WIDTH) XdmaAxiLiteProt;
typedef Bit#(AXILITE_STRB_WIDTH) XdmaAXiLiteStrb;

typedef Bit#(XDMA_AXIS_DATA_WIDTH)           XdmaAxisData;
typedef Bit#(TDiv#(XDMA_AXIS_DATA_WIDTH, 8)) XdmaAxisKeep;
typedef Bool                                XdmaAxisLast;

typedef Bit#(XDMA_DSC_BYPASS_ADDR_WIDTH) XdmaDscBypAddr;
typedef Bit#(XDMA_DSC_BYPASS_LEN)        XdmaDscBypLen;
typedef Bit#(XDMA_DSC_BYPASS_CTL_WIDTH)  XdmaDscBypCtl;

typedef Bit#(PCIE_LANES) XdmaPciExp;

typedef 0 XDMA_AXILITE_DEFAULT_PROT;
typedef 0 XDMA_AXILITE_DEFAULT_STRB;

typedef struct {
    XdmaAxisData data;
    XdmaAxisLast last;
    XdmaAxisKeep keep;
} XdmaDataStream deriving(Bits, Eq);

typedef enum {
    IS_EOF_AND_STOP      = 16'h13,
    IS_EOF_BUT_CONTINUE  = 16'h10,
    NOT_EOF_AND_CONTINUE = 16'h00
    // ctl[0]: Stop fetching next descriptor if setting 1;
    // ctl[1]: interrupt after finish this descriptor if setting 1;
    // ctl[4]: activate axi-s tLast if setting 1;
} XdmaDescriptorControl deriving(Bits, Eq);

typedef enum {
    C2H = 1'b1,
    H2C = 1'b0
} XdmaChannel deriving(Bits, Eq);

typedef struct {
`ifdef USING_AXISTREAM
    XdmaDscBypAddr            addr;
`else
    XdmaDscBypAddr            src;
    XdmaDscBypAddr            dst;
`endif
    XdmaDscBypLen             len;
    XdmaDescriptorControl     ctl;
    XdmaChannel               channel;
} XdmaDescriptorBypass deriving(Bits, Eq);

typedef struct {
    XdmaAxiLiteAddr addr;
    XdmaAxiLiteData data;
} XdmaAxiLiteWriteReq deriving(Bits, Eq);

typedef struct {
    XdmaAxiLiteResp resp;
} XdmaAxiLiteWriteResp deriving(Bits, Eq);

typedef struct {
    XdmaAxiLiteAddr addr;
} XdmaAxiLiteReadReq deriving(Bits, Eq);

typedef struct {
    XdmaAxiLiteData data;
    XdmaAxiLiteResp resp;
} XdmaAxiLiteReadResp deriving(Bits, Eq);

typedef struct {
    Bool isRunning;
    Bool isIrqPending;
    Bool isPktFinished;
    Bool isDscFinished;
    Bool isDscStop;
    Bool isDscCmpted;
    Bool isBusy;
} ChannelStatus deriving(Bits, Eq);

typedef enum {
    IDLE,
    WRITE_REQ,
    WRITE_RESP,
    INIT_SUCCESSED
} XdmaChannelInitStatus deriving(Bits, Eq);

typedef enum {
    READ,
    WRITE
} Operation deriving(Bits, Eq);

typedef struct {
    XdmaCfgMgmtAddr    addr;
    XdmaCfgMgmtData    data;
    XdmaCfgMgmtByteEna ena;
    Operation          op;
} XdmaConfigManagmentReq deriving(Bits, Eq);

typedef struct {
    XdmaCfgMgmtData data;
} XdmaConfigManagmentResp deriving(Bits, Eq);
