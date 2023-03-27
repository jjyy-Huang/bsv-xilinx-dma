proc readRTLFile { dir } {
    set FILES [glob -nocomplain -directory $dir/ *]
    foreach FILE $FILES {
        if {[file isfile $FILE]} {
            set FEXT [file extension $FILE]
            if { [string match $FEXT .v] || [string match $FEXT .vh]} {
                read_verilog -library xil_defaultlib $FILE
                puts $FILE
            }
            if { [string match $FEXT .sv] || [string match $FEXT .svh]} {
                read_verilog -library xil_defaultlib -sv $FILE
                puts $FILE
            }
        }
    }
}

readRTLFile $sim_src
save_project_as sim $out_dir -force
set_property top $sim_top [get_fileset sim_1]
launch_simulation -simset sim_1 -mode behavioral
run 1ms