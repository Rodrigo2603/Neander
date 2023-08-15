library ieee;
use ieee.std_logic_1164.all;

entity MODULO_MEMORIA is
        port(
            end_PC   : in std_logic_vector(7 downto 0);
            end_Barr : in std_logic_vector(7 downto 0);
            barr_PC  : in std_logic;
            rem_rw   : in std_logic;
            cl, clk  : in std_logic;
            mem_rw   : in std_logic;
            rdm_rw   : in std_logic;
            interface_barramento : inout std_logic_vector(7 downto 0)
        );
end entity;

architecture memory of MODULO_MEMORIA is

    component mux2x8 is
	    port(
	    --entradas
	    c0 : in std_logic_vector(7 downto 0);
	    c1 : in std_logic_vector(7 downto 0);
	    sel: in std_logic;
	    --saida
	    z : out std_logic_vector(7 downto 0)
    );
    end component;

    component REM1 is
    port(
        datain  : in std_logic_vector(7 downto 0);
        clk     : in std_logic;
        pr, cl  : in std_logic;
        write   : in std_logic;
        dataout : out std_logic_vector(7 downto 0)
    );
    end component;

    component as_ram is
	port(
		addr  : in    std_logic_vector(7 downto 0);
		data  : inout std_logic_vector(7 downto 0);
		notrw : in    std_logic;
		reset : in    std_logic
	);
    end component;

    component RDM is
    port(
        datain  : in std_logic_vector(7 downto 0);
        clk     : in std_logic;
        pr, cl  : in std_logic;        
        write   : in std_logic;
        dataout : out std_logic_vector(7 downto 0)
    );
    end component;

    signal s_mux2rem, s_rem2mem, s_mem2rdm, s_rdm2barramento : std_logic_vector(7 downto 0);

begin

    umux : mux2x8 port map(end_Barr, end_PC, barr_PC, s_mux2rem);
    urem : REM1   port map(s_mux2rem, clk, '1', cl, rem_rw, s_rem2mem);
    umem : as_ram port map(s_rem2mem, s_mem2rdm, mem_rw, cl);
    urdm : RDM    port map(s_mem2rdm, clk, '1', cl, rdm_rw, s_rdm2barramento);

    interface_barramento <= s_rdm2barramento when mem_rw='0' else (others => 'Z');
    s_mem2rdm <= interface_barramento when mem_rw='1' else (others => 'Z');

end architecture;
