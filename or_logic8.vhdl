library ieee;
use ieee.std_logic_1164.all;

entity or_logic8b is
    port(
        x : in std_logic_vector(7 downto 0);
        y : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0)
    );
end entity;

architecture comuta of or_logic8b is

begin

    gerador : for i in 0 to 7 generate
        ss : s(i) <= x(i) or y(i);
    end generate gerador;

end architecture;
