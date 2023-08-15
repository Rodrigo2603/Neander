library ieee;
use ieee.std_logic_1164.all; 

entity ctrljk07 is
	port(
		qa   : in  std_logic_vector(2 downto 0);
		j, k : out std_logic_vector(2 downto 0)
	);
end entity;

architecture controle of ctrljk07 is
begin

	--jk 2
	j(2) <= qa(1) and qa(0);
	k(2) <= qa(1) and qa(0);

	--jk 1
	j(1) <= qa(0);
	k(1) <= qa(0);
	
	--jk 0
	j(0) <= '1';
	k(0) <= '1';
	
end architecture;
