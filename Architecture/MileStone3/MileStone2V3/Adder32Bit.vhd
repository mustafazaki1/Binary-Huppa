----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:57 04/30/2017 
-- Design Name: 
-- Module Name:    Adder32Bit - Behavioral 
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
use work.AdderPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder32Bit is
    Port ( CarryIn : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           CarryOut : out  STD_LOGIC);
end Adder32Bit;

architecture Behavioral of Adder32Bit is
signal COut : STD_LOGIC_VECTOR (31 downto 0);
begin
A0: Adder PORT MAP (CarryIn,A(0),B(0),COut(0),Result(0));
A1: Adder PORT MAP (COut(0),A(1),B(1),COut(1),Result(1));
A2: Adder PORT MAP (COut(1),A(2),B(2),COut(2),Result(2));
A3: Adder PORT MAP (COut(2),A(3),B(3),COut(3),Result(3));
A4: Adder PORT MAP (COut(3),A(4),B(4),COut(4),Result(4));
A5: Adder PORT MAP (COut(4),A(5),B(5),COut(5),Result(5));
A6: Adder PORT MAP (COut(5),A(6),B(6),COut(6),Result(6));
A7: Adder PORT MAP (COut(6),A(7),B(7),COut(7),Result(7));
A8: Adder PORT MAP (COut(7),A(8),B(8),COut(8),Result(8));
A9: Adder PORT MAP (COut(8),A(9),B(9),COut(9),Result(9));
A10: Adder PORT MAP (COut(9),A(10),B(10),COut(10),Result(10));
A11: Adder PORT MAP (COut(10),A(11),B(11),COut(11),Result(11));
A12: Adder PORT MAP (COut(11),A(12),B(12),COut(12),Result(12));
A13: Adder PORT MAP (COut(12),A(13),B(13),COut(13),Result(13));
A14: Adder PORT MAP (COut(13),A(14),B(14),COut(14),Result(14));
A15: Adder PORT MAP (COut(14),A(15),B(15),COut(15),Result(15));
A16: Adder PORT MAP (COut(15),A(16),B(16),COut(16),Result(16));
A17: Adder PORT MAP (COut(16),A(17),B(17),COut(17),Result(17));
A18: Adder PORT MAP (COut(17),A(18),B(18),COut(18),Result(18));
A19: Adder PORT MAP (COut(18),A(19),B(19),COut(19),Result(19));
A20: Adder PORT MAP (COut(19),A(20),B(20),COut(20),Result(20));
A21: Adder PORT MAP (COut(20),A(21),B(21),COut(21),Result(21));
A22: Adder PORT MAP (COut(21),A(22),B(22),COut(22),Result(22));
A23: Adder PORT MAP (COut(22),A(23),B(23),COut(23),Result(23));
A24: Adder PORT MAP (COut(23),A(24),B(24),COut(24),Result(24));
A25: Adder PORT MAP (COut(24),A(25),B(25),COut(25),Result(25));
A26: Adder PORT MAP (COut(25),A(26),B(26),COut(26),Result(26));
A27: Adder PORT MAP (COut(26),A(27),B(27),COut(27),Result(27));
A28: Adder PORT MAP (COut(27),A(28),B(28),COut(28),Result(28));
A29: Adder PORT MAP (COut(28),A(29),B(29),COut(29),Result(29));
A30: Adder PORT MAP (COut(29),A(30),B(30),COut(30),Result(30));
A31: Adder PORT MAP (COut(30),A(31),B(31),CarryOut,Result(31));

end Behavioral;

