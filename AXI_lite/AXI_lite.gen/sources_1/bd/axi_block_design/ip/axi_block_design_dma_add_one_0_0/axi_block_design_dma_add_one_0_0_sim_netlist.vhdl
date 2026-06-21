-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Sat Jun 20 14:33:32 2026
-- Host        : ivanyuchen-Predator-PHN16-71 running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/ivanyuchen/CODING_FILES/VERILOG/AXI_lite/AXI_lite.gen/sources_1/bd/axi_block_design/ip/axi_block_design_dma_add_one_0_0/axi_block_design_dma_add_one_0_0_sim_netlist.vhdl
-- Design      : axi_block_design_dma_add_one_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_block_design_dma_add_one_0_0_dma_add_one is
  port (
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tvalid_reg_0 : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_block_design_dma_add_one_0_0_dma_add_one : entity is "dma_add_one";
end axi_block_design_dma_add_one_0_0_dma_add_one;

architecture STRUCTURE of axi_block_design_dma_add_one_0_0_dma_add_one is
  signal m_axis_tdata0 : STD_LOGIC;
  signal \m_axis_tdata_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \m_axis_tdata_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \m_axis_tdata_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \m_axis_tdata_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \m_axis_tdata_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \m_axis_tdata_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \m_axis_tdata_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \m_axis_tdata_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \m_axis_tdata_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \m_axis_tdata_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \m_axis_tdata_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \m_axis_tdata_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \m_axis_tdata_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \m_axis_tdata_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \m_axis_tdata_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \m_axis_tdata_reg[31]_i_3_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[31]_i_3_n_3\ : STD_LOGIC;
  signal \m_axis_tdata_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \m_axis_tdata_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \m_axis_tdata_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \m_axis_tdata_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \m_axis_tdata_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \m_axis_tdata_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \m_axis_tdata_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \^m_axis_tlast\ : STD_LOGIC;
  signal m_axis_tlast_i_1_n_0 : STD_LOGIC;
  signal m_axis_tvalid_i_1_n_0 : STD_LOGIC;
  signal \^m_axis_tvalid_reg_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_m_axis_tdata_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_m_axis_tdata_reg[31]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[28]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[31]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \m_axis_tdata_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of m_axis_tvalid_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of s_axis_tready_INST_0 : label is "soft_lutpair0";
begin
  m_axis_tlast <= \^m_axis_tlast\;
  m_axis_tvalid_reg_0 <= \^m_axis_tvalid_reg_0\;
\m_axis_tdata[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axis_tdata(0),
      O => p_1_in(0)
    );
\m_axis_tdata[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => p_0_in
    );
\m_axis_tdata[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => s_axis_tvalid,
      I1 => \^m_axis_tvalid_reg_0\,
      I2 => m_axis_tready,
      O => m_axis_tdata0
    );
\m_axis_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(0),
      Q => m_axis_tdata(0),
      R => p_0_in
    );
\m_axis_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(10),
      Q => m_axis_tdata(10),
      R => p_0_in
    );
\m_axis_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(11),
      Q => m_axis_tdata(11),
      R => p_0_in
    );
\m_axis_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(12),
      Q => m_axis_tdata(12),
      R => p_0_in
    );
\m_axis_tdata_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_axis_tdata_reg[8]_i_1_n_0\,
      CO(3) => \m_axis_tdata_reg[12]_i_1_n_0\,
      CO(2) => \m_axis_tdata_reg[12]_i_1_n_1\,
      CO(1) => \m_axis_tdata_reg[12]_i_1_n_2\,
      CO(0) => \m_axis_tdata_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(12 downto 9),
      S(3 downto 0) => s_axis_tdata(12 downto 9)
    );
\m_axis_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(13),
      Q => m_axis_tdata(13),
      R => p_0_in
    );
\m_axis_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(14),
      Q => m_axis_tdata(14),
      R => p_0_in
    );
\m_axis_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(15),
      Q => m_axis_tdata(15),
      R => p_0_in
    );
\m_axis_tdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(16),
      Q => m_axis_tdata(16),
      R => p_0_in
    );
\m_axis_tdata_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_axis_tdata_reg[12]_i_1_n_0\,
      CO(3) => \m_axis_tdata_reg[16]_i_1_n_0\,
      CO(2) => \m_axis_tdata_reg[16]_i_1_n_1\,
      CO(1) => \m_axis_tdata_reg[16]_i_1_n_2\,
      CO(0) => \m_axis_tdata_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(16 downto 13),
      S(3 downto 0) => s_axis_tdata(16 downto 13)
    );
\m_axis_tdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(17),
      Q => m_axis_tdata(17),
      R => p_0_in
    );
\m_axis_tdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(18),
      Q => m_axis_tdata(18),
      R => p_0_in
    );
\m_axis_tdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(19),
      Q => m_axis_tdata(19),
      R => p_0_in
    );
\m_axis_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(1),
      Q => m_axis_tdata(1),
      R => p_0_in
    );
\m_axis_tdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(20),
      Q => m_axis_tdata(20),
      R => p_0_in
    );
\m_axis_tdata_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_axis_tdata_reg[16]_i_1_n_0\,
      CO(3) => \m_axis_tdata_reg[20]_i_1_n_0\,
      CO(2) => \m_axis_tdata_reg[20]_i_1_n_1\,
      CO(1) => \m_axis_tdata_reg[20]_i_1_n_2\,
      CO(0) => \m_axis_tdata_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(20 downto 17),
      S(3 downto 0) => s_axis_tdata(20 downto 17)
    );
\m_axis_tdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(21),
      Q => m_axis_tdata(21),
      R => p_0_in
    );
\m_axis_tdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(22),
      Q => m_axis_tdata(22),
      R => p_0_in
    );
\m_axis_tdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(23),
      Q => m_axis_tdata(23),
      R => p_0_in
    );
\m_axis_tdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(24),
      Q => m_axis_tdata(24),
      R => p_0_in
    );
\m_axis_tdata_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_axis_tdata_reg[20]_i_1_n_0\,
      CO(3) => \m_axis_tdata_reg[24]_i_1_n_0\,
      CO(2) => \m_axis_tdata_reg[24]_i_1_n_1\,
      CO(1) => \m_axis_tdata_reg[24]_i_1_n_2\,
      CO(0) => \m_axis_tdata_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(24 downto 21),
      S(3 downto 0) => s_axis_tdata(24 downto 21)
    );
\m_axis_tdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(25),
      Q => m_axis_tdata(25),
      R => p_0_in
    );
\m_axis_tdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(26),
      Q => m_axis_tdata(26),
      R => p_0_in
    );
\m_axis_tdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(27),
      Q => m_axis_tdata(27),
      R => p_0_in
    );
\m_axis_tdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(28),
      Q => m_axis_tdata(28),
      R => p_0_in
    );
\m_axis_tdata_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_axis_tdata_reg[24]_i_1_n_0\,
      CO(3) => \m_axis_tdata_reg[28]_i_1_n_0\,
      CO(2) => \m_axis_tdata_reg[28]_i_1_n_1\,
      CO(1) => \m_axis_tdata_reg[28]_i_1_n_2\,
      CO(0) => \m_axis_tdata_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(28 downto 25),
      S(3 downto 0) => s_axis_tdata(28 downto 25)
    );
\m_axis_tdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(29),
      Q => m_axis_tdata(29),
      R => p_0_in
    );
\m_axis_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(2),
      Q => m_axis_tdata(2),
      R => p_0_in
    );
\m_axis_tdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(30),
      Q => m_axis_tdata(30),
      R => p_0_in
    );
\m_axis_tdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(31),
      Q => m_axis_tdata(31),
      R => p_0_in
    );
\m_axis_tdata_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_axis_tdata_reg[28]_i_1_n_0\,
      CO(3 downto 2) => \NLW_m_axis_tdata_reg[31]_i_3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \m_axis_tdata_reg[31]_i_3_n_2\,
      CO(0) => \m_axis_tdata_reg[31]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_m_axis_tdata_reg[31]_i_3_O_UNCONNECTED\(3),
      O(2 downto 0) => p_1_in(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => s_axis_tdata(31 downto 29)
    );
\m_axis_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(3),
      Q => m_axis_tdata(3),
      R => p_0_in
    );
\m_axis_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(4),
      Q => m_axis_tdata(4),
      R => p_0_in
    );
\m_axis_tdata_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \m_axis_tdata_reg[4]_i_1_n_0\,
      CO(2) => \m_axis_tdata_reg[4]_i_1_n_1\,
      CO(1) => \m_axis_tdata_reg[4]_i_1_n_2\,
      CO(0) => \m_axis_tdata_reg[4]_i_1_n_3\,
      CYINIT => s_axis_tdata(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(4 downto 1),
      S(3 downto 0) => s_axis_tdata(4 downto 1)
    );
\m_axis_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(5),
      Q => m_axis_tdata(5),
      R => p_0_in
    );
\m_axis_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(6),
      Q => m_axis_tdata(6),
      R => p_0_in
    );
\m_axis_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(7),
      Q => m_axis_tdata(7),
      R => p_0_in
    );
\m_axis_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(8),
      Q => m_axis_tdata(8),
      R => p_0_in
    );
\m_axis_tdata_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_axis_tdata_reg[4]_i_1_n_0\,
      CO(3) => \m_axis_tdata_reg[8]_i_1_n_0\,
      CO(2) => \m_axis_tdata_reg[8]_i_1_n_1\,
      CO(1) => \m_axis_tdata_reg[8]_i_1_n_2\,
      CO(0) => \m_axis_tdata_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(8 downto 5),
      S(3 downto 0) => s_axis_tdata(8 downto 5)
    );
\m_axis_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => m_axis_tdata0,
      D => p_1_in(9),
      Q => m_axis_tdata(9),
      R => p_0_in
    );
m_axis_tlast_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FB2A082A00000000"
    )
        port map (
      I0 => \^m_axis_tlast\,
      I1 => \^m_axis_tvalid_reg_0\,
      I2 => m_axis_tready,
      I3 => s_axis_tvalid,
      I4 => s_axis_tlast,
      I5 => aresetn,
      O => m_axis_tlast_i_1_n_0
    );
m_axis_tlast_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => m_axis_tlast_i_1_n_0,
      Q => \^m_axis_tlast\,
      R => '0'
    );
m_axis_tvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => \^m_axis_tvalid_reg_0\,
      I1 => m_axis_tready,
      I2 => s_axis_tvalid,
      I3 => aresetn,
      O => m_axis_tvalid_i_1_n_0
    );
m_axis_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => m_axis_tvalid_i_1_n_0,
      Q => \^m_axis_tvalid_reg_0\,
      R => '0'
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m_axis_tready,
      I1 => \^m_axis_tvalid_reg_0\,
      O => s_axis_tready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_block_design_dma_add_one_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axi_block_design_dma_add_one_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axi_block_design_dma_add_one_0_0 : entity is "axi_block_design_dma_add_one_0_0,dma_add_one,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_block_design_dma_add_one_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of axi_block_design_dma_add_one_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axi_block_design_dma_add_one_0_0 : entity is "dma_add_one,Vivado 2025.2";
end axi_block_design_dma_add_one_0_0;

architecture STRUCTURE of axi_block_design_dma_add_one_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN axi_block_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 m_axis TLAST";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_MODE of m_axis_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_tdata : signal is "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN axi_block_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute X_INTERFACE_MODE of s_axis_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_tdata : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN axi_block_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
inst: entity work.axi_block_design_dma_add_one_0_0_dma_add_one
     port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tdata(31 downto 0) => m_axis_tdata(31 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid_reg_0 => m_axis_tvalid,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
