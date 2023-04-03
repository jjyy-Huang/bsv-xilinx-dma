import Clocks :: *;
import PcieDataType :: *;

`define USING_PIPE_SIM
`define USING_CFG_MGMT
`define USING_CFG_EXT
`define USING_CFG_FC
`define USING_CFG_STATUS
`define USING_CFG_RX_MSG
`define USING_CFG_TX_MSG
`define USING_CFG
`define USING_CFG_CONTROL
`define USING_CFG_POWER_MGMT
`define USING_TANSMIT_FC
`define USING_MSI
`define USING_MSIX

(* always_enabled, always_ready *)
interface PciePin;
	(* prefix = ""*)
    method Action     rxn(PciExp rxn);
	(* prefix = ""*)
    method Action     rxp(PciExp rxp);
	(* prefix = ""*)
    method PciExp     txn();
	(* prefix = ""*)
    method PciExp     txp();
endinterface

(* always_ready, always_enabled *)
interface PcieSimPipe;
    (* prefix = "" *)
    method Action cmdIn((* port = "common_commands_in" *)PciePipeCmd cmd);
    (* prefix = "" *)
    method Action sigs0In((* port = "pipe_rx_0_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs1In((* port = "pipe_rx_1_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs2In((* port = "pipe_rx_2_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs3In((* port = "pipe_rx_3_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs4In((* port = "pipe_rx_4_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs5In((* port = "pipe_rx_5_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs6In((* port = "pipe_rx_6_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs7In((* port = "pipe_rx_7_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs8In((* port = "pipe_rx_8_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs9In((* port = "pipe_rx_9_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs10In((* port = "pipe_rx_10_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs11In((* port = "pipe_rx_11_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs12In((* port = "pipe_rx_12_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs13In((* port = "pipe_rx_13_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs14In((* port = "pipe_rx_14_sigs" *)PciePipeData data);
    (* prefix = "" *)
    method Action sigs15In((* port = "pipe_rx_15_sigs" *)PciePipeData data);

    (* prefix = "", result = "common_commands_out" *)
    method PciePipeCmd cmdOut;
    (* prefix = "", result = "pipe_tx_0_sigs" *)
    method PciePipeData sigs0Out;
    (* prefix = "", result = "pipe_tx_1_sigs" *)
    method PciePipeData sigs1Out;
    (* prefix = "", result = "pipe_tx_2_sigs" *)
    method PciePipeData sigs2Out;
    (* prefix = "", result = "pipe_tx_3_sigs" *)
    method PciePipeData sigs3Out;
    (* prefix = "", result = "pipe_tx_4_sigs" *)
    method PciePipeData sigs4Out;
    (* prefix = "", result = "pipe_tx_5_sigs" *)
    method PciePipeData sigs5Out;
    (* prefix = "", result = "pipe_tx_6_sigs" *)
    method PciePipeData sigs6Out;
    (* prefix = "", result = "pipe_tx_7_sigs" *)
    method PciePipeData sigs7Out;
    (* prefix = "", result = "pipe_tx_8_sigs" *)
    method PciePipeData sigs8Out;
    (* prefix = "", result = "pipe_tx_9_sigs" *)
    method PciePipeData sigs9Out;
    (* prefix = "", result = "pipe_tx_10_sigs" *)
    method PciePipeData sigs10Out;
    (* prefix = "", result = "pipe_tx_11_sigs" *)
    method PciePipeData sigs11Out;
    (* prefix = "", result = "pipe_tx_12_sigs" *)
    method PciePipeData sigs12Out;
    (* prefix = "", result = "pipe_tx_13_sigs" *)
    method PciePipeData sigs13Out;
    (* prefix = "", result = "pipe_tx_14_sigs" *)
    method PciePipeData sigs14Out;
    (* prefix = "", result = "pipe_tx_15_sigs" *)
    method PciePipeData sigs15Out;
endinterface

interface PcieGroup;
    interface PciePin          pciePin;
`ifdef USING_PIPE_SIM
    interface PcieSimPipe       pcieSimPipe;
`endif
endinterface

(* always_ready *)
interface CompleterRequestPin;
    method PcieAxisCqData  getData;
    method PcieAxisCqUser  getUser;
    method PcieAxisCqLast  getLast;
    method PcieAxisCqKeep  getKeep;
    method PcieAxisCqValid isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready *)
interface CompleterCompletionPin;
    method Action putData(
        PcieAxisCcData data,
        PcieAxisCcUser user,
        PcieAXisCcLast last,
        PcieAxisCckeep keep
    );
    method PcieAxisCcReady isReady;
endinterface

(* always_ready *)
interface RequesterRequestPin;
    method Action putData(
        PcieAxisRqData data,
        PcieAxisRqUser user,
        PcieAxisRqLast last,
        PcieAxisRqKeep keep
    );
    method PcieAxisRqReady isReady;
endinterface

(* always_ready *)
interface RequesterCompletionPin;
    method PcieAxisRcData  getData;
    method PcieAxisRcUser  getUser;
    method PcieAxisRcLast  getLast;
    method PcieAxisRcKeep  getKeep;
    method PcieAxisRcValid isValid;
    method Action          readyAssertAct;
endinterface

interface DataGroup;
    interface CompleterRequestPin    cqPin;
    interface CompleterCompletionPin ccPin;
    interface RequesterRequestPin    cqPin;
    interface RequesterCompletionPin rcPin;
endinterface

(* always_ready *)
interface PowerManagementPin;
    method Action rejectAspmL1EntryAssertAct;
    method Action disableAspmL0sEntryAssertAct;
endinterface

(* always_ready, always_enabled *)
interface ManagementPin;
    method Action       setAddr(MgmtAddr addr);
    method Action       setFuncNum(MgmtFuncNum funcNum);
    method Action       setWriteEnable(MgmtWriteEnable ena);
    method Action       setWriteData(MgmtWritaData data);
    method Action       setWriteByteEn(MgmtByteEnable byteEn);
    method Action       setReadEnable(MgmtReadEnable ena);
    method MgmtReadData getReadData;
    method Bool         isDone;
endinterface

(* always_ready *)
interface StatusPin;
    method StatusPhyLinkDown       getPhyLinkDown;
    method StatusPhyLinkStatus     getPhyLinkStatus;
    method StatusNegotiatedLink    getNegotiatedLink;
    method StatusLinkSpeed         getLinkSpeed;
    method StatusMaxPayload        getMaxPayload;
    method StatusMaxReadReq        getMaxReadReq;
    method StatusFunction          getFunction;
    method StatusVF                getVF;
    method StatusFunctionPower     getFunctionPower;
    method StatusVfPower           getVfPower;
    method StatusLinkPower         getLinkPower;
    method StatusLocalError        getLocalError;
    method StatusRxPM              getRxPM;
    method StatusTxPM              getTxPM;
    method StatusLTSSM             getLTSSM;
    method StatusRCB               getRCB;
    method StatusQpaChange         getQpaChange;
    method StatusObffEnable        getObffEnable;
    method StatusPlChange          getPlChange;
    method StatusTphReqEnable      getTphReqEnable;
    method StatusTphSteeringMode   getTphSteeringMode;
    method StatusVfTphReqEnable    getVfTphReqEnable;
    method StatusVfTphSteeringMode getVfTphSteeringMode;
    method StatusTfcNphAvail       getTfcNphAvail;
    method StatusTfcNpdAvail       getTfcNpdAvail;
    method StatusRqTagAvail        getRqTagAvail;
endinterface

(* always_ready *)
interface ReceivedMessagePin;
    method Bool            isValid;
    method MsgReceivedData getReceivedData;
    method MsgReceivedType getReceivedType;
endinterface

(* always_ready *)
interface TransmitMessagePin;
    method Action putMsg(
        MsgTransimitType msgType,
        MsgTransimitData msgData
    ); // enable
    method Bool   isDone;
endinterface

(* always_ready, always_enabled *)
interface FlowControlPin;
    method Action setSelect(
        FlowControlInfoSelect sel
    );
    method FlowControlPostedHeader     getPostedHeader;
    method FlowControlPostedData       getPostedData;
    method FlowControlNonPostedHeader  getNonPostedHeader;
    method FlowControlNonPostedData    getNonPostedData;
    method FlowControlCompletionHeader getCompletionHeader;
    method FlowControlCompletionData   getCompletionData;
endinterface

(* always_ready, always_enabled *)
interface ControlPin;
    method Action hotResetAssertAct;  // use in RP mode
    method Bool   getHotReset;        // use in EP mode
    method Action setCfgSpaceEnable(CtrlCfgSpaceEnable enable);
    method Action setDSN(CtrlDSN dsn);
    method Action setDownstreamBusNum(CtrlDownstreamBusNum downstreamBusNum);
    method Action setDownstreamDeviceNum(CtrlDownstreamDeviceNum downstreamDeviceNum);
    method Action setDownstreamFunctionNum(CtrlDownstreamFunctionNum downstreamFunctionNum);
    method Action setDownstreamPortNum(CtrlDownstreamPortNum downstreamPortNum);

    method Action setVendorID(CtrlVendorID id);
    method Action setSubsystemVendorID(CtrlSubsystemVendorID id);
    method Action setDeviceIdPF0(CtrlDeviceIdPF0 id);
    method Action setDeviceIdPF1(CtrlDeviceIdPF1 id);
    method Action setDeviceIdPF2(CtrlDeviceIdPF2 id);
    method Action setDeviceIdPF3(CtrlDeviceIdPF3 id);
    method Action setRevsionIdPF0(CtrlRevsionIdPF0 id);
    method Action setRevsionIdPF1(CtrlRevsionIdPF1 id);
    method Action setRevsionIdPF2(CtrlRevsionIdPF2 id);
    method Action setRevsionIdPF3(CtrlRevsionIdPF3 id);
    method Action setSubsystemIdPF0(CtrlSubsystemIdPF0 id);
    method Action setSubsystemIdPF1(CtrlSubsystemIdPF1 id);
    method Action setSubsystemIdPF2(CtrlSubsystemIdPF2 id);
    method Action setSubsystemIdPF3(CtrlSubsystemIdPF3 id);

    method Action powerStateChangeAckAssertAct;
    method Bool   getPowerStateChangeInterrupt; // bind to cfg_ext_func_num/cfg_func_power_state/cfg_vf_power_state

    method Action                          correctableErrorDetectedAssertAct;
    method Action                          unCorrectableErrorDetectedAssertAct;
    method CtrlCorrectableErrorDetectedOut isCorrectableErrorDetected;
    method CtrlFatalErrorDetectedOut       isFatalErrorDetected;
    method CtrlNonFatalErrorDetectedOut    isNonFatalErrorDetected;

    method Action setFlrReset(
        CtrlFunctionLevelResetDone flrRstDone
    );
    method Action setVfFlrReset(
        CtrlVfFunctionLevelResetDone vfFlrRstDone
    );
    method Action setVfFlrResetFuncNum(
        CtrlVfFunctionLevelResetFuncNum vfFlrRstFuncNum
    );
    method CtrlFunctionLevelResetInProcess   isFlrResetInProcess;
    method CtrlVfFunctionLevelResetInProcess isVfFlrResetInProcess;

    method Action reqPmTransitionL23ReadyAssertAct;

    method Action linkTrainingEnableAssertAct;

    method CtrlBusNum getBusNum;
endinterface

(* always_ready *)
interface LegacyInterruptPin;
    method Action setInt(
        InterruptVec intVec
    );
    method InterruptSent isSent;
    method Action suspend(
        InterruptPending intPending
    );
endinterface

(* always_ready *)
interface MsiInterruptPin;
    method Action msiEnable(
        MsiEnable enable
    );
    method Action setInt(
        MsiIntVec      intVec,
        MsiFunctionNum funcNum
    );
    method Bool   isSent;
    method Bool   isFail;

    method Action mmEnable(
        MsiMultipleMsgEnable mmEn
    );
    method Action putStatus(
        MsiPendingStatus            status,
        MsiPendingStatusFunctionNum funcNum
    ); // enable

    method MsiMaskUpdate isMaskUpdate;
    method Action selectMsi(
        MsiSelect sel
    );
    method MsiData getSelectedData;

    method Action setTlpAttribute(
        MsiTlpAttribute attr
    );
    method Action setTph(
        MsiTphType        tphType,
        MsiTphsteeringTag tphStTag
    ); // enable
endinterface

(* always_ready *)
interface MsixInterruptExternalPin;
    method MsixExternalEnable   getEnable;
    method MsixExternalMask     getMask;
    method MsixExternalVfEnable getVfEnable;
    method MsixExternalVfMask   getVfMask;

    method Action setInt(
        MsixExternalAddr addr,
        MsixExternalData data
    ); // enable

    method action suspend(
        MsixExternalVecPending intPending
    );
    method MsixExternalVecPendingStatus getPendingStatus;
endinterface

(* always_ready *)
interface MsixInterruptInternalPin;
    // msi
    method Action setMsiInt(
        MsiInteralIntVec      intVec,
        MsiInteralFunctionNum funcNum
    );
    method Bool   isSent;
    method Bool   isFail;
    method Action setTlpAttribute(
        MsiInteralTlpAttribute attr
    );
    method Action setTph(
        MsiInteralTphType        tphType,
        MsiInteralTphSteeringTag tphStTag
    ); // enable

    // msix
    method Action               setMsixInt; // enable
    method MsixInternalEnable   getEnable;
    method MsixInternalMask     getMask;
    method MsixInternalVfEnable getVfEnable;
    method MsixInternalVfMask   getVfMask;
endinterface

(* always_ready *)
interface ExtendPin;
    method ExtReadReceived    getReadReceived;
    method ExtWriteReceived   getWriteReceived;
    method ExtRegisterNum     getRegisterNum;
    method ExtFunctionNum     getFunctionNum;
    method ExtWriteData       getWriteData;
    method ExtWriteByteEnable getWriteByteEnable;
    method Action             getPutReadData;
endinterface

interface InterruptGroup;
    interface LegacyInterruptPin       legacyInterruptPin;
`ifdef USING_MSI
    interface MsiInterruptPin          msiInterruptPin;
`endif
`ifdef USING_MSIX
    interface MsixInterruptExternalPin msixInterruptExternalPin;
`endif
    interface MsixInterruptInternalPin msixInterruptInternalPin;
endinterface

interface ConfigurationGroup;
`ifdef USING_CFG_POWER_MGMT
    interface PowerManagementPin powerManagementPin;
`endif
`ifdef USING_CFG_MGMT
    interface ManagementPin      managementPin;
`endif
`ifdef USING_CFG_STATUS
    interface StatusPin          statusPin;
`endif
`ifdef USING_CFG_RX_MSG
    interface ReceivedMessagePin receivedMessagePin;
`endif
`ifdef USING_CFG_TX_MSG
    interface TransmitMessagePin transmitMessagePin;
`endif
`ifdef USING_CFG_FC
    interface FlowControlPin     flowControlPin;
`endif
`ifdef USING_CFG
    interface ControlPin         controlPin;
`endif
`ifdef USING_CFG_EXT
    interface ExtendPin          extendPin;
`endif
`ifdef USING_CFG_CONTROL
`endif
`ifdef USING_TANSMIT_FC
`endif
    interface InterruptGroup     interruptGroup;
endinterface

interface PcieUsrGroup;
    interface ConfigurationGroup configurationGroup;
    interface DataGroup          dataGroup;
    interface SystemGroup        systemGroup;
endinterface

interface PcieBvi;
    interface Clock usrClk;
    interface Reset usrRstN;
    interface Reset isPhyReady;

    interface PcieUsrGroup pcieUserGroup;
    interface PcieGroup    pcieGroup;
endinterface

import "BVI" pcie =
module mkPcieBvi#(Clock sysClk, Clock gtClk, Reset sysRstN)(PcieBvi);
    default_clock no_clock;
    default_reset no_reset;
    input_clock   sysClk(sys_clk, (* unused *) UNUSED)      = sysClk;
    input_clock   gtClk(sys_clk_gt, (* unused *) UNUSED)    = gtClk;
    input_reset   rstN(sys_rst)                             = sysRstN;

    output_clock  usrClk(user_clk);
    output_reset  usrRstN(user_reset);
    output_reset  isPhyReady(phy_rdy_out);

    interface PcieUsrGroup pcieUserGroup;

        interface ConfigurationGroup configurationGroup;

        endinterface

        interface DataGroup dataGroup;

        endinterface

        interface SystemGroup systemGroup;

        endinterface
    endinterface

    interface PcieGroup pcieGroup;

        interface PciePin          pciePin;

        endinterface
    `ifdef USING_PIPE_SIM
        interface PcieSimPipe       pcieSimPipe;

        endinterface
    `endif

    endinterface


// for methods clocked by related clocks the default is C.

    // pciePciExpPin CF pciePciExpPin
    schedule (
    `ifdef USING_PIPE_SIM
        pciePciExpPin.pcieSimPipe.cmdIn,
        pciePciExpPin.pcieSimPipe.sigs0In,
        pciePciExpPin.pcieSimPipe.sigs1In,
        pciePciExpPin.pcieSimPipe.sigs2In,
        pciePciExpPin.pcieSimPipe.sigs3In,
        pciePciExpPin.pcieSimPipe.sigs4In,
        pciePciExpPin.pcieSimPipe.sigs5In,
        pciePciExpPin.pcieSimPipe.sigs6In,
        pciePciExpPin.pcieSimPipe.sigs7In,
        pciePciExpPin.pcieSimPipe.sigs8In,
        pciePciExpPin.pcieSimPipe.sigs9In,
        pciePciExpPin.pcieSimPipe.sigs10In,
        pciePciExpPin.pcieSimPipe.sigs11In,
        pciePciExpPin.pcieSimPipe.sigs12In,
        pciePciExpPin.pcieSimPipe.sigs13In,
        pciePciExpPin.pcieSimPipe.sigs14In,
        pciePciExpPin.pcieSimPipe.sigs15In,

        pciePciExpPin.pcieSimPipe.cmdOut,
        pciePciExpPin.pcieSimPipe.sigs0Out,
        pciePciExpPin.pcieSimPipe.sigs1Out,
        pciePciExpPin.pcieSimPipe.sigs2Out,
        pciePciExpPin.pcieSimPipe.sigs3Out,
        pciePciExpPin.pcieSimPipe.sigs4Out,
        pciePciExpPin.pcieSimPipe.sigs5Out,
        pciePciExpPin.pcieSimPipe.sigs6Out,
        pciePciExpPin.pcieSimPipe.sigs7Out,
        pciePciExpPin.pcieSimPipe.sigs8Out,
        pciePciExpPin.pcieSimPipe.sigs9Out,
        pciePciExpPin.pcieSimPipe.sigs10Out,
        pciePciExpPin.pcieSimPipe.sigs11Out,
        pciePciExpPin.pcieSimPipe.sigs12Out,
        pciePciExpPin.pcieSimPipe.sigs13Out,
        pciePciExpPin.pcieSimPipe.sigs14Out,
        pciePciExpPin.pcieSimPipe.sigs15Out,
    `endif

        pciePciExpPin.pciePciePins.txn,
        pciePciExpPin.pciePciePins.txp,

        pciePciExpPin.pciePciePins.rxn,
        pciePciExpPin.pciePciePins.rxp
    ) CF (
    `ifdef USING_PIPE_SIM
        pciePciExpPin.pcieSimPipe.cmdIn,
        pciePciExpPin.pcieSimPipe.sigs0In,
        pciePciExpPin.pcieSimPipe.sigs1In,
        pciePciExpPin.pcieSimPipe.sigs2In,
        pciePciExpPin.pcieSimPipe.sigs3In,
        pciePciExpPin.pcieSimPipe.sigs4In,
        pciePciExpPin.pcieSimPipe.sigs5In,
        pciePciExpPin.pcieSimPipe.sigs6In,
        pciePciExpPin.pcieSimPipe.sigs7In,
        pciePciExpPin.pcieSimPipe.sigs8In,
        pciePciExpPin.pcieSimPipe.sigs9In,
        pciePciExpPin.pcieSimPipe.sigs10In,
        pciePciExpPin.pcieSimPipe.sigs11In,
        pciePciExpPin.pcieSimPipe.sigs12In,
        pciePciExpPin.pcieSimPipe.sigs13In,
        pciePciExpPin.pcieSimPipe.sigs14In,
        pciePciExpPin.pcieSimPipe.sigs15In,
        pciePciExpPin.pcieSimPipe.cmdOut,

        pciePciExpPin.pcieSimPipe.sigs0Out,
        pciePciExpPin.pcieSimPipe.sigs1Out,
        pciePciExpPin.pcieSimPipe.sigs2Out,
        pciePciExpPin.pcieSimPipe.sigs3Out,
        pciePciExpPin.pcieSimPipe.sigs4Out,
        pciePciExpPin.pcieSimPipe.sigs5Out,
        pciePciExpPin.pcieSimPipe.sigs6Out,
        pciePciExpPin.pcieSimPipe.sigs7Out,
        pciePciExpPin.pcieSimPipe.sigs8Out,
        pciePciExpPin.pcieSimPipe.sigs9Out,
        pciePciExpPin.pcieSimPipe.sigs10Out,
        pciePciExpPin.pcieSimPipe.sigs11Out,
        pciePciExpPin.pcieSimPipe.sigs12Out,
        pciePciExpPin.pcieSimPipe.sigs13Out,
        pciePciExpPin.pcieSimPipe.sigs14Out,
        pciePciExpPin.pcieSimPipe.sigs15Out,
    `endif

        pciePciExpPin.pciePciePins.txn,
        pciePciExpPin.pciePciePins.txp,

        pciePciExpPin.pciePciePins.rxn,
        pciePciExpPin.pciePciePins.rxp
    );

    schedule (
    `ifdef USING_MSI
        pcieUsrPin.isMsiEnable,
        pcieUsrPin.getMsiVecWidth,
    `endif

    `ifdef USING_MSIX
        pcieUsrPin.isMsixEnable,
    `endif

        pcieUsrPin.pcieC2HSts.getStatus,
        pcieUsrPin.pcieH2CSts.getStatus,

        pcieUsrPin.pcieC2HDataStream.putStream,
        pcieUsrPin.pcieC2HDataStream.isReady,

        pcieUsrPin.pcieH2CDataStream.isValid,
        pcieUsrPin.pcieH2CDataStream.getLast,
        pcieUsrPin.pcieH2CDataStream.getData,
        pcieUsrPin.pcieH2CDataStream.getKeep,
        pcieUsrPin.pcieH2CDataStream.readyAssertAct,

        pcieUsrPin.pcieC2HDscByp.isReady,
        pcieUsrPin.pcieC2HDscByp.putDescriptor,

        pcieUsrPin.pcieH2CDscByp.isReady,
        pcieUsrPin.pcieH2CDscByp.putDescriptor,

    `ifdef USING_AXIL_SLAVE
        pcieUsrPin.pcieConfigAxiLiteMmSlave.aw.putAddr,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.aw.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.w.putData,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.w.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.b.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.b.getResp,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.b.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.ar.putAddr,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.ar.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.getData,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.getResp,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.readyAssertAct,
    `endif

    `ifdef USING_AXIL_MASTER
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.getAddr,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.getProt,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.getData,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.getStrb,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.b.putResp,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.b.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.getAddr,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.getProt,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.r.putResp,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.r.isReady,
    `endif

    `ifdef USING_CFG_MGMT
        pcieUsrPin.pcieCfgMgmt.putAddr,
        pcieUsrPin.pcieCfgMgmt.wrAssertAct,
        pcieUsrPin.pcieCfgMgmt.putWrData,
        pcieUsrPin.pcieCfgMgmt.putByteEna,
        pcieUsrPin.pcieCfgMgmt.rdAssertAct,
        pcieUsrPin.pcieCfgMgmt.getRdData,
        pcieUsrPin.pcieCfgMgmt.isDone,
    `endif

        pcieUsrPin.pcieIrq.req,
        pcieUsrPin.pcieIrq.ask,
        pcieUsrPin.isUsrLnkUp
    ) CF (
    `ifdef USING_MSI
        pcieUsrPin.isMsiEnable,
        pcieUsrPin.getMsiVecWidth,
    `endif

    `ifdef USING_MSIX
        pcieUsrPin.isMsixEnable,
    `endif

        pcieUsrPin.pcieC2HSts.getStatus,
        pcieUsrPin.pcieH2CSts.getStatus,

        pcieUsrPin.pcieC2HDataStream.putStream,
        pcieUsrPin.pcieC2HDataStream.isReady,

        pcieUsrPin.pcieH2CDataStream.isValid,
        pcieUsrPin.pcieH2CDataStream.getLast,
        pcieUsrPin.pcieH2CDataStream.getData,
        pcieUsrPin.pcieH2CDataStream.getKeep,
        pcieUsrPin.pcieH2CDataStream.readyAssertAct,

        pcieUsrPin.pcieC2HDscByp.isReady,
        pcieUsrPin.pcieC2HDscByp.putDescriptor,

        pcieUsrPin.pcieH2CDscByp.isReady,
        pcieUsrPin.pcieH2CDscByp.putDescriptor,

    `ifdef USING_AXIL_SLAVE
        pcieUsrPin.pcieConfigAxiLiteMmSlave.aw.putAddr,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.aw.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.w.putData,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.w.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.b.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.b.getResp,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.b.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.ar.putAddr,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.ar.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.getData,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.getResp,
        pcieUsrPin.pcieConfigAxiLiteMmSlave.r.readyAssertAct,
    `endif

    `ifdef USING_AXIL_MASTER
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.getAddr,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.getProt,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.aw.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.getData,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.getStrb,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.w.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.b.putResp,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.b.isReady,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.getAddr,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.getProt,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.isValid,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.ar.readyAssertAct,

        pcieUsrPin.pcieConfigAxiLiteMmMaster.r.putResp,
        pcieUsrPin.pcieConfigAxiLiteMmMaster.r.isReady,
    `endif

    `ifdef USING_CFG_MGMT
        pcieUsrPin.pcieCfgMgmt.putAddr,
        pcieUsrPin.pcieCfgMgmt.wrAssertAct,
        pcieUsrPin.pcieCfgMgmt.putWrData,
        pcieUsrPin.pcieCfgMgmt.putByteEna,
        pcieUsrPin.pcieCfgMgmt.rdAssertAct,
        pcieUsrPin.pcieCfgMgmt.getRdData,
        pcieUsrPin.pcieCfgMgmt.isDone,
    `endif

        pcieUsrPin.pcieIrq.req,
        pcieUsrPin.pcieIrq.ask,
        pcieUsrPin.isUsrLnkUp
    );
endmodule
