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
use work.ALUControlPackage.all;
use work.ControlUnitPackage.all;
use work.SignExtendPackage.all;
use work.Mux2x1Package.all;
use work.Adder32BitPackage.all;
use work.DATAMEMORYPackage.all;

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
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  PCOut: OUT STD_LOGIC_VECTOR(31 downto 0);
			  DataMemOut: OUT STD_LOGIC_VECTOR(31 downto 0));
end MainModule;

architecture Behavioral of MainModule is
signal TmpPC:STD_LOGIC_VECTOR(31 downto 0);
signal Address: STD_LOGIC_VECTOR(31 downto 0);
signal Data: STD_LOGIC_VECTOR(31 downto 0);
signal AlUOutput: STD_LOGIC_VECTOR(31 downto 0);
signal TmpRegFileOut1: STD_LOGIC_VECTOR(31 downto 0);
signal TmpRegFileOut2: STD_LOGIC_VECTOR(31 downto 0);
signal OpCode: STD_LOGIC_VECTOR(3 downto 0);
signal cflag : STD_LOGIC;
signal zflag : STD_LOGIC;
signal oflag : STD_LOGIC;
signal RegDst : STD_LOGIC;
signal ALUSrc : STD_LOGIC;
signal MemtoReg : STD_LOGIC;
signal RegWrite : STD_LOGIC;
signal MemRead : STD_LOGIC;
signal MemWrite : STD_LOGIC;
signal Branch : STD_LOGIC;
signal Jump : STD_LOGIC;
signal BranchNE : STD_LOGIC;
signal ALUOp1 : STD_LOGIC;
signal ALUOp0 : STD_LOGIC;
signal WriteRegister : STD_LOGIC_VECTOR (4 downto 0);
signal ExtendedAddress : STD_LOGIC_VECTOR (31 downto 0);
signal Operation : STD_LOGIC_VECTOR (3 downto 0);
signal ALUSource2 : STD_LOGIC_VECTOR (31 downto 0);
signal ReadData : STD_LOGIC_VECTOR (31 downto 0);
signal WriteData : STD_LOGIC_VECTOR (31 downto 0);
signal NextPC : STD_LOGIC_VECTOR (31 downto 0);
signal PCCOut : STD_LOGIC;
signal JumpAddress : STD_LOGIC_VECTOR(31 downto 0);
signal NewPCAddress : STD_LOGIC_VECTOR (31 downto 0);
signal PCCOut2 : STD_LOGIC;
signal PreNextPCAddress : STD_LOGIC_VECTOR (31 downto 0);
signal NextPCAddress : STD_LOGIC_VECTOR (31 downto 0);

begin
PC: reg32_0 PORT MAP (NextPCAddress,CLK,not START,START,'0', TmpPC);
IM: INSTRMEMORY PORT MAP (not START,Data,TmpPC,CLK);
CU: ControlUnit PORT MAP (Data (31 downto 26),RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,BranchNE,ALUOp1,ALUOp0);
WriteRegisterSelector: Mux2x1 GENERIC MAP (4) PORT MAP (Data(20 downto 16),Data(15 downto 11),RegDst,WriteRegister);
RF: RegisterFile PORT MAP (Data(25 downto 21),Data(20 downto 16),WriteRegister,RegWrite,CLK,WriteData,TmpRegFileOut1,TmpRegFileOut2);
SE: SignExtend PORT MAP (Data(15 downto 0),ExtendedAddress);
AC: ALUControl PORT MAP ((ALUOp1&AluOp0),Data(5 downto 0),Operation);
ALUInput2Selector: Mux2x1 GENERIC MAP (31) PORT MAP (TmpRegFileOut2,ExtendedAddress,ALUSrc,ALUSource2);
ALUInstance: ALU PORT MAP (TmpRegFileOut1,ALUSource2,Operation,Operation(2),AlUOutput,cflag,zflag,oflag);
DM: DataMemory PORT MAP(not START,TmpRegFileOut2,ReadData,MemRead,MemWrite,ALUOutput,CLK);
ALUResultSelector: Mux2x1 GENERIC MAP (31) PORT MAP (ALUOutput,ReadData,MemtoReg,WriteData);
PCAdder: Adder32Bit PORT MAP ('0',TmpPC,"00000000000000000000000000000100",NextPC,PCCOut);
JumpAddress <= NextPC(31 downto 28)&Data(25 downto 0) & "00";
PCChoice: Adder32Bit PORT MAP ('0',NextPC,(ExtendedAddress(29 downto 0)&"00"),NewPCAddress,PCCOut2);
PCAddressSelector: Mux2x1 GENERIC MAP (31) PORT MAP (NextPC,NewPCAddress,((zflag AND Branch) OR (Not zflag AND BranchNE)),PreNextPCAddress);
PCNextAddressSelector: Mux2x1 GENERIC MAP (31) PORT MAP(PreNextPCAddress,JumpAddress,Jump,NextPCAddress);
RegFileOut1 <= TmpRegFileOut1;
RegFileOut2 <= TmpRegFileOut2;
ALUOut <=ALUOutput;
PCOut <= TmpPC;
DataMemOut <= ReadData;
end Behavioral;


