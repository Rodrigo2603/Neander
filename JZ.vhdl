library ieee;
use ieee.std_logic_1164.all;

entity JZ is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        flag_z : in std_logic;
        saida  : out std_logic_vector(10 downto 0)
    );
end entity;

architecture jump of JZ is

    signal sjztout, sjzfout : std_logic_vector(10 downto 0);

begin

    sjztout(10)          <= not(ciclo(0)) or ciclo(1) or not(ciclo(2));   
    sjztout(9)           <= '1';
    sjztout(8 downto 6)  <= "000";
    sjztout(5)           <= not(ciclo(1)) and ciclo(0);
    sjztout(4)           <= '0';
    sjztout(3)           <= '0';
    sjztout(2)           <= (not(ciclo(2)) and not(ciclo(1)) and not(ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    sjztout(1)           <= (not(ciclo(2)) and not(ciclo(1)) and ciclo(0)) or (ciclo(2) and not(ciclo(1)) and not(ciclo(0)));
    sjztout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

    sjzfout(10)          <= '1';
    sjzfout(9)           <= '1';
    sjzfout(8 downto 6)  <= "000";
    sjzfout(5)           <= not(ciclo(2)) and ciclo(0);
    sjzfout(4)           <= '0';
    sjzfout(3)           <= '0';
    sjzfout(2)           <= not(ciclo(2)) and not(ciclo(1)) and not(ciclo(0));
    sjzfout(1)           <= not(ciclo(2)) and not(ciclo(1)) and ciclo(0);
    sjzfout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

    saida <= sjztout when flag_z = '1' else sjzfout;

end architecture;
