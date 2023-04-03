import Clocks :: *;

`define USING_PIPE_SIM
`define USING_AXIL_SLAVE
`define USING_AXIL_MASTER
`define USING_AXIL_CSR
`define USING_VDM
`define USING_FLR

typedef 16      PCIE_LANES;
typedef Bit#(PCIE_LANES)    QdmaPciExp;

typedef 26      QDMA_PIPE_CMD_WIDTH;
typedef 84      QDMA_PIPE_DATA_WIDTH;

typedef Bit#(QDMA_PIPE_CMD_WIDTH)  QdmaPipeCmd;
typedef Bit#(QDMA_PIPE_DATA_WIDTH) QdmaPipeData;

typedef 32      AXILITE_ADDR_WIDTH;
typedef 32      AXILITE_DATA_WIDTH;
typedef 13      AXILITE_USER_SLAVE_WIDTH;
typedef 55      AXILITE_USER_MASTER_WIDTH;
typedef 2       AXILITE_RESP_WIDTH;
typedef 3       AXILITE_PROT_WIDTH;
typedef 4       AXILITE_STRB_WIDTH;

typedef Bit#(AXILITE_ADDR_WIDTH)        QdmaAxiLiteAddr;
typedef Bit#(AXILITE_DATA_WIDTH)        QdmaAxiLiteData;
typedef Bit#(AXILITE_USER_SLAVE_WIDTH)  QdmaAxiLiteSlaveUser;
typedef Bit#(AXILITE_USER_MASTER_WIDTH) QdmaAxiLiteMasterUser;
typedef Bit#(AXILITE_RESP_WIDTH)        QdmaAxiLiteResp;
typedef Bit#(AXILITE_PROT_WIDTH)        QdmaAxiLiteProt;
typedef Bit#(AXILITE_STRB_WIDTH)        QdmaAXiLiteStrb;

typedef 512     QDMA_AXIS_DATA_WIDTH;
typedef 32      QDMA_AXIS_CRC_WIDTH;
typedef 1       QDMA_AXIS_CTL_MARKER_WIDTH;
typedef 16      QDMA_AXIS_CTL_LEN_WIDTH;
typedef 11      QDMA_AXIS_CTL_QID_WIDTH;
typedef 3       QDMA_AXIS_CTL_PID_WIDTH;
typedef 7       QDMA_AXIS_CTL_ECC_WIDTH;
typedef 1       QDMA_AXIS_CTL_CMPT_WIDTH;
typedef 6       QDMA_AXIS_MTY_WIDTH;
typedef 11      QDMA_AXIS_USR_QID_WIDTH;
typedef 3       QDMA_AXIS_USR_PID_WIDTH;
typedef 1       QDMA_AXIS_USR_ERR_WIDTH;
typedef 32      QDMA_AXIS_USR_META_WIDTH;
typedef 1       QDMA_AXIS_USR_ZERO_WIDTH;
typedef 2       QDMA_AXIS_CMPT_SIZE_WIDTH;
typedef 16      QDMA_AXIS_CMPT_PARITY_WIDTH;
typedef 1       QDMA_AXIS_CTL_TRIGGER_WIDTH;
typedef 2       QDMA_AXIS_CMPT_TYPE_WIDTH;
typedef 16      QDMA_AXIS_CMPT_PKT_ID_WIDTH;
typedef 3       QDMA_AXIS_CMPT_COL_IDX_WIDTH;
typedef 3       QDMA_AXIS_CMPT_ERR_IDX_WIDTH;
typedef 1       QDMA_AXIS_CMPT_WRB_MARKER_WIDTH;


typedef Bit#(QDMA_AXIS_DATA_WIDTH)              QdmaAxisData;
typedef Bit#(QDMA_AXIS_CRC_WIDTH)               QdmaAxisCrc;
typedef Bit#(QDMA_AXIS_CTL_MARKER_WIDTH)        QdmaAxisCtlMarker;
typedef Bit#(QDMA_AXIS_CTL_LEN_WIDTH)           QdmaAxisCtlLen;
typedef Bit#(QDMA_AXIS_CTL_QID_WIDTH)           QdmaAxisCtlQid;
typedef Bit#(QDMA_AXIS_CTL_PID_WIDTH)           QdmaAxisCtlPid;
typedef Bit#(QDMA_AXIS_CTL_ECC_WIDTH)           QdmaAxisCtlEcc;
typedef Bit#(QDMA_AXIS_CTL_CMPT_WIDTH)          QdmaAxisCtlCmpt;
typedef Bit#(QDMA_AXIS_MTY_WIDTH)               QdmaAxisMty;
typedef Bool                                    QdmaAxisLast;
typedef Bit#(QDMA_AXIS_USR_QID_WIDTH)           QdmaAxisUsrQid;
typedef Bit#(QDMA_AXIS_USR_PID_WIDTH)           QdmaAxisUsrPid;
typedef Bit#(QDMA_AXIS_USR_ERR_WIDTH)           QdmaAxisUsrErr;
typedef Bit#(QDMA_AXIS_USR_META_WIDTH)          QdmaAxisUsrMeta;
typedef Bit#(QDMA_AXIS_MTY_WIDTH)               QdmaAxisUsrMty;
typedef Bit#(QDMA_AXIS_USR_ZERO_WIDTH)          QdmaAxisUsrZero;
typedef Bit#(QDMA_AXIS_CMPT_SIZE_WIDTH)         QdmaAxisCmptSize;
typedef Bit#(QDMA_AXIS_CMPT_PARITY_WIDTH)       QdmaAxisCmptParity;
typedef Bit#(QDMA_AXIS_CTL_TRIGGER_WIDTH)       QdmaAxisCmptTrigger;
typedef Bit#(QDMA_AXIS_CMPT_TYPE_WIDTH)         QdmaAxisCmptType;
typedef Bit#(QDMA_AXIS_CMPT_PKT_ID_WIDTH)       QdmaAxisCmptPktId;
typedef Bit#(QDMA_AXIS_CMPT_COL_IDX_WIDTH)      QdmaAxisCmptColIdx;
typedef Bit#(QDMA_AXIS_CMPT_ERR_IDX_WIDTH)      QdmaAxisCmptErrIdx;
typedef Bit#(QDMA_AXIS_CMPT_WRB_MARKER_WIDTH)   QdmaAxisCmptWrbMarker;


typedef 64      QDMA_DSC_BYP_ADDR_WIDTH;
typedef 16      QDMA_DSC_BYP_LEN_WIDTH;
typedef 11      QDMA_DSC_BYP_QID_WIDTH;
typedef 8       QDMA_DSC_BYP_FUNC_WIDTH;
typedef 16      QDMA_DSC_BYP_CIDX_WIDTH;
typedef 3       QDMA_DSC_BYP_PID_WIDTH;
typedef 7       QDMA_DSC_BYP_PREFETCH_TAG_WIDTH;
typedef 256     QDMA_DSC_BYP_DSC_WIDTH;
typedef 2       QDMA_DSC_BYP_SIZE_WIDTH;
typedef 3       QDMA_DSC_BYP_FMT_WIDTH;
typedef 16      QDMA_DSC_BYP_PIDX_WIDTH;

typedef Bit#(QDMA_DSC_BYP_ADDR_WIDTH)           QdmaDscBypAddr;
typedef Bit#(QDMA_DSC_BYP_LEN_WIDTH)            QdmaDscBypLen;
typedef Bool                                    QdmaDscBypSop;
typedef Bool                                    QdmaDscBypEop;
typedef Bool                                    QdmaDscBypSdi;
typedef Bool                                    QdmaDscBypMarkerReq;
typedef Bool                                    QdmaDscBypNoDma;
typedef Bit#(QDMA_DSC_BYP_QID_WIDTH)            QdmaDscBypQid;
typedef Bool                                    QdmaDscBypErr;
typedef Bit#(QDMA_DSC_BYP_FUNC_WIDTH)           QdmaDscBypFunc;
typedef Bit#(QDMA_DSC_BYP_CIDX_WIDTH)           QdmaDscBypCidx;
typedef Bit#(QDMA_DSC_BYP_PID_WIDTH)            QdmaDscBypPid;
typedef Bit#(QDMA_DSC_BYP_PREFETCH_TAG_WIDTH)   QdmaDscBypPreFetchTag;
typedef Bit#(QDMA_DSC_BYP_DSC_WIDTH)            QdmaDescriptor;
typedef Bool                                    QdmaDscBypType;
typedef Bit#(QDMA_DSC_BYP_SIZE_WIDTH)           QdmaDscBypSize;
typedef Bit#(QDMA_DSC_BYP_FMT_WIDTH)            QdmaDscBypFmt;
typedef Bit#(QDMA_DSC_BYP_PIDX_WIDTH)           QdmaDscBypPidx;

typedef 1       QDMA_DSC_CRDT_DIR_WIDTH;
typedef 1       QDMA_DSC_CRDT_FENCE_WIDTH;
typedef 11      QDMA_DSC_CRDT_QID_WIDTH;
typedef 16      QDMA_DSC_CRDT_WIDTH;

typedef Bit#(QDMA_DSC_CRDT_DIR_WIDTH)       QdmaDscCrdtDir;
typedef Bit#(QDMA_DSC_CRDT_FENCE_WIDTH)     QdmaDscCrdtFence;
typedef Bit#(QDMA_DSC_CRDT_QID_WIDTH)       QdmaDscCrdtQid;
typedef Bit#(QDMA_DSC_CRDT_WIDTH)           QdmaDscCrdt;

typedef 8       QUEUE_STATUS_OPCODE_WIDTH;
typedef 64      QUEUE_STATUS_DATA_WIDTH;
typedef 3       QUEUE_STATUS_PID_WIDTH;
typedef 12      QUEUE_STATUS_QID_WIDTH;

typedef Bit#(QUEUE_STATUS_OPCODE_WIDTH)     QueueOpType;
typedef Bit#(QUEUE_STATUS_DATA_WIDTH)       QueueOpCode;
typedef Bit#(QUEUE_STATUS_PID_WIDTH)        QueuePid;
typedef Bit#(QUEUE_STATUS_QID_WIDTH)        QueueQid;

typedef 32      VDM_DATA_WIDTH;

typedef Bit#(VDM_DATA_WIDTH)                VdmData;

typedef 8       FLR_FUNC_ID_WIDTH;

typedef Bit#(FLR_FUNC_ID_WIDTH)             FlrId;

typedef 12                           USR_IRQ_VECTOR_WIDTH;
typedef 8                            USR_IRQ_FUNCTION_WIDTH;

typedef Bit#(USR_IRQ_VECTOR_WIDTH)   IrqVec;
typedef Bit#(USR_IRQ_FUNCTION_WIDTH) IrqFunc;

(* always_ready *)
interface AxiLiteSlaveAwChannel;
    method Action putAddr(
        QdmaAxiLiteAddr addr,
        QdmaAxiLiteProt prot  // never used
    );
    method Bool   isReady;
endinterface

(* always_ready *)
interface AxiLiteSlaveWChannel;
    method Action putData(
        QdmaAxiLiteData data,
        QdmaAXiLiteStrb strb
    );
    method Bool   isReady;
endinterface

(* always_ready *)
interface AxiLiteSlaveBChannel;
    method Bool            isValid;
    method QdmaAxiLiteResp getResp;
    method Action          readyAssertAct;
endinterface

(* always_ready *)
interface AxiLiteSlaveArChannel;
    method Action putAddr(
        QdmaAxiLiteAddr addr,
        QdmaAxiLiteProt prot  // never used
    );
    method Bool   isReady;
endinterface

(* always_ready *)
interface AxiLiteSlaveRChannel;
    method Bool            isValid;
    method QdmaAxiLiteData getData;
    method QdmaAxiLiteResp getResp;
    method Action          readyAssertAct;
endinterface

(* always_ready *)
interface AxiLiteMasterAwChannel;
    method QdmaAxiLiteAddr getAddr;
    method QdmaAxiLiteProt getProt;   // never used
    method Bool            isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready *)
interface AxiLiteMasterWChannel;
    method QdmaAxiLiteData getData;
    method QdmaAXiLiteStrb getStrb;
    method Bool            isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready *)
interface AxiLiteMasterBChannel;
    method Action putResp(QdmaAxiLiteResp resp);
    method Bool   isReady;
endinterface

(* always_ready *)
interface AxiLiteMasterArChannel;
    method QdmaAxiLiteAddr getAddr;
    method QdmaAxiLiteProt getProt;  // never used
    method Bool            isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready *)
interface AxiLiteMasterRChannel;
    method Action putResp(
        QdmaAxiLiteData data,
        QdmaAxiLiteResp resp
    );
    method Bool   isReady;
endinterface

interface QdmaConfigAxiLiteMmSlave;
    interface AxiLiteSlaveAwChannel  aw;
    interface AxiLiteSlaveWChannel   w;
    interface AxiLiteSlaveBChannel   b;
    interface AxiLiteSlaveArChannel  ar;
    interface AxiLiteSlaveRChannel   r;
    method Action putAwUser(QdmaAxiLiteSlaveUser user);
    method Action putArUser(QdmaAxiLiteSlaveUser user);
endinterface

interface QdmaConfigAxiLiteMmMaster;
    interface AxiLiteMasterAwChannel aw;
    interface AxiLiteMasterWChannel  w;
    interface AxiLiteMasterBChannel  b;
    interface AxiLiteMasterArChannel ar;
    interface AxiLiteMasterRChannel  r;
    method    QdmaAxiLiteMasterUser  getAwUser;
    method    QdmaAxiLiteMasterUser  getArUser;
endinterface

interface QdmaCsrAxiLiteMmSlave;
    interface AxiLiteSlaveAwChannel  aw;
    interface AxiLiteSlaveWChannel   w;
    interface AxiLiteSlaveBChannel   b;
    interface AxiLiteSlaveArChannel  ar;
    interface AxiLiteSlaveRChannel   r;
endinterface

(* always_ready *)
interface QdmaC2HDataStream;
    method Action putData(
        QdmaAxisData      data,
        QdmaAxisLast      last,
        QdmaAxisMty       mty,
        QdmaAxisCrc       crc,
        QdmaAxisCtlMarker marker,
        QdmaAxisCtlLen    len,
        QdmaAxisCtlQid    qid,
        QdmaAxisCtlPid    pid,
        QdmaAxisCtlEcc    ecc,
        QdmaAxisCtlCmpt   hasCmpt
    );
    method Bool   isReady;
endinterface

(* always_ready *)
interface QdmaH2CDataStream;
    method QdmaAxisData    getData;
    method QdmaAxisCrc     getCrc;
    method QdmaAxisUsrQid  getUsrQid;
    method QdmaAxisUsrPid  getUsrPid;
    method QdmaAxisUsrErr  getUsrErr;
    method QdmaAxisUsrMeta getUsrMeta;
    method QdmaAxisUsrMty  getUsrMty;
    method QdmaAxisLast    getLast;
    method QdmaAxisUsrZero isZeroByte;
    method Bool            isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready *)
interface QdmaC2HCompleteStream;
    method Action putData(
        QdmaAxisData          data,
        QdmaAxisCmptSize      size,
        QdmaAxisCmptParity    parity,
        QdmaAxisCtlQid        qid,
        QdmaAxisCtlMarker     marker,
        QdmaAxisCmptTrigger   trigger,
        QdmaAxisCmptType      cmptType,
        QdmaAxisCmptPktId     pktId,
        QdmaAxisCtlPid        pid,
        QdmaAxisCmptColIdx    colIdx,
        QdmaAxisCmptErrIdx    errIdx,
        QdmaAxisCmptWrbMarker writeBackMarker
    );
    method Bool   isReady;
endinterface

(* always_ready *)
interface QdmaC2HStatusPin;
    method Bool           isValid;
    method QdmaAxisCtlQid getPktQid;
    method Bool           isPktDrop;
    method Bool           isLastDsc;
    method Bool           isCompletedPkt;
    method Bool           isErr;
endinterface

(* always_ready *)
interface QdmaH2CDescriptorStreamIn;
    method Action putData(
        QdmaDscBypAddr      addr,
        QdmaDscBypLen       len,
        QdmaDscBypSop       sop,
        QdmaDscBypEop       eop,
        QdmaDscBypSdi       sdi,
        QdmaDscBypMarkerReq req,
        QdmaDscBypNoDma     noDma,
        QdmaDscBypQid       qid,
        QdmaDscBypErr       err,
        QdmaDscBypFunc      func,
        QdmaDscBypCidx      cidx,
        QdmaDscBypPid       pid
    );
    method Bool isReady;
endinterface

(* always_ready *)
interface QdmaC2HDescriptorStreamIn;
    method Action putData(
        QdmaDscBypAddr        addr,
        QdmaDscBypQid         qid,
        QdmaDscBypErr         err,
        QdmaDscBypFunc        func,
        QdmaDscBypPid         pid,
        QdmaDscBypPreFetchTag pfchTag
    );
    method Bool   isReady;
endinterface

(* always_ready *)
interface QdmaH2CDescriptorStreamOut;
    method QdmaDescriptor getDescriptor;
    method QdmaDscBypType isMemroyMapped; // 0: stream; 1:memory mapped
    method QdmaDscBypSize getSize;        // 0: 8B; 1: 16B; 2: 32B; 3: 64B
    method QdmaDscBypQid  getQid;
    method QdmaDscBypErr  getErr;
    method QdmaDscBypFunc getFunc;
    method QdmaDscBypCidx getCidx;
    method QdmaDscBypPid  getPid;
    method QdmaDscBypFmt  getFmt;         // 0x0: standar descriptor; other reserved
    method Bool           isValid;
    method Action         readyAssertAct;
endinterface

(* always_ready *)
interface QdmaC2HDescriptorStreamOut;
    method QdmaDescriptor        getDescriptor;
    method QdmaDscBypType        isMemroyMapped; // 0: stream; 1:memory mapped
    method QdmaDscBypSize        getSize;        // 0: 8B; 1: 16B; 2: 32B; 3: 64B
    method QdmaDscBypQid         getQid;
    method QdmaDscBypErr         getErr;
    method QdmaDscBypFunc        getFunc;
    method QdmaDscBypCidx        getCidx;
    method QdmaDscBypPid         getPid;
    method QdmaDscBypPreFetchTag getPfchTag;
    method QdmaDscBypFmt         getFmt;         // 0x0: standar descriptor; other reserved
    method Bool                  isValid;
    method Action                readyAssertAct;
endinterface

(* always_ready *)
interface QdmaDescriptorCreditIn;
    method Action putCrdt(
        QdmaDscCrdt crdt,
        QdmaDscCrdtDir dir,         // 0: H2C; 1:C2H
        QdmaDscCrdtFence fence,
        QdmaDscCrdtQid qid
    );
    method Bool   isReady;
endinterface

(* always_ready *)
interface QdmaTrafficManageCreditOut;
    method Bool           isValid;
    method Bool           getByp;
    method QdmaDscCrdtDir isC2H;          // 0: H2C; 1:C2H
    method QdmaDscBypType isMemoryMapped; // 0: stream; 1:memory mapped
    method QdmaDscBypQid  getQid;
    method QdmaDscBypPid  getPid;
    method QdmaDscCrdt    getCrdtAvailNum;
    method Bool           isQeuenInvalid;
    method Bool           isQeuenEnabled;
    method Bool           isQeuenReadyIrq;
    method Bool           isPidxEqCidx;
    method QdmaDscBypPidx getPidx;
    method Action         readyAssertAct;
endinterface

(* always_ready *)
interface QueueStatusPin;
    method QueueOpType getQueueOpTpye;
    method QueueOpCode getQueueOpCode;
    method QueuePid    getQueuePid;
    method QueueQid    getQueueQid;
    method Bool        isValid;
    method Action      readyAssertAct;
endinterface

(* always_ready *)
interface VendorDefinedMessagePin;
    method Bool    isValid;
    method VdmData getData;
    method Bool    isLast;
    method Action  readyAssertAct;
endinterface

(* always_ready *)
interface FunctionalLevelResetPin;
    method FlrId  getChangedFuncId;
    method Bool   isSet;
    method Action putDoneFuncId(FlrId id);
endinterface

(* always_ready *)
interface UsrInterruptPin;
    method Action putIrq(
        IrqVec vec,
        IrqFunc fnc
    );
    method Bool   getAck;
    method Bool   isFail;
endinterface

interface QdmaUsrPin;
`ifdef USING_AXIL_SLAVE
    interface QdmaConfigAxiLiteMmSlave   qdmaConfigAxiLiteMmSlave;
`endif
`ifdef USING_AXIL_MASTER
    interface QdmaConfigAxiLiteMmMaster  qdmaConfigAxiLiteMmMaster;
`endif
`ifdef USING_AXIL_CSR
    interface QdmaCsrAxiLiteMmSlave      qdmaCsrAxiLiteMmSlave;
`endif
    interface UsrInterruptPin            usrIrq;
    interface QdmaH2CDataStream          qdmaH2CDataStream;
    interface QdmaC2HDataStream          qdmaC2HDataStream;
    interface QdmaC2HCompleteStream      qdmaC2HCompleteStream;
    interface QdmaC2HStatusPin           qdmaC2HStatus;
    interface QdmaH2CDescriptorStreamIn  qdmaH2CDescriptorStreamIn;
    interface QdmaC2HDescriptorStreamIn  qdmaC2HDescriptorStreamIn;
    interface QdmaC2HDescriptorStreamOut qdmaC2HDescriptorStreamOut;
    interface QdmaH2CDescriptorStreamOut qdmaH2CDescriptorStreamOut;
    interface QdmaDescriptorCreditIn     qdmaDescriptorCreditIn;
    interface QdmaTrafficManageCreditOut qdmaTrafficManageCredit;
    interface QueueStatusPin             queueStatus;
`ifdef USING_VDM
    interface VendorDefinedMessagePin    vendorDefinedMessagePin;
`endif
`ifdef USING_FLR
    interface FunctionalLevelResetPin    functionalLevelResetPin;
`endif
endinterface

(* always_ready, always_enabled *)
interface QdmaPciePin;
	(* prefix = "" *)
    method Action     rxn(QdmaPciExp rxn);
	(* prefix = "" *)
    method Action     rxp(QdmaPciExp rxp);
	(* prefix = "" *)
    method QdmaPciExp txn();
	(* prefix = "" *)
    method QdmaPciExp txp();
endinterface

(* always_ready, always_enabled *)
interface QdmaSimPipe;
    method Action cmdIn(QdmaPipeCmd cmd);
    method Action sigs0In(QdmaPipeData data);
    method Action sigs1In(QdmaPipeData data);
    method Action sigs2In(QdmaPipeData data);
    method Action sigs3In(QdmaPipeData data);
    method Action sigs4In(QdmaPipeData data);
    method Action sigs5In(QdmaPipeData data);
    method Action sigs6In(QdmaPipeData data);
    method Action sigs7In(QdmaPipeData data);
    method Action sigs8In(QdmaPipeData data);
    method Action sigs9In(QdmaPipeData data);
    method Action sigs10In(QdmaPipeData data);
    method Action sigs11In(QdmaPipeData data);
    method Action sigs12In(QdmaPipeData data);
    method Action sigs13In(QdmaPipeData data);
    method Action sigs14In(QdmaPipeData data);
    method Action sigs15In(QdmaPipeData data);

    method QdmaPipeCmd cmdOut;
    method QdmaPipeData sigs0Out;
    method QdmaPipeData sigs1Out;
    method QdmaPipeData sigs2Out;
    method QdmaPipeData sigs3Out;
    method QdmaPipeData sigs4Out;
    method QdmaPipeData sigs5Out;
    method QdmaPipeData sigs6Out;
    method QdmaPipeData sigs7Out;
    method QdmaPipeData sigs8Out;
    method QdmaPipeData sigs9Out;
    method QdmaPipeData sigs10Out;
    method QdmaPipeData sigs11Out;
    method QdmaPipeData sigs12Out;
    method QdmaPipeData sigs13Out;
    method QdmaPipeData sigs14Out;
    method QdmaPipeData sigs15Out;
endinterface

interface QdmaPciExpPin;
    interface QdmaPciePin qdmaPciePin;
    interface QdmaSimPipe  qdmaSimPipe;
endinterface

interface QdmaPin;
    interface Clock          usrClk;
    interface Reset          usrRstN;

    (* always_ready *)
    method    Bool           isPhyReady;
    (* always_ready *)
    method    Bool           isUsrLnkUp;
    (* always_ready *)
    method    Bool           isCsrPorgDone;

    interface QdmaPciExpPin qdmaPciExpPin;
    interface QdmaUsrPin    qdmaUsrPin;
endinterface

import "BVI" qdma =
module mkQdmaBvi#(Clock sysClk, Clock gtClk, Reset sysRstN, Reset dmaRstN)(QdmaPin);
    default_clock no_clock;
    default_reset no_reset;
    input_clock   sysClk(sys_clk, (* unused *) UNUSED)   = sysClk;
    input_clock   gtClk(sys_clk_gt, (* unused *) UNUSED) = gtClk;
    input_reset   rstN(sys_rst_n)                        = sysRstN;
    input_reset   dmaRstN(soft_reset_n)                  = dmaRstN;

    output_clock  usrClk(axi_aclk);
    output_reset  usrRstN(axi_aresetn);


    method phy_ready     isPhyReady    clocked_by(usrClk) reset_by(usrRstN);
    method user_lnk_up   isUsrLnkUp    clocked_by(usrClk) reset_by(usrRstN);
`ifdef USING_AXIL_CSR
    method csr_prog_done isCsrPorgDone clocked_by(usrClk) reset_by(usrRstN);
`endif
    interface QdmaPciExpPin qdmaPciExpPin;
        interface QdmaPciePin qdmaPciePin;
            method rxn(pci_exp_rxn) enable((*inhigh*) pci_exp_rxn_dummy_en) clocked_by(sysClk) reset_by(rstN);
            method rxp(pci_exp_rxp) enable((*inhigh*) pci_exp_rxp_dummy_en) clocked_by(sysClk) reset_by(rstN);
            method pci_exp_txn txn() clocked_by(sysClk) reset_by(rstN);
            method pci_exp_txp txp() clocked_by(sysClk) reset_by(rstN);
        endinterface
    `ifdef USING_PIPE_SIM
        interface QdmaSimPipe         qdmaSimPipe;
            method cmdIn(common_commands_in) enable((*inhigh*) common_commands_in_dummy_en)   clocked_by(sysClk) reset_by(rstN);
            method sigs0In(pipe_rx_0_sigs)   enable((*inhigh*) pipe_rx_0_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs1In(pipe_rx_1_sigs)   enable((*inhigh*) pipe_rx_1_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs2In(pipe_rx_2_sigs)   enable((*inhigh*) pipe_rx_2_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs3In(pipe_rx_3_sigs)   enable((*inhigh*) pipe_rx_3_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs4In(pipe_rx_4_sigs)   enable((*inhigh*) pipe_rx_4_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs5In(pipe_rx_5_sigs)   enable((*inhigh*) pipe_rx_5_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs6In(pipe_rx_6_sigs)   enable((*inhigh*) pipe_rx_6_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs7In(pipe_rx_7_sigs)   enable((*inhigh*) pipe_rx_7_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs8In(pipe_rx_8_sigs)   enable((*inhigh*) pipe_rx_8_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs9In(pipe_rx_9_sigs)   enable((*inhigh*) pipe_rx_9_sigs_dummy_en)       clocked_by(sysClk) reset_by(rstN);
            method sigs10In(pipe_rx_10_sigs) enable((*inhigh*) pipe_rx_10_sigs_dummy_en)      clocked_by(sysClk) reset_by(rstN);
            method sigs11In(pipe_rx_11_sigs) enable((*inhigh*) pipe_rx_11_sigs_dummy_en)      clocked_by(sysClk) reset_by(rstN);
            method sigs12In(pipe_rx_12_sigs) enable((*inhigh*) pipe_rx_12_sigs_dummy_en)      clocked_by(sysClk) reset_by(rstN);
            method sigs13In(pipe_rx_13_sigs) enable((*inhigh*) pipe_rx_13_sigs_dummy_en)      clocked_by(sysClk) reset_by(rstN);
            method sigs14In(pipe_rx_14_sigs) enable((*inhigh*) pipe_rx_14_sigs_dummy_en)      clocked_by(sysClk) reset_by(rstN);
            method sigs15In(pipe_rx_15_sigs) enable((*inhigh*) pipe_rx_15_sigs_dummy_en)      clocked_by(sysClk) reset_by(rstN);

            method common_commands_out   cmdOut       clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_0_sigs        sigs0Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_1_sigs        sigs1Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_2_sigs        sigs2Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_3_sigs        sigs3Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_4_sigs        sigs4Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_5_sigs        sigs5Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_6_sigs        sigs6Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_7_sigs        sigs7Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_8_sigs        sigs8Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_9_sigs        sigs9Out     clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_10_sigs       sigs10Out    clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_11_sigs       sigs11Out    clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_12_sigs       sigs12Out    clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_13_sigs       sigs13Out    clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_14_sigs       sigs14Out    clocked_by(sysClk) reset_by(rstN);
            method pipe_tx_15_sigs       sigs15Out    clocked_by(sysClk) reset_by(rstN);
        endinterface
    `endif
    endinterface
    interface QdmaUsrPin qdmaUsrPin;
    `ifdef USING_AXIL_SLAVE
        interface QdmaConfigAxiLiteMmSlave qdmaConfigAxiLiteMmSlave;
            interface AxiLiteSlaveAwChannel  aw;
                method putAddr(
                    s_axil_awaddr,
                    s_axil_awprot  // never used
                ) enable(s_axil_awvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_awready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveWChannel   w;
                method putData(
                    s_axil_wdata,
                    s_axil_wstrb
                )  enable(s_axil_wvalid)     clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_wready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveBChannel   b;
                method s_axil_bvalid          isValid               clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_bresp           getResp               clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct()       enable(s_axil_bready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveArChannel  ar;
                method putAddr(
                    s_axil_araddr,
                    s_axil_arprot  // never used
                ) enable(s_axil_arvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_arready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveRChannel   r;
                method s_axil_rvalid          isValid               clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_rdata           getData               clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_rresp           getResp               clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct()       enable(s_axil_rready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
                method putAwUser(s_axil_awuser) enable(s_axil_awuser_dummy_en) clocked_by(usrClk) reset_by(usrRstN);
                method putArUser(s_axil_aruser) enable(s_axil_aruser_dummy_en) clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    `endif
    `ifdef USING_AXIL_MASTER
        interface QdmaConfigAxiLiteMmMaster qdmaConfigAxiLiteMmMaster;
            interface AxiLiteMasterAwChannel aw;
                method m_axil_awaddr         getAddr                clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_awprot         getProt                clocked_by(usrClk) reset_by(usrRstN);   // never used
                method m_axil_awvalid        isValid                clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct()      enable(m_axil_awready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteMasterWChannel  w;
                method m_axil_wdata          getData               clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_wstrb          getStrb               clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_wvalid         isValid               clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct()      enable(m_axil_wready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteMasterBChannel  b;
                method putResp(m_axil_bresp) enable(m_axil_bvalid) clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_bready         isReady               clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteMasterArChannel ar;
                method m_axil_araddr         getAddr                clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_arprot         getProt                clocked_by(usrClk) reset_by(usrRstN);  // never used
                method m_axil_arvalid        isValid                clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct()      enable(m_axil_arready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteMasterRChannel  r;
                method putResp(
                    m_axil_rdata,
                    m_axil_rresp
                ) enable(m_axil_rvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_rready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            method m_axil_awuser         getAwUser                         clocked_by(usrClk) reset_by(usrRstN);
            method m_axil_aruser         getArUser                         clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    `endif
    `ifdef USING_AXIL_CSR
        interface QdmaCsrAxiLiteMmSlave qdmaCsrAxiLiteMmSlave;
            interface AxiLiteSlaveAwChannel  aw;
                method putAddr(
                    s_axil_csr_awaddr,
                    s_axil_csr_awprot  // never used
                ) enable(s_axil_csr_awvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_csr_awready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveWChannel   w;
                method putData(
                    s_axil_csr_wdata,
                    s_axil_csr_wstrb
                ) enable(s_axil_csr_wvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_csr_wready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveBChannel   b;
                method s_axil_csr_bvalid          isValid                   clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_csr_bresp           getResp                   clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct()           enable(s_axil_csr_bready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveArChannel  ar;
                method putAddr(
                    s_axil_csr_araddr,
                    s_axil_csr_arprot  // never used
                ) enable(s_axil_csr_arvalid) clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_csr_arready         isReady                            clocked_by(usrClk) reset_by(usrRstN);
            endinterface
            interface AxiLiteSlaveRChannel   r;
                method s_axil_csr_rvalid          isValid                   clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_csr_rdata           getData                   clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_csr_rresp           getResp                   clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct()           enable(s_axil_csr_rready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
        endinterface
    `endif
        interface UsrInterruptPin usrIrq;
            method putIrq(
                usr_irq_in_vec,
                usr_irq_in_fnc
            ) enable(usr_irq_in_vld)       clocked_by(usrClk) reset_by(usrRstN);
            method usr_irq_out_ack  getAck clocked_by(usrClk) reset_by(usrRstN);
            method usr_irq_out_fail isFail clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface QdmaH2CDataStream qdmaH2CDataStream;
            method m_axis_h2c_tdata           getData                   clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tcrc            getCrc                    clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tuser_qid       getUsrQid                 clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tuser_port_id   getUsrPid                 clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tuser_err       getUsrErr                 clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tuser_mdata     getUsrMeta                clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tuser_mty       getUsrMty                 clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tlast           getLast                   clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tuser_zero_byte isZeroByte                clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tvalid          isValid                   clocked_by(usrClk) reset_by(usrRstN);
            method readyAssertAct()           enable(m_axis_h2c_tready) clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface QdmaC2HDataStream qdmaC2HDataStream;
            method putData(
                s_axis_c2h_tdata,
                s_axis_c2h_tlast,
                s_axis_c2h_mty,
                s_axis_c2h_tcrc,
                s_axis_c2h_ctrl_marker,
                s_axis_c2h_ctrl_len,
                s_axis_c2h_ctrl_qid,
                s_axis_c2h_ctrl_port_id,
                s_axis_c2h_ctrl_ecc,
                s_axis_c2h_ctrl_has_cmpt
            ) enable(s_axis_c2h_tvalid)      clocked_by(usrClk) reset_by(usrRstN);
            method s_axis_c2h_tready isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface QdmaC2HCompleteStream qdmaC2HCompleteStream;
            method putData(
                s_axis_c2h_cmpt_tdata,
                s_axis_c2h_cmpt_size,
                s_axis_c2h_cmpt_dpar,
                s_axis_c2h_cmpt_ctrl_qid,
                s_axis_c2h_cmpt_ctrl_marker,
                s_axis_c2h_cmpt_ctrl_user_trig,
                s_axis_c2h_cmpt_ctrl_cmpt_type,
                s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id,
                s_axis_c2h_cmpt_ctrl_port_id,
                s_axis_c2h_cmpt_ctrl_col_idx,
                s_axis_c2h_cmpt_ctrl_err_idx,
                s_axis_c2h_cmpt_ctrl_no_wrb_marker
            ) enable(s_axis_c2h_cmpt_tvalid)      clocked_by(usrClk) reset_by(usrRstN);
            method s_axis_c2h_cmpt_tready isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QdmaC2HStatusPin qdmaC2HStatus;
            method axis_c2h_status_valid isValid        clocked_by(usrClk) reset_by(usrRstN);
            method axis_c2h_status_qid   getPktQid      clocked_by(usrClk) reset_by(usrRstN);
            method axis_c2h_status_drop  isPktDrop      clocked_by(usrClk) reset_by(usrRstN);
            method axis_c2h_status_last  isLastDsc      clocked_by(usrClk) reset_by(usrRstN);
            method axis_c2h_status_cmp   isCompletedPkt clocked_by(usrClk) reset_by(usrRstN);
            method axis_c2h_status_error isErr          clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QdmaH2CDescriptorStreamIn qdmaH2CDescriptorStreamIn;
            method putData(
                h2c_byp_in_st_addr,
                h2c_byp_in_st_len,
                h2c_byp_in_st_sop,
                h2c_byp_in_st_eop,
                h2c_byp_in_st_sdi,
                h2c_byp_in_st_mrkr_req,
                h2c_byp_in_st_no_dma,
                h2c_byp_in_st_qid,
                h2c_byp_in_st_error,
                h2c_byp_in_st_func,
                h2c_byp_in_st_cidx,
                h2c_byp_in_st_port_id
            ) enable(h2c_byp_in_st_vld)      clocked_by(usrClk) reset_by(usrRstN);
            method h2c_byp_in_st_rdy isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QdmaC2HDescriptorStreamIn qdmaC2HDescriptorStreamIn;
            method putData(
                c2h_byp_in_st_csh_addr,
                c2h_byp_in_st_csh_qid,
                c2h_byp_in_st_csh_error,
                c2h_byp_in_st_csh_func,
                c2h_byp_in_st_csh_port_id,
                c2h_byp_in_st_csh_pfch_tag
            ) enable(c2h_byp_in_st_csh_vld)      clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_in_st_csh_rdy isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QdmaH2CDescriptorStreamOut qdmaH2CDescriptorStreamOut;
            method h2c_byp_out_dsc     getDescriptor           clocked_by(usrClk) reset_by(usrRstN);
            method h2c_byp_out_st_mm   isMemroyMapped          clocked_by(usrClk) reset_by(usrRstN); // 0: stream; 1:memory mapped
            method h2c_byp_out_dsc_sz  getSize                 clocked_by(usrClk) reset_by(usrRstN); // 0: 8B; 1: 16B; 2: 32B; 3: 64B
            method h2c_byp_out_qid     getQid                  clocked_by(usrClk) reset_by(usrRstN);
            method h2c_byp_out_error   getErr                  clocked_by(usrClk) reset_by(usrRstN);
            method h2c_byp_out_func    getFunc                 clocked_by(usrClk) reset_by(usrRstN);
            method h2c_byp_out_cidx    getCidx                 clocked_by(usrClk) reset_by(usrRstN);
            method h2c_byp_out_port_id getPid                  clocked_by(usrClk) reset_by(usrRstN);
            method h2c_byp_out_fmt     getFmt                  clocked_by(usrClk) reset_by(usrRstN); // 0x0: standar descriptor; other reserved
            method h2c_byp_out_vld     isValid                 clocked_by(usrClk) reset_by(usrRstN);
            method readyAssertAct()    enable(h2c_byp_out_rdy) clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QdmaC2HDescriptorStreamOut qdmaC2HDescriptorStreamOut;
            method c2h_byp_out_dsc      getDescriptor           clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_out_st_mm    isMemroyMapped          clocked_by(usrClk) reset_by(usrRstN); // 0: stream; 1:memory mapped
            method c2h_byp_out_dsc_sz   getSize                 clocked_by(usrClk) reset_by(usrRstN); // 0: 8B; 1: 16B; 2: 32B; 3: 64B
            method c2h_byp_out_qid      getQid                  clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_out_error    getErr                  clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_out_func     getFunc                 clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_out_cidx     getCidx                 clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_out_port_id  getPid                  clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_out_pfch_tag getPfchTag              clocked_by(usrClk) reset_by(usrRstN);
            method c2h_byp_out_fmt      getFmt                  clocked_by(usrClk) reset_by(usrRstN); // 0x0: standar descriptor; other reserved
            method c2h_byp_out_vld      isValid                 clocked_by(usrClk) reset_by(usrRstN);
            method readyAssertAct()     enable(c2h_byp_out_rdy) clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QdmaDescriptorCreditIn qdmaDescriptorCreditIn;
            method putCrdt(
                dsc_crdt_in_crdt,
                dsc_crdt_in_dir, // 0: H2C; 1:C2H
                dsc_crdt_in_fence,
                dsc_crdt_in_qid
            ) enable(dsc_crdt_in_vld)      clocked_by(usrClk) reset_by(usrRstN);
            method dsc_crdt_in_rdy isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QdmaTrafficManageCreditOut qdmaTrafficManageCredit;
            method tm_dsc_sts_vld     isValid                clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_byp     getByp                 clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_dir     isC2H                  clocked_by(usrClk) reset_by(usrRstN); // 0: H2C; 1:C2H
            method tm_dsc_sts_mm      isMemoryMapped         clocked_by(usrClk) reset_by(usrRstN); // 0: stream; 1:memory mapped
            method tm_dsc_sts_qid     getQid                 clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_port_id getPid                 clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_avl     getCrdtAvailNum        clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_qinv    isQeuenInvalid         clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_qen     isQeuenEnabled         clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_irq_arm isQeuenReadyIrq        clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_error   isPidxEqCidx           clocked_by(usrClk) reset_by(usrRstN);
            method tm_dsc_sts_pidx    getPidx                clocked_by(usrClk) reset_by(usrRstN);
            method readyAssertAct()   enable(tm_dsc_sts_rdy) clocked_by(usrClk) reset_by(usrRstN);
        endinterface
        interface QueueStatusPin queueStatus;
            method qsts_out_op      getQueueOpTpye       clocked_by(usrClk) reset_by(usrRstN);
            method qsts_out_data    getQueueOpCode       clocked_by(usrClk) reset_by(usrRstN);
            method qsts_out_port_id getQueuePid          clocked_by(usrClk) reset_by(usrRstN);
            method qsts_out_qid     getQueueQid          clocked_by(usrClk) reset_by(usrRstN);
            method qsts_out_vld     isValid              clocked_by(usrClk) reset_by(usrRstN);
            method readyAssertAct() enable(qsts_out_rdy) clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    `ifdef USING_VDM
        interface VendorDefinedMessagePin vendorDefinedMessagePin;
            method st_rx_msg_valid  isValid               clocked_by(usrClk) reset_by(usrRstN);
            method st_rx_msg_data   getData               clocked_by(usrClk) reset_by(usrRstN);
            method st_rx_msg_last   isLast                clocked_by(usrClk) reset_by(usrRstN);
            method readyAssertAct() enable(st_rx_msg_rdy) clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    `endif
    `ifdef USING_FLR
        interface FunctionalLevelResetPin functionalLevelResetPin;
            method usr_flr_fnc                     getChangedFuncId         clocked_by(usrClk) reset_by(usrRstN);
            method usr_flr_set                     isSet                    clocked_by(usrClk) reset_by(usrRstN);
            method putDoneFuncId(usr_flr_done_fnc) enable(usr_flr_done_vld) clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    `endif
    endinterface

    schedule (
    `ifdef USING_PIPE_SIM
        qdmaPciExpPin.qdmaSimPipe.cmdIn,
        qdmaPciExpPin.qdmaSimPipe.sigs0In,
        qdmaPciExpPin.qdmaSimPipe.sigs1In,
        qdmaPciExpPin.qdmaSimPipe.sigs2In,
        qdmaPciExpPin.qdmaSimPipe.sigs3In,
        qdmaPciExpPin.qdmaSimPipe.sigs4In,
        qdmaPciExpPin.qdmaSimPipe.sigs5In,
        qdmaPciExpPin.qdmaSimPipe.sigs6In,
        qdmaPciExpPin.qdmaSimPipe.sigs7In,
        qdmaPciExpPin.qdmaSimPipe.sigs8In,
        qdmaPciExpPin.qdmaSimPipe.sigs9In,
        qdmaPciExpPin.qdmaSimPipe.sigs10In,
        qdmaPciExpPin.qdmaSimPipe.sigs11In,
        qdmaPciExpPin.qdmaSimPipe.sigs12In,
        qdmaPciExpPin.qdmaSimPipe.sigs13In,
        qdmaPciExpPin.qdmaSimPipe.sigs14In,
        qdmaPciExpPin.qdmaSimPipe.sigs15In,

        qdmaPciExpPin.qdmaSimPipe.cmdOut,
        qdmaPciExpPin.qdmaSimPipe.sigs0Out,
        qdmaPciExpPin.qdmaSimPipe.sigs1Out,
        qdmaPciExpPin.qdmaSimPipe.sigs2Out,
        qdmaPciExpPin.qdmaSimPipe.sigs3Out,
        qdmaPciExpPin.qdmaSimPipe.sigs4Out,
        qdmaPciExpPin.qdmaSimPipe.sigs5Out,
        qdmaPciExpPin.qdmaSimPipe.sigs6Out,
        qdmaPciExpPin.qdmaSimPipe.sigs7Out,
        qdmaPciExpPin.qdmaSimPipe.sigs8Out,
        qdmaPciExpPin.qdmaSimPipe.sigs9Out,
        qdmaPciExpPin.qdmaSimPipe.sigs10Out,
        qdmaPciExpPin.qdmaSimPipe.sigs11Out,
        qdmaPciExpPin.qdmaSimPipe.sigs12Out,
        qdmaPciExpPin.qdmaSimPipe.sigs13Out,
        qdmaPciExpPin.qdmaSimPipe.sigs14Out,
        qdmaPciExpPin.qdmaSimPipe.sigs15Out,
    `endif
        qdmaPciExpPin.qdmaPciePin.rxn,
        qdmaPciExpPin.qdmaPciePin.rxp,
        qdmaPciExpPin.qdmaPciePin.txn,
        qdmaPciExpPin.qdmaPciePin.txp
    ) CF (
    `ifdef USING_PIPE_SIM
        qdmaPciExpPin.qdmaSimPipe.cmdIn,
        qdmaPciExpPin.qdmaSimPipe.sigs0In,
        qdmaPciExpPin.qdmaSimPipe.sigs1In,
        qdmaPciExpPin.qdmaSimPipe.sigs2In,
        qdmaPciExpPin.qdmaSimPipe.sigs3In,
        qdmaPciExpPin.qdmaSimPipe.sigs4In,
        qdmaPciExpPin.qdmaSimPipe.sigs5In,
        qdmaPciExpPin.qdmaSimPipe.sigs6In,
        qdmaPciExpPin.qdmaSimPipe.sigs7In,
        qdmaPciExpPin.qdmaSimPipe.sigs8In,
        qdmaPciExpPin.qdmaSimPipe.sigs9In,
        qdmaPciExpPin.qdmaSimPipe.sigs10In,
        qdmaPciExpPin.qdmaSimPipe.sigs11In,
        qdmaPciExpPin.qdmaSimPipe.sigs12In,
        qdmaPciExpPin.qdmaSimPipe.sigs13In,
        qdmaPciExpPin.qdmaSimPipe.sigs14In,
        qdmaPciExpPin.qdmaSimPipe.sigs15In,

        qdmaPciExpPin.qdmaSimPipe.cmdOut,
        qdmaPciExpPin.qdmaSimPipe.sigs0Out,
        qdmaPciExpPin.qdmaSimPipe.sigs1Out,
        qdmaPciExpPin.qdmaSimPipe.sigs2Out,
        qdmaPciExpPin.qdmaSimPipe.sigs3Out,
        qdmaPciExpPin.qdmaSimPipe.sigs4Out,
        qdmaPciExpPin.qdmaSimPipe.sigs5Out,
        qdmaPciExpPin.qdmaSimPipe.sigs6Out,
        qdmaPciExpPin.qdmaSimPipe.sigs7Out,
        qdmaPciExpPin.qdmaSimPipe.sigs8Out,
        qdmaPciExpPin.qdmaSimPipe.sigs9Out,
        qdmaPciExpPin.qdmaSimPipe.sigs10Out,
        qdmaPciExpPin.qdmaSimPipe.sigs11Out,
        qdmaPciExpPin.qdmaSimPipe.sigs12Out,
        qdmaPciExpPin.qdmaSimPipe.sigs13Out,
        qdmaPciExpPin.qdmaSimPipe.sigs14Out,
        qdmaPciExpPin.qdmaSimPipe.sigs15Out,
    `endif
        qdmaPciExpPin.qdmaPciePin.rxn,
        qdmaPciExpPin.qdmaPciePin.rxp,
        qdmaPciExpPin.qdmaPciePin.txn,
        qdmaPciExpPin.qdmaPciePin.txp
    );

    schedule (
        isPhyReady,
        isUsrLnkUp,
    `ifdef USING_AXIL_CSR
        isCsrPorgDone,
    `endif
    `ifdef USING_AXIL_SLAVE
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.aw.putAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.aw.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.w.putData,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.w.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.b.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.b.getResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.b.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.ar.putAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.ar.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.getData,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.getResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.putAwUser,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.putArUser,
    `endif
    `ifdef USING_AXIL_MASTER
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.getAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.getProt,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.getData,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.getStrb,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.b.putResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.b.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.getAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.getProt,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.r.putResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.r.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.getAwUser,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.getArUser,
    `endif
    `ifdef USING_AXIL_CSR
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.aw.putAddr,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.aw.isReady,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.w.putData,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.w.isReady,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.b.isValid,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.b.getResp,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.b.readyAssertAct,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.ar.putAddr,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.ar.isReady,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.isValid,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.getData,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.getResp,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.readyAssertAct,
    `endif
        qdmaUsrPin.qdmaH2CDataStream.getData,
        qdmaUsrPin.qdmaH2CDataStream.getCrc,
        qdmaUsrPin.qdmaH2CDataStream.getUsrQid,
        qdmaUsrPin.qdmaH2CDataStream.getUsrPid,
        qdmaUsrPin.qdmaH2CDataStream.getUsrErr,
        qdmaUsrPin.qdmaH2CDataStream.getUsrMeta,
        qdmaUsrPin.qdmaH2CDataStream.getUsrMty,
        qdmaUsrPin.qdmaH2CDataStream.getLast,
        qdmaUsrPin.qdmaH2CDataStream.isZeroByte,
        qdmaUsrPin.qdmaH2CDataStream.isValid,
        qdmaUsrPin.qdmaH2CDataStream.readyAssertAct,

        qdmaUsrPin.qdmaC2HDataStream.putData,
        qdmaUsrPin.qdmaC2HDataStream.isReady,

        qdmaUsrPin.qdmaC2HCompleteStream.putData,
        qdmaUsrPin.qdmaC2HCompleteStream.isReady,

        qdmaUsrPin.qdmaC2HStatus.isValid,
        qdmaUsrPin.qdmaC2HStatus.getPktQid,
        qdmaUsrPin.qdmaC2HStatus.isPktDrop,
        qdmaUsrPin.qdmaC2HStatus.isLastDsc,
        qdmaUsrPin.qdmaC2HStatus.isCompletedPkt,
        qdmaUsrPin.qdmaC2HStatus.isErr,

        qdmaUsrPin.qdmaH2CDescriptorStreamIn.putData,
        qdmaUsrPin.qdmaH2CDescriptorStreamIn.isReady,

        qdmaUsrPin.qdmaC2HDescriptorStreamIn.putData,
        qdmaUsrPin.qdmaC2HDescriptorStreamIn.isReady,

        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getDescriptor,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.isMemroyMapped,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getSize,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getQid,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getErr,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getFunc,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getCidx,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getPid,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getFmt,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.isValid,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.readyAssertAct,

        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getDescriptor,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.isMemroyMapped,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getSize,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getQid,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getErr,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getFunc,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getCidx,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getPid,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getPfchTag,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getFmt,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.isValid,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.readyAssertAct,

        qdmaUsrPin.qdmaDescriptorCreditIn.putCrdt,
        qdmaUsrPin.qdmaDescriptorCreditIn.isReady,

        qdmaUsrPin.qdmaTrafficManageCredit.isValid,
        qdmaUsrPin.qdmaTrafficManageCredit.getByp,
        qdmaUsrPin.qdmaTrafficManageCredit.isC2H,
        qdmaUsrPin.qdmaTrafficManageCredit.isMemoryMapped,
        qdmaUsrPin.qdmaTrafficManageCredit.getQid,
        qdmaUsrPin.qdmaTrafficManageCredit.getPid,
        qdmaUsrPin.qdmaTrafficManageCredit.getCrdtAvailNum,
        qdmaUsrPin.qdmaTrafficManageCredit.isQeuenInvalid,
        qdmaUsrPin.qdmaTrafficManageCredit.isQeuenEnabled,
        qdmaUsrPin.qdmaTrafficManageCredit.isQeuenReadyIrq,
        qdmaUsrPin.qdmaTrafficManageCredit.isPidxEqCidx,
        qdmaUsrPin.qdmaTrafficManageCredit.getPidx,
        qdmaUsrPin.qdmaTrafficManageCredit.readyAssertAct,

        qdmaUsrPin.queueStatus.getQueueOpTpye,
        qdmaUsrPin.queueStatus.getQueueOpCode,
        qdmaUsrPin.queueStatus.getQueuePid,
        qdmaUsrPin.queueStatus.getQueueQid,
        qdmaUsrPin.queueStatus.isValid,
        qdmaUsrPin.queueStatus.readyAssertAct,
    `ifdef USING_VDM
        qdmaUsrPin.vendorDefinedMessagePin.isValid,
        qdmaUsrPin.vendorDefinedMessagePin.getData,
        qdmaUsrPin.vendorDefinedMessagePin.isLast,
        qdmaUsrPin.vendorDefinedMessagePin.readyAssertAct,
    `endif
    `ifdef USING_FLR
        qdmaUsrPin.functionalLevelResetPin.getChangedFuncId,
        qdmaUsrPin.functionalLevelResetPin.isSet,
        qdmaUsrPin.functionalLevelResetPin.putDoneFuncId,
    `endif
        qdmaUsrPin.usrIrq.putIrq,
        qdmaUsrPin.usrIrq.getAck,
        qdmaUsrPin.usrIrq.isFail
    ) CF (
        isPhyReady,
        isUsrLnkUp,
    `ifdef USING_AXIL_CSR
        isCsrPorgDone,
    `endif
    `ifdef USING_AXIL_SLAVE
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.aw.putAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.aw.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.w.putData,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.w.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.b.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.b.getResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.b.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.ar.putAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.ar.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.getData,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.getResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.r.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.putAwUser,
        qdmaUsrPin.qdmaConfigAxiLiteMmSlave.putArUser,
    `endif
    `ifdef USING_AXIL_MASTER
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.getAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.getProt,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.aw.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.getData,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.getStrb,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.w.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.b.putResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.b.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.getAddr,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.getProt,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.isValid,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.ar.readyAssertAct,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.r.putResp,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.r.isReady,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.getAwUser,
        qdmaUsrPin.qdmaConfigAxiLiteMmMaster.getArUser,
    `endif
    `ifdef USING_AXIL_CSR
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.aw.putAddr,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.aw.isReady,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.w.putData,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.w.isReady,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.b.isValid,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.b.getResp,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.b.readyAssertAct,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.ar.putAddr,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.ar.isReady,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.isValid,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.getData,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.getResp,
        qdmaUsrPin.qdmaCsrAxiLiteMmSlave.r.readyAssertAct,
    `endif
        qdmaUsrPin.qdmaH2CDataStream.getData,
        qdmaUsrPin.qdmaH2CDataStream.getCrc,
        qdmaUsrPin.qdmaH2CDataStream.getUsrQid,
        qdmaUsrPin.qdmaH2CDataStream.getUsrPid,
        qdmaUsrPin.qdmaH2CDataStream.getUsrErr,
        qdmaUsrPin.qdmaH2CDataStream.getUsrMeta,
        qdmaUsrPin.qdmaH2CDataStream.getUsrMty,
        qdmaUsrPin.qdmaH2CDataStream.getLast,
        qdmaUsrPin.qdmaH2CDataStream.isZeroByte,
        qdmaUsrPin.qdmaH2CDataStream.isValid,
        qdmaUsrPin.qdmaH2CDataStream.readyAssertAct,

        qdmaUsrPin.qdmaC2HDataStream.putData,
        qdmaUsrPin.qdmaC2HDataStream.isReady,

        qdmaUsrPin.qdmaC2HCompleteStream.putData,
        qdmaUsrPin.qdmaC2HCompleteStream.isReady,

        qdmaUsrPin.qdmaC2HStatus.isValid,
        qdmaUsrPin.qdmaC2HStatus.getPktQid,
        qdmaUsrPin.qdmaC2HStatus.isPktDrop,
        qdmaUsrPin.qdmaC2HStatus.isLastDsc,
        qdmaUsrPin.qdmaC2HStatus.isCompletedPkt,
        qdmaUsrPin.qdmaC2HStatus.isErr,

        qdmaUsrPin.qdmaH2CDescriptorStreamIn.putData,
        qdmaUsrPin.qdmaH2CDescriptorStreamIn.isReady,

        qdmaUsrPin.qdmaC2HDescriptorStreamIn.putData,
        qdmaUsrPin.qdmaC2HDescriptorStreamIn.isReady,

        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getDescriptor,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.isMemroyMapped,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getSize,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getQid,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getErr,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getFunc,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getCidx,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getPid,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.getFmt,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.isValid,
        qdmaUsrPin.qdmaH2CDescriptorStreamOut.readyAssertAct,

        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getDescriptor,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.isMemroyMapped,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getSize,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getQid,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getErr,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getFunc,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getCidx,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getPid,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getPfchTag,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.getFmt,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.isValid,
        qdmaUsrPin.qdmaC2HDescriptorStreamOut.readyAssertAct,

        qdmaUsrPin.qdmaDescriptorCreditIn.putCrdt,
        qdmaUsrPin.qdmaDescriptorCreditIn.isReady,

        qdmaUsrPin.qdmaTrafficManageCredit.isValid,
        qdmaUsrPin.qdmaTrafficManageCredit.getByp,
        qdmaUsrPin.qdmaTrafficManageCredit.isC2H,
        qdmaUsrPin.qdmaTrafficManageCredit.isMemoryMapped,
        qdmaUsrPin.qdmaTrafficManageCredit.getQid,
        qdmaUsrPin.qdmaTrafficManageCredit.getPid,
        qdmaUsrPin.qdmaTrafficManageCredit.getCrdtAvailNum,
        qdmaUsrPin.qdmaTrafficManageCredit.isQeuenInvalid,
        qdmaUsrPin.qdmaTrafficManageCredit.isQeuenEnabled,
        qdmaUsrPin.qdmaTrafficManageCredit.isQeuenReadyIrq,
        qdmaUsrPin.qdmaTrafficManageCredit.isPidxEqCidx,
        qdmaUsrPin.qdmaTrafficManageCredit.getPidx,
        qdmaUsrPin.qdmaTrafficManageCredit.readyAssertAct,

        qdmaUsrPin.queueStatus.getQueueOpTpye,
        qdmaUsrPin.queueStatus.getQueueOpCode,
        qdmaUsrPin.queueStatus.getQueuePid,
        qdmaUsrPin.queueStatus.getQueueQid,
        qdmaUsrPin.queueStatus.isValid,
        qdmaUsrPin.queueStatus.readyAssertAct,
    `ifdef USING_VDM
        qdmaUsrPin.vendorDefinedMessagePin.isValid,
        qdmaUsrPin.vendorDefinedMessagePin.getData,
        qdmaUsrPin.vendorDefinedMessagePin.isLast,
        qdmaUsrPin.vendorDefinedMessagePin.readyAssertAct,
    `endif
    `ifdef USING_FLR
        qdmaUsrPin.functionalLevelResetPin.getChangedFuncId,
        qdmaUsrPin.functionalLevelResetPin.isSet,
        qdmaUsrPin.functionalLevelResetPin.putDoneFuncId,
    `endif
        qdmaUsrPin.usrIrq.putIrq,
        qdmaUsrPin.usrIrq.getAck,
        qdmaUsrPin.usrIrq.isFail
    );
endmodule