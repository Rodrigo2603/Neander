library ieee;
use ieee.std_logic_1164.all;

entity MODULO_ULA is
    port(
        AC_rw                : in std_logic;
        ULA_op               : in std_logic_vector(2 downto 0);
        cl, clk              : in std_logic;
        mem_rw               : in std_logic;
        interface_flags      : out std_logic_vector(1 downto 0);
        interface_barramento : inout std_logic_vector(7 downto 0)
    );
end entity;

architecture logic of MODULO_ULA is

    component ULA is
    port(
        x           : in std_logic_vector(7 downto 0);
        y           : in std_logic_vector(7 downto 0);        
        ULA_op      : in std_logic_vector(2 downto 0);
        resultado   : out std_logic_vector(7 downto 0);
        NZ          : out std_logic_vector(1 downto 0)
    );
    end component;   

    component AC is
    port(
        datain  : in std_logic_vector(7 downto 0);
        clk     : in std_logic;
        pr, cl  : in std_logic;        
        write   : in std_logic;
        dataout : out std_logic_vector(7 downto 0)
    );
    end component;

    component FLAGS is
    port(
        datain  : in std_logic_vector(1 downto 0);
        clk     : in std_logic;
        pr, cl  : in std_logic;        
        write   : in std_logic;
        dataout : out std_logic_vector(1 downto 0)
    );
    end component;                                     

    signal s_ula2ac, s_ac2ula: std_logic_vector(7 downto 0);
    signal s_ac2flags : std_logic_vector(1 downto 0);

begin

    uula   : ULA   port map (s_ac2ula, interface_barramento, ULA_op, s_ula2ac, s_ac2flags);
    uac    : AC    port map (s_ula2ac, clk, '1', cl, AC_rw, s_ac2ula);
    uflags : FLAGS port map (s_ac2flags, clk, '1', cl, AC_rw, interface_flags);

    interface_barramento <= s_ac2ula when mem_rw='1' else (others => 'Z');

end architecture; 


