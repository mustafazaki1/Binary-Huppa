----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:04 04/03/2017 
-- Design Name: 
-- Module Name:    mux_module - Behavioral 
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

entity Mux2x1 is
GENERIC(n:NATURAL);
    Port ( input0 : in  STD_LOGIC_VECTOR(n downto 0);
           input1 : in  STD_LOGIC_VECTOR(n downto 0);
           selector : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR(n downto 0));
end Mux2x1;

architecture Behavioral of Mux2x1 is

begin

output <= input0 when selector='0' else
input1 when selector='1';
end Behavioral;

