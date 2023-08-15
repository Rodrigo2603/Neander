library ieee;
use ieee.std_logic_1164.all;

entity N_OT is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        notout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture no of N_OT is

begin

    notout(10)          <= '1';   
    notout(9)           <= '1';
    notout(8 downto 6)  <= "100";
    notout(5)           <= not(ciclo(2)) and not(ciclo(1)) and ciclo(0);
    notout(4)           <= ciclo(2) and ciclo(1) and ciclo(0);
    notout(3)           <= '0';
    notout(2)           <= not(ciclo(2)) and not(ciclo(1)) and not(ciclo(0));
    notout(1)           <= not(ciclo(2)) and not(ciclo(1)) and ciclo(0);
    notout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
