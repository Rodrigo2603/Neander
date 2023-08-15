library ieee;
use ieee.std_logic_1164.all;

entity A_ND is
    port(
        ciclo  : in std_logic_vector(2 downto 0);
        andout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture smth of A_ND is

begin

    andout(10)          <= '1';   
    andout(9)           <= not(ciclo(2));
    andout(8 downto 6)  <= "011";
    andout(5)           <= not(ciclo(1)) and (ciclo(2) xor ciclo(0));
    andout(4)           <= ciclo(2) and ciclo(1) and ciclo(0);
    andout(3)           <= '0';
    andout(2)           <= (not(ciclo(1)) and (ciclo(2) xnor ciclo(0))) or (not(ciclo(2)) and ciclo(1) and ciclo(0));
    andout(1)           <= (ciclo(2) and not(ciclo(0))) or (not(ciclo(2)) and not(ciclo(1)) and ciclo(0));
    andout(0)           <= not(ciclo(2)) and ciclo(1) and not(ciclo(0));

end architecture;
