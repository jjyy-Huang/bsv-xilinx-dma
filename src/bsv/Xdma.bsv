import XdmaBvi :: *;
import XdmaUser :: *;

interface XDMA;
    interface Clock              usrClk;
    interface Reset              usrRstN;
    (* prefix = "" *)
    interface XdmaPciExpPin      pciePins;
    interface XdmaUser           xdmaUser;
endinterface

(* no_default_clock, no_default_reset *)
module mkXDMA#(Clock sysClk, Clock gtClk, Reset sysRstN)(XDMA);
    let xdmaBvi <- mkXdmaBvi(sysClk, gtClk, sysRstN);
    let xdmaUsr <- mkXdmaUser(
        xdmaBvi.xdmaUsrPin,
        clocked_by xdmaBvi.usrClk,
        reset_by xdmaBvi.usrRstN
    );

    interface usrClk   = xdmaBvi.usrClk;
    interface usrRstN  = xdmaBvi.usrRstN;
    interface pciePins = xdmaBvi.xdmaPciExpPin;
    interface xdmaUser = xdmaUsr;
endmodule
