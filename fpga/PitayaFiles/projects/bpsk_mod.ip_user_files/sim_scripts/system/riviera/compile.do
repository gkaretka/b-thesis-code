vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_8
vlib riviera/processing_system7_vip_v1_0_10
vlib riviera/xlconstant_v1_1_7
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_register_slice_v1_1_22
vlib riviera/axis_subset_converter_v1_1_22
vlib riviera/axis_dwidth_converter_v1_1_21
vlib riviera/xbip_utils_v3_0_10
vlib riviera/c_reg_fd_v12_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_addsub_v3_0_6
vlib riviera/c_addsub_v12_0_14
vlib riviera/c_gate_bit_v12_0_6
vlib riviera/xbip_counter_v3_0_6
vlib riviera/c_counter_binary_v12_0_14
vlib riviera/xlslice_v1_0_2
vlib riviera/axi_utils_v2_0_6
vlib riviera/fir_compiler_v7_2_15
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_data_fifo_v2_1_21
vlib riviera/axi_crossbar_v2_1_23
vlib riviera/axi_protocol_converter_v2_1_22

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 riviera/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 riviera/processing_system7_vip_v1_0_10
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_register_slice_v1_1_22 riviera/axis_register_slice_v1_1_22
vmap axis_subset_converter_v1_1_22 riviera/axis_subset_converter_v1_1_22
vmap axis_dwidth_converter_v1_1_21 riviera/axis_dwidth_converter_v1_1_21
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap c_reg_fd_v12_0_6 riviera/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 riviera/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 riviera/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 riviera/c_addsub_v12_0_14
vmap c_gate_bit_v12_0_6 riviera/c_gate_bit_v12_0_6
vmap xbip_counter_v3_0_6 riviera/xbip_counter_v3_0_6
vmap c_counter_binary_v12_0_14 riviera/c_counter_binary_v12_0_14
vmap xlslice_v1_0_2 riviera/xlslice_v1_0_2
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap fir_compiler_v7_2_15 riviera/fir_compiler_v7_2_15
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 riviera/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 riviera/axi_crossbar_v2_1_23
vmap axi_protocol_converter_v2_1_22 riviera/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_pll_0_0/system_pll_0_0_clk_wiz.v" \
"../../../bd/system/ip/system_pll_0_0/system_pll_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv2k12 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_ps_0_0/sim/system_ps_0_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_const_0_0/sim/system_const_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_rst_0_0/sim/system_rst_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ipshared/0a79/sim/axis_red_pitaya_adc.v" \
"../../../bd/system/ip/system_adc_0_0/sim/system_adc_0_0.v" \
"../../../bd/system/ipshared/6754/sim/axi_cfg_register.v" \
"../../../bd/system/ip/system_cfg_0_0/sim/system_cfg_0_0.v" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_register_slice_v1_1_22  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ebcc/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_subset_0_0/hdl/tdata_system_subset_0_0.v" \
"../../../bd/system/ip/system_subset_0_0/hdl/tuser_system_subset_0_0.v" \
"../../../bd/system/ip/system_subset_0_0/hdl/tstrb_system_subset_0_0.v" \
"../../../bd/system/ip/system_subset_0_0/hdl/tkeep_system_subset_0_0.v" \
"../../../bd/system/ip/system_subset_0_0/hdl/tid_system_subset_0_0.v" \
"../../../bd/system/ip/system_subset_0_0/hdl/tdest_system_subset_0_0.v" \
"../../../bd/system/ip/system_subset_0_0/hdl/tlast_system_subset_0_0.v" \

vlog -work axis_subset_converter_v1_1_22  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/69d9/hdl/axis_subset_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_subset_0_0/hdl/top_system_subset_0_0.v" \
"../../../bd/system/ip/system_subset_0_0/sim/system_subset_0_0.v" \

vlog -work axis_dwidth_converter_v1_1_21  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/6614/hdl/axis_dwidth_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_conv_0_0/sim/system_conv_0_0.v" \
"../../../bd/system/ip/system_const_1_0/sim/system_const_1_0.v" \
"../../../bd/system/ipshared/12f8/sim/axis_ram_writer.v" \
"../../../bd/system/ip/system_writer_0_0/sim/system_writer_0_0.v" \
"../../../bd/system/ipshared/d45f/sim/axi_sts_register.v" \
"../../../bd/system/ip/system_sts_0_0/sim/system_sts_0_0.v" \
"../../../bd/system/ipshared/10f5/sim/axis_red_pitaya_dac.v" \
"../../../bd/system/ip/system_axis_red_pitaya_dac_0_0/sim/system_axis_red_pitaya_dac_0_0.v" \
"../../../bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0.v" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/cfdd/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ebb8/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_gate_bit_v12_0_6 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/7161/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \

vcom -work xbip_counter_v3_0_6 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/9ac8/hdl/xbip_counter_v3_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_14 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/1f12/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_c_counter_binary_0_0/sim/system_c_counter_binary_0_0.vhd" \

vlog -work xlslice_v1_0_2  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xlslice_0_1/sim/system_xlslice_0_1.v" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work fir_compiler_v7_2_15 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/9825/hdl/fir_compiler_v7_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_fir_compiler_1_0/sim/system_fir_compiler_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_clocker2_0_0/sim/system_clocker2_0_0.v" \
"../../../bd/system/ip/system_xlconstant_0_0/sim/system_xlconstant_0_0.v" \
"../../../bd/system/ip/system_xlconstant_0_1/sim/system_xlconstant_0_1.v" \
"../../../bd/system/ip/system_fir_filt_reg_0_0/sim/system_fir_filt_reg_0_0.v" \
"../../../bd/system/ip/system_aresetn_gen_0_0/sim/system_aresetn_gen_0_0.v" \
"../../../bd/system/ip/system_status_reg_conc_0_0/sim/system_status_reg_conc_0_0.v" \
"../../../bd/system/ip/system_dac_reg_0_1/sim/system_dac_reg_0_1.v" \
"../../../bd/system/ip/system_xlconstant_1_0/sim/system_xlconstant_1_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xbar_0/sim/system_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/d0f7" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/34f8/hdl" "+incdir+../../../../bpsk_mod.srcs/sources_1/bd/system/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"

