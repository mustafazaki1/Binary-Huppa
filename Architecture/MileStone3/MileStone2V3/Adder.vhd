----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:26 04/03/2017 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( CarryIn : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CarryOut : out  STD_LOGIC;
           Output : out  STD_LOGIC);
end Adder;

architecture Behavioral of Adder is
signal Tmp:STD_LOGIC_VECTOR(1 downto 0);
begin
Tmp<= ('0'&A) + ('0'&B)+('0'&CarryIn);
CarryOut<=Tmp(1);
Output<= Tmp(0);

end Behavioral;

