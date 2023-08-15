library ieee;
use ieee.std_logic_1164.all;

entity mux11x11 is
        port(
            c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10 : in std_logic_vector(10 downto 0);
            sel_op : in std_logic_vector(10 downto 0);
            s      : out std_logic_vector(10 downto 0)
        );
end entity;

architecture comutador of mux11x11 is
begin

    s <= c0  when sel_op="10000000000" else
         c1  when sel_op="01000000000" else
         c2  when sel_op="00100000000" else
         c3  when sel_op="00010000000" else
         c4  when sel_op="00001000000" else
         c5  when sel_op="00000100000" else
         c6  when sel_op="00000010000" else
         c7  when sel_op="00000001000" else
         c8  when sel_op="00000000100" else
         c9  when sel_op="00000000010" else
         c10 when sel_op="00000000001" else
         (others => 'Z');

end architecture;
