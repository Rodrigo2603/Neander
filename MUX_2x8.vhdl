library ieee;
use ieee.std_logic_1164.all;

entity mux2x8 is
	port(
	--entradas
	c0 : in std_logic_vector(7 downto 0);
	c1 : in std_logic_vector(7 downto 0);
	sel: in std_logic;
	--saida
	z : out std_logic_vector(7 downto 0)
);
end entity;

--arquitetura/comportamento
architecture comutador of mux2x8 is
begin

	z <= c0 when sel='0' else c1;

end architecture;
