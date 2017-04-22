--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package AdderPackage is

component Adder is
    Port ( CarryIn : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CarryOut : out  STD_LOGIC;
           Output : out  STD_LOGIC);
end component;

end AdderPackage;

package body AdderPackage is


 
end AdderPackage;
