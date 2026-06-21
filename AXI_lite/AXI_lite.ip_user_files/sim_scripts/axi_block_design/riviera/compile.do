transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_datamover_v5_1_37
vlib riviera/axi_sg_v4_1_21
vlib riviera/axi_dma_v7_1_37
vlib riviera/xil_defaultlib
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_22
vlib riviera/processing_system7_vip_v1_0_24
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/smartconnect_v1_0
vlib riviera/axi_register_slice_v2_1_36

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_datamover_v5_1_37 riviera/axi_datamover_v5_1_37
vmap axi_sg_v4_1_21 riviera/axi_sg_v4_1_21
vmap axi_dma_v7_1_37 riviera/axi_dma_v7_1_37
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_22 riviera/axi_vip_v1_1_22
vmap processing_system7_vip_v1_0_24 riviera/processing_system7_vip_v1_0_24
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_register_slice_v2_1_36 riviera/axi_register_slice_v2_1_36

vlog -work xilinx_vip  -incr "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/ivanyuchen/2025.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"/home/ivanyuchen/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/ivanyuchen/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/ivanyuchen/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/home/ivanyuchen/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_datamover_v5_1_37 -93  -incr \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/d44a/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_21 -93  -incr \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/b193/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_37 -93  -incr \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/7f6a/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/axi_block_design/ip/axi_block_design_axi_dma_0_0/sim/axi_block_design_axi_dma_0_0.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_24  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_processing_system7_0_0/sim/axi_block_design_processing_system7_0_0.v" \
"../../../bd/axi_block_design/ip/axi_block_design_dma_add_one_0_0/sim/axi_block_design_dma_add_one_0_0.v" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_1/sim/bd_22c4_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_2/sim/bd_22c4_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_3/sim/bd_22c4_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_4/sim/bd_22c4_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_5/sim/bd_22c4_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_6/sim/bd_22c4_sarn_0.sv" \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_7/sim/bd_22c4_srn_0.sv" \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_8/sim/bd_22c4_sawn_0.sv" \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_9/sim/bd_22c4_swn_0.sv" \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_10/sim/bd_22c4_sbn_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_11/sim/bd_22c4_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/ip/ip_12/sim/bd_22c4_m00e_0.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/bd_0/sim/bd_22c4.v" \

vcom -work smartconnect_v1_0 -93  -incr \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work axi_register_slice_v2_1_36  -incr -v2k5 "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/ip/axi_block_design_axi_smc_1/sim/axi_block_design_axi_smc_1.sv" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/axi_block_design/ip/axi_block_design_rst_ps7_0_100M_0/sim/axi_block_design_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/ec67/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/9a25/hdl" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AXI_lite.gen/sources_1/bd/axi_block_design/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../2025.2/data/rsb/busdef" "+incdir+/home/ivanyuchen/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_datamover_v5_1_37 -l axi_sg_v4_1_21 -l axi_dma_v7_1_37 -l xil_defaultlib -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_22 -l processing_system7_vip_v1_0_24 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_register_slice_v2_1_36 \
"../../../bd/axi_block_design/sim/axi_block_design.v" \

vlog -work xil_defaultlib \
"glbl.v"

