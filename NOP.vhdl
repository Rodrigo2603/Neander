library ieee;
use ieee.std_logic_1164.all;

entity NOP is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        nopout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture nop of NOP is

begin

    nopout(10)          <= '1';   
    nopout(9)           <= '1';
    nopout(8 downto 6)  <= "000";
    nopout(5)           <= not(ciclo(2)) and not(ciclo(1)) and ciclo(0);
    nopout(4)           <= '0';
    nopout(3)           <= '0';
    nopout(2)           <= not(ciclo(2)) and not(ciclo(1)) and not(ciclo(0));
    nopout(1)           <= not(ciclo(2)) and not(ciclo(1)) and ciclo(0);
    nopout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
