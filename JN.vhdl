library ieee;
use ieee.std_logic_1164.all;

entity JN is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        flag_n : in std_logic;
        saida  : out std_logic_vector(10 downto 0)
    );
end entity;

architecture jump of JN is

    signal sjntout, sjnfout : std_logic_vector(10 downto 0);

begin

    sjntout(10)          <= not(ciclo(0)) or ciclo(1) or not(ciclo(2));   
    sjntout(9)           <= '1';
    sjntout(8 downto 6)  <= "000";
    sjntout(5)           <= not(ciclo(1)) and ciclo(0);
    sjntout(4)           <= '0';
    sjntout(3)           <= '0';
    sjntout(2)           <= (not(ciclo(2)) and not(ciclo(1)) and not(ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    sjntout(1)           <= (not(ciclo(2)) and not(ciclo(1)) and ciclo(0)) or (ciclo(2) and not(ciclo(1)) and not(ciclo(0)));
    sjntout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

    sjnfout(10)          <= '1';
    sjnfout(9)           <= '1';
    sjnfout(8 downto 6)  <= "000";
    sjnfout(5)           <= not(ciclo(2)) and ciclo(0);
    sjnfout(4)           <= '0';
    sjnfout(3)           <= '0';
    sjnfout(2)           <= not(ciclo(2)) and not(ciclo(1)) and not(ciclo(0));
    sjnfout(1)           <= not(ciclo(2)) and not(ciclo(1)) and ciclo(0);
    sjnfout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

    saida <= sjntout when flag_n = '1' else sjnfout;

end architecture;
