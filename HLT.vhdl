library ieee;
use ieee.std_logic_1164.all;

entity HLT is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        hltout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture finish of HLT is

begin

    hltout(10)          <= '1';   
    hltout(9)           <= '0';
    hltout(8 downto 6)  <= "000";
    hltout(5)           <= '0';
    hltout(4)           <= '0';
    hltout(3)           <= '0';
    hltout(2)           <= '0';
    hltout(1)           <= '0';
    hltout(0)           <= '0';

end architecture;
