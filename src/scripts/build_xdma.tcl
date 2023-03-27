set ip_name xdma
set ip_version 4.1
set ip_vendor_name xilinx.com
set ip_lib ip

set module_name xdma

set ip_dcp $ipcache_dir/$module_name/$module_name.dcp
if { [file exists $ip_dcp] } {
    puts "Found IP OOC file, just use it."
    read_ip [ glob $ipcache_dir/$module_name/$module_name.xci ]
} else {
    puts "Can't find an IP OOC file, creat a new one."
    create_ip -name $ip_name -vendor $ip_vendor_name -library $ip_lib -version $ip_version -module_name $module_name -force -dir $ipcache_dir
    set_property -dict [list \
        CONFIG.mode_selection {Advanced} \
        CONFIG.pcie_blk_locn {X1Y2} \
        CONFIG.pl_link_cap_max_link_width {X16} \
        CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
        CONFIG.axi_data_width {512_bit} \
        CONFIG.axisten_freq {250} \
        CONFIG.pipe_sim {true} \
        CONFIG.pf0_device_id {903F} \
        CONFIG.xdma_axilite_slave {true} \
        CONFIG.select_quad {GTY_Quad_227} \
        CONFIG.coreclk_freq {500} \
        CONFIG.plltype {QPLL1} \
        CONFIG.xdma_axi_intf_mm {AXI_Stream} \
        CONFIG.dsc_bypass_rd {0001} \
        CONFIG.dsc_bypass_wr {0001} \
        CONFIG.xdma_sts_ports {true} \
        CONFIG.pf0_msix_enabled {true} \
        CONFIG.pf0_msix_cap_table_size {01F} \
        CONFIG.pf0_msix_cap_table_offset {00008000} \
        CONFIG.pf0_msix_cap_pba_offset {00008FE0} \
        CONFIG.cfg_mgmt_if {false} \
        CONFIG.PF0_DEVICE_ID_mqdma {903F} \
        CONFIG.PF2_DEVICE_ID_mqdma {923F} \
        CONFIG.PF3_DEVICE_ID_mqdma {933F} \
        CONFIG.PF0_SRIOV_VF_DEVICE_ID {A03F} \
        CONFIG.PF1_SRIOV_VF_DEVICE_ID {A13F} \
        CONFIG.PF2_SRIOV_VF_DEVICE_ID {A23F} \
        CONFIG.PF3_SRIOV_VF_DEVICE_ID {A33F}] [get_ips $module_name]
    generate_target all [get_files $ipcache_dir/$module_name/$module_name.xci]
    synth_ip [get_ips $module_name]
}
