----------------------------------------------------------------------
-- Fichero: Deco3a8Reg.vhd
-- Descripci�n: Testbench para un decodificador 3 a 8 registrado
-- Fecha �ltima modificaci�n:

-- Autores: Sergio Arranz Gonzalez y Alejandro Alcal� �lvarez
-- Asignatura: E.C. 1� grado
-- Grupo de Pr�cticas:
-- Grupo de Teor�a:
-- Pr�ctica: 1
-- Ejercicio: 3
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.ALL;


entity Deco3a8Reg is port (
			D : in std_logic_vector (2 downto 0);
			CE : in std_logic;
			Clk : in std_logic;
			Reset : in std_logic;
			Q : out std_logic_vector (7 downto 0)
		);
end Deco3a8Reg;

architecture comportamental of Deco3a8Reg is

-- Declaramos una se�al para la salida del Decodificador
		signal salidaDeco: std_logic_vector (7 downto 0);
		
-- A�adimos el componente del Regristo de 8 bits
		component Registro_8bits port(
								D : in  std_logic_vector (7 downto 0);
								Reset : in  std_logic;
								Clk : in  std_logic;
								Ce : in  std_logic;
								Q : out  std_logic_vector (7 downto 0)
					);
		end component;
		
		
		begin
--Instanciamos el Registtro de 8 bits
				uut: Registro_8bits port map(
								D => salidaDeco,
								Reset => Reset,
								Clk => Clk,
								Ce => CE,
								Q => Q
						);
-- Toda la funci�n del Decodificador
				with D select
				salidaDeco <= "00000001" when "000",
								  "00000010" when "001",
				              "00000100" when "010",
								  "00001000" when "011",
				              "00010000" when "100",
								  "00100000" when "101",
								  "01000000" when "110",
                          "10000000" when others;				
end comportamental;