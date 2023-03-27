import FIFOF :: *;
import PAClib :: *;

function PipeOut#(anytype) convertFifo2PipeOut(FIFOF#(anytype) outputQ);
    return f_FIFOF_to_PipeOut(outputQ);
endfunction