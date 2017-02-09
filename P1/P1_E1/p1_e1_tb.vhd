
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

entity p1_e1_tb is 
end p1_e1_tb;


architecture comportamental of p1_e1_tb is
component p1_e1 port(
						A: in std_logic;
						B: in std_logic;
						C: in std_logic;
						Q: out std_logic
					);
end component;
		
-- Entradas del circuito
			signal sigA: std_logic := '0';
			signal sigB: std_logic := '0';
			signal sigC: std_logic := '0';
		
-- Salidas del circuito
			signal sigQ: std_logic;
			

begin
					uut: p1_e1 port map(
								A => sigA,
								B => sigB,
								C => sigC,
								Q => sigQ
					);
					
					stim_proc: process
								begin 
								-- Caso 000
								wait for 10 ns;
										sigA <= '0';
										sigB <= '0';
										sigC <= '0';
								wait for 10 ns;
										assert sigQ = '0' report "Error en el caso 000." severity failure;
								-- Caso 001
								wait for 10 ns;
										sigA <= '0';
										sigB <= '0';
										sigC <= '1';
								wait for 10 ns;
										assert sigQ = '0' report "Error en el caso 001" severity failure;
								-- Caso 010
								wait for 10 ns;
										sigA <= '0';
										sigB <= '1';
										sigC <= '0';
								wait for 10 ns;
										assert sigQ = '0' report "Error en el caso 010." severity failure;
								-- Caso 011
								wait for 10 ns;
										sigA <= '0';
										sigB <= '1';
										sigC <= '1';
								wait for 10 ns;
										assert sigQ = '1' report "Error en el caso 001" severity failure;
								-- Caso 100
								wait for 10 ns;
										sigA <= '1';
										sigB <= '0';
										sigC <= '0';
								wait for 10 ns;
										assert sigQ = '0' report "Error en el caso 100." severity failure;
								-- Caso 101
								wait for 10 ns;
										sigA <= '1';
										sigB <= '0';
										sigC <= '1';
								wait for 10 ns;
										assert sigQ = '1' report "Error en el caso 101" severity failure;
								-- Caso 110
								wait for 10 ns;
										sigA <= '1';
										sigB <= '1';
										sigC <= '0';
								wait for 10 ns;
										assert sigQ = '0' report "Error en el caso 110." severity failure;
								-- Caso 111
								wait for 10 ns;
										sigA <= '1';
										sigB <= '1';
										sigC <= '1';
								wait for 10 ns;
										assert sigQ = '1' report "Error en el caso 001" severity failure;
										
								wait for 10 ns;
								report "Simulación Finalizada Correctamente.";
								wait;
					end process;
end comportamental;
								
								
								
			
			
			
			
			
			
			
			
			
		
										