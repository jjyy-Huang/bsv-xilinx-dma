import GetPut :: *;
import Xdma :: *;
import XdmaBvi :: *;
import XdmaUserController :: *;
import Clocks :: *;
import FIFO :: *;
import FIFOF :: *;
import PrimUtils :: *;
import Randomizable :: * ;
import PAClib :: *;
import Connectable :: *;

typedef enum {
    INIT_C2H_DSC_BYP,
    INIT_H2C_DSC_BYP,
    INIT_RESP,
    INIT_IDLE
} InitDscStatus deriving (Bits, Eq);


typedef enum {
    INIT_C2H_DSC_BYP,
    INIT_H2C_DSC_BYP,
    PROCCESS_C2H,
    PROCCESS_H2C,
    INIT_IDLE
} InitRandomStatus deriving (Bits, Eq);

typedef enum {
    IDLE,
    ADDR_WRITE,
    WAITING_ADDR_WRITE_RESP,
    DATA_WRITE,
    WAITING_DATA_WRITE_RESP,
    RESP_REQ,
    WAITING_RESP_REQ
} AxiLiteWriteStage deriving (Bits, Eq);

typedef 1024 SEND_CNT;
typedef Bit#(32) SendCounter;

// `define LOOPBACK_TEST_C2H
`define LOOPBACK_TEST_H2C

(* synthesize *)
(* no_default_clock, no_default_reset *)
(* clock_prefix = "" *)
(* reset_prefix = "" *)
module mkTbXdmaEndpoint#(Clock sysClk, Clock gtClk, Reset sysRstN, Bool startTest)(XdmaPciExpPin);
    let xdmaInst <- mkXDMA(sysClk, gtClk, sysRstN);
    let usrClk = xdmaInst.usrClk;
    let usrRstN = xdmaInst.usrRstN;
    let xdmaUsr = xdmaInst.xdmaUsrCtl;
    let pcie = xdmaInst.pciePins;

`ifdef LOOPBACK_TEST_H2C
    // xdma application: loopback
    mkXdmaLoopback(xdmaUsr.xdmaDataIfc, clocked_by usrClk, reset_by usrRstN);
    mkDscBypInit(fromInteger(valueOf(SEND_CNT)), xdmaUsr.xdmaDataIfc, clocked_by usrClk, reset_by usrRstN);
`endif

// `ifdef LOOPBACK_TEST_C2H
//     mkRandomDataGenerator(usrClk, usrRstN,
//         usrIfc.xdmaH2CDscByp,
//         usrIfc.xdmaC2HDscByp,
//         usrIfc.xdmaH2CDataStream,
//         usrIfc.xdmaC2HDataStream,
//         usrIfc.xdmaH2CSts,
//         usrIfc.xdmaC2HSts
//         );
// `endif
    // let tmpFifo <- mkInitXdmaCfg(usrClk, usrRstN, usrIfc.usrLnkUp);

    let reqFifo <- mkInitXdmaCfg(startTest, xdmaUsr.xdmaConfigIfc.xdmaRegisterConfig, clocked_by usrClk, reset_by usrRstN);

    return pcie;
endmodule

module mkDscBypInit#(
    XdmaDscBypLen sendNums,
    XdmaDataIfc xdmaData
)();
    Reg#(InitDscStatus)  initStatus <- mkReg(INIT_C2H_DSC_BYP);
    let h2cStatus = xdmaData.h2cStream.getStatus;
    let c2hStatus = xdmaData.c2hStream.getStatus;

    rule initC2HDscByp if (initStatus == INIT_C2H_DSC_BYP && c2hStatus == 8'h40);
    // 16'h3 -> enum
        xdmaData.c2hStream.dmaWriteReq.put(DMADescriptorBypass{
            src: 64'h0,
            dst: 64'h800,
            len: sendNums,
            ctl: 16'h13
        });
        initStatus <= INIT_H2C_DSC_BYP;
    endrule

    rule initH2CDscByp if (initStatus == INIT_H2C_DSC_BYP && h2cStatus == 8'h40);
        xdmaData.h2cStream.dmaReadReq.put(DMADescriptorBypass{
            src: 64'h400,
            dst: 64'h000,
            len: sendNums,
            ctl: 16'h13
        });
        initStatus <= INIT_IDLE;
    endrule

    rule initH2CDscBypResp if (initStatus == INIT_RESP && c2hStatus == 8'h40);
        xdmaData.h2cStream.dmaReadReq.put(DMADescriptorBypass{
            src: 64'h1000,
            dst: 64'h000,
            len: sendNums,
            ctl: 16'h13
        });
        initStatus <= INIT_IDLE;
    endrule
endmodule

module mkXdmaLoopback#(XdmaDataIfc xdmaData)();
    FIFO#(DMADataStream) fifo <- mkFIFO();
    let receiveDataPipeOut = xdmaData.h2cStream.dmaReadDataOutput;
    rule loopbackEnq;
        xdmaData.c2hStream.dmaWriteDataInput.put(fifo.first);
        fifo.deq;
    endrule

    mkConnection(toGet(receiveDataPipeOut), toPut(fifo));
endmodule

// (* no_default_clock, no_default_reset *)
// module mkRandomDataGenerator#(Clock usrClk, Reset usrRstN,
//     XdmaH2CDscByp h2cDsc, XdmaC2HDscByp c2hDsc,
//     XdmaH2CDataStream h2cDate, XdmaC2HDataStream c2hData,
//     XdmaH2CSts h2csts, XdmaC2HSts c2hsts
//     )();
//     let sendNums = fromInteger(valueOf(SEND_CNT));
//     let cntMax = fromInteger(valueOf(SEND_CNT) / 8);

//     Randomize#(XdmaAxisData) rndData <- mkGenericRandomizer(clocked_by usrClk, reset_by usrRstN);
//     FIFO#(XdmaAxisData) refFifo <- mkSizedFIFO(16, clocked_by usrClk, reset_by usrRstN);
//     Reg#(InitRandomStatus)  initStatus <- mkReg(INIT_C2H_DSC_BYP, clocked_by usrClk, reset_by usrRstN);
//     Reg#(SendCounter) cnt <- mkReg(0, clocked_by usrClk, reset_by usrRstN);

//     let h2cStatus = h2csts.sts;
//     let c2hStatus = c2hsts.sts;

//     rule initC2HDscByp if (initStatus == INIT_C2H_DSC_BYP && c2hStatus == 8'h40);
//         c2hDsc.put(64'h0, 64'h800, sendNums, 16'h3);
//         cnt <= 0;
//         initStatus <= PROCCESS_C2H;
//     endrule

//     rule proccessC2H if (initStatus == PROCCESS_C2H);
//         let rnd <- rndData.next;
//         refFifo.enq(rnd);
//         Bool isLast = cnt == cntMax;
//         c2hData.put(rnd, isLast, 64'hffff_ffff_ffff_ffff);
//         if (isLast) begin
//             initStatus <= INIT_IDLE;
//         end
//         cnt <= cnt + 1;
//     endrule

//     rule initH2CDscByp if (initStatus == INIT_H2C_DSC_BYP);
//         h2cDsc.put(64'h800, 64'h0, sendNums, 16'h3);
//         initStatus <= PROCCESS_H2C;
//     endrule

//     rule processH2C if (initStatus == PROCCESS_H2C);
//         let refData = refFifo.first;
//         XdmaAxisData data <- h2cDate.getData;
//         XdmaAxisLast last = h2cDate.isLast;
//         XdmaAxisKeep keep = h2cDate.getKeep;
//         immAssert(
//             !(refData != data),
//             "h2c.getData not equal to refData assertion @ mkRandomDataGenerator",
//             $format(
//                 "ref: %h, got: %h",
//                 refData, data
//             )
//         );
//         refFifo.deq();
//         if (last) begin
//             initStatus <= INIT_IDLE;
//         end

//     endrule

// endmodule

module mkInitXdmaCfg#(Bool start, XdmaRegisterConfigSlave xdmaCfg)();
    Reg#(Bit#(32)) cnt <- mkReg(0);

    rule init if (cnt == 0);
        if (start)
            cnt <= cnt + 1;
    endrule

    rule a if (cnt == 1);
        xdmaCfg.writeReq.put(
            XdmaAxiLiteWriteReq{
                addr: 32'h1004,
                data: 32'h2fffe7f
            }
        );
        cnt <= cnt + 1;
    endrule

    rule b if (cnt == 2);
        let t = xdmaCfg.writeResp;
        if (t.notEmpty) begin
            cnt <= cnt + 1;
            t.deq;
        end
    endrule

    rule c if (cnt == 3);
        xdmaCfg.writeReq.put(
            XdmaAxiLiteWriteReq{
                addr: 32'h0004,
                data: 32'h2fffe7f
            }
        );
        cnt <= cnt + 1;
    endrule

    rule d if (cnt == 4);
        let t = xdmaCfg.writeResp;
        if (t.notEmpty) begin
            cnt <= cnt + 1;
            t.deq;
        end
    endrule

endmodule

// (* no_default_clock, no_default_reset *)
// module mkAxiLiteSlaveWrite#(Clock usrClk, Reset usrRstN, XdmaRegCfgAxiL regCfg, FIFOF#(XdmaAxiLiteWriteReq) req)();
//     Reg#(AxiLiteWriteStage) status <- mkReg(IDLE, clocked_by usrClk, reset_by usrRstN);
//     let axiWrite = req.first;

//     rule stageIdel if (status == IDLE);
//         if (req.notEmpty)
//             status <= ADDR_WRITE;
//     endrule

//     rule stageAW if (status == ADDR_WRITE);
//         regCfg.aw.req(axiWrite.addr, 0);
//         status <= WAITING_ADDR_WRITE_RESP;
//     endrule

//     rule stageAWWait if (status == WAITING_ADDR_WRITE_RESP);
//         if (regCfg.aw.resp) begin
//             status <= DATA_WRITE;
//         end
//     endrule

//     rule stageW if (status == DATA_WRITE);
//         regCfg.w.req(axiWrite.data, False);
//         status <= WAITING_DATA_WRITE_RESP;
//     endrule

//     rule stageWWait if (status == WAITING_DATA_WRITE_RESP);
//         if (regCfg.w.resp) begin
//             status <= RESP_REQ;
//         end
//     endrule

//     rule stageB if (status == RESP_REQ);
//         regCfg.b.req(True);
//         status <= WAITING_RESP_REQ;
//     endrule

//     rule stageBWait if (status == WAITING_RESP_REQ);
//         if (regCfg.b.isValid) begin
//             req.deq;
//             status <= IDLE;
//         end
//     endrule

// endmodule
