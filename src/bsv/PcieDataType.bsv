typedef 16      PCIE_LANES;

typedef 512     PCIE_AXIS_DATA_WIDTH;

typedef PCIE_AXIS_DATA_WIDTH PCIE_AXIS_CQ_DATA_WIDTH;
typedef 183                  PCIE_AXIS_CQ_USER_WIDTH;
typedef 16                   PCIE_AXIS_CQ_KEEP_WIDTH;
typedef 1                    PCIE_AXIS_CQ_READY_WIDTH;
typedef 2                    PCIE_CQ_NONE_POST_REQ_WIDTH;
typedef 6                    PCIE_CQ_NONE_POST_COUNT_WIDTH;

typedef PCIE_AXIS_DATA_WIDTH PCIE_AXIS_CC_DATA_WIDTH;
typedef 81                   PCIE_AXIS_CC_USER_WIDTH;
typedef 16                   PCIE_AXIS_CC_KEEP_WIDTH;
typedef 4                    PCIE_AXIS_CC_READY_WIDTH;

typedef PCIE_AXIS_DATA_WIDTH PCIE_AXIS_RQ_DATA_WIDTH;
typedef 137                  PCIE_AXIS_RQ_USER_WIDTH;
typedef 16                   PCIE_AXIS_RQ_KEEP_WIDTH;
typedef 4                    PCIE_AXIS_RQ_READY_WIDTH;
typedef 8                    PCIE_RQ_TAG_WIDTH;
typedef 6                    PCIE_RQ_SEQ_NUM_WIDTH;

typedef PCIE_AXIS_DATA_WIDTH PCIE_AXIS_RC_DATA_WIDTH;
typedef 161                  PCIE_AXIS_RC_USER_WIDTH;
typedef 16                   PCIE_AXIS_RC_KEEP_WIDTH;

typedef Bit#(PCIE_AXIS_CQ_DATA_WIDTH)       PcieAxisCqData;
typedef Bit#(PCIE_AXIS_CQ_USER_WIDTH)       PcieAxisCqUser;
typedef Bit#(PCIE_AXIS_CQ_KEEP_WIDTH)       PcieAxisCqKeep;
typedef Bool                                PcieAxisCqLast;
typedef Bool                                PcieAxisCqValid;
typedef Bit#(PCIE_AXIS_CQ_READY_WIDTH)      PcieAxisCqReady;
typedef Bit#(PCIE_CQ_NONE_POST_REQ_WIDTH)   PcieCqNpReq;
typedef Bit#(PCIE_CQ_NONE_POST_COUNT_WIDTH) PcieCqNPCount;

typedef Bit#(PCIE_AXIS_CC_DATA_WIDTH)       PcieAxisCcData;
typedef Bit#(PCIE_AXIS_CC_USER_WIDTH)       PcieAxisCcUser;
typedef Bool                                PcieAXisCcLast;
typedef Bit#(PCIE_AXIS_CC_KEEP_WIDTH)       PcieAxisCckeep;
typedef Bool                                PcieAxisCcValid;
typedef Bit#(PCIE_AXIS_CC_READY_WIDTH)      PcieAxisCcReady;

typedef Bit#(PCIE_AXIS_RQ_DATA_WIDTH)       PcieAxisRqData;
typedef Bit#(PCIE_AXIS_RQ_USER_WIDTH)       PcieAxisRqUser;
typedef Bool                                PcieAxisRqLast;
typedef Bit#(PCIE_AXIS_RQ_KEEP_WIDTH)       PcieAxisRqKeep;
typedef Bool                                PcieAxisRqValid;
typedef Bit#(PCIE_AXIS_RQ_READY_WIDTH)      PcieAxisRqReady;
typedef Bool                                PcieRqTagValid0;
typedef Bit#(PCIE_RQ_TAG_WIDTH)             PcieRqTag0;
typedef Bool                                PcieRqTagValid1;
typedef Bit#(PCIE_RQ_TAG_WIDTH)             PcieRqTag1;
typedef Bit#(PCIE_RQ_SEQ_NUM_WIDTH)         PcieRqSeqNumValid0;
typedef Bit#(PCIE_RQ_SEQ_NUM_WIDTH)         PcieRqSeqNum0;
typedef Bit#(PCIE_RQ_SEQ_NUM_WIDTH)         PcieRqSeqNumValid1;
typedef Bit#(PCIE_RQ_SEQ_NUM_WIDTH)         PcieRqSeqNum1;

typedef Bit#(PCIE_AXIS_RC_DATA_WIDTH)       PcieAxisRcData;
typedef Bit#(PCIE_AXIS_RC_USER_WIDTH)       PcieAxisRcUser;
typedef Bool                                PcieAxisRcLast;
typedef Bit#(PCIE_AXIS_RC_KEEP_WIDTH)       PcieAxisRcKeep;
typedef Bool                                PcieAxisRcValid;
typedef Bool                                PcieAxisRcReady;

typedef 64 CQ_USER_PARITY_WIDTH;
typedef 8  CQ_USER_TPH_STEERING_TAG_WIDTH;
typedef 4  CQ_USER_TPH_TYPE_WIDTH;
typedef 2  CQ_USER_TPH_PRESENT_WIDTH;
typedef 1  CQ_USER_DISCONTINUE_WIDTH;
typedef 4  CQ_USER_IS_EOP1_PTR_WIDTH;
typedef 4  CQ_USER_IS_EOP0_PTR_WIDTH;
typedef 2  CQ_USER_IS_EOP_WIDTH;
typedef 2  CQ_USER_IS_SOP1_PTR_WIDTH;
typedef 2  CQ_USER_IS_SOP0_PTR_WIDTH;
typedef 2  CQ_USER_IS_SOP_WIDTH;
typedef 64 CQ_USER_BYTE_EN_WIDTH;
typedef 8  CQ_USER_LAST_BYTE_EN_WIDTH;
typedef 8  CQ_USER_FIRST_BYTE_EN_WIDTH;

typedef Bit#(CQ_USER_PARITY_WIDTH)           CqParity;
typedef Bit#(CQ_USER_TPH_STEERING_TAG_WIDTH) CqTphSteeringTag;
typedef Bit#(CQ_USER_TPH_TYPE_WIDTH)         CqTphType;
typedef Bit#(CQ_USER_TPH_PRESENT_WIDTH)      CqTphPresent;
typedef Bit#(CQ_USER_DISCONTINUE_WIDTH)      CqDiscontinue;
typedef Bit#(CQ_USER_IS_EOP1_PTR_WIDTH)      CqIsEop1Ptr;
typedef Bit#(CQ_USER_IS_EOP0_PTR_WIDTH)      CqIsEop0Ptr;
typedef Bit#(CQ_USER_IS_EOP_WIDTH)           CqIsEop;
typedef Bit#(CQ_USER_IS_SOP1_PTR_WIDTH)      CqIsSop1Ptr;
typedef Bit#(CQ_USER_IS_SOP0_PTR_WIDTH)      CqIsSop0Ptr;
typedef Bit#(CQ_USER_IS_SOP_WIDTH)           CqIsSop;
typedef Bit#(CQ_USER_BYTE_EN_WIDTH)          CqByteEnable;
typedef Bit#(CQ_USER_LAST_BYTE_EN_WIDTH)     CqLastByteEnable;
typedef Bit#(CQ_USER_FIRST_BYTE_EN_WIDTH)    CqFirstByteEnable;

typedef struct {
    CqParity          parity;
    CqTphSteeringTag  tphSteeringTag;
    CqTphType         tphType;
    CqTphPresent      tphPresent;
    CqDiscontinue     discontinue;
    CqIsEop1Ptr       isEop1Ptr;
    CqIsEop0Ptr       isEop0Ptr;
    CqIsEop           isEop;
    CqIsSop1Ptr       isSop1Ptr;
    CqIsSop0Ptr       isSop0Ptr;
    CqIsSop           isSop;
    CqByteEnable      byteEnable;
    CqLastByteEnable  lastByteEnable;
    CqFirstByteEnable firstByteEnable;
} CqUserSideband deriving (Bits, Eq);

typedef 64 CC_USER_PARITY_WIDTH;
typedef 1  CC_USER_DISCONTINUE_WIDTH;
typedef 4  CC_USER_IS_EOP1_PTR_WIDTH;
typedef 4  CC_USER_IS_EOP0_PTR_WIDTH;
typedef 2  CC_USER_IS_EOP_WIDTH;
typedef 2  CC_USER_IS_SOP1_PTR_WIDTH;
typedef 2  CC_USER_IS_SOP0_PTR_WIDTH;
typedef 2  CC_USER_IS_SOP_WIDTH;

typedef Bit#(CC_USER_PARITY_WIDTH)      CcParity;
typedef Bit#(CC_USER_DISCONTINUE_WIDTH) CcDiscontinue;
typedef Bit#(CC_USER_IS_EOP1_PTR_WIDTH) CcIsEop1Ptr;
typedef Bit#(CC_USER_IS_EOP0_PTR_WIDTH) CcIsEop0Ptr;
typedef Bit#(CC_USER_IS_EOP_WIDTH)      CcIsEop;
typedef Bit#(CC_USER_IS_SOP1_PTR_WIDTH) CcIsSop1Ptr;
typedef Bit#(CC_USER_IS_SOP0_PTR_WIDTH) CcIsSop0Ptr;
typedef Bit#(CC_USER_IS_SOP_WIDTH)      CcIsSop;

typedef struct {
    CcParity      parity;
    CcDiscontinue discontinue;
    CcIsEop1Ptr   isEop1Ptr;
    CcIsEop0Ptr   isEop0Ptr;
    CcIsEop       isEop;
    CcIsSop1Ptr   isSop1Ptr;
    CcIsSop0Ptr   isSop0Ptr;
    CcIsSop       isSop;
} CcUserSideband deriving (Bits, Eq);

typedef 64 RQ_USER_PARITY_WIDTH;
typedef 6  RQ_USER_SEQ_NUM1_WIDTH;
typedef 6  RQ_USER_SEQ_NUM0_WIDTH;
typedef 16 RQ_USER_TPH_STEERING_TAG_WIDTH;
typedef 2  RQ_USER_TPH_INDIRECT_TAG_EN_WIDTH;
typedef 4  RQ_USER_TPH_TYPE_WIDTH;
typedef 2  RQ_USER_TPH_PRESENT_WIDTH;
typedef 1  RQ_USER_DISCONTINUE_WIDTH;
typedef 4  RQ_USER_IS_EOP1_PTR_WIDTH;
typedef 4  RQ_USER_IS_EOP0_PTR_WIDTH;
typedef 2  RQ_USER_IS_EOP_WIDTH;
typedef 2  RQ_USER_IS_SOP1_PTR_WIDTH;
typedef 2  RQ_USER_IS_SOP0_PTR_WIDTH;
typedef 2  RQ_USER_IS_SOP_WIDTH;
typedef 4  RQ_USER_ADDR_OFFSET;
typedef 8  RQ_USER_LAST_BYTE_EN_WIDTH;
typedef 8  RQ_USER_FIRST_BYTE_EN_WIDTH;

typedef Bit#(RQ_USER_PARITY_WIDTH)               RqParity;
typedef Bit#(RQ_USER_SEQ_NUM1_WIDTH)             RqSeqNum1;
typedef Bit#(RQ_USER_SEQ_NUM0_WIDTH)             RqSeqNum0;
typedef Bit#(RQ_USER_TPH_STEERING_TAG_WIDTH)     RqTphSteeringTag;
typedef Bit#(RQ_USER_TPH_INDIRECT_TAG_EN_WIDTH)  RqTphIndir
typedef Bit#(RQ_USER_TPH_TYPE_WIDTH)             RqTphType;
typedef Bit#(RQ_USER_TPH_PRESENT_WIDTH)          RqTphPresent;
typedef Bit#(RQ_USER_DISCONTINUE_WIDTH)          RqDiscontinue;
typedef Bit#(RQ_USER_IS_EOP1_PTR_WIDTH)          RqIsEop1Ptr;
typedef Bit#(RQ_USER_IS_EOP0_PTR_WIDTH)          RqIsEop0Ptr;
typedef Bit#(RQ_USER_IS_EOP_WIDTH)               RqIsEop;
typedef Bit#(RQ_USER_IS_SOP1_PTR_WIDTH)          RqIsSop1Ptr;
typedef Bit#(RQ_USER_IS_SOP0_PTR_WIDTH)          RqIsSop0Ptr;
typedef Bit#(RQ_USER_IS_SOP_WIDTH)               RqIsSop;
typedef Bit#(RQ_USER_ADDR_OFFSET)                RqAddrOffset;
typedef Bit#(RQ_USER_LAST_BYTE_EN_WIDTH)         RqLastByteEnable;
typedef Bit#(RQ_USER_FIRST_BYTE_EN_WIDTH)        RqFirstByteEnable;

typedef struct {
    RqParity            parity;
    RqSeqNum1           seqNum1;
    RqSeqNum0           seqNum0;
    RqTphSteeringTag    tphSteeringTag;
    RqTphIndir          tphIndir;
    RqTphType           tphType;
    RqTphPresent        tphPresent;
    RqDiscontinue       discontinue;
    RqIsEop1Ptr         isEop1Ptr;
    RqIsEop0Ptr         isEop0Ptr;
    RqIsEop             isEop;
    RqIsSop1Ptr         isSop1Ptr;
    RqIsSop0Ptr         isSop0Ptr;
    RqIsSop             isSop;
    RqAddrOffset        addrOffset;
    RqLastByteEnable    lastByteEnable;
    RqFirstByteEnable   firstByteEnable;
} RqUserSideband deriving (Bits, Eq);

typedef 64 RC_USER_PARITY_WIDTH;
typedef 1  RC_USER_DISCONTINUE_WIDTH;
typedef 4  RC_USER_IS_EOP3_PTR_WIDTH;
typedef 4  RC_USER_IS_EOP2_PTR_WIDTH;
typedef 4  RC_USER_IS_EOP1_PTR_WIDTH;
typedef 4  RC_USER_IS_EOP0_PTR_WIDTH;
typedef 4  RC_USER_IS_EOP_WIDTH;
typedef 2  RC_USER_IS_SOP3_PTR_WIDTH;
typedef 2  RC_USER_IS_SOP2_PTR_WIDTH;
typedef 2  RC_USER_IS_SOP1_PTR_WIDTH;
typedef 2  RC_USER_IS_SOP0_PTR_WIDTH;
typedef 4  RC_USER_IS_SOP_WIDTH;
typedef 64 RC_USER_BYTE_EN_WIDTH;

typedef Bit#(RC_USER_PARITY_WIDTH)      RcParity;
typedef Bit#(RC_USER_DISCONTINUE_WIDTH) RcDiscontinue;
typedef Bit#(RC_USER_IS_EOP3_PTR_WIDTH) RcIsEop3Ptr;
typedef Bit#(RC_USER_IS_EOP2_PTR_WIDTH) RcIsEop2Ptr;
typedef Bit#(RC_USER_IS_EOP1_PTR_WIDTH) RcIsEop1Ptr;
typedef Bit#(RC_USER_IS_EOP0_PTR_WIDTH) RcIsEop0Ptr;
typedef Bit#(RC_USER_IS_EOP_WIDTH)      RcIsEop;
typedef Bit#(RC_USER_IS_SOP3_PTR_WIDTH) RcIsSop3Ptr;
typedef Bit#(RC_USER_IS_SOP2_PTR_WIDTH) RcIsSop2Ptr;
typedef Bit#(RC_USER_IS_SOP1_PTR_WIDTH) RcIsSop1Ptr;
typedef Bit#(RC_USER_IS_SOP0_PTR_WIDTH) RcIsSop0Ptr;
typedef Bit#(RC_USER_IS_SOP_WIDTH)      RcIsSop;
typedef Bit#(RC_USER_BYTE_EN_WIDTH)     RcByteEnable;

typedef struct {
    RcParity      parity;
    RcDiscontinue discontinue;
    RcIsEop3Ptr   isEop3Ptr;
    RcIsEop2Ptr   isEop2Ptr;
    RcIsEop1Ptr   isEop1Ptr;
    RcIsEop0Ptr   isEop0Ptr;
    RcIsEop       isEop;
    RcIsSop3Ptr   isSop3Ptr;
    RcIsSop2Ptr   isSop2Ptr;
    RcIsSop1Ptr   isSop1Ptr;
    RcIsSop0Ptr   isSop0Ptr;
    RcIsSop       isSop;
    RcByteEnable  byteEnable;
} RcUserSideband deriving (Bits, Eq);

typedef 10 PCIE_CFG_MGMT_ADDR_WIDTH;
typedef 8  PCIE_CFG_MGMT_FUNC_NUM_WIDTH;
typedef 32 PCIE_CFG_MGMT_WRITE_DATA_WIDTH;
typedef 4  PCIE_CFG_MGMT_BYTE_EN_WIDTH;
typedef 32 PCIE_CFG_MGMT_READ_DATA_WIDTH;

typedef Bit#(PCIE_CFG_MGMT_ADDR_WIDTH)        MgmtAddr;
typedef Bit#(PCIE_CFG_MGMT_FUNC_NUM_WIDTH)    MgmtFuncNum;
typedef Bool                                  MgmtWriteEnable;
typedef Bit#(PCIE_CFG_MGMT_WRITE_DATA_WIDTH)  MgmtWritaData;
typedef Bit#(PCIE_CFG_MGMT_BYTE_EN_WIDTH)     MgmtByteEnable;
typedef Bit#(PCIE_CFG_MGMT_READ_DATA_WIDTH)   MgmtReadData;
typedef Bool                                  MgmtReadEnable;

typedef 1   PCIE_CFG_STATUS_PHY_LINK_DOWN_WIDTH;
typedef 2   PCIE_CFG_STATUS_PHY_LINK_STATUS_WDITH;
typedef 3   PCIE_CFG_STATUS_NEGOTIATED_LINK_WIDTH;
typedef 3   PCIE_CFG_STATUS_LINK_SPEED_WIDTH;
typedef 2   PCIE_CFG_STATUS_MAX_PAYLOAD_WDITH;
typedef 3   PCIE_CFG_STATUS_MAX_READ_REQ_WIDTH;
typedef 16  PCIE_CFG_STATUS_FUNC_WIDTH;
typedef 504 PCIE_CFG_STATUS_VF_WIDTH;
typedef 12  PCIE_CFG_STATUS_FUNC_POWER_WIDTH;
typedef 756 PCIE_CFG_STATUS_VF_POWER_WIDTH;
typedef 2   PCIE_CFG_STATUS_LINK_POWER_WIDTH;
typedef 5   PCIE_CFG_STATUS_LOCAL_ERROR_WIDTH;
typedef 2   PCIE_CFG_STATUS_RX_PM_WIDTH;
typedef 2   PCIE_CFG_STATUS_TX_PM_WIDTH;
typedef 6   PCIE_CFG_STATUS_LTSSM_WIDTH;
typedef 4   PCIE_CFG_STATUS_RCB_WIDTH;
typedef 4   PCIE_CFG_STATUS_QPA_CHANGE_WIDTH;
typedef 2   PCIE_CFG_STATUS_OBFF_EN_WIDTH;
typedef 1   PCIE_CFG_STATUS_PL_CHANGE_WIDTH;
typedef 4   PCIE_CFG_STATUS_TPH_REQ_EN_WIDTH;
typedef 12  PCIE_CFG_STATUS_TPH_STEERING_MODE_WIDTH;
typedef 252 PCIE_CFG_STATUS_VF_TPH_REQ_EN_WIDTH;
typedef 756 PCIE_CFG_STATUS_VF_TPH_STEERING_MODE_WIDTH;
typedef 4   PCIE_CFG_STATUS_TFC_NPH_AV_WIDTH;
typedef 4   PCIE_CFG_STATUS_TFC_NPD_AV_WIDTH;
typedef 4   PCIE_CFG_STATUS_RQ_TAG_AV_WIDTH;

typedef Bit#(PCIE_CFG_STATUS_PHY_LINK_DOWN_WIDTH)        StatusPhyLinkDown;
typedef Bit#(PCIE_CFG_STATUS_PHY_LINK_STATUS_WDITH)      StatusPhyLinkStatus;
typedef Bit#(PCIE_CFG_STATUS_NEGOTIATED_LINK_WIDTH)      StatusNegotiatedLink;
typedef Bit#(PCIE_CFG_STATUS_LINK_SPEED_WIDTH)           StatusLinkSpeed;
typedef Bit#(PCIE_CFG_STATUS_MAX_PAYLOAD_WDITH)          StatusMaxPayload;
typedef Bit#(PCIE_CFG_STATUS_MAX_READ_REQ_WIDTH)         StatusMaxReadReq;
typedef Bit#(PCIE_CFG_STATUS_FUNC_WIDTH)                 StatusFunction;
typedef Bit#(PCIE_CFG_STATUS_VF_WIDTH)                   StatusVF;
typedef Bit#(PCIE_CFG_STATUS_FUNC_POWER_WIDTH)           StatusFunctionPower;
typedef Bit#(PCIE_CFG_STATUS_VF_POWER_WIDTH)             StatusVfPower;
typedef Bit#(PCIE_CFG_STATUS_LINK_POWER_WIDTH)           StatusLinkPower;
typedef Bit#(PCIE_CFG_STATUS_LOCAL_ERROR_WIDTH)          StatusLocalError;
typedef Bit#(PCIE_CFG_STATUS_RX_PM_WIDTH)                StatusRxPM;
typedef Bit#(PCIE_CFG_STATUS_TX_PM_WIDTH)                StatusTxPM;
typedef Bit#(PCIE_CFG_STATUS_LTSSM_WIDTH)                StatusLTSSM;
typedef Bit#(PCIE_CFG_STATUS_RCB_WIDTH)                  StatusRCB;
typedef Bit#(PCIE_CFG_STATUS_QPA_CHANGE_WIDTH)           StatusQpaChange;
typedef Bit#(PCIE_CFG_STATUS_OBFF_EN_WIDTH)              StatusObffEnable;
typedef Bit#(PCIE_CFG_STATUS_PL_CHANGE_WIDTH)            StatusPlChange;
typedef Bit#(PCIE_CFG_STATUS_TPH_REQ_EN_WIDTH)           StatusTphReqEnable;
typedef Bit#(PCIE_CFG_STATUS_TPH_STEERING_MODE_WIDTH)    StatusTphSteeringMode;
typedef Bit#(PCIE_CFG_STATUS_VF_TPH_REQ_EN_WIDTH)        StatusVfTphReqEnable;
typedef Bit#(PCIE_CFG_STATUS_VF_TPH_STEERING_MODE_WIDTH) StatusVfTphSteeringMode;
typedef Bit#(PCIE_CFG_STATUS_TFC_NPH_AV_WIDTH)           StatusTfcNphAvail;
typedef Bit#(PCIE_CFG_STATUS_TFC_NPD_AV_WIDTH)           StatusTfcNpdAvail;
typedef Bit#(PCIE_CFG_STATUS_RQ_TAG_AV_WIDTH)            StatusRqTagAvail;

typedef 8 PCIE_CFG_MSG_RECEIVED_DATA_WIDTH;
typedef 5 PCIE_CFG_MSG_RECEIVED_TYPE_WIDTH;

typedef Bit#(PCIE_CFG_MSG_RECEIVED_WIDTH)      MsgReceivedValid;
typedef Bit#(PCIE_CFG_MSG_RECEIVED_DATA_WIDTH) MsgReceivedData;
typedef Bit#(PCIE_CFG_MSG_RECEIVED_TYPE_WIDTH) MsgReceivedType;

typedef 3  PCIE_CFG_MSG_TRANSIMIT_TYPE_WIDTH;
typedef 32 PCIE_CFG_MSG_TRANSIMIT_DATA_WIDTH;

typedef Bit#(PCIE_CFG_MSG_TRANSIMIT_TYPE_WIDTH) MsgTransimitType;
typedef Bit#(PCIE_CFG_MSG_TRANSIMIT_DATA_WIDTH) MsgTransimitData;

typedef 8  PCIE_CFG_FC_PH_WIDTH;
typedef 12 PCIE_CFG_FC_PD_WIDTH;
typedef 8  PCIE_CFG_FC_NPH_WIDTH;
typedef 12 PCIE_CFG_FC_NPD_WIDTH;
typedef 8  PCIE_CFG_FC_CPLH_WIDTH;
typedef 12 PCIE_CFG_FC_CPLD_WIDTH;
typedef 3  PCIE_CFG_FC_SEL_WIDTH;

typedef Bit#(PCIE_CFG_FC_PH_WIDTH)   FlowControlPostedHeader;
typedef Bit#(PCIE_CFG_FC_PD_WIDTH)   FlowControlPostedData;
typedef Bit#(PCIE_CFG_FC_NPH_WIDTH)  FlowControlNonPostedHeader;
typedef Bit#(PCIE_CFG_FC_NPD_WIDTH)  FlowControlNonPostedData;
typedef Bit#(PCIE_CFG_FC_CPLH_WIDTH) FlowControlCompletionHeader;
typedef Bit#(PCIE_CFG_FC_CPLD_WIDTH) FlowControlCompletionData;
typedef Bit#(PCIE_CFG_FC_SEL_WIDTH)  FlowControlInfoSelect;

typedef 1   PCIE_CFG_CTRL_HOT_RESET_IN_WIDTH;
typedef 1   PCIE_CFG_CTRL_HOT_RESET_OUT_WIDTH;
typedef 1   PCIE_CFG_CTRL_CONFIG_SPACE_EN_WIDTH;
typedef 64  PCIE_CFG_CTRL_DSN_WIDTH;
typedef 8   PCIE_CFG_CTRL_DS_BUS_NUM_WIDTH;
typedef 5   PCIE_CFG_CTRL_DS_DEVICE_NUM_WIDTH;
typedef 3   PCIE_CFG_CTRL_DS_FUNC_NUM_WIDTH;
typedef 1   PCIE_CFG_CTRL_POWER_STATE_CHANGE_ACK_WIDTH;
typedef 1   PCIE_CFG_CTRL_POWER_STATE_CHANGE_INTERRUPT_WIDTH;
typedef 8   PCIE_CFG_CTRL_DS_PORT_NUM_WIDTH;
typedef 1   PCIE_CFG_CTRL_ERR_COR_IN_WIDTH;
typedef 1   PCIE_CFG_CTRL_ERR_COR_OUT_WIDTH;
typedef 1   PCIE_CFG_CTRL_ERR_FATAL_OUT_WIDTH;
typedef 1   PCIE_CFG_CTRL_ERR_NONFATAL_OUT_WIDTH;
typedef 1   PCIE_CFG_CTRL_ERR_UNCOR_IN_WIDTH;
typedef 4   PCIE_CFG_CTRL_FLR_DONE_WIDTH;
typedef 1   PCIE_CFG_CTRL_VF_FLR_DONE_WIDTH;
typedef 8   PCIE_CFG_CTRL_VF_FLR_FUNC_NUM_WIDTH;
typedef 4   PCIE_CFG_CTRL_FLR_IN_PROCESS_WIDTH;
typedef 252 PCIE_CFG_CTRL_VF_FLR_IN_PROCESS_WIDTH;
typedef 1   PCIE_CFG_CTRL_REQ_PM_TRANSITION_L23_READY_WIDTH;
typedef 1   PCIE_CFG_CTRL_LINK_TRAINING_EN_WIDTH;
typedef 8   PCIE_CFG_CTRL_BUS_NUM_WIDTH;
typedef 16  PCIE_CFG_CTRL_VENDOR_ID_WIDTH;
typedef 16  PCIE_CFG_CTRL_SUBSYS_VENDOR_ID_WIDTH;
typedef 16  PCIE_CFG_CTRL_DEV_ID_PF0_WIDTH;
typedef 16  PCIE_CFG_CTRL_DEV_ID_PF1_WIDTH;
typedef 16  PCIE_CFG_CTRL_DEV_ID_PF2_WIDTH;
typedef 16  PCIE_CFG_CTRL_DEV_ID_PF3_WIDTH;
typedef 16  PCIE_CFG_CTRL_REV_ID_PF0_WIDTH;
typedef 16  PCIE_CFG_CTRL_REV_ID_PF1_WIDTH;
typedef 16  PCIE_CFG_CTRL_REV_ID_PF2_WIDTH;
typedef 16  PCIE_CFG_CTRL_REV_ID_PF3_WIDTH;
typedef 16  PCIE_CFG_CTRL_SUBSYS_ID_PF0_WIDTH;
typedef 16  PCIE_CFG_CTRL_SUBSYS_ID_PF1_WIDTH;
typedef 16  PCIE_CFG_CTRL_SUBSYS_ID_PF2_WIDTH;
typedef 16  PCIE_CFG_CTRL_SUBSYS_ID_PF3_WIDTH;

typedef Bit#(PCIE_CFG_CTRL_HOT_RESET_IN_WIDTH)                  CtrlHotRstIn;
typedef Bit#(PCIE_CFG_CTRL_HOT_RESET_OUT_WIDTH)                 CtrlHotRstOut;
typedef Bit#(PCIE_CFG_CTRL_CONFIG_SPACE_EN_WIDTH)               CtrlCfgSpaceEnable;
typedef Bit#(PCIE_CFG_CTRL_DSN_WIDTH)                           CtrlDSN;
typedef Bit#(PCIE_CFG_CTRL_DS_BUS_NUM_WIDTH)                    CtrlDownstreamBusNum;
typedef Bit#(PCIE_CFG_CTRL_DS_DEVICE_NUM_WIDTH)                 CtrlDownstreamDeviceNum;
typedef Bit#(PCIE_CFG_CTRL_DS_FUNC_NUM_WIDTH)                   CtrlDownstreamFunctionNum;
typedef Bit#(PCIE_CFG_CTRL_POWER_STATE_CHANGE_ACK_WIDTH)        CtrlPowerStateChangeAck;
typedef Bit#(PCIE_CFG_CTRL_POWER_STATE_CHANGE_INTERRUPT_WIDTH)  CtrlPowerStateChangeInterrupt;
typedef Bit#(PCIE_CFG_CTRL_DS_PORT_NUM_WIDTH)                   CtrlDownstreamPortNum;
typedef Bit#(PCIE_CFG_CTRL_ERR_COR_IN_WIDTH)                    CtrlCorrectableErrorDetectedIn;
typedef Bit#(PCIE_CFG_CTRL_ERR_COR_OUT_WIDTH)                   CtrlCorrectableErrorDetectedOut;
typedef Bit#(PCIE_CFG_CTRL_ERR_FATAL_OUT_WIDTH)                 CtrlFatalErrorDetectedOut;
typedef Bit#(PCIE_CFG_CTRL_ERR_NONFATAL_OUT_WIDTH)              CtrlNonFatalErrorDetectedOut;
typedef Bit#(PCIE_CFG_CTRL_ERR_UNCOR_IN_WIDTH)                  CtrlUnCorrectableErrorDetectedIn;
typedef Bit#(PCIE_CFG_CTRL_FLR_DONE_WIDTH)                      CtrlFunctionLevelResetDone;
typedef Bit#(PCIE_CFG_CTRL_VF_FLR_DONE_WIDTH)                   CtrlVfFunctionLevelResetDone;
typedef Bit#(PCIE_CFG_CTRL_VF_FLR_FUNC_NUM_WIDTH)               CtrlVfFunctionLevelResetFuncNum;
typedef Bit#(PCIE_CFG_CTRL_FLR_IN_PROCESS_WIDTH)                CtrlFunctionLevelResetInProcess;
typedef Bit#(PCIE_CFG_CTRL_VF_FLR_IN_PROCESS_WIDTH)             CtrlVfFunctionLevelResetInProcess;
typedef Bit#(PCIE_CFG_CTRL_REQ_PM_TRANSITION_L23_READY_WIDTH)   CtrlReqPmTransitionL23Ready;
typedef Bit#(PCIE_CFG_CTRL_LINK_TRAINING_EN_WIDTH)              CtrlLinkTrainingEnable;
typedef Bit#(PCIE_CFG_CTRL_BUS_NUM_WIDTH)                       CtrlBusNum;
typedef Bit#(PCIE_CFG_CTRL_VENDOR_ID_WIDTH)                     CtrlVendorID;
typedef Bit#(PCIE_CFG_CTRL_SUBSYS_VENDOR_ID_WIDTH)              CtrlSubsystemVendorID;
typedef Bit#(PCIE_CFG_CTRL_DEV_ID_PF0_WIDTH)                    CtrlDeviceIdPF0;
typedef Bit#(PCIE_CFG_CTRL_DEV_ID_PF1_WIDTH)                    CtrlDeviceIdPF1;
typedef Bit#(PCIE_CFG_CTRL_DEV_ID_PF2_WIDTH)                    CtrlDeviceIdPF2;
typedef Bit#(PCIE_CFG_CTRL_DEV_ID_PF3_WIDTH)                    CtrlDeviceIdPF3;
typedef Bit#(PCIE_CFG_CTRL_REV_ID_PF0_WIDTH)                    CtrlRevsionIdPF0;
typedef Bit#(PCIE_CFG_CTRL_REV_ID_PF1_WIDTH)                    CtrlRevsionIdPF1;
typedef Bit#(PCIE_CFG_CTRL_REV_ID_PF2_WIDTH)                    CtrlRevsionIdPF2;
typedef Bit#(PCIE_CFG_CTRL_REV_ID_PF3_WIDTH)                    CtrlRevsionIdPF3;
typedef Bit#(PCIE_CFG_CTRL_SUBSYS_ID_PF0_WIDTH)                 CtrlSubsystemIdPF0
typedef Bit#(PCIE_CFG_CTRL_SUBSYS_ID_PF1_WIDTH)                 CtrlSubsystemIdPF1
typedef Bit#(PCIE_CFG_CTRL_SUBSYS_ID_PF2_WIDTH)                 CtrlSubsystemIdPF2
typedef Bit#(PCIE_CFG_CTRL_SUBSYS_ID_PF3_WIDTH)                 CtrlSubsystemIdPF3

typedef 4 PCIE_CFG_INTERRUPT_INT_WIDTH;
typedef 1 PCIE_CFG_INTERRUPT_SENT_WIDTH;
typedef 4 PCIE_CFG_INTERRUPT_PENDING_WIDTH;

typedef Bit#(PCIE_CFG_INTERRUPT_INT_WIDTH)     InterruptVec;
typedef Bit#(PCIE_CFG_INTERRUPT_SENT_WIDTH)    InterruptSent;
typedef Bit#(PCIE_CFG_INTERRUPT_PENDING_WIDTH) InterruptPending;

typedef 4  PCIE_CFG_MSI_EN_WIDTH;
typedef 32 PCIE_CFG_MSI_INT_WIDTH;
typedef 8  PCIE_CFG_MSI_FUNC_NUM_WIDTH;
typedef 12 PCIE_CFG_MSI_MMENABLE_WIDTH;
typedef 32 PCIE_CFG_MSI_PENDING_STATUS_WIDTH;
typedef 2  PCIE_CFG_MSI_PENDING_STATUS_FUNC_NUM_WIDTH;
typedef 1  PCIE_CFG_MSI_PENDING_STATUS_DATA_EN_WIDTH;
typedef 1  PCIE_CFG_MSI_MASK_UPDATE_WIDTH;
typedef 2  PCIE_CFG_MSI_SEL_WIDTH;
typedef 32 PCIE_CFG_MSI_DATA_WIDTH;
typedef 3  PCIE_CFG_MSI_ATTR_WIDTH;
typedef 1  PCIE_CFG_MSI_TPH_PRESENT_WIDTH;
typedef 2  PCIE_CFG_MSI_TPH_TYPE_WIDTH;
typedef 8  PCIE_CFG_MSI_TPH_STEERING_TAG_WIDTH;

typedef Bit#(PCIE_CFG_MSI_EN_WIDTH)                      MsiEnable;
typedef Bit#(PCIE_CFG_MSI_INT_WIDTH)                     MsiIntVec;
typedef Bit#(PCIE_CFG_MSI_FUNC_NUM_WIDTH)                MsiFunctionNum;
typedef Bit#(PCIE_CFG_MSI_MMENABLE_WIDTH)                MsiMultipleMsgEnable;
typedef Bit#(PCIE_CFG_MSI_PENDING_STATUS_WIDTH)          MsiPendingStatus;
typedef Bit#(PCIE_CFG_MSI_PENDING_STATUS_FUNC_NUM_WIDTH) MsiPendingStatusFunctionNum;
typedef Bit#(PCIE_CFG_MSI_PENDING_STATUS_DATA_EN_WIDTH)  MsiPendingStatusDataEnable;
typedef Bit#(PCIE_CFG_MSI_MASK_UPDATE_WIDTH)             MsiMaskUpdate;
typedef Bit#(PCIE_CFG_MSI_SEL_WIDTH)                     MsiSelect;
typedef Bit#(PCIE_CFG_MSI_DATA_WIDTH)                    MsiData;
typedef Bit#(PCIE_CFG_MSI_ATTR_WIDTH)                    MsiTlpAttribute;
typedef Bit#(PCIE_CFG_MSI_TPH_PRESENT_WIDTH)             MsiTphPresent;
typedef Bit#(PCIE_CFG_MSI_TPH_TYPE_WIDTH)                MsiTphType;
typedef Bit#(PCIE_CFG_MSI_TPH_STEERING_TAG_WIDTH)        MsiTphsteeringTag;

typedef 4   PCIE_CFG_MSIX_EXTERNAL_EN_WIDTH;
typedef 4   PCIE_CFG_MSIX_EXTERNAL_MASK_WIDTH;
typedef 252 PCIE_CFG_MSIX_EXTERNAL_VF_EN_WIDTH;
typedef 252 PCIE_CFG_MSIX_EXTERNAL_VF_MASK_WIDTH;
typedef 64  PCIE_CFG_MSIX_EXTERNAL_ADDR_WIDTH;
typedef 32  PCIE_CFG_MSIX_EXTERNAL_DATA_WIDTH;
typedef 2   PCIE_CFG_MSIX_EXTERNAL_VEC_PENDING_WIDTH;
typedef 1   PCIE_CFG_MSIX_EXTERNAL_VEC_PENDING_STATUS_WIDTH;

typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_EN_WIDTH)                 MsixExternalEnable;
typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_MASK_WIDTH)               MsixExternalMask;
typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_VF_EN_WIDTH)              MsixExternalVfEnable;
typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_VF_MASK_WIDTH)            MsixExternalVfMask;
typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_ADDR_WIDTH)               MsixExternalAddr;
typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_DATA_WIDTH)               MsixExternalData;
typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_VEC_PENDING_WIDTH)        MsixExternalVecPending;
typedef Bit#(PCIE_CFG_MSIX_EXTERNAL_VEC_PENDING_STATUS_WIDTH) MsixExternalVecPendingStatus;

typedef 8   PCIE_CFG_MSI_INTERNAL_INT_WIDTH;
typedef 8   PCIE_CFG_MSI_INTERNAL_FUNC_NUM_WIDTH;
typedef 3   PCIE_CFG_MSI_INTERNAL_ATTR_WIDTH;
typedef 1   PCIE_CFG_MSI_INTERNAL_TPH_PRESENT_WIDTH;
typedef 2   PCIE_CFG_MSI_INTERNAL_TPH_TYPE_WIDTH;
typedef 9   PCIE_CFG_MSI_INTERNAL_TPH_STEERING_TAG_WIDTH;
typedef 1   PCIE_CFG_MSIX_INTERNAL_INT_WIDTH;
typedef 2   PCIE_CFG_MSIX_INTERNAL_VEC_PENDING_WIDTH;
typedef 1   PCIE_CFG_MSIX_INTERNAL_VEC_PENDING_STATUS_WIDTH;
typedef 4   PCIE_CFG_MSIX_INTERNAL_EN_WIDTH;
typedef 4   PCIE_CFG_MSIX_INTERNAL_MASK_WIDTH;
typedef 252 PCIE_CFG_MSIX_INTERNAL_VF_EN_WIDTH;
typedef 252 PCIE_CFG_MSIX_INTERNAL_VF_MASK_WIDTH;

typedef Bit#(PCIE_CFG_MSI_INTERNAL_INT_WIDTH)                 MsiInteralIntVec;
typedef Bit#(PCIE_CFG_MSI_INTERNAL_FUNC_NUM_WIDTH)            MsiInteralFunctionNum;
typedef Bit#(PCIE_CFG_MSI_INTERNAL_ATTR_WIDTH)                MsiInteralTlpAttribute;
typedef Bit#(PCIE_CFG_MSI_INTERNAL_TPH_PRESENT_WIDTH)         MsiInteralTphPresent;
typedef Bit#(PCIE_CFG_MSI_INTERNAL_TPH_TYPE_WIDTH)            MsiInteralTphType;
typedef Bit#(PCIE_CFG_MSI_INTERNAL_TPH_STEERING_TAG_WIDTH)    MsiInteralTphSteeringTag;
typedef Bit#(PCIE_CFG_MSIX_INTERNAL_INT_WIDTH)                MsixInternalIntValid;
typedef Bit#(PCIE_CFG_MSIX_INTERNAL_VEC_PENDING_WIDTH)        MsixInternalVecPending;
typedef Bit#(PCIE_CFG_MSIX_INTERNAL_VEC_PENDING_STATUS_WIDTH) MsixInternalVecPendingStatus;
typedef Bit#(PCIE_CFG_MSIX_INTERNAL_EN_WIDTH)                 MsixInternalEnable;
typedef Bit#(PCIE_CFG_MSIX_INTERNAL_MASK_WIDTH)               MsixInternalMask;
typedef Bit#(PCIE_CFG_MSIX_INTERNAL_VF_EN_WIDTH)              MsixInternalVfEnable;
typedef Bit#(PCIE_CFG_MSIX_INTERNAL_VF_MASK_WIDTH)            MsixInternalVfMask;

typedef 1  PCIE_CFG_EXTEND_READ_RECEIVED_WIDTH;
typedef 1  PCIE_CFG_EXTEND_WRITE_RECEIVED_WIDTH;
typedef 10 PCIE_CFG_EXTEND_REGISTER_NUM_WIDTH;
typedef 8  PCIE_CFG_EXTEND_FUNC_NUM_WIDTH;
typedef 32 PCIE_CFG_EXTEND_WRITE_DATA_WIDTH;
typedef 4  PCIE_CFG_EXTEND_WRITE_BYTE_EN_WIDTH;
typedef 32 PCIE_CFG_EXTEND_READ_DATA_WIDTH;
typedef 1  PCIE_CFG_EXTEND_READ_DATA_VALID_WIDTH;

typedef Bit#(PCIE_CFG_EXTEND_READ_RECEIVED_WIDTH)   ExtReadReceived;
typedef Bit#(PCIE_CFG_EXTEND_WRITE_RECEIVED_WIDTH)  ExtWriteReceived;
typedef Bit#(PCIE_CFG_EXTEND_REGISTER_NUM_WIDTH)    ExtRegisterNum;
typedef Bit#(PCIE_CFG_EXTEND_FUNC_NUM_WIDTH)        ExtFunctionNum;
typedef Bit#(PCIE_CFG_EXTEND_WRITE_DATA_WIDTH)      ExtWriteData;
typedef Bit#(PCIE_CFG_EXTEND_WRITE_BYTE_EN_WIDTH)   ExtWriteByteEnable;
typedef Bit#(PCIE_CFG_EXTEND_READ_DATA_WIDTH)       ExtReadData;
typedef Bit#(PCIE_CFG_EXTEND_READ_DATA_VALID_WIDTH) ExtReadDataValid;
