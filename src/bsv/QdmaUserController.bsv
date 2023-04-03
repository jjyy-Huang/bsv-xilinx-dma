import Clocks :: *;
import FIFO :: *;
import FIFOF :: *;
import SpecialFIFOs :: *;
import GetPut :: *;
import PAClib :: *;

import QdmaBvi :: *;

typedef struct {
    QdmaAxisData      data;
    QdmaAxisLast      last;
    QdmaAxisMty       mty;
    QdmaAxisCrc       crc;
    QdmaAxisCtlMarker marker;
    QdmaAxisCtlLen    len;
    QdmaAxisCtlQid    queueID;
    QdmaAxisCtlPid    portID;
    QdmaAxisCtlEcc    ecc;
    QdmaAxisCtlCmpt   hasCmpt;
} QdmaC2HData deriving(Bits, Eq);

typedef struct {
    QdmaAxisData    data;
    QdmaAxisCrc     crc;
    QdmaAxisUsrQid  queueID;
    QdmaAxisUsrPid  portID;
    QdmaAxisUsrErr  err;
    QdmaAxisUsrMeta meta;
    QdmaAxisUsrMty  mty;
    QdmaAxisLast    last;
    QdmaAxisUsrZero isZero;
} QdmaH2CData deriving(Bits, Eq);

typedef struct {
    QdmaAxisData          data;
    QdmaAxisCmptSize      size;
    QdmaAxisCmptParity    parity;
    QdmaAxisCtlQid        queueID;
    QdmaAxisCtlMarker     marker;
    QdmaAxisCmptTrigger   trigger;
    QdmaAxisCmptType      cmptType;
    QdmaAxisCmptPktId     packetID;
    QdmaAxisCtlPid        portID;
    QdmaAxisCmptColIdx    colorID;
    QdmaAxisCmptErrIdx    errorID;
    QdmaAxisCmptWrbMarker writeBackMarker; // 1: sent to cmpt loopback; 0: dont sent
} QdmaC2HCompleteData deriving(Bits, Eq);

typedef struct {
    QdmaAxisCtlQid queueID;
    Bool           isPktDrop;
    Bool           isLastDsc;
    Bool           isCompletedPkt;
    Bool           isErr;
} QdmaC2HStatus deriving(Bits, Eq);

typedef struct {
    QdmaDscBypAddr      addr;
    QdmaDscBypLen       len;
    QdmaDscBypSop       sop;
    QdmaDscBypEop       eop;
    QdmaDscBypSdi       sdi;
    QdmaDscBypMarkerReq markReq;
    QdmaDscBypNoDma     noDMA;
    QdmaDscBypQid       queueID;
    QdmaDscBypErr       err;
    QdmaDscBypFunc      func;
    QdmaDscBypCidx      cidx;
    QdmaDscBypPid       portID;
} QdmaH2CDescriptorBypassIn deriving(Bits, Eq);

typedef struct {
    QdmaDescriptor dsc;
    QdmaDscBypType isMemoryMapped;
    QdmaDscBypSize size;
    QdmaDscBypQid  queueID;
    QdmaDscBypErr  err;
    QdmaDscBypFunc func;
    QdmaDscBypCidx cidx;
    QdmaDscBypPid  portID;
    QdmaDscBypFmt  fmt;
} QdmaH2CDescriptorBypassOut deriving(Bits, Eq);

typedef struct {
    QdmaDscBypAddr        addr;
    QdmaDscBypQid         queueID;
    QdmaDscBypErr         err;
    QdmaDscBypFunc        func;
    QdmaDscBypPid         portID;
    QdmaDscBypPreFetchTag preFetchTag;
} QdmaC2HDescriptorBypassIn deriving(Bits, Eq);

typedef struct {
    QdmaDescriptor        dsc;
    QdmaDscBypType        isMemoryMapped;
    QdmaDscBypSize        size;
    QdmaDscBypQid         queueID;
    QdmaDscBypErr         err;
    QdmaDscBypFunc        func;
    QdmaDscBypCidx        cidx;
    QdmaDscBypPid         portID;
    QdmaDscBypPreFetchTag preFetchTag;
    QdmaDscBypFmt         fmt;
} QdmaC2HDescriptorBypassOut deriving(Bits, Eq);

typedef struct {
    QdmaDscCrdt      crdt;
    QdmaDscCrdtDir   dir;
    QdmaDscCrdtFence fence;
    QdmaDscCrdtQid   qid;
} QdmaDescriptorCredit deriving(Bits, Eq);

typedef struct {
    Bool           isBypass;
    QdmaDscCrdtDir isC2H;
    QdmaDscBypType isMemoryMapped;
    QdmaDscBypQid  queueID;
    QdmaDscBypPid  portID;
    QdmaDscCrdt    crdtAvailNum;
    Bool           isQeuenInvalid;
    Bool           isQeuenEnabled;
    Bool           isQeuenReadyIrq;
    Bool           isPidxEqCidx;
    QdmaDscBypPidx pidx;
} QdmaTrafficManageCredit deriving(Bits, Eq);

typedef struct {
    QueueOpType opType;
    QueueOpCode opCode;
    QueuePid    portID;
    QueueQid    queueID;
} QdmaQueueStatus deriving(Bits, Eq);

typedef struct {
    VdmData data;
    Bool    isLast;
} QdmaVendorDefineMessage deriving(Bits, Eq);

typedef struct {
    IrqVec  vec;
    IrqFunc fnc;
} QdmaUserInterruptReq deriving(Bits, Eq);

typedef struct {
    Bool isFail;
} QdmaUserInterruptResp deriving(Bits, Eq);

typedef struct {
    QdmaAxiLiteAddr      addr;
    QdmaAxiLiteData      data;
    QdmaAxiLiteSlaveUser user;
} QdmaAxiLiteSlaveWriteReq deriving(Bits, Eq);

typedef struct {
    QdmaAxiLiteResp resp;
} QdmaAxiLiteSlaveWriteResp deriving(Bits, Eq);

typedef struct {
    QdmaAxiLiteAddr      addr;
    QdmaAxiLiteSlaveUser user;
} QdmaAxiLiteSlaveReadReq deriving(Bits, Eq);

typedef struct {
    QdmaAxiLiteData data;
    QdmaAxiLiteResp resp;
} QdmaAxiLiteSlaveReadResp deriving(Bits, Eq);

typedef struct {
    QdmaAxiLiteAddr addr;
    QdmaAxiLiteData data;
} QdmaCsrAxiLiteSlaveWriteReq deriving(Bits, Eq);

typedef struct {
    QdmaAxiLiteAddr addr;
} QdmaCsrAxiLiteSlaveReadReq deriving(Bits, Eq);

interface QdmaRegisterConfigSlave;
    interface Put#(QdmaAxiLiteSlaveWriteReq)      writeReq;
    interface PipeOut#(QdmaAxiLiteSlaveWriteResp) writeResp;
    interface Put#(QdmaAxiLiteSlaveReadReq)       readReq;
    interface PipeOut#(QdmaAxiLiteSlaveReadResp)  readResp;
endinterface

interface QdmaCsrConfigSlave;
    interface Put#(QdmaCsrAxiLiteSlaveWriteReq)   writeReq;
    interface PipeOut#(QdmaAxiLiteSlaveWriteResp) writeResp;
    interface Put#(QdmaCsrAxiLiteSlaveReadReq)    readReq;
    interface PipeOut#(QdmaAxiLiteSlaveReadResp)  readResp;
endinterface

// interface UserRegisterConfigMaster;
//     interface PipeOut#(QdmaAxiLiteWriteReq)     writeReq;
// endinterface

interface QdmaConfigIfc;
    interface QdmaRegisterConfigSlave qdmaRegisterConfig;
    interface QdmaCsrConfigSlave      qdmaCsrConfig;
endinterface

interface CardToHostStream;
    interface Put#(QdmaC2HDescriptorBypassIn)      qdmaWriteDscInput;
    interface Put#(QdmaC2HData)                    qdmaWriteDataInput;
    interface PipeOut#(QdmaC2HStatus)              channleStatus;
    interface Put#(QdmaC2HCompleteData)            qdmaWriteCmptInput;
endinterface

interface HostToCardStream;
    interface Put#(QdmaH2CDescriptorBypassIn)      dmaReadDscInput;
    interface PipeOut#(QdmaH2CData)                dmaReadDataOutput;
endinterface

interface QdmaDataIfc;
    interface CardToHostStream c2hStream;
    interface HostToCardStream h2cStream;
endinterface

interface QdmaDescriptorIfc;
    interface PipeOut#(QdmaC2HDescriptorBypassOut) qdmaExtraC2HDsc;
    interface PipeOut#(QdmaH2CDescriptorBypassOut) qdmaExtraH2CDsc;
    interface Put#(QdmaDescriptorCredit)           qdmaDscCrdt;
    interface PipeOut#(QdmaTrafficManageCredit)    qdmaTmCrdtPipeOut;
endinterface

interface QdmaIrqIfc;
    interface Put#(QdmaUserInterruptReq)      irqReq;
    interface PipeOut#(QdmaUserInterruptResp) irqResp;
endinterface

interface QdmaUserController;
    interface QdmaConfigIfc             qdmaConfigIfc;
    interface QdmaDataIfc               qdmaDataIfc;
    interface QdmaDescriptorIfc         qmdaDescriptorIfc;
    interface QdmaIrqIfc                qdmaIrqIfc;
    interface PipeOut#(QdmaQueueStatus) queueStatus;
endinterface

module mkConfigAxiLiteSlaveWrite#(
    QdmaConfigAxiLiteMmSlave axil,
    PipeOut#(QdmaAxiLiteWriteReq) reqQ
)(PipeOut#(QdmaAxiLiteWriteResp));
    FIFOF#(QdmaAxiLiteAddr)      addrQ <- mkFIFOF();
    FIFOF#(QdmaAxiLiteSlaveUser) userQ <- mkFIFOF();
    FIFOF#(QdmaAxiLiteData)      dataQ <- mkFIFOF();
    FIFOF#(QdmaAxiLiteWriteResp) respQ <- mkFIFOF();
    FIFOF#(Bool)                 waitQ <- mkFIFOF();

    rule handleReqQ;
        if (reqQ.notEmpty) begin
            addrQ.enq(reqQ.first.addr);
            dataQ.enq(reqQ.first.data);
            reqQ.deq;
        end
    endrule

    rule dmaRegWriteeAddr;
        if (addrQ.notEmpty) begin
            axil.aw.putAddr(
                addrQ.first,
                fromInteger(valueOf(XDMA_AXILITE_DEFAULT_PROT))
            );
        end
        if (axil.aw.isReady) begin
            addrQ.deq;
        end
    endrule

    rule dmaRegWriteData;
        if (dataQ.notEmpty) begin
            axil.w.putData(
                dataQ.first,
                fromInteger(valueOf(XDMA_AXILITE_DEFAULT_STRB))
            );
        end
        if (axil.w.isReady) begin
            dataQ.deq;
            waitQ.enq(dontCareValue);
        end
    endrule

    rule dmaRegWriteResp;
        if (waitQ.notEmpty) begin
            axil.b.readyAssertAct;
        end
        if (axil.b.isValid) begin
            respQ.enq(QdmaAxiLiteWriteResp{resp: axil.b.getResp});
            waitQ.deq;
        end
    endrule

    return convertFifo2PipeOut(respQ);
endmodule

module mkConfigAxiLiteSlaveRead#(
    QdmaConfigAxiLiteMmSlave axil,
    PipeOut#(QdmaAxiLiteSlaveReadReq) reqPipeIn
)(PipeOut#(QdmaAxiLiteSlaveReadResp));
    FIFOF#(QdmaAxiLiteSlaveReadResp) respQ <- mkFIFOF();
    FIFOF#(Bool)                     waitQ <- mkFIFOF();

    rule dmaRegReadAddrReq;
        if (reqPipeIn.notEmpty) begin
            axil.ar.putAddr(
                reqPipeIn.first.addr,
                fromInteger(valueOf(XDMA_AXILITE_DEFAULT_PROT))
            );
        end
        if (axil.ar.isReady) begin
            waitQ.enq(dontCareValue);
            reqPipeIn.deq;
        end
    endrule

    rule dmaRegReadResp;
        if (waitQ.notEmpty) begin
            axil.r.readyAssertAct;
        end
        if (axil.r.isValid) begin
            respQ.enq(QdmaAxiLiteReadResp{
                data: axil.r.getData,
                resp: axil.r.getResp
            });
            waitQ.deq;
        end
    endrule

    return convertFifo2PipeOut(respQ);
endmodule

module mkCsrAxiLiteSlaveWrite#(
    QdmaCsrAxiLiteMmSlave axil,
    PipeOut#(QdmaAxiLiteSlaveWriteReq) reqQ
)(PipeOut#(QdmaAxiLiteSlaveWriteResp));
    FIFOF#(QdmaAxiLiteAddr)           addrQ <- mkFIFOF();
    FIFOF#(QdmaAxiLiteData)           dataQ <- mkFIFOF();
    FIFOF#(QdmaAxiLiteSlaveWriteResp) respQ <- mkFIFOF();
    FIFOF#(Bool)                      waitQ <- mkFIFOF();

    rule handleReqQ;
        if (reqQ.notEmpty) begin
            addrQ.enq(reqQ.first.addr);
            dataQ.enq(reqQ.first.data);
            reqQ.deq;
        end
    endrule

    rule dmaRegWriteeAddr;
        if (addrQ.notEmpty) begin
            axil.aw.putAddr(
                addrQ.first,
                fromInteger(valueOf(XDMA_AXILITE_DEFAULT_PROT))
            );
        end
        if (axil.aw.isReady) begin
            addrQ.deq;
        end
    endrule

    rule dmaRegWriteData;
        if (dataQ.notEmpty) begin
            axil.w.putData(
                dataQ.first,
                fromInteger(valueOf(XDMA_AXILITE_DEFAULT_STRB))
            );
        end
        if (axil.w.isReady) begin
            dataQ.deq;
            waitQ.enq(dontCareValue);
        end
    endrule

    rule dmaRegWriteResp;
        if (waitQ.notEmpty) begin
            axil.b.readyAssertAct;
        end
        if (axil.b.isValid) begin
            respQ.enq(QdmaAxiLiteWriteResp{ resp: axil.b.getResp });
            waitQ.deq;
        end
    endrule

    return convertFifo2PipeOut(respQ);
endmodule

module mkCsrAxiLiteSlaveRead#(
    QdmaCsrAxiLiteMmSlave axil,
    PipeOut#(QdmaAxiLiteSlaveReadReq) reqPipeIn
)(PipeOut#(QdmaAxiLiteSlaveReadResp));
    FIFOF#(QdmaAxiLiteSlaveReadResp) respQ <- mkFIFOF();
    FIFOF#(Bool)                     waitQ <- mkFIFOF();

    rule dmaRegReadAddrReq;
        if (reqPipeIn.notEmpty) begin
            axil.ar.putAddr(
                reqPipeIn.first.addr,
                fromInteger(valueOf(XDMA_AXILITE_DEFAULT_PROT))
            );
        end
        if (axil.ar.isReady) begin
            waitQ.enq(dontCareValue);
            reqPipeIn.deq;
        end
    endrule

    rule dmaRegReadResp;
        if (waitQ.notEmpty) begin
            axil.r.readyAssertAct;
        end
        if (axil.r.isValid) begin
            respQ.enq(QdmaAxiLiteReadResp{
                data: axil.r.getData,
                resp: axil.r.getResp
            });
            waitQ.deq;
        end
    endrule

    return convertFifo2PipeOut(respQ);
endmodule

module mkProcessC2HDataStream#(
    QdmaC2HDataStream c2hDataStream,
    PipeOut#(QdmaC2HData) sendDataQ
)(Empty);
    rule processC2HDataStreamTransmitHandshake;
        if (sendDataQ.notEmpty) begin
            c2hDataStream.putData(
                sendDataQ.first.data,
                sendDataQ.first.last,
                sendDataQ.first.mty,
                sendDataQ.first.crc,
                sendDataQ.first.marker,
                sendDataQ.first.len,
                sendDataQ.first.queueID,
                sendDataQ.first.portID,
                sendDataQ.first.ecc,
                sendDataQ.first.hasCmpt
            );
        end
        if (c2hDataStream.isReady) begin
            sendDataQ.deq;
        end
    endrule
endmodule

module mkProcessH2CDataStream#(
    QdmaH2CDataStream h2cDataStream
)(PipeOut#(QdmaH2CData));
    FIFOF#(QdmaH2CData)   receiveDataQ <- mkFIFOF();

    rule processH2CDataStreamReceiveHandshake;
        h2cDataStream.readyAssertAct;
        if (h2cDataStream.isValid) begin
            receiveDataQ.enq(
                QdmaH2CData {
                    data:    h2cDataStream.getData,
                    crc:     h2cDataStream.getCrc,
                    queueID: h2cDataStream.getUsrQid,
                    portID:  h2cDataStream.getUsrPid,
                    err:     h2cDataStream.getUsrErr,
                    meta:    h2cDataStream.getUsrMeta,
                    mty:     h2cDataStream.getUsrMty,
                    last:    h2cDataStream.getLast,
                    isZero:  h2cDataStream.isZeroByte
                }
            );
        end
    endrule

    return convertFifo2PipeOut(receiveDataQ);
endmodule

module mkProcessC2HCompleteStream#(
    QdmaC2HCompleteStream c2hCompleteStream,
    PipeOut#(QdmaC2HCompleteData) sendDataQ
)(Empty);
    rule processC2HCompleteStreamTransmitHandshake;
        if (sendDataQ.notEmpty) begin
            c2hCompleteStream.putData(
                sendDataQ.first.data,
                sendDataQ.first.size,
                sendDataQ.first.parity,
                sendDataQ.first.queueID,
                sendDataQ.first.marker,
                sendDataQ.first.trigger,
                sendDataQ.first.cmptType,
                sendDataQ.first.packetID,
                sendDataQ.first.portID,
                sendDataQ.first.colorID,
                sendDataQ.first.errorID,
                sendDataQ.first.writeBackMarker
            );
        end
        if (c2hCompleteStream.isReady) begin
            sendDataQ.deq;
        end
    endrule
endmodule

module mkProcessC2HStatus#(
    QdmaC2HStatusPin c2hStatus
)(PipeOut#(QdmaC2HStatus));
    FIFOF#(QdmaC2HStatus)   getStatusQ <- mkFIFOF();

    rule processH2CDataStreamReceiveHandshake;
        if (c2hStatus.isValid) begin
            getStatusQ.enq(
                QdmaC2HStatus {
                    queueID:        c2hStatus.getPktQid,
                    isPktDrop:      c2hStatus.isPktDrop,
                    isLastDsc:      c2hStatus.isLastDsc,
                    isCompletedPkt: c2hStatus.isCompletedPkt,
                    isErr:          c2hStatus.isErr
                }
            );
        end
    endrule

    return convertFifo2PipeOut(getStatusQ);
endmodule

module mkProcessH2CDescriptorInput#(
    QdmaH2CDescriptorStreamIn h2cDscStream,
    PipeOut#(QdmaH2CDescriptorBypassIn) dscPipeIn
)(Empty);
    rule processH2CDescriptorInputHandshake;
        if (dscPipeIn.notEmpty) begin
            h2cDscStream.putData(
                dscPipeIn.first.addr,
                dscPipeIn.first.len,
                dscPipeIn.first.sop,
                dscPipeIn.first.eop,
                dscPipeIn.first.sdi,
                dscPipeIn.first.markReq,
                dscPipeIn.first.noDMA,
                dscPipeIn.first.queueID,
                dscPipeIn.first.err,
                dscPipeIn.first.func,
                dscPipeIn.first.cidx,
                dscPipeIn.first.portID
            );
        end
        if (h2cDscStream.isReady) begin
            dscPipeIn.deq;
        end
    endrule
endmodule

module mkProcessC2HDescriptorInput#(
    QdmaC2HDescriptorStreamIn c2hDscStream,
    PipeOut#(QdmaC2HDescriptorBypassIn) dscPipeIn
)(Empty);
    rule processC2HDescriptorInputHandshake;
        if (dscPipeIn.notEmpty) begin
            c2hDscStream.putData(
                dscPipeIn.first.addr,
                dscPipeIn.first.queueID,
                dscPipeIn.first.err,
                dscPipeIn.first.func,
                dscPipeIn.first.portID,
                dscPipeIn.first.preFetchTag
            );
        end
        if (c2hDscStream.isReady) begin
            dscPipeIn.deq;
        end
    endrule
endmodule

module mkProcessH2CDescriptorOutput#(
    QdmaH2CDescriptorStreamOut h2cDscStream
)(PipeOut#(QdmaH2CDescriptorBypassOut));
    FIFOF#(QdmaH2CDescriptorBypassOut)   receiveDscQ <- mkFIFOF();

    rule processH2CDataStreamReceiveHandshake;
        h2cDscStream.readyAssertAct;
        if (h2cDscStream.isValid) begin
            receiveDscQ.enq(
                QdmaH2CDescriptorBypassOut {
                    dsc:            h2cDscStream.getDescriptor,
                    isMemoryMapped: h2cDscStream.isMemroyMapped,
                    size:           h2cDscStream.getSize,
                    queueID:        h2cDscStream.getQid,
                    err:            h2cDscStream.getErr,
                    func:           h2cDscStream.getFunc,
                    cidx:           h2cDscStream.getCidx,
                    portID:         h2cDscStream.getPid,
                    fmt:            h2cDscStream.getFmt
                }
            );
        end
    endrule

    return convertFifo2PipeOut(receiveDscQ);
endmodule

module mkProcessC2HDescriptorOutput#(
    QdmaC2HDescriptorStreamOut c2hDscStream
)(PipeOut#(QdmaC2HDescriptorBypassOut));
    FIFOF#(QdmaC2HDescriptorBypassOut) receiveDscQ <- mkFIFOF();

    rule processC2HDataStreamReceiveHandshake;
        c2hDscStream.readyAssertAct;
        if (c2hDscStream.isValid) begin
            receiveDscQ.enq(
                QdmaC2HDescriptorBypassOut {
                    dsc:            c2hDscStream.getDescriptor,
                    isMemoryMapped: c2hDscStream.isMemroyMapped,
                    size:           c2hDscStream.getSize,
                    queueID:        c2hDscStream.getQid,
                    err:            c2hDscStream.getErr,
                    func:           c2hDscStream.getFunc,
                    cidx:           c2hDscStream.getCidx,
                    portID:         c2hDscStream.getPid,
                    preFetchTag:    c2hDscStream.getPfchTag,
                    fmt:            c2hDscStream.getFmt
                }
            );
        end
    endrule

    return convertFifo2PipeOut(receiveDscQ);
endmodule

module mkProcessDescriptorCredit#(
    QdmaDescriptorCreditIn dscCrdtPin,
    PipeOut#(QdmaDescriptorCredit) writeReqPipeIn
)(Empty);
    rule processDescriptorInputHandshake;
        if (writeReqPipeIn.notEmpty) begin
            dscCrdtPin.putCrdt(
                writeReqPipeIn.first.crdt,
                writeReqPipeIn.first.dir,
                writeReqPipeIn.first.fence,
                writeReqPipeIn.first.qid
            );
        end
        if (dscCrdtPin.isReady) begin
            writeReqPipeIn.deq;
        end
    endrule
endmodule

module mkProcessTrafficManageCredit#(
    QdmaTrafficManageCreditOut tmCrdt
)(PipeOut#(QdmaTrafficManageCredit));
    FIFOF#(QdmaTrafficManageCredit)   receiveCrdtQ <- mkFIFOF();

    rule processTrafficManageCreditReceiveHandshake;
        tmCrdt.readyAssertAct;
        if (tmCrdt.isValid) begin
            receiveCrdtQ.enq(
                QdmaTrafficManageCredit {
                    isBypass:        tmCrdt.getByp,
                    isC2H:           tmCrdt.isC2H,
                    isMemoryMapped:  tmCrdt.isMemoryMapped,
                    queueID:         tmCrdt.getQid,
                    portID:          tmCrdt.getPid,
                    crdtAvailNum:    tmCrdt.getCrdtAvailNum,
                    isQeuenInvalid:  tmCrdt.isQeuenInvalid,
                    isQeuenEnabled:  tmCrdt.isQeuenEnabled,
                    isQeuenReadyIrq: tmCrdt.isQeuenReadyIrq,
                    isPidxEqCidx:    tmCrdt.isPidxEqCidx,
                    pidx:            tmCrdt.getPidx
                }
            );
        end
    endrule

    return convertFifo2PipeOut(receiveCrdtQ);
endmodule

module mkProcessQueueStatus#(
    QueueStatusPin qStatus
)(PipeOut#(QdmaQueueStatus));
    FIFOF#(QdmaQueueStatus) receiveStatusQ <- mkFIFOF();

    rule processQueueStatusReceiveHandshake;
        qStatus.readyAssertAct;
        if (qStatus.isValid) begin
            receiveStatusQ.enq(
                QdmaQueueStatus {
                    opType:  qStatus.getQueueOpTpye,
                    opCode:  qStatus.getQueueOpCode,
                    portID:  qStatus.getQueuePid,
                    queueID: qStatus.getQueueQid
                }
            );
        end
    endrule

    return convertFifo2PipeOut(receiveStatusQ);
endmodule

module mkProcessUsrInterrupt#(
    UsrInterruptPin usrIrqPin,
    PipeOut#(QdmaUserInterruptReq) usrIrqReqPipeIn
)(PipeOut#(QdmaUserInterruptResp));
    FIFOF#(QdmaUserInterruptResp) usrIrqRespQ <- mkFIFOF();

    rule processIrqHandshake;
        if(usrIrqReqPipeIn.notEmpty) begin
            usrIrqPin.putIrq(
                usrIrqReqPipeIn.first.vec,
                usrIrqReqPipeIn.first.fnc
            );
        end
        if (usrIrqPin.getAck) begin
            usrIrqReqPipeIn.deq;
            usrIrqRespQ.enq(
                QdmaUserInterruptResp {
                    isFail: usrIrqPin.isFail
                }
            );
        end
    endrule

    return convertFifo2PipeOut(usrIrqRespQ);
endmodule

(* no_defualt_clock, no_default_reset *)
module mkQdmaUserController(QdmaUsrPin usrPin)(QdmaUserController);
    FIFOF#(QdmaAxiLiteSlaveWriteReq) qdmaConfigWriteReqQ <- mkFIFOF();
    let qdmaConfigWriteReqPipeIn   =  convertFifo2PipeOut(qdmaConfigWriteReqQ);
    let qdmaConfigWriteRespPipeOut <- mkConfigAxiLiteSlaveWrite(
        usrPin.qdmaConfigAxiLiteMmSlave,
        qdmaConfigWriteReqPipeIn
    );

    FIFOF#(QdmaAxiLiteSlaveReadReq) qdmaConfigReadReqQ <- mkFIFOF();
    let qdmaConfigReadReqPipeIn   =  convertFifo2PipeOut(qdmaConfigReadReqQ);
    let qdmaConfigReadRespPipeOut <- mkConfigAxiLiteSlaveRead(
        usrPin.qdmaConfigAxiLiteMmSlave,
        qdmaConfigReadReqPipeIn
    );

    FIFOF#(QdmaCsrAxiLiteSlaveWriteReq) qdmaCsrWriteReqQ <- mkFIFOF();
    let qdmaCsrWriteReqPipeIn   =  convertFifo2PipeOut(qdmaCsrWriteReqQ);
    let qdmaCsrWriteRespPipeOut <- mkCsrAxiLiteSlaveWrite(
        usrPin.qdmaCsrAxiLiteMmSlave,
        qdmaCsrWriteReqPipeIn
    );

    FIFOF#(QdmaCsrAxiLiteSlaveReadReq) qdmaCsrReadReqQ <- mkFIFOF();
    let qdmaCsrReadReqPipeIn   =  convertFifo2PipeOut(qdmaCsrReadReqQ);
    let qdmaCsrReadRespPipeOut <- mkCsrAxiLiteSlaveRead(
        usrPin.qdmaCsrAxiLiteMmSlave,
        qdmaCsrReadReqPipeIn
    );

    FIFOF#(QdmaC2HDescriptorBypassIn) qdmaC2HDscWriteQ <- mkFIFOF();
    let qmdaC2HDscWritePipeIn = convertFifo2PipeOut(qdmaC2HDscWriteQ);
    mkProcessC2HDescriptorInput(usrPin.qdmaC2HDescriptorStreamIn, qmdaC2HDscWritePipeIn);

    FIFOF#(QdmaC2HData) qdmaC2HDataWriteQ <- mkFIFOF();
    let qdmaC2HDataWritePipeIn = convertFifo2PipeOut(qdmaC2HDataWriteQ);
    mkProcessC2HDataStream(usrPin.qdmaC2HDataStream, qdmaC2HDataWritePipeIn);

    FIFOF#(QdmaC2HCompleteData) qdmaC2HCmptWriteQ <- mkFIFOF();
    let qdmaC2HCmptWritePipeIn = convertFifo2PipeOut(qdmaC2HCmptWriteQ);
    mkProcessC2HCompleteStream(usrPin.qdmaC2HCompleteStream, qdmaC2HCmptWritePipeIn);

    let qdmaC2HStatusPipeOut <- mkProcessC2HStatus(usrPin.qdmaC2HStatusPin);

    FIFOF#(QdmaH2CDescriptorBypassIn) qdmaH2CDscWriteQ <- mkFIFOF();
    let qdmaH2CDscWritePipeIn = convertFifo2PipeOut(qdmaH2CDscWriteQ);
    mkProcessH2CDescriptorInput(usrPin.qdmaH2CDescriptorStreamIn, qdmaH2CDscWritePipeIn);

    let qdmaH2CDataPipeOut <- mkProcessH2CDataStream(usrPin.qdmaH2CDataStream);

    let qdmaC2HDscExtraPipeOut <- mkProcessC2HDescriptorOutput(usrPin.qdmaC2HDescriptorStreamOut);
    let qdmaH2CDscExtraPipeOut <- mkProcessH2CDescriptorOutput(usrPin.qdmaH2CDescriptorStreamOut);

    FIFOF#(QdmaDescriptorCredit) qdmaDscCrdtWriteQ <- mkFIFOF();
    let qdmaDscCrdtWritePipeIn = convertFifo2PipeOut(qdmaDscCrdtWriteQ);
    mkProcessDescriptorCredit(usrPin.qdmaDescriptorCreditIn);

    let qdmaTmCrdtPipeOut <- mkProcessTrafficManageCredit(usrPin.qdmaTrafficManageCredit);

    let qmdaQueuePipeOut <- mkProcessQueueStatus(usrPin.queueStatus);

    FIFOF#(QdmaUserInterruptReq) qdmaUsrIrqReqQ <- mkFIFOF();
    let qdmaUsrIrqReqPipeIn   =  convertFifo2PipeOut(qdmaUsrIrqReqQ);
    let qdmaUsrIrqRespPipeOut <- mkProcessUsrInterrupt(usrPin.usrIrq, qdmaUsrIrqReqPipeIn);

    interface QdmaConfigIfc qdmaConfigIfc;
        interface QdmaRegisterConfigSlave qdmaRegisterConfig;
            interface writeReq  = toPut(qdmaConfigWriteReqQ);
            interface writeResp = qdmaConfigWriteRespPipeOut;
            interface readReq   = toPut(qdmaConfigReadReqQ);
            interface readResp  = qdmaConfigReadRespPipeOut;
        endinterface

        interface QdmaCsrConfigSlave qdmaCsrConfig;
            interface writeReq  = toPut(qdmaCsrWriteReqQ);
            interface writeResp = qdmaCsrWriteRespPipeOut;
            interface readReq   = toPut(qdmaCsrReadReqQ);
            interface readResp  = qdmaCsrReadRespPipeOut;
        endinterface
    endinterface

    interface QdmaDataIfc qdmaDataIfc;
        interface CardToHostStream c2hStream;
            interface qdmaWriteDscInput  = toPut(qdmaC2HDscWriteQ);
            interface qdmaWriteDataInput = toPut(qdmaC2HDataWriteQ);
            interface qdmaWriteCmptInput = toPut(qdmaC2HCmptWriteQ);
            interface channleStatus      = qdmaC2HStatusPipeOut;
        endinterface

        interface HostToCardStream h2cStream;
            interface dmaReadDscInput   = toPut(qdmaH2CDscWriteQ);
            interface dmaReadDataOutput = qdmaH2CDataPipeOut;
        endinterface
    endinterface

    interface QdmaDescriptorIfc qmdaDescriptorIfc;
        interface qdmaExtraC2HDsc   = qdmaC2HDscExtraPipeOut;
        interface qdmaExtraH2CDsc   = qdmaH2CDscExtraPipeOut;
        interface qdmaDscCrdt       = toPut(qdmaDscCrdtWriteQ);
        interface qdmaTmCrdtPipeOut = qdmaTmCrdtPipeOut;
    endinterface

    interface QdmaIrqIfc qdmaIrqIfc;
        interface irqReq  = toPut(qdmaUsrIrqReqQ);
        interface irqResp = qdmaUsrIrqRespPipeOut;
    endinterface

    interface queueStatus = qmdaQueuePipeOut;
endmodule