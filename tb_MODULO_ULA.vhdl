library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_MODULO_ULA is
end entity;

architecture unit_logic_arit of tb_MODULO_ULA is
    constant cicloClock : time := 20 ns;

    component MODULO_ULA is
    port(
        AC_rw                : in std_logic;
        ULA_op               : in std_logic_vector(2 downto 0);
        cl, clk              : in std_logic;
        mem_rw              : in std_logic;
        interface_flags      : out std_logic_vector(1 downto 0);
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

begin
    sclk <= not(sclk) after cicloClock / 2;

    umodula : MODULO_ULA port map (sAC_rw, sULA_op, scl, sclk, smem_rw, sinterface_flags, sinterface_barramento);

    tb: process
    begin
    --cl inicial
    scl <= '0';
    wait for cicloClock;
    scl <= '1';
    smem_rw <= '0';

    sAC_rw <= '1';
    sULA_op <= "000";
    sinterface_barramento <= "01010100";
    wait for cicloClock;
    
    sULA_op <= "001";
    sinterface_barramento <= "10000000";
    wait for cicloClock;
    
    sinterface_barramento <= "00101100";
    wait for cicloClock;
    wait;    
    end process;

end architecture;
    

