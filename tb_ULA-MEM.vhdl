library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ULAMEM is
end entity;

architecture ulamem of tb_ULAMEM is
    constant cicloClock : time := 20 ns;

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

    --sinais de controle
    signal scl : std_logic := '1';
    signal sclk: std_logic := '0';

    --sinais de observação
    signal sinterface_flags      : std_logic_vector(1 downto 0);
    signal sinterface_barramento : std_logic_vector(7 downto 0);

    --sinais de entrada
    signal sAC_rw   : std_logic;
    signal sULA_op  : std_logic_vector(2 downto 0);
    signal smem_rw  : std_logic;
    signal send_PC  : std_logic_vector(7 downto 0);
    signal sbarr_PC : std_logic;
    signal srem_rw  : std_logic;
    signal srdm_rw  : std_logic;

begin
    sclk <= not(sclk) after cicloClock / 2;

    umodula : MODULO_ULA port map (sAC_rw, sULA_op, scl, sclk, smem_rw, sinterface_flags, sinterface_barramento);
    umodmem : MODULO_MEMORIA port map (send_PC, sinterface_barramento, sbarr_PC, srem_rw, scl, sclk, smem_rw, srdm_rw, sinterface_barramento);

    tb: process
    begin
    --cl inicial
    scl <= '0';
    wait for cicloClock;
    scl <= '1';
   
    send_PC <= "10000000";
    sbarr_PC <= '1';
    srem_rw <= '1';
    wait for cicloClock;
    sbarr_PC <= '0';
    srem_rw <= '0';    
    
    smem_rw <= '0';
    srdm_rw <= '1';
    wait for cicloClock;
    srdm_rw <= '0';

    sULA_op <= "000";
    sAC_rw <= '1';
    wait for cicloClock;

    sULA_op <= "001";
    wait for cicloClock;
    sAC_rw <= '0';
    
    wait;
    end process;

end architecture;
    




