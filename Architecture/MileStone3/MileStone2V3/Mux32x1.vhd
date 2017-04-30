----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:13:09 04/07/2017 
-- Design Name: 
-- Module Name:    Mux32x1 - Behavioral 
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

entity Mux32x1 is
    Port ( Register0 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register4 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register5 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register6 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register7 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register8 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register9 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register10 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register11 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register12 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register13 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register14 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register15 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register16 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register17 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register18 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register19 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register20 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register21 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register22 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register23 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register24 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register25 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register26 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register27 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register28 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register29 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux32x1;

architecture Behavioral of Mux32x1 is

begin
Output <=Register0 when Selector = "00000"else
			Register1 when Selector = "00001"else
			Register2 when Selector = "00010"else
			Register3 when Selector = "00011"else
			Register4 when Selector = "00100"else
			Register5 when Selector = "00101"else
			Register6 when Selector = "00110"else
			Register7 when Selector = "00111"else
			Register8 when Selector = "01000"else
			Register9 when Selector = "01001"else
			Register10 when Selector = "01010"else
			Register11 when Selector = "01011"else
			Register12 when Selector = "01100"else
			Register13 when Selector = "01101"else
			Register14 when Selector = "01110"else
			Register15 when Selector = "01111"else
			Register16 when Selector = "10000"else
			Register17 when Selector = "10001"else
			Register18 when Selector = "10010"else
			Register19 when Selector = "10011"else
			Register20 when Selector = "10100"else
			Register21 when Selector = "10101"else
			Register22 when Selector = "10110"else
			Register23 when Selector = "10111"else
			Register24 when Selector = "11000"else
			Register25 when Selector = "11001"else
			Register26 when Selector = "11010"else
			Register27 when Selector = "11011"else
			Register28 when Selector = "11100"else
			Register29 when Selector = "11101"else
			Register30 when Selector = "11110"else
			Register31 when Selector = "11111";
end Behavioral;

