library ieee;
use ieee.std_logic_1164.all;

entity STA is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        staout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture stack of STA is

begin

    staout(10)          <= '1';   
    staout(9)           <= not(ciclo(2));
    staout(8 downto 6)  <= "000";
    staout(5)           <= not(ciclo(1)) and (ciclo(2) xor ciclo(0));
    staout(4)           <= '0';
    staout(3)           <= ciclo(2) and ciclo(1) and not(ciclo(0));
    staout(2)           <= (not(ciclo(1)) and (ciclo(2) xnor ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    staout(1)           <= (not(ciclo(2)) and not(ciclo(1)) and ciclo(0)) or (ciclo(2) and not(ciclo(1)) and not(ciclo(0)));
    staout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
