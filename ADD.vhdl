library ieee;
use ieee.std_logic_1164.all;

entity ADD is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        addout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture adder of ADD is

begin

    addout(10)          <= '1';   
    addout(9)           <= not(ciclo(2));
    addout(8 downto 6)  <= "001";
    addout(5)           <= not(ciclo(1)) and (ciclo(2) xor ciclo(0));
    addout(4)           <= ciclo(2) and ciclo(1) and ciclo(0);
    addout(3)           <= '0';
    addout(2)           <= (not(ciclo(1)) and (ciclo(2) xnor ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    addout(1)           <= (ciclo(2) and not(ciclo(0))) or (not(ciclo(2)) and not(ciclo(1)) and ciclo(0));
    addout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
