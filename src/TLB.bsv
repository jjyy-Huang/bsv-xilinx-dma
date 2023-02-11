import BRAM :: *;
import FIFOF :: *;
import Vector :: *;

typedef 8 BYTE_WIDTH;
typedef TExp#(21) PAGE_SIZE_CAP; // 2MB

typedef 64 ADDR_WIDTH;
typedef Bit#(ADDR_WIDTH) ADDR;

typedef TExp#(14) TLB_CACHE_SIZE;      // TLB cache size 16K
typedef 48        PHYSICAL_ADDR_WIDTH; // X86 physical address width

typedef TLog#(PAGE_SIZE_CAP)  PAGE_OFFSET_WIDTH;
typedef TLog#(TLB_CACHE_SIZE) TLB_CACHE_INDEX_WIDTH;
typedef TSub#(PHYSICAL_ADDR_WIDTH, PAGE_OFFSET_WIDTH) TLB_CACHE_PA_DATA_WIDTH; // 48-21=27
typedef TSub#(TSub#(ADDR_WIDTH, TLB_CACHE_INDEX_WIDTH), PAGE_OFFSET_WIDTH) TLB_CACHE_TAG_WIDTH; // 64-14-21=29

typedef TExp#(11)  BRAM_CACHE_SIZE; // 2K
typedef BYTE_WIDTH BRAM_CACHE_DATA_WIDTH;

typedef Bit#(TLog#(BRAM_CACHE_SIZE)) BramCacheAddr;
typedef Bit#(BRAM_CACHE_DATA_WIDTH)  BramCacheData;

typedef struct {
    Bit#(TLB_CACHE_PA_DATA_WIDTH) data;
    Bit#(TLB_CACHE_TAG_WIDTH)     tag;
} PayloadTLB deriving(Bits);

typedef SizeOf#(PayloadTLB) TLB_PAYLOAD_WIDTH;

function anytype dontCareValue() provisos(Bits#(anytype, anysize));
    return ?;
endfunction

interface BramCache;
    method Action readReq(BramCacheAddr cacheAddr);
    method ActionValue#(BramCacheData) readResp();
    method Action write(BramCacheAddr cacheAddr, BramCacheData writeData);
endinterface

// BramCache total size 2K * 8 = 16Kb
module mkBramCache(BramCache);
    BRAM_Configure cfg = defaultValue;
    // Both read address and read output are registered
    cfg.latency = 2;
    // Allow full pipeline behavior
    cfg.outFIFODepth = 4;
    BRAM2Port#(BramCacheAddr, BramCacheData) bram2Port <- mkBRAM2Server(cfg);

    method Action readReq(BramCacheAddr cacheAddr);
        let req = BRAMRequest{
            write: False,
            responseOnWrite: False,
            address: cacheAddr,
            datain: dontCareValue
        };
        bram2Port.portA.request.put(req);
    endmethod

    method ActionValue#(BramCacheData) readResp();
        let readRespData <- bram2Port.portA.response.get;
        return readRespData;
    endmethod

    method Action write(BramCacheAddr cacheAddr, BramCacheData writeData);
        let req = BRAMRequest{
            write: True,
            responseOnWrite: False,
            address: cacheAddr,
            datain: writeData
        };
        bram2Port.portB.request.put(req);
    endmethod
endmodule

interface CascadeCache#(numeric type addrWidth, numeric type payloadWidth);
    method Action readReq(Bit#(addrWidth) cacheAddr);
    method ActionValue#(Bit#(payloadWidth)) readResp();
    method Action write(Bit#(addrWidth) cacheAddr, Bit#(payloadWidth) writeData);
endinterface

module mkCascadeCache(CascadeCache#(addrWidth, payloadWidth))
provisos(
    NumAlias#(TLog#(BRAM_CACHE_SIZE), bramCacheIndexWidth),
    Add#(bramCacheIndexWidth, TAdd#(anysize, 1), addrWidth), // addrWidth > bramCacheIndexWidth
    NumAlias#(TDiv#(payloadWidth, BRAM_CACHE_DATA_WIDTH), colNum),
    Add#(TMul#(BRAM_CACHE_DATA_WIDTH, colNum), 0, payloadWidth), // payloadWidth must be multiplier of BYTE_WIDTH
    NumAlias#(TSub#(addrWidth, bramCacheIndexWidth), cascadeCacheIndexWidth),
    NumAlias#(TExp#(cascadeCacheIndexWidth), rowNum)
);
    function BramCacheAddr getBramCacheIndex(Bit#(addrWidth) cacheAddr);
        return truncate(cacheAddr); // [valueOf(bramCacheIndexWidth) - 1 : 0];
    endfunction

    function Bit#(cascadeCacheIndexWidth) getCascadeCacheIndex(Bit#(addrWidth) cacheAddr);
        return truncateLSB(cacheAddr); // [valueOf(addrWidth) - 1 : valueOf(bramCacheIndexWidth)];
    endfunction

    function Action readReqHelper(BramCacheAddr bramCacheIndex, BramCache bramCache);
        action
            bramCache.readReq(bramCacheIndex);
        endaction
    endfunction

    function ActionValue#(BramCacheData) readRespHelper(BramCache bramCache);
        actionvalue
            let bramCacheReadRespData <- bramCache.readResp;
            return bramCacheReadRespData;
        endactionvalue
    endfunction

    function Action writeHelper(
        BramCacheAddr bramCacheIndex, Tuple2#(BramCache, BramCacheData) tupleInput
    );
        action
            let { bramCache, writeData } = tupleInput;
            bramCache.write(bramCacheIndex, writeData);
        endaction
    endfunction

    function Bit#(payloadWidth) concatBitVec(BramCacheData bramCacheData, Bit#(payloadWidth) concatResult);
        return truncate({ concatResult, bramCacheData });
    endfunction
    // function Bit#(m) concatBitVec(Vector#(nSz, Bit#(n)) inputBitVec)
    // provisos(Add#(TMul#(n, nSz), 0, m));
    //     Bit#(m) result = dontCareValue;
    //     for (Integer idx = 0; idx < valueOf(n); idx = idx + 1) begin
    //         // result[(idx+1)*valueOf(n) : idx*valueOf(n)] = inputBitVec[idx];
    //         result = truncate({ result, inputBitVec[idx] });
    //     end
    //     return result;
    // endfunction

    Vector#(rowNum, Vector#(colNum, BramCache)) cascadeCacheVec <- replicateM(replicateM(mkBramCache));
    FIFOF#(Bit#(cascadeCacheIndexWidth)) cascadeCacheIndexQ <- mkFIFOF;

    method Action readReq(Bit#(addrWidth) cacheAddr);
        let cascadeCacheIndex = getCascadeCacheIndex(cacheAddr);
        let bramCacheIndex = getBramCacheIndex(cacheAddr);

        mapM_(readReqHelper(bramCacheIndex), cascadeCacheVec[cascadeCacheIndex]);
        cascadeCacheIndexQ.enq(cascadeCacheIndex);
    endmethod

    method ActionValue#(Bit#(payloadWidth)) readResp();
        let cascadeCacheIndex = cascadeCacheIndexQ.first;
        cascadeCacheIndexQ.deq;
        Vector#(colNum, BramCacheData) bramCacheReadRespVec <- mapM(
            readRespHelper, cascadeCacheVec[cascadeCacheIndex]
        );
        Bit#(payloadWidth) concatSeed = dontCareValue;
        Bit#(payloadWidth) concatResult = foldr(concatBitVec, concatSeed, bramCacheReadRespVec);
        return concatResult;
    endmethod

    method Action write(Bit#(addrWidth) cacheAddr, Bit#(payloadWidth) writeData);
        let cascadeCacheIndex = getCascadeCacheIndex(cacheAddr);
        let bramCacheIndex = getBramCacheIndex(cacheAddr);

        Vector#(colNum, BramCacheData) writeDataVec = toChunks(writeData);
        Vector#(colNum, Tuple2#(BramCache, BramCacheData)) bramCacheAndWriteDataVec = zip(
            cascadeCacheVec[cascadeCacheIndex], writeDataVec
        );
        mapM_(writeHelper(bramCacheIndex), bramCacheAndWriteDataVec);
    endmethod
endmodule

interface TLB;
    method Action findReq(ADDR va);
    method ActionValue#(Tuple2#(Bool, ADDR)) findResp();
    method Action insert(ADDR va, ADDR pa);
endinterface

module mkTLB(TLB);
    CascadeCache#(TLB_CACHE_INDEX_WIDTH, TLB_PAYLOAD_WIDTH) cache4TLB <- mkCascadeCache;
    FIFOF#(ADDR) vaInputQ <- mkFIFOF;

    function Bit#(PAGE_OFFSET_WIDTH) getPageOffset(ADDR addr);
        return truncate(addr);
    endfunction

    function ADDR restorePA(
        Bit#(TLB_CACHE_PA_DATA_WIDTH) paData, Bit#(PAGE_OFFSET_WIDTH) pageOffset
    );
        return signExtend({ paData, pageOffset });
    endfunction

    function Bit#(TLB_CACHE_PA_DATA_WIDTH) getData4PA(ADDR pa);
        return truncate(pa >> valueOf(PAGE_OFFSET_WIDTH));
    endfunction

    function Bit#(TLB_CACHE_INDEX_WIDTH) getIndex4TLB(ADDR va);
        return truncate(va >> valueOf(PAGE_OFFSET_WIDTH));
    endfunction

    function Bit#(TLB_CACHE_TAG_WIDTH) getTag4TLB(ADDR va);
        return truncate(va >> valueOf(TAdd#(TLB_CACHE_INDEX_WIDTH, PAGE_OFFSET_WIDTH)));
    endfunction

    method Action findReq(ADDR va);
        let index = getIndex4TLB(va);
        cache4TLB.readReq(index);
        vaInputQ.enq(va);
    endmethod

    method ActionValue#(Tuple2#(Bool, ADDR)) findResp();
        let va = vaInputQ.first;
        vaInputQ.deq;

        let inputTag = getTag4TLB(va);
        let pageOffset = getPageOffset(va);

        let readRespData <- cache4TLB.readResp;
        PayloadTLB payload = unpack(readRespData);

        let pa = restorePA(payload.data, pageOffset);
        let tagMatch = inputTag == payload.tag;
        return tuple2(tagMatch, pa);
    endmethod

    method Action insert(ADDR va, ADDR pa);
        let index = getIndex4TLB(va);
        let inputTag = getTag4TLB(va);
        let paData = getData4PA(pa);
        let payload = PayloadTLB {
            data: paData,
            tag : inputTag
        };
        cache4TLB.write(index, pack(payload));
    endmethod
endmodule
