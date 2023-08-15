library ieee;
use ieee.std_logic_1164.all;

entity JMP is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        jmpout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture jump of JMP is

begin

    jmpout(10)          <= not(ciclo(0)) or ciclo(1) or not(ciclo(2));   
    jmpout(9)           <= '1';
    jmpout(8 downto 6)  <= "000";
    jmpout(5)           <= not(ciclo(1)) and ciclo(0);
    jmpout(4)           <= '0';
    jmpout(3)           <= '0';
    jmpout(2)           <= (not(ciclo(2)) and not(ciclo(1)) and not(ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    jmpout(1)           <= (not(ciclo(2)) and not(ciclo(1)) and ciclo(0)) or (ciclo(2) and not(ciclo(1)) and not(ciclo(0)));
    jmpout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
