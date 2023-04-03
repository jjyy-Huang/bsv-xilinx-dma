import Clocks :: *;
import FIFOF :: *;
import FIFO :: *;
import SpecialFIFOs :: *;
import XdmaBvi :: *;
import PAClib :: *;
import GetPut :: *;
import Utils :: *;
import XdmaDataType :: *;

// dma as slave, user logic as master
module mkAxiLiteSlaveWriteHandshake#(
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

    rule usrWriteDmaAddr;
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

    rule usrWriteDmaData;
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

    rule dmaResp;
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

module mkAxiLiteSlaveReadHandshake#(
    XdmaConfigAxiLiteMmSlave axil,
    PipeOut#(XdmaAxiLiteReadReq) reqPipeIn
)(PipeOut#(XdmaAxiLiteReadResp));
    FIFOF#(XdmaAxiLiteReadResp) respQ <- mkFIFOF();
    FIFOF#(Bool)                waitQ <- mkFIFOF();

    rule usrReadDmaAddr;
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

    rule dmaResp;
        if (waitQ.notEmpty) begin
            axil.r.readyAssertAct;
        end
        if (axil.r.isValid) begin
            respQ.enq(
                XdmaAxiLiteReadResp {
                    data: axil.r.getData,
                    resp: axil.r.getResp
                }
            );
            waitQ.deq;
        end
    endrule

    return convertFifo2PipeOut(respQ);
endmodule

// dma as master, ram or user logic as slave; RAM gen resp signal
module mkAxiLiteMasterWriteHandshake#(
    XdmaConfigAxiLiteMmMaster axil,
    PipeOut#(XdmaAxiLiteWriteResp) respPipeIn
)(PipeOut#(XdmaAxiLiteWriteReq));
    FIFOF#(XdmaAxiLiteAddr)      addrQ <- mkFIFOF();
    FIFOF#(XdmaAxiLiteData)      dataQ <- mkFIFOF();
    FIFOF#(XdmaAxiLiteWriteReq)  reqQ  <- mkFIFOF();

    rule dmaWriteUsrAddr;
        if (axil.aw.isValid) begin
            axil.aw.readyAssertAct;
            addrQ.enq(axil.aw.getAddr);
        end
    endrule

    rule dmaWriteUsrData;
        if (axil.w.isValid) begin
            axil.w.readyAssertAct;
            dataQ.enq(axil.w.getData);
        end
    endrule

    rule handleReqQ;
        if (addrQ.notEmpty && dataQ.notEmpty) begin
            reqQ.enq(
                XdmaAxiLiteWriteReq {
                    addr: addrQ.first,
                    data: dataQ.first
                }
            );
            addrQ.deq;
            dataQ.deq;
        end
    endrule

    rule usrResp;
        if (respPipeIn.notEmpty) begin
            axil.b.putResp(respPipeIn.first.resp);
        end
        if (axil.b.isReady) begin
            respPipeIn.deq;
        end
    endrule

    return convertFifo2PipeOut(reqQ);
endmodule

module mkAxiLiteMasterReadHandshake#(
    XdmaConfigAxiLiteMmMaster axil,
    PipeOut#(XdmaAxiLiteReadResp) respPipeIn
)(PipeOut#(XdmaAxiLiteReadReq));
    FIFOF#(XdmaAxiLiteReadReq)  reqQ  <- mkFIFOF();
    FIFOF#(Bool)                waitQ <- mkFIFOF();

    rule dmaReadUsrAddr;
        if (axil.ar.isValid) begin
            axil.ar.readyAssertAct;
            reqQ.enq(unpack(axil.ar.getAddr));
        end
    endrule

    rule usrResp;
        if (respPipeIn.notEmpty) begin
            axil.r.putResp(
                respPipeIn.first.data,
                respPipeIn.first.resp
            );
        end
        if (axil.r.isReady) begin
            respPipeIn.deq;
        end
    endrule

    return convertFifo2PipeOut(reqQ);
endmodule

// stream or axiMM
module mkBypassDescriptorHandshake#(
    XdmaChannelDscByp dscStream,
    PipeOut#(XdmaDescriptorBypass) reqPipein
)(Empty);
    Reg#(Bool) prvRdy <- mkReg(False);
    let isC2H = (reqPipein.first.channel == C2H);

    rule handshake;
        prvRdy <= dscStream.isReady;
        if (reqPipein.notEmpty) begin
            dscStream.putDescriptor(
            `ifdef USING_AXISTREAM
                !isC2H ? reqPipein.first.addr : 0,
                isC2H  ? reqPipein.first.addr : 0,
            `else
                reqPipein.first.src,
                reqPipein.first.dst,
            `endif
                reqPipein.first.len,
                zeroExtend(pack(reqPipein.first.ctl))
            );
        end
        if (dscStream.isReady || prvRdy) begin
            reqPipein.deq;
        end
    endrule
endmodule

module mkC2HDataStreamHandshake#(
    XdmaC2HDataStream c2hDataStream,
    PipeOut#(XdmaDataStream) sendDataQ
)(Empty);
    rule handshake;
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

module mkH2CDataStreamHandshake#(
    XdmaH2CDataStream h2cDataStream
)(PipeOut#(XdmaDataStream));
    FIFOF#(XdmaDataStream)   receiveDataQ <- mkFIFOF();

    rule handshake;
        h2cDataStream.readyAssertAct;
        if (h2cDataStream.isValid) begin
            receiveDataQ.enq(
                XdmaDataStream {
                    data: h2cDataStream.getData,
                    keep: h2cDataStream.getKeep,
                    last: h2cDataStream.getLast
                }
            );
        end
    endrule

    return convertFifo2PipeOut(receiveDataQ);
endmodule

`ifdef USING_CFG_MGMT
module mkConfigManagementHandshake#(
    XdmaCfgMgmt cfgMgmt,
    PipeOut#(XdmaConfigManagmentReq) mgmtReqPipeIn
)(PipeOut#(XdmaConfigManagmentResp));
    FIFOF#(XdmaConfigManagmentResp)  mgmtRespQ <- mkFIFOF();

    Reg#(XdmaConfigManagmentReq) cfgReg     <- mkRegU;
    Reg#(Bool)                   isWriteReg <- mkRegU;
    Reg#(Bool)                   isEmpty[2] <- mkCReg(2, False);

    rule alwaysRun;
        cfgReg     <= mgmtReqPipeIn.first;
        isWriteReg <= mgmtReqPipeIn.first.op == WRITE;
        isEmpty[0] <= mgmtReqPipeIn.notEmpty;
    endrule

    rule setData;
        cfgMgmt.putAddr(cfgReg.addr);
        cfgMgmt.putWrData(cfgReg.data);
        cfgMgmt.putByteEna(cfgReg.ena);
    endrule

    rule handshake;
        if (isEmpty[1]) begin
            if (isWriteReg) begin
                cfgMgmt.wrAssertAct;
            end
            else begin
                cfgMgmt.rdAssertAct;
            end
        end

        if (cfgMgmt.isDone) begin
            mgmtRespQ.enq(
                XdmaConfigManagmentResp {
                    data: isWriteReg ? ? : mgmtReadData
                }
            );
            mgmtReqPipeIn.deq;
            isEmpty[1] <= False;
        end
    endrule

    return convertFifo2PipeOut(mgmtRespQ);
endmodule
`endif
