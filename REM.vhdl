library ieee;
use ieee.std_logic_1164.all;

entity REM1 is
    port(
        datain  : in std_logic_vector(7 downto 0);
        clk     : in std_logic;
        pr, cl  : in std_logic;
        write   : in std_logic;
        dataout : out std_logic_vector(7 downto 0)
    );
end entity;

architecture reg of REM1 is

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

    gr: for i in 7 downto 0 generate
	    ur : reg01bitC port map(datain(i), clk, pr, cl, write, dataout(i));
    end generate gr;

end architecture;
