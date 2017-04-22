----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:18:52 04/19/2017 
-- Design Name: 
-- Module Name:    MainModule - Behavioral 
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
use work.INSTRMEMORYPackage.all;
use work.reg32_0Package.all;
use work.RegisterFilePackage.all;
use work.ALUPackage.all;
use work.TranslationCircuiPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MainModule is
    Port ( START : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RegFileOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegFileOut2 : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MainModule;

architecture Behavioral of MainModule is
signal Tmp:STD_LOGIC_VECTOR(5 downto 0);
signal Address: STD_LOGIC_VECTOR(31 downto 0);
signal Data: STD_LOGIC_VECTOR(31 downto 0);
signal AlUOutput: STD_LOGIC_VECTOR(31 downto 0);
signal TmpRegFileOut1: STD_LOGIC_VECTOR(31 downto 0);
signal TmpRegFileOut2: STD_LOGIC_VECTOR(31 downto 0);
signal OpCode: STD_LOGIC_VECTOR(3 downto 0);
signal cflag : STD_LOGIC;
signal zflag : STD_LOGIC;
signal oflag : STD_LOGIC;

begin
PC:reg32_0 GENERIC MAP (6) PORT MAP ("000000",CLK,'0',START,not START, Tmp);
Address <= "000000000000000000000000"&Tmp&"00";
IM: INSTRMEMORY PORT MAP (not START,Data,Address,CLK);
TC :TranslationCircuit PORT MAP( Data(5 downto 0),OpCode);
RF: RegisterFile PORT MAP(Data (25 downto 21),Data(20 downto 16),Data(15 downto 11), '1' , CLK,ALUOutput,TmpRegFileOut1,TmpRegFileOut2);
ALUInstance : ALU PORT MAP (TmpRegFileOut1,TmpRegFileOut2,OpCode,OpCode (2), ALUOutput,cflag,zflag,oflag);
RegFileOut1<=TmpRegFileOut1;
RegFileOut2<=TmpRegFileOut2;
ALUOut<=AlUOutput;
end Behavioral;

