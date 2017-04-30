----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:13 04/30/2017 
-- Design Name: 
-- Module Name:    Mux2x15Bits - Behavioral 
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

entity Mux2x15Bits is
    Port ( Input0 : in  STD_LOGIC_VECTOR (4 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Selector : in  STD_LOGIC;
           Output : in  STD_LOGIC_VECTOR (4 downto 0));
end Mux2x15Bits;

architecture Behavioral of Mux2x15Bits is

begin
Output <= Input0 when Selector='0' else Input1;

end Behavioral;

