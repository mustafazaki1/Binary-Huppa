----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:06 04/30/2017 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
    Port ( OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
			  MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
			  Jump : out  STD_LOGIC;
			  BranchNE : out STD_LOGIC;
           ALUOp1 : out  STD_LOGIC;
           ALUOp0 : out  STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is
signal RFormat : STD_LOGIC;
signal lw : STD_LOGIC;
signal sw : STD_LOGIC;
signal beq : STD_LOGIC;
signal bne : STD_LOGIC;
signal jmp : STD_LOGIC;

begin
RFormat <= not OpCode(5) and not OpCode(4) and not OpCode(3) and not OpCode(2) and not OpCode(1) and not OpCode(0);
lw <= OpCode(5) and not OpCode(4) and not OpCode(3) and not OpCode(2) and OpCode(1) and OpCode(0);
sw <= OpCode(5) and not OpCode(4) and OpCode(3) and not OpCode(2) and OpCode(1) and OpCode(0);
beq <= not OpCode(5) and not OpCode(4) and not OpCode(3) and OpCode(2) and not OpCode(1) and not OpCode(0);
bne <= not OpCode(5) and not OpCode(4) and not OpCode(3) and OpCode(2) and not OpCode(1) and OpCode(0);
jmp <= not OpCode(5) and not OpCode(4) and not OpCode(3) and not OpCode(2) and OpCode(1) and not OpCode(0);

RegDst <= RFormat;
ALUSrc <= lw OR sw;
MemtoReg <= lw;
RegWrite <= lw OR RFormat;
MemRead <= lw;
MemWrite <= sw;
Branch <= beq;
Jump <= jmp;
BranchNE <= bne;
ALUOp1 <= RFormat;
ALUOp0 <= beq OR bne;

end Behavioral;

