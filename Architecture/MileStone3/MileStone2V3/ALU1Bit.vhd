----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:20 04/03/2017 
-- Design Name: 
-- Module Name:    ALU1Bit - Behavioral 
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
use IEEE.STD_LOGIC_Unsigned.ALL;
use work.Mux2x11BitPackage.ALL;
use work.Mux4x1Package.ALL;
use work.AdderPackage.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU1Bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CarryIn : in  STD_LOGIC;
           CarryOut : out  STD_LOGIC;
           Result : out  STD_LOGIC;
           OverFlow : out  STD_LOGIC;
           Mode : in  STD_LOGIC_VECTOR(3 downto 0);
			  Less : in STD_LOGIC;
			  Set : Out STD_LOGIC;
           Zero : out  STD_LOGIC);
end ALU1Bit;

architecture Behavioral of ALU1Bit is
signal TmpB : STD_LOGIC;
signal TmpA : STD_LOGIC;
signal ANDResult: STD_LOGIC;
signal ORResult: STD_LOGIC;
signal ArithmeticResult: STD_LOGIC;
signal Tmp:STD_LOGIC;
signal TmpCarryOut:STD_LOGIC;

begin
SubtractSelector: Mux2x11Bit PORT MAP (B,Not B, Mode(2),TmpB);
ANDSelector: Mux2x11Bit PORT MAP (A,Not A, Mode(3),TmpA);

AndResult <= TmpA and TmpB;
ORResult <= TmpA or TmpB;
ArithmericOperation: Adder PORT MAP(CarryIn,TmpA,TmpB,TmpCarryOut,ArithmeticResult);
Set <= ArithmeticResult;
OperationSelect: Mux4x1 PORT MAP (AndResult,ORResult,ArithmeticResult,Less,Mode(0),Mode(1),Tmp);
Zero <='1' when Tmp = '0' else '0';
OverFlow <= CarryIn Xor TmpCarryOut;
Result <= Tmp;
CarryOut <=TmpCarryOut;

end Behavioral;

