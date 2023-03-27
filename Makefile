BUILDDIR = build
SRCDIR = src
VLOGDIR = generated
OUTPUTDIR = output
ONLYSYNTH = 1
CLK = main_clock
IPCACHEDIR = cache

TARGETFILE ?= $(SRCDIR)/bsv/Testbench.bsv
TOPMODULE ?= mkTbXdmaEndpoint
export TOP = $(TOPMODULE)
export RTL = $(VLOGDIR)
export XDC = $(SRCDIR)/xdc
export OUTPUT = $(OUTPUTDIR)
export SYNTHONLY = $(ONLYSYNTH)
export CLOCKS = $(CLK)
export IPSRC = $(SRCDIR)/scripts
export IPCACHE = $(IPCACHEDIR)

TRANSFLAGS = -aggressive-conditions # -lift -split-if
RECOMPILEFLAGS = -u -show-compiles
SCHEDFLAGS = -show-schedule -sched-dot # -show-rule-rel dMemInit_request_put doExecute
#	-show-elab-progress
DEBUGFLAGS = -check-assert \
	-continue-after-errors \
	-keep-fires \
	-keep-inlined-boundaries \
	-show-method-bvi \
	-show-method-conf \
	-show-module-use \
	-show-range-conflict \
	-show-stats \
	-warn-action-shadowing \
	-warn-method-urgency \
	-promote-warnings ALL
VERILOGFLAGS = -verilog -remove-dollar -remove-unused-modules # -use-dpi -verilog-filter cmd
BLUESIMFLAGS = -parallel-sim-link 16 # -systemc
OUTDIR = -bdir $(BUILDDIR) -info-dir $(BUILDDIR) -simdir $(BUILDDIR) -vdir $(BUILDDIR)
WORKDIR = -fdir $(abspath .)
BSVSRCDIR = -p +:$(abspath $(SRCDIR)/bsv)
DIRFLAGS = $(BSVSRCDIR) $(OUTDIR) $(WORKDIR)
MISCFLAGS = -print-flags -show-timestamps -show-version # -steps 1000000000000000 -D macro
RUNTIMEFLAGS = +RTS -K256M -RTS
SIMEXE = $(BUILDDIR)/out

compile:
	mkdir -p $(BUILDDIR)
	bsc -elab -sim -verbose $(BLUESIMFLAGS) $(DEBUGFLAGS) $(DIRFLAGS) $(MISCFLAGS) $(RECOMPILEFLAGS) $(RUNTIMEFLAGS) $(SCHEDFLAGS) $(TRANSFLAGS) -g $(TOPMODULE) $(TARGETFILE)

link: compile
	bsc -sim $(BLUESIMFLAGS) $(DIRFLAGS) $(RECOMPILEFLAGS) $(SCHEDFLAGS) $(TRANSFLAGS) -e $(TOPMODULE) -o $(SIMEXE)

simulate: link
	$(SIMEXE)

verilog: compile
	bsc $(VERILOGFLAGS) $(DIRFLAGS) $(RECOMPILEFLAGS) $(TRANSFLAGS) -g $(TOPMODULE) $(TARGETFILE)
	mkdir -p $(VLOGDIR)
	bluetcl listVlogFiles.tcl -bdir $(BUILDDIR) -vdir $(BUILDDIR) $(TOPMODULE) $(TOPMODULE) | grep -i '\.v' | xargs -I {} cp {} $(VLOGDIR)

vivado: verilog
	vivado -nolog -nojournal -mode batch -source non_project_build.tcl 2>&1 | tee ./run.log

clean:
	rm -rf $(BUILDDIR) $(VLOGDIR) $(OUTPUTDIR) .Xil *.jou *.log

.PHONY: compile link simulate clean vivado
.DEFAULT_GOAL := vivado
