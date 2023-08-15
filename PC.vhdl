library ieee;
use ieee.std_logic_1164.all;

entity PC is
    port(
        interface_barramento : in std_logic_vector(7 downto 0);
        barr_inc             : in std_logic;
        PC_rw                : in std_logic;
        cl, clk              : in std_logic;
        s_endPC2MEM          : out std_logic_vector(7 downto 0)
    );
end PC;

architecture counter of PC is

    component fadder8 is
          port (
                a, b : in std_logic_vector(7 downto 0);
                cin  : in std_logic;
                s    : out std_logic_vector(7 downto 0);
                cout : out std_logic
          );
    end component;

    component mux2x8 is
	    port(
	        c0 : in std_logic_vector(7 downto 0);
	        c1 : in std_logic_vector(7 downto 0);
	        sel: in std_logic;
	        z : out std_logic_vector(7 downto 0)
        );
    end component;

    component reg08bitC is
        port(
            datain  : in std_logic_vector(7 downto 0);
            clk     : in std_logic;
            pr, cl  : in std_logic;        
            write   : in std_logic;
            dataout : out std_logic_vector(7 downto 0)
        );
    end component;

    signal sadd, s_PCatual, s_mux2pc : std_logic_vector(7 downto 0);

begin

    s_endPC2MEM <= s_PCatual;

    ufadder : fadder8   port map("00000001", s_PCatual, '0', sadd);
    umux2x8 : mux2x8    port map(interface_barramento, sadd, barr_inc, s_mux2pc);
    ureg    : reg08bitC port map(s_mux2pc, clk, '1', cl, PC_rw, s_PCatual);

end architecture;
