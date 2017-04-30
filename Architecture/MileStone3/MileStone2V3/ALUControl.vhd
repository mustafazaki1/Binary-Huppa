----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:10 04/30/2017 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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

entity ALUControl is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Func : in  STD_LOGIC_VECTOR (5 downto 0);
           Operation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is
signal Temp1: STD_LOGIC;
signal Temp2: STD_LOGIC;
signal Temp3: STD_LOGIC;
signal Temp4: STD_LOGIC;
signal Temp5: STD_LOGIC;

begin
Temp1 <= Func(0) OR Func(3);
Temp2 <= ALUOp(1) AND Temp1;
Temp3 <= ALUOp(1) AND Func(1);
Temp4 <= Func(0) AND Func(1);
Temp5 <= ALUOp(1) AND Temp4;
Operation(2) <= ALUOp(0) OR Temp3;
Operation(1) <= NOT ALUOp(1) OR NOT Func(2);
Operation(0) <= NOT Temp5 AND Temp2;
Operation(3) <= Temp5;
end Behavioral;

