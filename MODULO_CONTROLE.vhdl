library ieee;
use ieee.std_logic_1164.all;

entity MODULO_CONTROLE is
    port(
        interface_barramento : in std_logic_vector(7 downto 0);
        NZ                   : in std_logic_vector(1 downto 0);
        barr_inc             : in std_logic;
        PC_rw, RI_rw         : in std_logic;
        cl, clk              : in std_logic;
        barramento_controle  : out std_logic_vector(10 downto 0);
        endout               : out std_logic_vector(7 downto 0)
    );
end entity;

architecture control of MODULO_CONTROLE is

    component PC is
        port(
            interface_barramento : in std_logic_vector(7 downto 0);
            barr_inc             : in std_logic;
            PC_rw                : in std_logic;
            cl, clk              : in std_logic;
            s_endPC2MEM          : out std_logic_vector(7 downto 0)
        );
    end component;

    component RI is
        port(
            datain  : in std_logic_vector(7 downto 0);
            clk     : in std_logic;
            pr, cl  : in std_logic;        
            write   : in std_logic;
            dataout : out std_logic_vector(7 downto 0)
        );
    end component;

    component decodificador is
        port(
            instrin  : in std_logic_vector(7 downto 0);
            instrout : out std_logic_vector(10 downto 0)
        );
    end component;

    component UC is
        port(
            cl, clk             : in std_logic;
            dec2uc              : in std_logic_vector(10 downto 0);
            NZ                  : in std_logic_vector(1 downto 0);
            barramento_controle : out std_logic_vector(10 downto 0)
        );
    end component;

    signal sri2decode : std_logic_vector(7 downto 0);
    signal sdec2uc    : std_logic_vector(10 downto 0);  

begin    

    uPC     : PC            port map(interface_barramento, barr_inc, PC_rw, cl, clk, endout);
    uRI     : RI            port map(interface_barramento, clk, '1', cl, RI_rw, sri2decode);
    uDecode : decodificador port map(sri2decode, sdec2uc);
    uUC     : UC            port map(cl, clk, sdec2uc, NZ, barramento_controle);

end architecture;
