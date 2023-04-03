import FIFOF :: *;
import PAClib :: *;
import XdmaBvi :: *;
import XdmaDataType :: *;

function PipeOut#(anytype) convertFifo2PipeOut(FIFOF#(anytype) outputQ);
    return f_FIFOF_to_PipeOut(outputQ);
endfunction

function ChannelStatus extraChannelStatus(XdmaChannelSts channel);
    return unpack(truncate(channel.getStatus));
endfunction
