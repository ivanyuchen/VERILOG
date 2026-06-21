vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_22
vlib modelsim_lib/msim/processing_system7_vip_v1_0_24
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_datamover_v5_1_37
vlib modelsim_lib/msim/axi_sg_v4_1_21
vlib modelsim_lib/msim/axi_dma_v7_1_37
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_36
vlib modelsim_lib/msim/generic_baseblocks_v2_1_2
vlib modelsim_lib/msim/fifo_generator_v13_2_14
vlib modelsim_lib/msim/axi_data_fifo_v2_1_36
vlib modelsim_lib/msim/axi_crossbar_v2_1_38
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_37
vlib modelsim_lib/msim/axi_clock_converter_v2_1_35
vlib modelsim_lib/msim/blk_mem_gen_v8_4_12
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_37

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 modelsim_lib/msim/axi_vip_v1_1_22
vmap processing_system7_vip_v1_0_24 modelsim_lib/msim/processing_system7_vip_v1_0_24
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_datamover_v5_1_37 modelsim_lib/msim/axi_datamover_v5_1_37
vmap axi_sg_v4_1_21 modelsim_lib/msim/axi_sg_v4_1_21
vmap axi_dma_v7_1_37 modelsim_lib/msim/axi_dma_v7_1_37
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 modelsim_lib/msim/axi_register_slice_v2_1_36
vmap generic_baseblocks_v2_1_2 modelsim_lib/msim/generic_baseblocks_v2_1_2
vmap fifo_generator_v13_2_14 modelsim_lib/msim/fifo_generator_v13_2_14
vmap axi_data_fifo_v2_1_36 modelsim_lib/msim/axi_data_fifo_v2_1_36
vmap axi_crossbar_v2_1_38 modelsim_lib/msim/axi_crossbar_v2_1_38
vmap axi_protocol_converter_v2_1_37 modelsim_lib/msim/axi_protocol_converter_v2_1_37
vmap axi_clock_converter_v2_1_35 modelsim_lib/msim/axi_clock_converter_v2_1_35
vmap blk_mem_gen_v8_4_12 modelsim_lib/msim/blk_mem_gen_v8_4_12
vmap axi_dwidth_converter_v2_1_37 modelsim_lib/msim/axi_dwidth_converter_v2_1_37

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_24 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_processing_system7_0_0/sim/PCSNN_block_design_processing_system7_0_0.v" \

vcom -work axi_datamover_v5_1_37 -64 -93  \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/d44a/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_21 -64 -93  \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/b193/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_37 -64 -93  \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/7f6a/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_dma_0_0/sim/PCSNN_block_design_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_snn_dma_wrapper_0_0/sim/PCSNN_block_design_snn_dma_wrapper_0_0.v" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/sim/bd_cc28.v" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_1/sim/bd_cc28_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_2/sim/bd_cc28_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_3/sim/bd_cc28_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_4/sim/bd_cc28_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_5/sim/bd_cc28_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_6/sim/bd_cc28_sarn_0.sv" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_7/sim/bd_cc28_srn_0.sv" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_8/sim/bd_cc28_sawn_0.sv" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_9/sim/bd_cc28_swn_0.sv" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_10/sim/bd_cc28_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_11/sim/bd_cc28_m00s2a_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/bd_0/ip/ip_12/sim/bd_cc28_m00e_0.sv" \

vcom -work smartconnect_v1_0 -64 -93  \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work axi_register_slice_v2_1_36 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L processing_system7_vip_v1_0_24 -L xilinx_vip "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_smc_0/sim/PCSNN_block_design_axi_smc_0.sv" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_rst_ps7_0_100M_0/sim/PCSNN_block_design_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_2 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_14 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/d654/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14 -64 -93  \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/d654/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/d654/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_36 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/fb46/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_38 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f084/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_mem_intercon_imp_xbar_0/sim/PCSNN_block_design_axi_mem_intercon_imp_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_37 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/d98a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_mem_intercon_imp_auto_pc_0/sim/PCSNN_block_design_axi_mem_intercon_imp_auto_pc_0.v" \

vlog -work axi_clock_converter_v2_1_35 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/e059/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_12 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/42f3/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_37 -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/21f8/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/ec67/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/9a25/hdl" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../PCSNN.gen/sources_1/bd/PCSNN_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_mem_intercon_imp_auto_us_0/sim/PCSNN_block_design_axi_mem_intercon_imp_auto_us_0.v" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_mem_intercon_imp_auto_pc_1/sim/PCSNN_block_design_axi_mem_intercon_imp_auto_pc_1.v" \
"../../../bd/PCSNN_block_design/ip/PCSNN_block_design_axi_mem_intercon_imp_auto_us_1/sim/PCSNN_block_design_axi_mem_intercon_imp_auto_us_1.v" \
"../../../bd/PCSNN_block_design/sim/PCSNN_block_design.v" \

vlog -work xil_defaultlib \
"glbl.v"

