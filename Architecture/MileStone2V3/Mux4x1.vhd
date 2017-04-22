----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:25 04/03/2017 
-- Design Name: 
-- Module Name:    Mux_4x1 - Behavioral 
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

entity Mux4x1 is
    Port ( Input0 : in  STD_LOGIC;
           Input1 : in  STD_LOGIC;
           Input2 : in  STD_LOGIC;
           Input3 : in  STD_LOGIC;
           Selector1 : in  STD_LOGIC;
           Selector2 : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end Mux4x1;

architecture Behavioral of Mux4x1 is
signal Selector :STD_LOGIC_Vector(1 downto 0);
begin
Selector <= Selector2&Selector1;

Output <= Input0 when Selector = "00" else
			 Input1 when Selector = "01" else
			 Input2 when Selector = "10" else
			 Input3 when Selector = "11" else
			 'Z';

end Behavioral;

