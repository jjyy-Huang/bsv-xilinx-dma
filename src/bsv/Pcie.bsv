import PcieBvi :: *;
import PcieUser :: *;

interface PCIE;
    interface Clock              usrClk;
    interface Reset              usrRstN;
    (* prefix = "" *)
    interface PciePciExpPin      pciePins;
    interface PcieUser           pcieUser;
endinterface

(* no_default_clock, no_default_reset *)
module mkPCIE#(Clock sysClk, Clock gtClk, Reset sysRstN)(PCIE);
    let pcieBvi <- mkPcieBvi(sysClk, gtClk, sysRstN);
    let pcieUsr <- mkPcieUser(
        pcieBvi.pcieUsrPin,
        clocked_by pcieBvi.usrClk,
        reset_by pcieBvi.usrRstN
    );

    interface usrClk   = pcieBvi.usrClk;
    interface usrRstN  = pcieBvi.usrRstN;
    interface pciePins = pcieBvi.pciePciExpPin;
    interface pcieUser = pcieUsr;
endmodule
