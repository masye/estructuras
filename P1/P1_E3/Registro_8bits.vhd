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
	--El registro es sensible al Reset (as�ncrono) y a la se�al del reloj
	process (Reset, Clk)
	begin
		-- Si el reset est� activo la salida vale 0
		if Reset = '1' then
			Q <= "00000000";
		-- Si hay un flanco de subida del reloj
		elsif rising_edge (Clk) then
			-- Si el chip enable est� activo
			if Ce = '1' then
				Q <= D;
			end if;
		end if;
	end process;
end comportamental;