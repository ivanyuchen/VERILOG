// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Sat Jun 20 14:33:32 2026
// Host        : ivanyuchen-Predator-PHN16-71 running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/ivanyuchen/CODING_FILES/VERILOG/AXI_lite/AXI_lite.gen/sources_1/bd/axi_block_design/ip/axi_block_design_dma_add_one_0_0/axi_block_design_dma_add_one_0_0_sim_netlist.v
// Design      : axi_block_design_dma_add_one_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "axi_block_design_dma_add_one_0_0,dma_add_one,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "dma_add_one,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module axi_block_design_dma_add_one_0_0
   (aclk,
    aresetn,
    s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tlast,
    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tlast);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN axi_block_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN axi_block_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN axi_block_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output m_axis_tlast;

  wire aclk;
  wire aresetn;
  wire [31:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;

  axi_block_design_dma_add_one_0_0_dma_add_one inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid_reg_0(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "dma_add_one" *) 
module axi_block_design_dma_add_one_0_0_dma_add_one
   (m_axis_tdata,
    m_axis_tlast,
    m_axis_tvalid_reg_0,
    s_axis_tready,
    s_axis_tdata,
    aclk,
    m_axis_tready,
    s_axis_tvalid,
    s_axis_tlast,
    aresetn);
  output [31:0]m_axis_tdata;
  output m_axis_tlast;
  output m_axis_tvalid_reg_0;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input aclk;
  input m_axis_tready;
  input s_axis_tvalid;
  input s_axis_tlast;
  input aresetn;

  wire aclk;
  wire aresetn;
  wire [31:0]m_axis_tdata;
  wire m_axis_tdata0;
  wire \m_axis_tdata_reg[12]_i_1_n_0 ;
  wire \m_axis_tdata_reg[12]_i_1_n_1 ;
  wire \m_axis_tdata_reg[12]_i_1_n_2 ;
  wire \m_axis_tdata_reg[12]_i_1_n_3 ;
  wire \m_axis_tdata_reg[16]_i_1_n_0 ;
  wire \m_axis_tdata_reg[16]_i_1_n_1 ;
  wire \m_axis_tdata_reg[16]_i_1_n_2 ;
  wire \m_axis_tdata_reg[16]_i_1_n_3 ;
  wire \m_axis_tdata_reg[20]_i_1_n_0 ;
  wire \m_axis_tdata_reg[20]_i_1_n_1 ;
  wire \m_axis_tdata_reg[20]_i_1_n_2 ;
  wire \m_axis_tdata_reg[20]_i_1_n_3 ;
  wire \m_axis_tdata_reg[24]_i_1_n_0 ;
  wire \m_axis_tdata_reg[24]_i_1_n_1 ;
  wire \m_axis_tdata_reg[24]_i_1_n_2 ;
  wire \m_axis_tdata_reg[24]_i_1_n_3 ;
  wire \m_axis_tdata_reg[28]_i_1_n_0 ;
  wire \m_axis_tdata_reg[28]_i_1_n_1 ;
  wire \m_axis_tdata_reg[28]_i_1_n_2 ;
  wire \m_axis_tdata_reg[28]_i_1_n_3 ;
  wire \m_axis_tdata_reg[31]_i_3_n_2 ;
  wire \m_axis_tdata_reg[31]_i_3_n_3 ;
  wire \m_axis_tdata_reg[4]_i_1_n_0 ;
  wire \m_axis_tdata_reg[4]_i_1_n_1 ;
  wire \m_axis_tdata_reg[4]_i_1_n_2 ;
  wire \m_axis_tdata_reg[4]_i_1_n_3 ;
  wire \m_axis_tdata_reg[8]_i_1_n_0 ;
  wire \m_axis_tdata_reg[8]_i_1_n_1 ;
  wire \m_axis_tdata_reg[8]_i_1_n_2 ;
  wire \m_axis_tdata_reg[8]_i_1_n_3 ;
  wire m_axis_tlast;
  wire m_axis_tlast_i_1_n_0;
  wire m_axis_tready;
  wire m_axis_tvalid_i_1_n_0;
  wire m_axis_tvalid_reg_0;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [3:2]\NLW_m_axis_tdata_reg[31]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_m_axis_tdata_reg[31]_i_3_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \m_axis_tdata[0]_i_1 
       (.I0(s_axis_tdata[0]),
        .O(p_1_in[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \m_axis_tdata[31]_i_1 
       (.I0(aresetn),
        .O(p_0_in));
  LUT3 #(
    .INIT(8'hA2)) 
    \m_axis_tdata[31]_i_2 
       (.I0(s_axis_tvalid),
        .I1(m_axis_tvalid_reg_0),
        .I2(m_axis_tready),
        .O(m_axis_tdata0));
  FDRE \m_axis_tdata_reg[0] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[0]),
        .Q(m_axis_tdata[0]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[10] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[10]),
        .Q(m_axis_tdata[10]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[11] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[11]),
        .Q(m_axis_tdata[11]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[12] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[12]),
        .Q(m_axis_tdata[12]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[12]_i_1 
       (.CI(\m_axis_tdata_reg[8]_i_1_n_0 ),
        .CO({\m_axis_tdata_reg[12]_i_1_n_0 ,\m_axis_tdata_reg[12]_i_1_n_1 ,\m_axis_tdata_reg[12]_i_1_n_2 ,\m_axis_tdata_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(s_axis_tdata[12:9]));
  FDRE \m_axis_tdata_reg[13] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[13]),
        .Q(m_axis_tdata[13]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[14] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[14]),
        .Q(m_axis_tdata[14]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[15] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[15]),
        .Q(m_axis_tdata[15]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[16] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[16]),
        .Q(m_axis_tdata[16]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[16]_i_1 
       (.CI(\m_axis_tdata_reg[12]_i_1_n_0 ),
        .CO({\m_axis_tdata_reg[16]_i_1_n_0 ,\m_axis_tdata_reg[16]_i_1_n_1 ,\m_axis_tdata_reg[16]_i_1_n_2 ,\m_axis_tdata_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[16:13]),
        .S(s_axis_tdata[16:13]));
  FDRE \m_axis_tdata_reg[17] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[17]),
        .Q(m_axis_tdata[17]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[18] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[18]),
        .Q(m_axis_tdata[18]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[19] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[19]),
        .Q(m_axis_tdata[19]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[1] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[1]),
        .Q(m_axis_tdata[1]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[20] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[20]),
        .Q(m_axis_tdata[20]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[20]_i_1 
       (.CI(\m_axis_tdata_reg[16]_i_1_n_0 ),
        .CO({\m_axis_tdata_reg[20]_i_1_n_0 ,\m_axis_tdata_reg[20]_i_1_n_1 ,\m_axis_tdata_reg[20]_i_1_n_2 ,\m_axis_tdata_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[20:17]),
        .S(s_axis_tdata[20:17]));
  FDRE \m_axis_tdata_reg[21] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[21]),
        .Q(m_axis_tdata[21]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[22] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[22]),
        .Q(m_axis_tdata[22]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[23] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[23]),
        .Q(m_axis_tdata[23]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[24] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[24]),
        .Q(m_axis_tdata[24]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[24]_i_1 
       (.CI(\m_axis_tdata_reg[20]_i_1_n_0 ),
        .CO({\m_axis_tdata_reg[24]_i_1_n_0 ,\m_axis_tdata_reg[24]_i_1_n_1 ,\m_axis_tdata_reg[24]_i_1_n_2 ,\m_axis_tdata_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[24:21]),
        .S(s_axis_tdata[24:21]));
  FDRE \m_axis_tdata_reg[25] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[25]),
        .Q(m_axis_tdata[25]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[26] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[26]),
        .Q(m_axis_tdata[26]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[27] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[27]),
        .Q(m_axis_tdata[27]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[28] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[28]),
        .Q(m_axis_tdata[28]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[28]_i_1 
       (.CI(\m_axis_tdata_reg[24]_i_1_n_0 ),
        .CO({\m_axis_tdata_reg[28]_i_1_n_0 ,\m_axis_tdata_reg[28]_i_1_n_1 ,\m_axis_tdata_reg[28]_i_1_n_2 ,\m_axis_tdata_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[28:25]),
        .S(s_axis_tdata[28:25]));
  FDRE \m_axis_tdata_reg[29] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[29]),
        .Q(m_axis_tdata[29]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[2] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[2]),
        .Q(m_axis_tdata[2]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[30] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[30]),
        .Q(m_axis_tdata[30]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[31] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[31]),
        .Q(m_axis_tdata[31]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[31]_i_3 
       (.CI(\m_axis_tdata_reg[28]_i_1_n_0 ),
        .CO({\NLW_m_axis_tdata_reg[31]_i_3_CO_UNCONNECTED [3:2],\m_axis_tdata_reg[31]_i_3_n_2 ,\m_axis_tdata_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_m_axis_tdata_reg[31]_i_3_O_UNCONNECTED [3],p_1_in[31:29]}),
        .S({1'b0,s_axis_tdata[31:29]}));
  FDRE \m_axis_tdata_reg[3] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[3]),
        .Q(m_axis_tdata[3]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[4] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[4]),
        .Q(m_axis_tdata[4]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\m_axis_tdata_reg[4]_i_1_n_0 ,\m_axis_tdata_reg[4]_i_1_n_1 ,\m_axis_tdata_reg[4]_i_1_n_2 ,\m_axis_tdata_reg[4]_i_1_n_3 }),
        .CYINIT(s_axis_tdata[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(s_axis_tdata[4:1]));
  FDRE \m_axis_tdata_reg[5] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[5]),
        .Q(m_axis_tdata[5]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[6] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[6]),
        .Q(m_axis_tdata[6]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[7] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[7]),
        .Q(m_axis_tdata[7]),
        .R(p_0_in));
  FDRE \m_axis_tdata_reg[8] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[8]),
        .Q(m_axis_tdata[8]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \m_axis_tdata_reg[8]_i_1 
       (.CI(\m_axis_tdata_reg[4]_i_1_n_0 ),
        .CO({\m_axis_tdata_reg[8]_i_1_n_0 ,\m_axis_tdata_reg[8]_i_1_n_1 ,\m_axis_tdata_reg[8]_i_1_n_2 ,\m_axis_tdata_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(s_axis_tdata[8:5]));
  FDRE \m_axis_tdata_reg[9] 
       (.C(aclk),
        .CE(m_axis_tdata0),
        .D(p_1_in[9]),
        .Q(m_axis_tdata[9]),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'hFB2A082A00000000)) 
    m_axis_tlast_i_1
       (.I0(m_axis_tlast),
        .I1(m_axis_tvalid_reg_0),
        .I2(m_axis_tready),
        .I3(s_axis_tvalid),
        .I4(s_axis_tlast),
        .I5(aresetn),
        .O(m_axis_tlast_i_1_n_0));
  FDRE m_axis_tlast_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_axis_tlast_i_1_n_0),
        .Q(m_axis_tlast),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF200)) 
    m_axis_tvalid_i_1
       (.I0(m_axis_tvalid_reg_0),
        .I1(m_axis_tready),
        .I2(s_axis_tvalid),
        .I3(aresetn),
        .O(m_axis_tvalid_i_1_n_0));
  FDRE m_axis_tvalid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_axis_tvalid_i_1_n_0),
        .Q(m_axis_tvalid_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    s_axis_tready_INST_0
       (.I0(m_axis_tready),
        .I1(m_axis_tvalid_reg_0),
        .O(s_axis_tready));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
