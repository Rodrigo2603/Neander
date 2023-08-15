library ieee;
use ieee.std_logic_1164.all;

entity FLAGS is
    port(
        datain  : in std_logic_vector(1 downto 0);
        clk     : in std_logic;
        pr, cl  : in std_logic;        
        write   : in std_logic;
        dataout : out std_logic_vector(1 downto 0)
    );
end entity;

architecture reg of FLAGS is
    component reg01bitC is
        port(
            datain  : in std_logic;
            clk     : in std_logic;
            pr, cl  : in std_logic;        
            write   : in std_logic;
            dataout : out std_logic
        );
    end component;
begin

	    urn : reg01bitC port map(datain(1), clk, '1', cl, write, dataout(1));
        urz : reg01bitC port map(datain(0), clk, cl, '1', write, dataout(0));

end architecture;
