typedef 32'h2fffe7f ChannelAllStarted;

typedef 32'h0000 XdmaHostToCardRegisterBaseAddress;
typedef 32'h1000 XdmaCardToHostRegisterBaseAddress;

typedef 32'h00   XdmaChannelIdentifierOffset;
typedef 32'h04   XdmaChannelControlOffset;
typedef 32'h08   XdmaChannelControlWrite1SetOffset;
typedef 32'h0C   XdmaChannelControlWrite1ClearOffset;
typedef 32'h40   XdmaChannelStatusReadWrite1ClearOffset;
typedef 32'h44   XdmaChannelStatusReadOnceCleaerOffset;
typedef 32'h48   XdmaChannelCompletedDescriptorCountOffset;
typedef 32'h4C   XdmaChannelAlignmentsOffset;
typedef 32'h88   XdmaPollModeWriteBackAddressLoOffset;
typedef 32'h8C   XdmaPollModeWriteBackAddressHiOffset;
typedef 32'h90   XdmaChannelInterruptEnableMaskOffset;
typedef 32'h94   XdmaChannelInterruptEnableMaskWrite1SetOffset;
typedef 32'h98   XdmaChannelInterruptEnableMaskWrite1ClearOffset;
typedef 32'hC0   XdmaChannelPerformanceMonitorControlOffset;
typedef 32'hC4   XdmaChannelPerformanceCycleCountLoOffset;
typedef 32'hC8   XdmaChannelPerformanceCycleCountHiOffset;
typedef 32'hCC   XdmaChannelPerformanceDataCountLoOffset;
typedef 32'hD0   XdmaChannelPerformanceDataCountHiOffset;

typedef 32'h2000 XdmaIrqRegisterBaseAddress;

typedef 32'h00   XdmaIrqBlockIdentifierOffset;
typedef 32'h04   XdmaIrqBlockUserInterruptEnableMaskOffset;
typedef 32'h08   XdmaIrqBlockUserInterruptEnableMaskWrite1SetOffset;
typedef 32'h0C   XdmaIrqBlockUserInterruptEnableMaskWrite1ClearOffset;
typedef 32'h10   XdmaIrqBlockChannelInterruptEnableMaskOffset;
typedef 32'h14   XdmaIrqBlockChannelInterruptEnableMaskWrite1SetOffset;
typedef 32'h18   XdmaIrqBlockChannelInterruptEnableMaskWrite1ClearOffset;
typedef 32'h40   XdmaIrqBlockUserInterruptRequestOffset;
typedef 32'h44   XdmaIrqBlockChannelInterruptRequestOffset;
typedef 32'h48   XdmaIrqBlockUserInterruptPendingOffset;
typedef 32'h4C   XdmaIrqBlockChannelInterruptPendingOffset;
typedef 32'h80   XdmaIrqBlockUserVectorNumberZeroOffset;
typedef 32'h84   XdmaIrqBlockUserVectorNumberOneOffset;
typedef 32'h88   XdmaIrqBlockUserVectorNumberTwoOffset;
typedef 32'h8C   XdmaIrqBlockUserVectorNumberThreeOffset;
typedef 32'hA0   XdmaIrqBlockChannelVectorNumberZeroOffset;
typedef 32'hA4   XdmaIrqBlockChannelVectorNumberOneOffset;

typedef 32'h3000 XdmaConfigBlockRegisterBaseAddress;

typedef 32'h00   ConfigBlockIdentifierOffset;
typedef 32'h04   ConfigBlockBusDevOffset;
typedef 32'h08   ConfigBlockPCIEMaxPayloadSizeOffset;
typedef 32'h0C   ConfigBlockPCIEMaxReadRequestSizeOffset;
typedef 32'h10   ConfigBlockSystemIDOffset;
typedef 32'h14   ConfigBlockMSIEnableOffset;
typedef 32'h18   ConfigBlockPCIEDataWidthOffset;
typedef 32'h1C   ConfigPCIEControlOffset;
typedef 32'h40   ConfigAXIUserMaxPayloadSizeOffset;
typedef 32'h44   ConfigAXIUserMaxReadRequestSizeOffset;
typedef 32'h60   ConfigWriteFlushTimeoutOffset;

typedef 32'h4000 XdmaHostToCardSgdmaRegisterBaseAddress;
typedef 32'h5000 XdmaCardToHostSgdmaRegisterBaseAddress;

typedef 32'h00   XdmaChannelSgdmaIdentifierOffset;
typedef 32'h80   XdmaChannelSgdmaDescriptorLoAddressOffset;
typedef 32'h84   XdmaChannelSgdmaDescriptorHiAddressOffset;
typedef 32'h88   XdmaChannelSgdmaDescriptorAdjacentOffset;
typedef 32'h8C   XdmaChannelSgdmaDescriptorCreditsOffset;

typedef 32'h6000 XdmaSgdmaCommonRegisterBassAddress;

typedef 32'h00   SgdmaIdentifierRegistersOffset;
typedef 32'h10   SgdmaDescriptorControlRegisterOffset;
typedef 32'h14   SgdmaDescriptorControlRegisterWrite1SetOffset;
typedef 32'h18   SgdmaDescriptorControlRegisterWrite1ClearOffset;
typedef 32'h20   SgdmaDescriptorCreditModeEnableOffset;
typedef 32'h24   SgDescriptorModeEnableRegisterWrite1SetOffset;
typedef 32'h28   SgDescriptorModeEnableRegisterWrite1ClearOffset;

typedef 32'h8000 XdmaMSIXVectorTableAndPbaBassAddress;

typedef 32'h000  MsixVector0MessageLoAddressOffset;
typedef 32'h004  MsixVector0MessageHiAddressOffset;
typedef 32'h008  MsixVector0MessageDataOffset;
typedef 32'h00C  MsixVector0ControlOffset;
typedef 32'h1F0  MsixVector31MessageLoAddressOffset;
typedef 32'h1F4  MsixVector31MessageHiAddressOffset;
typedef 32'h1F8  MsixVector31MessagedataOffset;
typedef 32'h1FC  MsixVector31ControlOffset;
typedef 32'hFE0  MsixPendingBitArrayOffset;
