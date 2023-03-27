import Clocks :: *;
import FIFOF :: *;
import FIFO :: *;
import SpecialFIFOs :: *;
import XdmaBvi :: *;
import PAClib :: *;
import GetPut :: *;
import Utils :: *;

typedef 0       XDMA_AXILITE_DEFAULT_PROT;
typedef 0       XDMA_AXILITE_DEFAULT_STRB;

interface XdmaRegisterConfigSlave;
    interface Put#(XdmaAxiLiteWriteReq)         writeReq;
    interface PipeOut#(XdmaAxiLiteWriteResp)    writeResp;
    interface Put#(XdmaAxiLiteReadReq)          readReq;
    interface PipeOut#(XdmaAxiLiteReadResp)     readResp;
endinterface

interface UserRegisterConfigMaster;
    interface PipeOut#(XdmaAxiLiteWriteReq)     writeReq;
endinterface

interface XdmaConfigIfc;
    interface XdmaRegisterConfigSlave xdmaRegisterConfig;
endinterface

interface CardToHostStream;
    interface Put#(DMADescriptorBypass) dmaWriteReq;
    interface Put#(DMADataStream)       dmaWriteDataInput;

    method    XdmaChStatus              getStatus;
endinterface

interface HostToCardStream;
    interface Put#(DMADescriptorBypass) dmaReadReq;
    interface PipeOut#(DMADataStream)   dmaReadDataOutput;

    method    XdmaChStatus              getStatus;
endinterface

interface XdmaDataIfc;
    interface CardToHostStream c2hStream;
    interface HostToCardStream h2cStream;
endinterface

interface XdmaUserController;
    interface XdmaConfigIfc xdmaConfigIfc;
    interface XdmaDataIfc   xdmaDataIfc;
endinterface

module mkAxiLiteWrite#(
    XdmaConfigAxiLiteMmSlave axil,
    PipeOut#(XdmaAxiLiteWriteReq) reqQ
)(PipeOut#(XdmaAxiLiteWriteResp));
    FIFOF#(XdmaAxiLiteAddr)      addrQ <- mkFIFOF();
    FIFOF#(XdmaAxiLiteData)      dataQ <- mkFIFOF();
    FIFOF#(XdmaAxiLiteWriteResp) respQ <- mkFIFOF();
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
            waitQ.enq(?);
        end
    endrule

    rule dmaRegWriteResp;
        if (waitQ.notEmpty) begin
            axil.b.readyAssertAct;
        end
        if (axil.b.isValid) begin
            respQ.enq(XdmaAxiLiteWriteResp{resp: axil.b.getResp});
            waitQ.deq;
        end
    endrule
    return convertFifo2PipeOut(respQ);
endmodule

module mkAxiLiteRead#(
    XdmaConfigAxiLiteMmSlave axil,
    PipeOut#(XdmaAxiLiteReadReq) reqPipeIn
)(PipeOut#(XdmaAxiLiteReadResp));
    FIFOF#(XdmaAxiLiteReadResp) respQ <- mkFIFOF();
    FIFOF#(Bool)                waitQ <- mkFIFOF();

    rule dmaRegReadAddrReq;
        if (reqPipeIn.notEmpty) begin
            axil.ar.putAddr(
                reqPipeIn.first.addr,
                fromInteger(valueOf(XDMA_AXILITE_DEFAULT_PROT))
            );
        end
        if (axil.ar.isReady) begin
            waitQ.enq(?);
            reqPipeIn.deq;
        end
    endrule

    rule dmaRegReadResp;
        if (waitQ.notEmpty) begin
            axil.r.readyAssertAct;
        end
        if (axil.r.isValid) begin
            respQ.enq(XdmaAxiLiteReadResp{
                data: axil.r.getData,
                resp: axil.r.getResp
            });
            waitQ.deq;
        end
    endrule
    return convertFifo2PipeOut(respQ);
endmodule

module mkProcessBypassDescriptor#(
    XdmaChannelDscByp dscStream,
    PipeOut#(DMADescriptorBypass) reqPipein
)(Empty);
    Reg#(Bool) prvRdy <- mkReg(False);

    rule process;
        prvRdy <= dscStream.isReady;
        if (reqPipein.notEmpty) begin
            dscStream.putDescriptor(
                reqPipein.first.src,
                reqPipein.first.dst,
                reqPipein.first.len,
                reqPipein.first.ctl
            );
        end
        if (dscStream.isReady || prvRdy) begin
            reqPipein.deq;
        end
    endrule
endmodule

module mkProcessC2HDataStream#(
    XdmaC2HDataStream c2hDataStream,
    PipeOut#(DMADataStream) sendDataQ
)(Empty);
    rule processC2HDataStreamTransmitHandshake;
        if (sendDataQ.notEmpty) begin
            c2hDataStream.putStream(
                sendDataQ.first.data,
                sendDataQ.first.last,
                sendDataQ.first.keep
            );
        end
        if (c2hDataStream.isReady) begin
            sendDataQ.deq;
        end
    endrule
endmodule

module mkProcessH2CDataStream#(
    XdmaH2CDataStream h2cDataStream
)(PipeOut#(DMADataStream));
    FIFOF#(DMADataStream)   receiveDataQ <- mkFIFOF();

    rule processH2CDataStreamReceiveHandshake;
        h2cDataStream.readyAssertAct;
        if (h2cDataStream.isValid) begin
            receiveDataQ.enq(DMADataStream{
                data: h2cDataStream.getData,
                keep: h2cDataStream.getKeep,
                last: h2cDataStream.getLast
            });
        end
    endrule
    return convertFifo2PipeOut(receiveDataQ);
endmodule

module mkXdmaUserController#(XdmaUsrPin usr)(XdmaUserController);
    FIFOF#(DMADescriptorBypass) h2cDscQ  <- mkFIFOF();
    let h2cDscBypPipeIn = convertFifo2PipeOut(h2cDscQ);

    FIFOF#(DMADescriptorBypass) c2hDscQ  <- mkFIFOF();
    let c2hDscBypPipeIn = convertFifo2PipeOut(c2hDscQ);

    FIFOF#(DMADataStream)       c2hDataQ <- mkFIFOF();
    let c2hDataStreamPipeIn = convertFifo2PipeOut(c2hDataQ);

    FIFOF#(XdmaAxiLiteWriteReq) dmaRegWriteReqQ <- mkFIFOF();
    let dmaRegWriteReqPipeIn = convertFifo2PipeOut(dmaRegWriteReqQ);

    FIFOF#(XdmaAxiLiteReadReq)  dmaRegReadReqQ  <- mkFIFOF();
    let dmaRegReadReqPipeIn = convertFifo2PipeOut(dmaRegReadReqQ);

    let dmaRegWriteRespPipeOut <- mkAxiLiteWrite(usr.xdmaConfigAxiLiteMmSlave, dmaRegWriteReqPipeIn);
    let dmaRegReadRespPipeOut  <- mkAxiLiteRead(usr.xdmaConfigAxiLiteMmSlave, dmaRegReadReqPipeIn);


    mkProcessBypassDescriptor(usr.xdmaC2HDscByp, c2hDscBypPipeIn);
    mkProcessBypassDescriptor(usr.xdmaH2CDscByp, h2cDscBypPipeIn);

    mkProcessC2HDataStream(usr.xdmaC2HDataStream, c2hDataStreamPipeIn);
    let h2cDataPipeOut <- mkProcessH2CDataStream(usr.xdmaH2CDataStream);

    interface XdmaConfigIfc xdmaConfigIfc;
        interface XdmaRegisterConfigSlave xdmaRegisterConfig;
            interface writeReq  = toPut(dmaRegWriteReqQ);
            interface writeResp = dmaRegWriteRespPipeOut;
            interface readReq   = toPut(dmaRegReadReqQ);
            interface readResp  = dmaRegReadRespPipeOut;
        endinterface
    endinterface

    interface XdmaDataIfc   xdmaDataIfc;
        interface CardToHostStream c2hStream;
            interface dmaWriteReq = toPut(c2hDscQ);
            interface dmaWriteDataInput = toPut(c2hDataQ);

            method    getStatus = usr.xdmaC2HSts.getStatus;
        endinterface

        interface HostToCardStream h2cStream;
            interface dmaReadReq = toPut(h2cDscQ);
            interface dmaReadDataOutput = h2cDataPipeOut;

            method    getStatus = usr.xdmaH2CSts.getStatus;
        endinterface
    endinterface
endmodule