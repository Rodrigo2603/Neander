library ieee;
use ieee.std_logic_1164.all;

entity tb_NEANDER is
end entity tb_NEANDER;

architecture computer of tb_NEANDER is
    constant cicloClock : time := 20 ns;

    component NEANDER is
        port(
            cl, clk: in std_logic
        );
    end component;

    signal cl  : std_logic := '1';
    signal clk : std_logic := '0';

begin

    clk <= not(clk) after cicloClock / 2;

    uneander : NEANDER port map(cl, clk);

    process
    begin

    cl <= '0';
    wait for cicloClock;
    cl <= '1';
    
    wait;
    end process;

end architecture;
