library ieee;
use ieee.std_logic_1164.all;

entity LDA is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        ldaout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture load of LDA is

begin

    ldaout(10)          <= '1';   
    ldaout(9)           <= not(ciclo(2));
    ldaout(8 downto 6)  <= "000";
    ldaout(5)           <= not(ciclo(1)) and (ciclo(2) xor ciclo(0));
    ldaout(4)           <= ciclo(2) and ciclo(1) and ciclo(0);
    ldaout(3)           <= '0';
    ldaout(2)           <= (not(ciclo(1)) and (ciclo(2) xnor ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    ldaout(1)           <= (ciclo(2) and not(ciclo(0))) or (not(ciclo(2)) and not(ciclo(1)) and ciclo(0));
    ldaout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
