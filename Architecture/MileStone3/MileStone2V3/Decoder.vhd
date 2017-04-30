----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:15:36 04/06/2017 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
PORT (
Enable: IN STD_LOGIC;
Selector: IN STD_LOGIC_VECTOR(4 downto 0);
Output: OUT STD_LOGIC_VECTOR(31 downto 0)
);
end Decoder;

architecture Behavioral of Decoder is

begin

Output <="00000000000000000000000000000001" when Selector="00000" else
			"00000000000000000000000000000010" when Selector="00001" else
			"00000000000000000000000000000100" when Selector="00010" else
			"00000000000000000000000000001000" when Selector="00011" else
			"00000000000000000000000000010000" when Selector="00100" else
			"00000000000000000000000000100000" when Selector="00101" else
			"00000000000000000000000001000000" when Selector="00110" else
			"00000000000000000000000010000000" when Selector="00111" else
			"00000000000000000000000100000000" when Selector="01000" else
			"00000000000000000000001000000000" when Selector="01001" else
			"00000000000000000000010000000000" when Selector="01010" else
			"00000000000000000000100000000000" when Selector="01011" else
			"00000000000000000001000000000000" when Selector="01100" else
			"00000000000000000010000000000000" when Selector="01101" else
			"00000000000000000100000000000000" when Selector="01110" else
			"00000000000000001000000000000000" when Selector="01111" else
			"00000000000000010000000000000000" when Selector="10000" else
			"00000000000000100000000000000000" when Selector="10001" else
			"00000000000001000000000000000000" when Selector="10010" else
			"00000000000010000000000000000000" when Selector="10011" else
			"00000000000100000000000000000000" when Selector="10100" else
			"00000000001000000000000000000000" when Selector="10101" else
			"00000000010000000000000000000000" when Selector="10110" else
			"00000000100000000000000000000000" when Selector="10111" else
			"00000001000000000000000000000000" when Selector="11000" else
			"00000010000000000000000000000000" when Selector="11001" else
			"00000100000000000000000000000000" when Selector="11010" else
			"00001000000000000000000000000000" when Selector="11011" else
			"00010000000000000000000000000000" when Selector="11100" else
			"00100000000000000000000000000000" when Selector="11101" else
			"01000000000000000000000000000000" when Selector="11110" else
			"10000000000000000000000000000000" when Selector="11111" else
			"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end Behavioral;

