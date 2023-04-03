import Clocks :: *;
import FIFOF :: *;
import FIFO :: *;
import SpecialFIFOs :: *;
import PAClib :: *;
import GetPut :: *;
import Utils :: *;
import ProcessHandshake :: *;
import PcieBvi :: *;
import PcieDataType :: *;
import PcieRegisterSpace :: *;

interface PcieRegisterConfigSlave;
    interface Put#(PcieAxiLiteWriteReq)      writeReq;
    interface PipeOut#(PcieAxiLiteWriteResp) writeResp;
    interface Put#(PcieAxiLiteReadReq)       readReq;
    interface PipeOut#(PcieAxiLiteReadResp)  readResp;
endinterface

interface UserRegisterConfigMaster;
    interface PipeOut#(PcieAxiLiteWriteReq)  writeReq;
endinterface

interface PcieConfigIfc;
    interface PcieRegisterConfigSlave pcieRegisterConfig;
endinterface

interface CardToHostStream;
    interface Put#(PcieDescriptorBypass) dmaWriteReq;
    interface Put#(PcieDataStream)       dmaWriteDataInput;

    method    ChannelStatus              getStatus;
endinterface

interface HostToCardStream;
    interface Put#(PcieDescriptorBypass) dmaReadReq;
    interface PipeOut#(PcieDataStream)   dmaReadDataOutput;

    method    ChannelStatus              getStatus;
endinterface

interface PcieDataIfc;
    interface CardToHostStream c2hStream;
    interface HostToCardStream h2cStream;
endinterface

interface PcieUser;
    interface PcieConfigIfc pcieConfigIfc;
    interface PcieDataIfc   pcieDataIfc;
endinterface

module mkInitPcieChannel#(PipeOut#(PcieChannel) initReqPipeIn, PcieRegisterConfigSlave pcieCfg)(Empty);
    Reg#(PcieChannelInitStatus) pcieChannelInitStatus <- mkReg(IDLE);
    let isC2H = initReqPipeIn.first == C2H;
    let writeAddr = isC2H ?
        fromInteger(valueOf(PcieCardToHostRegisterBaseAddress)) + fromInteger(valueOf(PcieChannelControlOffset)) :
        fromInteger(valueOf(PcieHostToCardRegisterBaseAddress)) + fromInteger(valueOf(PcieChannelControlOffset));

    rule idleStage if (pcieChannelInitStatus == IDLE);
        if (initReqPipeIn.notEmpty) begin
            pcieChannelInitStatus <= WRITE_REQ;
        end
    endrule

    rule reqStage if (pcieChannelInitStatus == WRITE_REQ);
        pcieCfg.writeReq.put(
            PcieAxiLiteWriteReq {
                addr: writeAddr,
                data: fromInteger(valueOf(ChannelAllStarted))
            }
        );
        pcieChannelInitStatus <= WRITE_RESP;
    endrule

    rule respStage if (pcieChannelInitStatus == WRITE_RESP);
        pcieCfg.writeResp.deq;
        pcieChannelInitStatus <= INIT_SUCCESSED;
    endrule
endmodule

module mkPcieUser#(PcieUsrPin usrPin)(PcieUser);
    FIFOF#(PcieDescriptorBypass) h2cDscQ  <- mkFIFOF();
    let h2cDscBypPipeIn = convertFifo2PipeOut(h2cDscQ);

    FIFOF#(PcieDescriptorBypass) c2hDscQ  <- mkFIFOF();
    let c2hDscBypPipeIn = convertFifo2PipeOut(c2hDscQ);

    FIFOF#(PcieDataStream)       c2hDataQ <- mkFIFOF();
    let c2hDataStreamPipeIn = convertFifo2PipeOut(c2hDataQ);

    FIFOF#(PcieAxiLiteWriteReq) dmaRegWriteReqQ <- mkFIFOF();
    let dmaRegWriteReqPipeIn = convertFifo2PipeOut(dmaRegWriteReqQ);

    FIFOF#(PcieAxiLiteReadReq)  dmaRegReadReqQ  <- mkFIFOF();
    let dmaRegReadReqPipeIn = convertFifo2PipeOut(dmaRegReadReqQ);

    let dmaRegWriteRespPipeOut <- mkAxiLiteSlaveWriteHandshake(usrPin.pcieConfigAxiLiteMmSlave, dmaRegWriteReqPipeIn);
    let dmaRegReadRespPipeOut  <- mkAxiLiteSlaveReadHandshake(usrPin.pcieConfigAxiLiteMmSlave, dmaRegReadReqPipeIn);

    mkBypassDescriptorHandshake(usrPin.pcieC2HDscByp, c2hDscBypPipeIn);
    mkBypassDescriptorHandshake(usrPin.pcieH2CDscByp, h2cDscBypPipeIn);

    mkC2HDataStreamHandshake(usrPin.pcieC2HDataStream, c2hDataStreamPipeIn);
    let h2cDataPipeOut <- mkH2CDataStreamHandshake(usrPin.pcieH2CDataStream);

    let c2hStsWire = extraChannelStatus(usrPin.pcieC2HSts);
    let h2cStsWire = extraChannelStatus(usrPin.pcieH2CSts);

    interface PcieConfigIfc pcieConfigIfc;
        interface PcieRegisterConfigSlave pcieRegisterConfig;
            interface writeReq  = toPut(dmaRegWriteReqQ);
            interface writeResp = dmaRegWriteRespPipeOut;
            interface readReq   = toPut(dmaRegReadReqQ);
            interface readResp  = dmaRegReadRespPipeOut;
        endinterface
    endinterface

    interface PcieDataIfc   pcieDataIfc;
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
