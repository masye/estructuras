
--------------------------------------------------------------------------------
-- Company: UNIVERSIDAD AUTONOMA DE MADRID 
-- Engineer: SERGIO ARRANZ GONZÁLEZ Y ALEJANDRO ALCALÁ ÁLVAREZ
--
-- Create Date: <date>
-- Design Name: <name_of_top-level_design>
-- Component Name: <name_of_this_component>
-- Target Device: <target device>
-- Tool versions: <tool_versions>
-- Description:
--    <Description here>
-- Dependencies:
--    <Dependencies here>
-- Revision:
--    <Code_revision_information>
-- Additional Comments:
--    <Additional_comments>
--------------------------------------------------------------------------------
			
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity p1_e1 is port(
		A: in std_logic;
		B: in std_logic;
		C: in std_logic;
		Q: out std_logic
);
end p1_e1;

architecture comportamental of p1_e1 is 
		signal salida: std_logic;
begin 
				salida <= A or B;
				Q <= salida and C;
end comportamental;
		
		
		
		
		
		
		
		
		