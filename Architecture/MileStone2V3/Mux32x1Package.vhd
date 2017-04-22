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

package Mux32x1Package is
COMPONENT Mux32x1 is
    Port ( Register0 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register4 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register5 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register6 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register7 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register8 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register9 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register10 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register11 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register12 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register13 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register14 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register15 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register16 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register17 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register18 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register19 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register20 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register21 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register22 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register23 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register24 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register25 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register26 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register27 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register28 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register29 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Register31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end Mux32x1Package;

package body Mux32x1Package is

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
 
end Mux32x1Package;
