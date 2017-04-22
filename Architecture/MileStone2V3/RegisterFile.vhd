----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:17 04/07/2017 
-- Design Name: 
-- Module Name:    reg32_0isterFile - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.reg32_0Package.all;
use work.reg32_1Package.all;
use work.DecoderPackage.all;
use work.Mux32x1Package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
signal WriteSelector : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp0 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp1 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp2 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp3 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp4 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp5 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp6 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp7 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp8 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp9 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp10 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp11 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp12 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp13 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp14 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp15 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp16 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp17 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp18 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp19 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp20 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp21 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp22 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp23 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp24 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp25 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp26 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp27 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp28 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp29 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp30 : STD_LOGIC_VECTOR (31 downto 0);
signal Tmp31 : STD_LOGIC_VECTOR (31 downto 0);
begin

WriteDecoder: Decoder PORT MAP('1',write_sel,WriteSelector);

R0: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(0), '0','0',Tmp0);
R1: reg32_1 PORT MAP (write_data,clk,write_ena AND WriteSelector(1), '0','0',Tmp1);
R2: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(2), '0','0',Tmp2);
R3: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(3), '0','0',Tmp3);
R4: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(4), '0','0',Tmp4);
R5: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(5), '0','0',Tmp5);
R6: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(6), '0','0',Tmp6);
R7: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(7), '0','0',Tmp7);
R8: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(8), '0','0',Tmp8);
R9: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(9), '0','0',Tmp9);
R10: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(10), '0','0',Tmp10);
R11: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(11), '0','0',Tmp11);
R12: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(12), '0','0',Tmp12);
R13: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(13), '0','0',Tmp13);
R14: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(14), '0','0',Tmp14);
R15: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(15), '0','0',Tmp15);
R16: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(16), '0','0',Tmp16);
R17: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(17), '0','0',Tmp17);
R18: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(18), '0','0',Tmp18);
R19: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(19), '0','0',Tmp19);
R20: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(20), '0','0',Tmp20);
R21: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(21), '0','0',Tmp21);
R22: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(22), '0','0',Tmp22);
R23: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(23), '0','0',Tmp23);
R24: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(24), '0','0',Tmp24);
R25: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(25), '0','0',Tmp25);
R26: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(26), '0','0',Tmp26);
R27: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(27), '0','0',Tmp27);
R28: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(28), '0','0',Tmp28);
R29: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(29), '0','0',Tmp29);
R30: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(30), '0','0',Tmp30);
R31: reg32_0 PORT MAP (write_data,clk,write_ena AND WriteSelector(31), '0','0',Tmp31);

ReadMux1 : Mux32x1 PORT MAP(Tmp0,Tmp1,Tmp2,Tmp3,Tmp4,Tmp5,Tmp6,Tmp7,Tmp8,Tmp9,Tmp10,Tmp11,Tmp12,Tmp13,Tmp14,Tmp15,Tmp16,Tmp17,Tmp18,Tmp19,Tmp20,Tmp21,Tmp22,Tmp23,Tmp24,Tmp25,Tmp26,Tmp27,Tmp28,Tmp29,Tmp30,Tmp31,read_sel1,data1);
ReadMux2 : Mux32x1 PORT MAP(Tmp0,Tmp1,Tmp2,Tmp3,Tmp4,Tmp5,Tmp6,Tmp7,Tmp8,Tmp9,Tmp10,Tmp11,Tmp12,Tmp13,Tmp14,Tmp15,Tmp16,Tmp17,Tmp18,Tmp19,Tmp20,Tmp21,Tmp22,Tmp23,Tmp24,Tmp25,Tmp26,Tmp27,Tmp28,Tmp29,Tmp30,Tmp31,read_sel2,data2);

end Behavioral;

