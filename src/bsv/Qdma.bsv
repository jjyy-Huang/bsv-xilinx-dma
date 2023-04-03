import QdmaBvi :: *;
// import QdmaUserController :: *;

interface QDMA;
    interface Clock         usrClk;
    interface Reset         usrRstN;
    interface QdmaPciExpPin pciePin;
    // interface QdmaUserIfc   qdmaUsr;
endinterface

(* no_default_clock, no_default_reset *)
module mkQDMA#(Clock sysClk, Clock gtClk, Reset sysRstN, Reset dmaSoftReset)(QDMA);
    let qdmaBvi <- mkQdmaBvi(sysClk, gtClk, sysRstN, dmaSoftReset);

    interface usrClk   = qdmaBvi.usrClk;
    interface usrRstN  = qdmaBvi.usrRstN;
    interface pciePin = qdmaBvi.qdmaPciExpPin;
endmodule
