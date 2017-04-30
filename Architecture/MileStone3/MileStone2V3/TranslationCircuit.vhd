----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:38 04/19/2017 
-- Design Name: 
-- Module Name:    TranslationCircuit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TranslationCircuit is
    Port ( FunctionCode : in  STD_LOGIC_VECTOR (5 downto 0);
           OpCode : out  STD_LOGIC_VECTOR (3 downto 0));
end TranslationCircuit;

architecture Behavioral of TranslationCircuit is

begin
OpCode <= "0000" when FunctionCode = "100100" else
			 "0001" when FunctionCode = "100101" else
			 "0010" when FunctionCode = "100000" else
			 "0110" when FunctionCode = "100010" else
			 "0111" when FunctionCode = "101010" else
			 "1100" when FunctionCode = "100111" else
			 "ZZZZ";
end Behavioral;

