library ieee;
use ieee.std_logic_1164.all;

entity NEANDER is
    port(
        cl, clk: in std_logic
    );
end entity;

architecture computer of NEANDER is

    component MODULO_ULA is
        port(
            AC_rw                : in std_logic;
            ULA_op               : in std_logic_vector(2 downto 0);
            cl, clk              : in std_logic;
            mem_rw               : in std_logic;
            interface_flags      : out std_logic_vector(1 downto 0);
            interface_barramento : inout std_logic_vector(7 downto 0)
        );
    end component;

    component MODULO_MEMORIA is
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
    end component;

    component MODULO_CONTROLE is
        port(
            interface_barramento : in std_logic_vector(7 downto 0);
            NZ                   : in std_logic_vector(1 downto 0);
            barr_inc             : in std_logic;
            PC_rw, RI_rw         : in std_logic;
            cl, clk              : in std_logic;
            barramento_controle  : out std_logic_vector(10 downto 0);
            endout               : out std_logic_vector(7 downto 0)
        );
    end component;

    signal sinterface_barramento : std_logic_vector(7 downto 0);
    signal send_PC               : std_logic_vector(7 downto 0);
    signal sflagsNZ              : std_logic_vector(1 downto 0);
    signal sbarramento_controle  : std_logic_vector(10 downto 0);

begin

    umodulo_ula      : MODULO_ULA      port map(sbarramento_controle(4), sbarramento_controle(8 downto 6), cl, clk, sbarramento_controle(3), sflagsNZ, sinterface_barramento);
    umodulo_memoria  : MODULO_MEMORIA  port map(send_PC, sinterface_barramento, sbarramento_controle(9), sbarramento_controle(2), cl, clk, sbarramento_controle(3), sbarramento_controle(1), sinterface_barramento);
    umodulo_controle : MODULO_CONTROLE port map(sinterface_barramento, sflagsNZ, sbarramento_controle(10), sbarramento_controle(5), sbarramento_controle(0), cl, clk, sbarramento_controle, send_PC);

end architecture;
