----------------------------------------------------------------------
-- Fichero: Deco3a8RegTb.vhd
-- Descripción: Testbench para un contador de 8 bits
-- Fecha última modificación: 2012-01-22

-- Autores: Alberto Sánchez (2012), Fernando López (2010) 
-- Asignatura: E.C. 1º grado
-- Grupo de Prácticas:
-- Grupo de Teoría:
-- Práctica: 1
-- Ejercicio: 4
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.ALL;


entity Contador_8bits is
end Contador_8bits;

architecture Simulacion of Contador_8bits is 
		component Contador port(
				Clk : in  STD_LOGIC;
				Reset : in  STD_LOGIC;
				Ce : in  STD_LOGIC;
				Up : in  STD_LOGIC;
				Q : out  STD_LOGIC_VECTOR (7 downto 0)
		);
		end component;
		
-- Entradas para comprobar en la simulación
		signal sigClk: std_logic := '0';
		signal sigReset: std_logic := '0';
		signal sigCe: std_logic := '0';
		signal sigUp: std_logic:= '0';
-- Salidas para comprobar en la simulación
		signal sigQ: std_logic_vector (7 downto 0);
-- Constante para usar en la simulación del contador
		constant CLKPERIOD: time:= 10 ns;
		constant ESPERA: time:= 1 ns;
		constant INPUT: integer:= 8;
begin 
-- Instanciación del Contador 8 bits en el Testbench
		uut: Contador port map(
				Clk => sigClk,
				Reset => sigReset,
				Ce => sigCe,
				Up => sigUp,
				Q => sigQ
		);
-- Probamos el proceso del Clk 
		CLKPROCESS: process
				begin 
						sigClk <='0';
						wait for CLKPERIOD/2;
						sigClk <= '1';
						wait for CLKPERIOD/2;
				end process;
-- Probamos el Reset
		process	
				begin 
						sigReset <= '1';
						sigCe <= '0';
						sigUp <= '0';
						wait for CLKPERIOD;
						assert sigQ = "00000000" report "Error en el reset." severity failure;
-- Probamos el Chip Enable, preguntar en clase si tenemos que comprobarlo
						sigReset <= '0';
						sigCe <= '0';
						sigUp <= '1';
						wait for CLKPERIOD;
						assert sigQ = "00000000" report "Error en el Chip Enable." severity failure;
-- Chip Enable a 1 y Up a 1, para que cuente hacia arriba
						sigReset <= '0';
						sigCe <= '1';
						sigUp <= '1';
						for i in 0 to 254 loop
								assert conv_integer(sigQ) = i report "Fallo en el número hacia arriba = " &integer'image(i) severity failure;
								wait for CLKPERIOD;
						end loop;
-- Chip Enable a 1 y Up a 0, pra que cuente hacia abajo
						sigReset <= '0';
						sigCe <= '1';
						sigUp <= '0';
						wait for ESPERA;
						for i in 255 downto 0 loop
								assert conv_integer(sigQ) = i report "Fallo en el número = " &integer'image(i) severity failure;
								wait for CLKPERIOD;
						end loop;
						
						wait for CLKPERIOD;
						report "Simulación terminada.";
						wait;
				end process;
		end Simulacion;











