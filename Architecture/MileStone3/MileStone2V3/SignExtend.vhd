----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:09 04/30/2017 
-- Design Name: 
-- Module Name:    SignExtend - Behavioral 
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

entity SignExtend is
    Port ( InAddress : in  STD_LOGIC_VECTOR (15 downto 0);
           OutAddress : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtend;

architecture Behavioral of SignExtend is

begin
OutAddress <=InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress(15)&InAddress;
end Behavioral;

