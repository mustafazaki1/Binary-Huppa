----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:39:44 04/03/2017 
-- Design Name: 
-- Module Name:    ALU32-data2it - data2ehavioral 
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
library work;
use work.ALU1bitPackage.ALL;
use work.Mux2x1Package.ALL;

-- Uncomment the following lidata2rary declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following lidata2rary declaration if instantiating
-- any Xilinx primitives in this code.
--lidata2rary UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           cflag : out  STD_LOGIC;
           zflag : out  STD_LOGIC;
           oflag : out  STD_LOGIC);
end ALU;

architecture behavioral of ALU is
signal TmpCarryOut :STD_LOGIC_VECTOR (31 downto 0);
signal TmpZero:STD_LOGIC_VECTOR (31 downto 0);
signal oflag2:STD_LOGIC;
signal TmpSet:STD_LOGIC_VECTOR (31 downto 0);

begin
TmpCarryOut(0)<= cin;
ALU1: ALU1Bit PORT MAP (data1(0),data2(0),TmpCarryOut(0),TmpCarryOut(1),dataout(0),oflag2,aluop,TmpSet(31),TmpSet(0),TmpZero(0));
ALU2: ALU1Bit PORT MAP (data1(1),data2(1),TmpCarryOut(1),TmpCarryOut(2),dataout(1),oflag2,aluop,'0',TmpSet(1),TmpZero(1));
ALU3: ALU1Bit PORT MAP (data1(2),data2(2),TmpCarryOut(2),TmpCarryOut(3),dataout(2),oflag2,aluop,'0',TmpSet(2),TmpZero(2));
ALU4: ALU1Bit PORT MAP (data1(3),data2(3),TmpCarryOut(3),TmpCarryOut(4),dataout(3),oflag2,aluop,'0',TmpSet(3),TmpZero(3));
ALU5: ALU1Bit PORT MAP (data1(4),data2(4),TmpCarryOut(4),TmpCarryOut(5),dataout(4),oflag2,aluop,'0',TmpSet(4),TmpZero(4));
ALU6: ALU1Bit PORT MAP (data1(5),data2(5),TmpCarryOut(5),TmpCarryOut(6),dataout(5),oflag2,aluop,'0',TmpSet(5),TmpZero(5));
ALU7: ALU1Bit PORT MAP (data1(6),data2(6),TmpCarryOut(6),TmpCarryOut(7),dataout(6),oflag2,aluop,'0',TmpSet(6),TmpZero(6));
ALU8: ALU1Bit PORT MAP (data1(7),data2(7),TmpCarryOut(7),TmpCarryOut(8),dataout(7),oflag2,aluop,'0',TmpSet(7),TmpZero(7));
ALU9: ALU1Bit PORT MAP (data1(8),data2(8),TmpCarryOut(8),TmpCarryOut(9),dataout(8),oflag2,aluop,'0',TmpSet(8),TmpZero(8));
ALU10: ALU1Bit PORT MAP (data1(9),data2(9),TmpCarryOut(9),TmpCarryOut(10),dataout(9),oflag2,aluop,'0',TmpSet(9),TmpZero(9));
ALU11: ALU1Bit PORT MAP (data1(10),data2(10),TmpCarryOut(10),TmpCarryOut(11),dataout(10),oflag2,aluop,'0',TmpSet(10),TmpZero(10));
ALU12: ALU1Bit PORT MAP (data1(11),data2(11),TmpCarryOut(11),TmpCarryOut(12),dataout(11),oflag2,aluop,'0',TmpSet(11),TmpZero(11));
ALU13: ALU1Bit PORT MAP (data1(12),data2(12),TmpCarryOut(12),TmpCarryOut(13),dataout(12),oflag2,aluop,'0',TmpSet(12),TmpZero(12));
ALU14: ALU1Bit PORT MAP (data1(13),data2(13),TmpCarryOut(13),TmpCarryOut(14),dataout(13),oflag2,aluop,'0',TmpSet(13),TmpZero(13));
ALU15: ALU1Bit PORT MAP (data1(14),data2(14),TmpCarryOut(14),TmpCarryOut(15),dataout(14),oflag2,aluop,'0',TmpSet(14),TmpZero(14));
ALU16: ALU1Bit PORT MAP (data1(15),data2(15),TmpCarryOut(15),TmpCarryOut(16),dataout(15),oflag2,aluop,'0',TmpSet(15),TmpZero(15));
ALU17: ALU1Bit PORT MAP (data1(16),data2(16),TmpCarryOut(16),TmpCarryOut(17),dataout(16),oflag2,aluop,'0',TmpSet(16),TmpZero(16));
ALU18: ALU1Bit PORT MAP (data1(17),data2(17),TmpCarryOut(17),TmpCarryOut(18),dataout(17),oflag2,aluop,'0',TmpSet(17),TmpZero(17));
ALU19: ALU1Bit PORT MAP (data1(18),data2(18),TmpCarryOut(18),TmpCarryOut(19),dataout(18),oflag2,aluop,'0',TmpSet(18),TmpZero(18));
ALU20: ALU1Bit PORT MAP (data1(19),data2(19),TmpCarryOut(19),TmpCarryOut(20),dataout(19),oflag2,aluop,'0',TmpSet(19),TmpZero(19));
ALU21: ALU1Bit PORT MAP (data1(20),data2(20),TmpCarryOut(20),TmpCarryOut(21),dataout(20),oflag2,aluop,'0',TmpSet(20),TmpZero(20));
ALU22: ALU1Bit PORT MAP (data1(21),data2(21),TmpCarryOut(21),TmpCarryOut(22),dataout(21),oflag2,aluop,'0',TmpSet(21),TmpZero(21));
ALU23: ALU1Bit PORT MAP (data1(22),data2(22),TmpCarryOut(22),TmpCarryOut(23),dataout(22),oflag2,aluop,'0',TmpSet(22),TmpZero(22));
ALU24: ALU1Bit PORT MAP (data1(23),data2(23),TmpCarryOut(23),TmpCarryOut(24),dataout(23),oflag2,aluop,'0',TmpSet(23),TmpZero(23));
ALU25: ALU1Bit PORT MAP (data1(24),data2(24),TmpCarryOut(24),TmpCarryOut(25),dataout(24),oflag2,aluop,'0',TmpSet(24),TmpZero(24));
ALU26: ALU1Bit PORT MAP (data1(25),data2(25),TmpCarryOut(25),TmpCarryOut(26),dataout(25),oflag2,aluop,'0',TmpSet(25),TmpZero(25));
ALU27: ALU1Bit PORT MAP (data1(26),data2(26),TmpCarryOut(26),TmpCarryOut(27),dataout(26),oflag2,aluop,'0',TmpSet(26),TmpZero(26));
ALU28: ALU1Bit PORT MAP (data1(27),data2(27),TmpCarryOut(27),TmpCarryOut(28),dataout(27),oflag2,aluop,'0',TmpSet(27),TmpZero(27));
ALU29: ALU1Bit PORT MAP (data1(28),data2(28),TmpCarryOut(28),TmpCarryOut(29),dataout(28),oflag2,aluop,'0',TmpSet(28),TmpZero(28));
ALU30: ALU1Bit PORT MAP (data1(29),data2(29),TmpCarryOut(29),TmpCarryOut(30),dataout(29),oflag2,aluop,'0',TmpSet(29),TmpZero(29));
ALU31: ALU1Bit PORT MAP (data1(30),data2(30),TmpCarryOut(30),TmpCarryOut(31),dataout(30),oflag2,aluop,'0',TmpSet(30),TmpZero(30));
ALU32: ALU1Bit PORT MAP (data1(31),data2(31),TmpCarryOut(31),cflag,dataout(31),oflag,aluop,'0',TmpSet(31),TmpZero(31));


zflag <= '1' when TmpZero ="11111111111111111111111111111111" else '0';

end behavioral;

