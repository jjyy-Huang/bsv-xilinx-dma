import Clocks :: *;
import XdmaDataType :: *;

(* always_enabled, always_ready *)
interface XdmaPciePins;
	(* prefix = ""*)
    method Action     rxn(XdmaPciExp rxn);
	(* prefix = ""*)
    method Action     rxp(XdmaPciExp rxp);
	(* prefix = ""*)
    method XdmaPciExp txn();
	(* prefix = ""*)
    method XdmaPciExp txp();
endinterface

(* always_ready, always_enabled *)
interface XdmaC2HDataStream;
    method Action putStream(
        XdmaAxisData data,
        XdmaAxisLast last,
        XdmaAxisKeep keep
    );
    method Bool   isReady;
endinterface

(* always_ready, always_enabled *)
interface XdmaH2CDataStream;
    method Bool         isValid;
    method XdmaAxisData getData;
    method XdmaAxisLast getLast;
    method XdmaAxisKeep getKeep;
    method Action       readyAssertAct;
endinterface

(* always_ready, always_enabled *)
interface XdmaChannelDscByp;
    method Bool   isReady;
    method Action putDescriptor(
        XdmaDscBypAddr srcAddr,
        XdmaDscBypAddr dstAddr,
        XdmaDscBypLen  len,
        XdmaDscBypCtl  cmd
    );
endinterface

(* always_ready *)
interface XdmaChannelSts;
    method XdmaChStatus getStatus;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteSlaveAwChannel;
    method Action putAddr(
        XdmaAxiLiteAddr addr,
        XdmaAxiLiteProt prot   // never used
    );
    method Bool   isReady;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteSlaveWChannel;
    method Action putData(
        XdmaAxiLiteData data,
        XdmaAXiLiteStrb strb
    );
    method Bool   isReady;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteSlaveBChannel;
    method Bool            isValid;
    method XdmaAxiLiteResp getResp;
    method Action          readyAssertAct;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteSlaveArChannel;
    method Action putAddr(
        XdmaAxiLiteAddr addr,
        XdmaAxiLiteProt prot
    );
    method Bool   isReady;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteSlaveRChannel;
    method Bool            isValid;
    method XdmaAxiLiteData getData;
    method XdmaAxiLiteResp getResp;
    method Action          readyAssertAct;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteMasterAwChannel;
    method XdmaAxiLiteAddr getAddr;
    method XdmaAxiLiteProt getProt;   // never used
    method Bool            isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteMasterWChannel;
    method XdmaAxiLiteData getData;
    method XdmaAXiLiteStrb getStrb;
    method Bool            isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteMasterBChannel;
    method Action          putResp(XdmaAxiLiteResp resp);
    method Bool            isReady;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteMasterArChannel;
    method XdmaAxiLiteAddr getAddr;
    method XdmaAxiLiteProt getProt;  // never used
    method Bool            isValid;
    method Action          readyAssertAct;
endinterface

(* always_ready, always_enabled *)
interface AxiLiteMasterRChannel;
    method Action putResp(
        XdmaAxiLiteData data,
        XdmaAxiLiteResp resp
    );
    method Bool   isReady;
endinterface

interface XdmaConfigAxiLiteMmSlave;
    interface AxiLiteSlaveAwChannel  aw;
    interface AxiLiteSlaveWChannel   w;
    interface AxiLiteSlaveBChannel   b;
    interface AxiLiteSlaveArChannel  ar;
    interface AxiLiteSlaveRChannel   r;
endinterface

interface XdmaConfigAxiLiteMmMaster;
    interface AxiLiteMasterAwChannel aw;
    interface AxiLiteMasterWChannel  w;
    interface AxiLiteMasterBChannel  b;
    interface AxiLiteMasterArChannel ar;
    interface AxiLiteMasterRChannel  r;
endinterface

(* always_ready, always_enabled *)
interface XdmaCfgMgmt;
    method Action          putAddr(XdmaCfgMgmtAddr addr);
    method Action          wrAssertAct;
    method Action          putWrData(XdmaCfgMgmtData data);
    method Action          putByteEna(XdmaCfgMgmtByteEna ena);
    method Action          rdAssertAct;
    method XdmaCfgMgmtData getRdData;
    method Bool            isDone;
endinterface

(* always_ready, always_enabled *)
interface XdmaIrq;
    method Action       req;
    method XdmaUsrIrq   ask;
endinterface

(* always_ready, always_enabled *)
interface XdmaSimPipe;
    (* prefix = "" *)
    method Action cmdIn((* port = "common_commands_in" *)XdmaPipeCmd cmd);
    (* prefix = "" *)
    method Action sigs0In((* port = "pipe_rx_0_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs1In((* port = "pipe_rx_1_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs2In((* port = "pipe_rx_2_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs3In((* port = "pipe_rx_3_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs4In((* port = "pipe_rx_4_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs5In((* port = "pipe_rx_5_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs6In((* port = "pipe_rx_6_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs7In((* port = "pipe_rx_7_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs8In((* port = "pipe_rx_8_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs9In((* port = "pipe_rx_9_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs10In((* port = "pipe_rx_10_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs11In((* port = "pipe_rx_11_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs12In((* port = "pipe_rx_12_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs13In((* port = "pipe_rx_13_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs14In((* port = "pipe_rx_14_sigs" *)XdmaPipeData data);
    (* prefix = "" *)
    method Action sigs15In((* port = "pipe_rx_15_sigs" *)XdmaPipeData data);

    (* prefix = "", result = "common_commands_out" *)
    method XdmaPipeCmd cmdOut;
    (* prefix = "", result = "pipe_tx_0_sigs" *)
    method XdmaPipeData sigs0Out;
    (* prefix = "", result = "pipe_tx_1_sigs" *)
    method XdmaPipeData sigs1Out;
    (* prefix = "", result = "pipe_tx_2_sigs" *)
    method XdmaPipeData sigs2Out;
    (* prefix = "", result = "pipe_tx_3_sigs" *)
    method XdmaPipeData sigs3Out;
    (* prefix = "", result = "pipe_tx_4_sigs" *)
    method XdmaPipeData sigs4Out;
    (* prefix = "", result = "pipe_tx_5_sigs" *)
    method XdmaPipeData sigs5Out;
    (* prefix = "", result = "pipe_tx_6_sigs" *)
    method XdmaPipeData sigs6Out;
    (* prefix = "", result = "pipe_tx_7_sigs" *)
    method XdmaPipeData sigs7Out;
    (* prefix = "", result = "pipe_tx_8_sigs" *)
    method XdmaPipeData sigs8Out;
    (* prefix = "", result = "pipe_tx_9_sigs" *)
    method XdmaPipeData sigs9Out;
    (* prefix = "", result = "pipe_tx_10_sigs" *)
    method XdmaPipeData sigs10Out;
    (* prefix = "", result = "pipe_tx_11_sigs" *)
    method XdmaPipeData sigs11Out;
    (* prefix = "", result = "pipe_tx_12_sigs" *)
    method XdmaPipeData sigs12Out;
    (* prefix = "", result = "pipe_tx_13_sigs" *)
    method XdmaPipeData sigs13Out;
    (* prefix = "", result = "pipe_tx_14_sigs" *)
    method XdmaPipeData sigs14Out;
    (* prefix = "", result = "pipe_tx_15_sigs" *)
    method XdmaPipeData sigs15Out;
endinterface

interface XdmaUsrPin;
    interface XdmaC2HDataStream         xdmaC2HDataStream;
    interface XdmaH2CDataStream         xdmaH2CDataStream;
    interface XdmaChannelDscByp         xdmaC2HDscByp;
    interface XdmaChannelDscByp         xdmaH2CDscByp;
    interface XdmaChannelSts            xdmaC2HSts;
    interface XdmaChannelSts            xdmaH2CSts;
`ifdef USING_AXIL_SLAVE
    interface XdmaConfigAxiLiteMmSlave  xdmaConfigAxiLiteMmSlave;
`endif
`ifdef USING_AXIL_MASTER
    interface XdmaConfigAxiLiteMmMaster xdmaConfigAxiLiteMmMaster;
`endif
`ifdef USING_CFG_MGMT
    interface XdmaCfgMgmt               xdmaCfgMgmt;
`endif
    interface XdmaIrq                   xdmaIrq;

    method    Bool                      isUsrLnkUp;
`ifdef USING_MSI
    method    Bool                      isMsiEnable;
    method    XdmaMsiVec                getMsiVecWidth;
`endif
`ifdef USING_MSIX
    method   Bool                       isMsixEnable;
`endif

endinterface

interface XdmaPciExpPin;
    interface XdmaPciePins      xdmaPciePins;
`ifdef USING_PIPE_SIM
    interface XdmaSimPipe       xdmaSimPipe;
`endif
endinterface

interface XdmaPin;
    interface Clock         usrClk;
    interface Reset         usrRstN;
`ifdef USING_DMA_BRIDGE
    interface Reset         dmaBridgeRstN;
`endif
    (* prefix = "" *)
    interface XdmaPciExpPin xdmaPciExpPin;
    interface XdmaUsrPin    xdmaUsrPin;
endinterface

import "BVI" xdma =
module mkXdmaBvi#(Clock sysClk, Clock gtClk, Reset sysRstN)(XdmaPin);
    default_clock no_clock;
    default_reset no_reset;
    input_clock     sysClk(sys_clk, (* unused *) UNUSED)      = sysClk;
    input_clock     gtClk(sys_clk_gt, (* unused *) UNUSED)    = gtClk;
    input_reset     rstN(sys_rst_n)                          = sysRstN;

    output_clock    usrClk(axi_aclk);
    output_reset    usrRstN(axi_aresetn);
    `ifdef USING_DMA_BRIDGE
    output_reset    dmaBridgeRstN(dma_bridge_resetn);
    `endif

    interface XdmaPciExpPin xdmaPciExpPin;
        interface XdmaPciePins xdmaPciePins;
            method rxn(pci_exp_rxn) enable((*inhigh*) pci_exp_rxn_dummy_en) clocked_by(sysClk) reset_by(rstN);
            method rxp(pci_exp_rxp) enable((*inhigh*) pci_exp_rxp_dummy_en) clocked_by(sysClk) reset_by(rstN);
            method pci_exp_txn txn()                                        clocked_by(sysClk) reset_by(rstN);
            method pci_exp_txp txp()                                        clocked_by(sysClk) reset_by(rstN);
        endinterface
    `ifdef USING_PIPE_SIM
        interface XdmaSimPipe         xdmaSimPipe;
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

    interface XdmaUsrPin xdmaUsrPin;
        method user_lnk_up      isUsrLnkUp      clocked_by(usrClk) reset_by(usrRstN);
    `ifdef USING_MSI
        method msi_enable       isMsiEnable     clocked_by(usrClk) reset_by(usrRstN);
        method msi_vector_width getMsiVecWidth  clocked_by(usrClk) reset_by(usrRstN);
    `endif
    `ifdef USING_MSIX
        method msix_enable      isMsixEnable    clocked_by(usrClk) reset_by(usrRstN);
    `endif
        interface XdmaC2HDataStream xdmaC2HDataStream;
            method putStream(
                s_axis_c2h_tdata_0,
                s_axis_c2h_tlast_0,
                s_axis_c2h_tkeep_0
            )   enable(s_axis_c2h_tvalid_0)    clocked_by(usrClk) reset_by(usrRstN);
            method s_axis_c2h_tready_0 isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface XdmaH2CDataStream xdmaH2CDataStream;
            method m_axis_h2c_tvalid_0         isValid                               clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tdata_0          getData                               clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tlast_0          getLast                               clocked_by(usrClk) reset_by(usrRstN);
            method m_axis_h2c_tkeep_0          getKeep                               clocked_by(usrClk) reset_by(usrRstN);
            method readyAssertAct()            enable(m_axis_h2c_tready_0)           clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface XdmaChannelDscByp xdmaC2HDscByp;
            method putDescriptor(
                c2h_dsc_byp_src_addr_0,
                c2h_dsc_byp_dst_addr_0,
                c2h_dsc_byp_len_0,
                c2h_dsc_byp_ctl_0
            ) enable(c2h_dsc_byp_load_0)       clocked_by(usrClk) reset_by(usrRstN);
            method c2h_dsc_byp_ready_0 isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface XdmaChannelDscByp xdmaH2CDscByp;
            method putDescriptor(
                h2c_dsc_byp_src_addr_0,
                h2c_dsc_byp_dst_addr_0,
                h2c_dsc_byp_len_0,
                h2c_dsc_byp_ctl_0
            ) enable(h2c_dsc_byp_load_0)       clocked_by(usrClk) reset_by(usrRstN);
            method h2c_dsc_byp_ready_0 isReady clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface XdmaChannelSts xdmaC2HSts;
            method c2h_sts_0 getStatus clocked_by(usrClk) reset_by(usrRstN);
        endinterface

        interface XdmaChannelSts xdmaH2CSts;
            method h2c_sts_0 getStatus clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    `ifdef USING_AXIL_SLAVE
        interface XdmaConfigAxiLiteMmSlave xdmaConfigAxiLiteMmSlave;
            interface AxiLiteSlaveAwChannel aw;
                method putAddr(
                    s_axil_awaddr,
                    s_axil_awprot
                ) enable(s_axil_awvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_awready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteSlaveWChannel w;
                method putData(
                    s_axil_wdata,
                    s_axil_wstrb
                ) enable(s_axil_wvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_wready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteSlaveBChannel b;
                method s_axil_bvalid    isValid               clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_bresp     getResp               clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct() enable(s_axil_bready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteSlaveArChannel ar;
                method putAddr(
                    s_axil_araddr,
                    s_axil_arprot
                ) enable(s_axil_arvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_arready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteSlaveRChannel r;
                method s_axil_rvalid    isValid               clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_rdata     getData               clocked_by(usrClk) reset_by(usrRstN);
                method s_axil_rresp     getResp               clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct() enable(s_axil_rready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface
        endinterface
    `endif
    `ifdef USING_AXIL_MASTER
        interface XdmaConfigAxiLiteMmMaster xdmaConfigAxiLiteMmMaster;
            interface AxiLiteMasterAwChannel aw;
                method m_axil_awaddr    getAddr                 clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_awprot    getProt                 clocked_by(usrClk) reset_by(usrRstN);   // never used
                method m_axil_awvalid   isValid                 clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct() enable(m_axil_awready)  clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteMasterWChannel w;
                method m_axil_wdata     getData                 clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_wstrb     getStrb                 clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_wvalid    isValid                 clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct() enable(m_axil_wready)   clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteMasterBChannel b;
                method putResp(m_axil_bresp) enable(m_axil_bvalid) clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_bready         isReady               clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteMasterArChannel ar;
                method m_axil_araddr    getAddr                clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_arprot    getProt                clocked_by(usrClk) reset_by(usrRstN);  // never used
                method m_axil_arvalid   isValid                clocked_by(usrClk) reset_by(usrRstN);
                method readyAssertAct() enable(m_axil_arready) clocked_by(usrClk) reset_by(usrRstN);
            endinterface

            interface AxiLiteMasterRChannel r;
                method putResp(
                    m_axil_rdata,
                    m_axil_rresp
                ) enable(m_axil_rvalid)      clocked_by(usrClk) reset_by(usrRstN);
                method m_axil_rready isReady clocked_by(usrClk) reset_by(usrRstN);
            endinterface
        endinterface
    `endif

    `ifdef USING_CFG_MGMT
        interface XdmaCfgMgmt xdmaCfgMgmt;
            method putAddr(cfg_mgmt_addr)           enable((* inhigh *)cfg_mgmt_addr_dummy_en)        clocked_by(usrClk) reset_by(usrRstN);
            method wrAssertAct()                    enable(cfg_mgmt_write)                            clocked_by(usrClk) reset_by(usrRstN);
            method putWrData(cfg_mgmt_write_data)   enable((* inhigh *)cfg_mgmt_write_data_dummy_en)  clocked_by(usrClk) reset_by(usrRstN);
            method putByteEna(cfg_mgmt_byte_enable) enable((* inhigh *)cfg_mgmt_byte_enable_dummy_en) clocked_by(usrClk) reset_by(usrRstN);
            method rdAssertAct()                    enable(cfg_mgmt_read)                             clocked_by(usrClk) reset_by(usrRstN);
            method cfg_mgmt_read_data               getRdData                                         clocked_by(usrClk) reset_by(usrRstN);
            method cfg_mgmt_read_write_done         isDone                                            clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    `endif

        interface XdmaIrq xdmaIrq;
            method req()                    enable(usr_irq_req) clocked_by(usrClk) reset_by(usrRstN);
            method usr_irq_ack ask                              clocked_by(usrClk) reset_by(usrRstN);
        endinterface
    endinterface

// for methods clocked by related clocks the default is C.

    // xdmaPciExpPin CF xdmaPciExpPin
    schedule (
    `ifdef USING_PIPE_SIM
        xdmaPciExpPin.xdmaSimPipe.cmdIn,
        xdmaPciExpPin.xdmaSimPipe.sigs0In,
        xdmaPciExpPin.xdmaSimPipe.sigs1In,
        xdmaPciExpPin.xdmaSimPipe.sigs2In,
        xdmaPciExpPin.xdmaSimPipe.sigs3In,
        xdmaPciExpPin.xdmaSimPipe.sigs4In,
        xdmaPciExpPin.xdmaSimPipe.sigs5In,
        xdmaPciExpPin.xdmaSimPipe.sigs6In,
        xdmaPciExpPin.xdmaSimPipe.sigs7In,
        xdmaPciExpPin.xdmaSimPipe.sigs8In,
        xdmaPciExpPin.xdmaSimPipe.sigs9In,
        xdmaPciExpPin.xdmaSimPipe.sigs10In,
        xdmaPciExpPin.xdmaSimPipe.sigs11In,
        xdmaPciExpPin.xdmaSimPipe.sigs12In,
        xdmaPciExpPin.xdmaSimPipe.sigs13In,
        xdmaPciExpPin.xdmaSimPipe.sigs14In,
        xdmaPciExpPin.xdmaSimPipe.sigs15In,

        xdmaPciExpPin.xdmaSimPipe.cmdOut,
        xdmaPciExpPin.xdmaSimPipe.sigs0Out,
        xdmaPciExpPin.xdmaSimPipe.sigs1Out,
        xdmaPciExpPin.xdmaSimPipe.sigs2Out,
        xdmaPciExpPin.xdmaSimPipe.sigs3Out,
        xdmaPciExpPin.xdmaSimPipe.sigs4Out,
        xdmaPciExpPin.xdmaSimPipe.sigs5Out,
        xdmaPciExpPin.xdmaSimPipe.sigs6Out,
        xdmaPciExpPin.xdmaSimPipe.sigs7Out,
        xdmaPciExpPin.xdmaSimPipe.sigs8Out,
        xdmaPciExpPin.xdmaSimPipe.sigs9Out,
        xdmaPciExpPin.xdmaSimPipe.sigs10Out,
        xdmaPciExpPin.xdmaSimPipe.sigs11Out,
        xdmaPciExpPin.xdmaSimPipe.sigs12Out,
        xdmaPciExpPin.xdmaSimPipe.sigs13Out,
        xdmaPciExpPin.xdmaSimPipe.sigs14Out,
        xdmaPciExpPin.xdmaSimPipe.sigs15Out,
    `endif

        xdmaPciExpPin.xdmaPciePins.txn,
        xdmaPciExpPin.xdmaPciePins.txp,

        xdmaPciExpPin.xdmaPciePins.rxn,
        xdmaPciExpPin.xdmaPciePins.rxp
    ) CF (
    `ifdef USING_PIPE_SIM
        xdmaPciExpPin.xdmaSimPipe.cmdIn,
        xdmaPciExpPin.xdmaSimPipe.sigs0In,
        xdmaPciExpPin.xdmaSimPipe.sigs1In,
        xdmaPciExpPin.xdmaSimPipe.sigs2In,
        xdmaPciExpPin.xdmaSimPipe.sigs3In,
        xdmaPciExpPin.xdmaSimPipe.sigs4In,
        xdmaPciExpPin.xdmaSimPipe.sigs5In,
        xdmaPciExpPin.xdmaSimPipe.sigs6In,
        xdmaPciExpPin.xdmaSimPipe.sigs7In,
        xdmaPciExpPin.xdmaSimPipe.sigs8In,
        xdmaPciExpPin.xdmaSimPipe.sigs9In,
        xdmaPciExpPin.xdmaSimPipe.sigs10In,
        xdmaPciExpPin.xdmaSimPipe.sigs11In,
        xdmaPciExpPin.xdmaSimPipe.sigs12In,
        xdmaPciExpPin.xdmaSimPipe.sigs13In,
        xdmaPciExpPin.xdmaSimPipe.sigs14In,
        xdmaPciExpPin.xdmaSimPipe.sigs15In,
        xdmaPciExpPin.xdmaSimPipe.cmdOut,

        xdmaPciExpPin.xdmaSimPipe.sigs0Out,
        xdmaPciExpPin.xdmaSimPipe.sigs1Out,
        xdmaPciExpPin.xdmaSimPipe.sigs2Out,
        xdmaPciExpPin.xdmaSimPipe.sigs3Out,
        xdmaPciExpPin.xdmaSimPipe.sigs4Out,
        xdmaPciExpPin.xdmaSimPipe.sigs5Out,
        xdmaPciExpPin.xdmaSimPipe.sigs6Out,
        xdmaPciExpPin.xdmaSimPipe.sigs7Out,
        xdmaPciExpPin.xdmaSimPipe.sigs8Out,
        xdmaPciExpPin.xdmaSimPipe.sigs9Out,
        xdmaPciExpPin.xdmaSimPipe.sigs10Out,
        xdmaPciExpPin.xdmaSimPipe.sigs11Out,
        xdmaPciExpPin.xdmaSimPipe.sigs12Out,
        xdmaPciExpPin.xdmaSimPipe.sigs13Out,
        xdmaPciExpPin.xdmaSimPipe.sigs14Out,
        xdmaPciExpPin.xdmaSimPipe.sigs15Out,
    `endif

        xdmaPciExpPin.xdmaPciePins.txn,
        xdmaPciExpPin.xdmaPciePins.txp,

        xdmaPciExpPin.xdmaPciePins.rxn,
        xdmaPciExpPin.xdmaPciePins.rxp
    );

    schedule (
    `ifdef USING_MSI
        xdmaUsrPin.isMsiEnable,
        xdmaUsrPin.getMsiVecWidth,
    `endif

    `ifdef USING_MSIX
        xdmaUsrPin.isMsixEnable,
    `endif

        xdmaUsrPin.xdmaC2HSts.getStatus,
        xdmaUsrPin.xdmaH2CSts.getStatus,

        xdmaUsrPin.xdmaC2HDataStream.putStream,
        xdmaUsrPin.xdmaC2HDataStream.isReady,

        xdmaUsrPin.xdmaH2CDataStream.isValid,
        xdmaUsrPin.xdmaH2CDataStream.getLast,
        xdmaUsrPin.xdmaH2CDataStream.getData,
        xdmaUsrPin.xdmaH2CDataStream.getKeep,
        xdmaUsrPin.xdmaH2CDataStream.readyAssertAct,

        xdmaUsrPin.xdmaC2HDscByp.isReady,
        xdmaUsrPin.xdmaC2HDscByp.putDescriptor,

        xdmaUsrPin.xdmaH2CDscByp.isReady,
        xdmaUsrPin.xdmaH2CDscByp.putDescriptor,

    `ifdef USING_AXIL_SLAVE
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.aw.putAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.aw.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.w.putData,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.w.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.b.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.b.getResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.b.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.ar.putAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.ar.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.getData,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.getResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.readyAssertAct,
    `endif

    `ifdef USING_AXIL_MASTER
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.getAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.getProt,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.getData,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.getStrb,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.b.putResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.b.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.getAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.getProt,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.r.putResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.r.isReady,
    `endif

    `ifdef USING_CFG_MGMT
        xdmaUsrPin.xdmaCfgMgmt.putAddr,
        xdmaUsrPin.xdmaCfgMgmt.wrAssertAct,
        xdmaUsrPin.xdmaCfgMgmt.putWrData,
        xdmaUsrPin.xdmaCfgMgmt.putByteEna,
        xdmaUsrPin.xdmaCfgMgmt.rdAssertAct,
        xdmaUsrPin.xdmaCfgMgmt.getRdData,
        xdmaUsrPin.xdmaCfgMgmt.isDone,
    `endif

        xdmaUsrPin.xdmaIrq.req,
        xdmaUsrPin.xdmaIrq.ask,
        xdmaUsrPin.isUsrLnkUp
    ) CF (
    `ifdef USING_MSI
        xdmaUsrPin.isMsiEnable,
        xdmaUsrPin.getMsiVecWidth,
    `endif

    `ifdef USING_MSIX
        xdmaUsrPin.isMsixEnable,
    `endif

        xdmaUsrPin.xdmaC2HSts.getStatus,
        xdmaUsrPin.xdmaH2CSts.getStatus,

        xdmaUsrPin.xdmaC2HDataStream.putStream,
        xdmaUsrPin.xdmaC2HDataStream.isReady,

        xdmaUsrPin.xdmaH2CDataStream.isValid,
        xdmaUsrPin.xdmaH2CDataStream.getLast,
        xdmaUsrPin.xdmaH2CDataStream.getData,
        xdmaUsrPin.xdmaH2CDataStream.getKeep,
        xdmaUsrPin.xdmaH2CDataStream.readyAssertAct,

        xdmaUsrPin.xdmaC2HDscByp.isReady,
        xdmaUsrPin.xdmaC2HDscByp.putDescriptor,

        xdmaUsrPin.xdmaH2CDscByp.isReady,
        xdmaUsrPin.xdmaH2CDscByp.putDescriptor,

    `ifdef USING_AXIL_SLAVE
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.aw.putAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.aw.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.w.putData,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.w.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.b.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.b.getResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.b.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.ar.putAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.ar.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.getData,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.getResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmSlave.r.readyAssertAct,
    `endif

    `ifdef USING_AXIL_MASTER
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.getAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.getProt,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.aw.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.getData,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.getStrb,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.w.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.b.putResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.b.isReady,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.getAddr,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.getProt,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.isValid,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.ar.readyAssertAct,

        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.r.putResp,
        xdmaUsrPin.xdmaConfigAxiLiteMmMaster.r.isReady,
    `endif

    `ifdef USING_CFG_MGMT
        xdmaUsrPin.xdmaCfgMgmt.putAddr,
        xdmaUsrPin.xdmaCfgMgmt.wrAssertAct,
        xdmaUsrPin.xdmaCfgMgmt.putWrData,
        xdmaUsrPin.xdmaCfgMgmt.putByteEna,
        xdmaUsrPin.xdmaCfgMgmt.rdAssertAct,
        xdmaUsrPin.xdmaCfgMgmt.getRdData,
        xdmaUsrPin.xdmaCfgMgmt.isDone,
    `endif

        xdmaUsrPin.xdmaIrq.req,
        xdmaUsrPin.xdmaIrq.ask,
        xdmaUsrPin.isUsrLnkUp
    );
endmodule
