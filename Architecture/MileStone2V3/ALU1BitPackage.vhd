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

package ALU1BitPackage is

component ALU1Bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CarryIn : in  STD_LOGIC;
           CarryOut : out  STD_LOGIC;
           Result : out  STD_LOGIC;
           OverFlow : out  STD_LOGIC;
           Mode : in  STD_LOGIC_VECTOR(3 downto 0);
			  Less : in STD_LOGIC;
			  Set : Out STD_LOGIC;
           Zero : out  STD_LOGIC);

end component;
end ALU1BitPackage;


package body ALU1BitPackage is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end ALU1BitPackage;
