import Clocks :: *;
import FIFOF :: *;
import FIFO :: *;
import SpecialFIFOs :: *;
import PAClib :: *;
import GetPut :: *;
import Utils :: *;
import ProcessHandshake :: *;
import XdmaBvi :: *;
import XdmaDataType :: *;
import XdmaRegisterSpace :: *;

interface XdmaRegisterConfigSlave;
    interface Put#(XdmaAxiLiteWriteReq)      writeReq;
    interface PipeOut#(XdmaAxiLiteWriteResp) writeResp;
    interface Put#(XdmaAxiLiteReadReq)       readReq;
    interface PipeOut#(XdmaAxiLiteReadResp)  readResp;
endinterface

interface UserRegisterConfigMaster;
    interface PipeOut#(XdmaAxiLiteWriteReq)  writeReq;
endinterface

interface XdmaConfigIfc;
    interface XdmaRegisterConfigSlave xdmaRegisterConfig;
endinterface

interface CardToHostStream;
    interface Put#(XdmaDescriptorBypass) dmaWriteReq;
    interface Put#(XdmaDataStream)       dmaWriteDataInput;

    method    ChannelStatus              getStatus;
endinterface

interface HostToCardStream;
    interface Put#(XdmaDescriptorBypass) dmaReadReq;
    interface PipeOut#(XdmaDataStream)   dmaReadDataOutput;

    method    ChannelStatus              getStatus;
endinterface

interface XdmaDataIfc;
    interface CardToHostStream c2hStream;
    interface HostToCardStream h2cStream;
endinterface

interface XdmaUser;
    interface XdmaConfigIfc xdmaConfigIfc;
    interface XdmaDataIfc   xdmaDataIfc;
endinterface

module mkInitXdmaChannel#(PipeOut#(XdmaChannel) initReqPipeIn, XdmaRegisterConfigSlave xdmaCfg)(Empty);
    Reg#(XdmaChannelInitStatus) xdmaChannelInitStatus <- mkReg(IDLE);
    let isC2H = initReqPipeIn.first == C2H;
    let writeAddr = isC2H ?
        fromInteger(valueOf(XdmaCardToHostRegisterBaseAddress)) + fromInteger(valueOf(XdmaChannelControlOffset)) :
        fromInteger(valueOf(XdmaHostToCardRegisterBaseAddress)) + fromInteger(valueOf(XdmaChannelControlOffset));

    rule idleStage if (xdmaChannelInitStatus == IDLE);
        if (initReqPipeIn.notEmpty) begin
            xdmaChannelInitStatus <= WRITE_REQ;
        end
    endrule

    rule reqStage if (xdmaChannelInitStatus == WRITE_REQ);
        xdmaCfg.writeReq.put(
            XdmaAxiLiteWriteReq {
                addr: writeAddr,
                data: fromInteger(valueOf(ChannelAllStarted))
            }
        );
        xdmaChannelInitStatus <= WRITE_RESP;
    endrule

    rule respStage if (xdmaChannelInitStatus == WRITE_RESP);
        xdmaCfg.writeResp.deq;
        xdmaChannelInitStatus <= INIT_SUCCESSED;
    endrule
endmodule

module mkXdmaUser#(XdmaUsrPin usrPin)(XdmaUser);
    FIFOF#(XdmaDescriptorBypass) h2cDscQ  <- mkFIFOF();
    let h2cDscBypPipeIn = convertFifo2PipeOut(h2cDscQ);

    FIFOF#(XdmaDescriptorBypass) c2hDscQ  <- mkFIFOF();
    let c2hDscBypPipeIn = convertFifo2PipeOut(c2hDscQ);

    FIFOF#(XdmaDataStream)       c2hDataQ <- mkFIFOF();
    let c2hDataStreamPipeIn = convertFifo2PipeOut(c2hDataQ);

    FIFOF#(XdmaAxiLiteWriteReq) dmaRegWriteReqQ <- mkFIFOF();
    let dmaRegWriteReqPipeIn = convertFifo2PipeOut(dmaRegWriteReqQ);

    FIFOF#(XdmaAxiLiteReadReq)  dmaRegReadReqQ  <- mkFIFOF();
    let dmaRegReadReqPipeIn = convertFifo2PipeOut(dmaRegReadReqQ);

    let dmaRegWriteRespPipeOut <- mkAxiLiteSlaveWriteHandshake(usrPin.xdmaConfigAxiLiteMmSlave, dmaRegWriteReqPipeIn);
    let dmaRegReadRespPipeOut  <- mkAxiLiteSlaveReadHandshake(usrPin.xdmaConfigAxiLiteMmSlave, dmaRegReadReqPipeIn);

    mkBypassDescriptorHandshake(usrPin.xdmaC2HDscByp, c2hDscBypPipeIn);
    mkBypassDescriptorHandshake(usrPin.xdmaH2CDscByp, h2cDscBypPipeIn);

    mkC2HDataStreamHandshake(usrPin.xdmaC2HDataStream, c2hDataStreamPipeIn);
    let h2cDataPipeOut <- mkH2CDataStreamHandshake(usrPin.xdmaH2CDataStream);

    let c2hStsWire = extraChannelStatus(usrPin.xdmaC2HSts);
    let h2cStsWire = extraChannelStatus(usrPin.xdmaH2CSts);

`ifdef USING_CFG_MGMT
    FIFOF#(XdmaConfigManagmentReq) cfgMgmtReqQ  <- mkFIFOF();
    let cfgMgmtReqPipeIn = convertFifo2PipeOut(cfgMgmtReqQ);
    let cfgMgmtRespPipeOut <- mkConfigManagementHandshake(usrPin.xdmaCfgMgmt, cfgMgmtReqPipeIn);
`endif

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

            method    getStatus = c2hStsWire;
        endinterface

        interface HostToCardStream h2cStream;
            interface dmaReadReq = toPut(h2cDscQ);
            interface dmaReadDataOutput = h2cDataPipeOut;

            method    getStatus = h2cStsWire;
        endinterface
    endinterface
endmodule
