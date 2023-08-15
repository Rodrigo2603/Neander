library ieee;
use ieee.std_logic_1164.all;

entity O_R is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        orout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture other of O_R is

begin

    orout(10)          <= '1';   
    orout(9)           <= not(ciclo(2));
    orout(8 downto 6)  <= "010";
    orout(5)           <= not(ciclo(1)) and (ciclo(2) xor ciclo(0));
    orout(4)           <= ciclo(2) and ciclo(1) and ciclo(0);
    orout(3)           <= '0';
    orout(2)           <= (not(ciclo(1)) and (ciclo(2) xnor ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    orout(1)           <= (ciclo(2) and not(ciclo(0))) or (not(ciclo(2)) and not(ciclo(1)) and ciclo(0));
    orout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
