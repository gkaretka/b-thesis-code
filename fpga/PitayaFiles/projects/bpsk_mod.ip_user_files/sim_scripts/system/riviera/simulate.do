onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+system -L xilinx_vip -L xpm -L xil_defaultlib -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_8 -L processing_system7_vip_v1_0_10 -L xlconstant_v1_1_7 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L axis_infrastructure_v1_1_0 -L axis_register_slice_v1_1_22 -L axis_subset_converter_v1_1_22 -L axis_dwidth_converter_v1_1_21 -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L c_gate_bit_v12_0_6 -L xbip_counter_v3_0_6 -L c_counter_binary_v12_0_14 -L xlslice_v1_0_2 -L axi_utils_v2_0_6 -L fir_compiler_v7_2_15 -L generic_baseblocks_v2_1_0 -L axi_register_slice_v2_1_22 -L fifo_generator_v13_2_5 -L axi_data_fifo_v2_1_21 -L axi_crossbar_v2_1_23 -L axi_protocol_converter_v2_1_22 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.system xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {system.udo}

run -all

endsim

quit -force
