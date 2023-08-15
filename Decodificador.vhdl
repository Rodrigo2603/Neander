library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
    port(
        instrin  : in std_logic_vector(7 downto 0);
        instrout : out std_logic_vector(10 downto 0)
    );
end entity;

architecture decode of decodificador is

begin

    instrout(10) <= not(instrin(7)) and not(instrin(6)) and not(instrin(5)) and not(instrin(4));
    instrout(9)  <= not(instrin(7)) and not(instrin(6)) and not(instrin(5)) and instrin(4);
    instrout(8)  <= not(instrin(7)) and not(instrin(6)) and instrin(5) and not(instrin(4));
    instrout(7)  <= not(instrin(7)) and not(instrin(6)) and instrin(5) and instrin(4);
    instrout(6)  <= not(instrin(7)) and instrin(6) and not(instrin(5)) and not(instrin(4));
    instrout(5)  <= not(instrin(7)) and instrin(6) and not(instrin(5)) and instrin(4);
    instrout(4)  <= not(instrin(7)) and instrin(6) and instrin(5) and not(instrin(4));
    instrout(3)  <= instrin(7) and not(instrin(6)) and not(instrin(5)) and not(instrin(4));
    instrout(2)  <= instrin(7) and not(instrin(6)) and not(instrin(5)) and instrin(4);
    instrout(1)  <= instrin(7) and not(instrin(6)) and instrin(5) and not(instrin(4));
    instrout(0)  <= instrin(7) and instrin(6) and instrin(5) and instrin(4);

end architecture;
