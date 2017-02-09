----------------------------------------------------------------------
-- Fichero: Deco3a8Reg.vhd
-- Descripción: Testbench para un decodificador 3 a 8 registrado
-- Fecha última modificación:

-- Autores: Sergio Arranz Gonzalez y Alejandro Alcalá Álvarez
-- Asignatura: E.C. 1º grado
-- Grupo de Prácticas:
-- Grupo de Teoría:
-- Práctica: 1
-- Ejercicio: 3
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.ALL;


entity Registro_8bits is port ( 
			D : in  std_logic_vector (7 downto 0);
			Reset : in  std_logic;
			Clk : in  std_logic;
			Ce : in  std_logic;
			Q : out  std_logic_vector (7 downto 0) 
		);
end Registro_8bits;

architecture comportamental of Registro_8bits is
	
begin
	--El registro es sensible al Reset (asíncrono) y a la señal del reloj
	process (Reset, Clk)
	begin
		-- Si el reset está activo la salida vale 0
		if Reset = '1' then
			Q <= "00000000";
		-- Si hay un flanco de subida del reloj
		elsif rising_edge (Clk) then
			-- Si el chip enable está activo
			if Ce = '1' then
				Q <= D;
			end if;
		end if;
	end process;
end comportamental;