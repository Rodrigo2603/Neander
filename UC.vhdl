library ieee;
use ieee.std_logic_1164.all;

entity UC is
    port(
        cl, clk             : in std_logic;
        dec2uc              : in std_logic_vector(10 downto 0);
        NZ                  : in std_logic_vector(1 downto 0);
        barramento_controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture controle of UC is

    component contador07 is
	    port(
		    clk : in  std_logic;
		    cl  : in  std_logic;
		    v   : out std_logic_vector(2 downto 0)
	    );
    end component;

    component mux11x11 is
        port(
            c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10 : in std_logic_vector(10 downto 0);
            sel_op : in std_logic_vector(10 downto 0);
            s      : out std_logic_vector(10 downto 0)
        );
    end component;

    component LDA is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            ldaout : out std_logic_vector(10 downto 0)
        );
    end component;

    component NOP is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            nopout : out std_logic_vector(10 downto 0)
        );
    end component;

    component STA is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            staout : out std_logic_vector(10 downto 0)
        );
    end component;

    component N_OT is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            notout : out std_logic_vector(10 downto 0)
        );
    end component;

    component ADD is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            addout : out std_logic_vector(10 downto 0)
        );
    end component;

    component O_R is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            orout : out std_logic_vector(10 downto 0)
        );
    end component;    

    component A_ND is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            andout : out std_logic_vector(10 downto 0)
        );
    end component;

    component JMP is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            jmpout : out std_logic_vector(10 downto 0)
        );
    end component;

    component JN is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            flag_n : in std_logic;
            saida  : out std_logic_vector(10 downto 0)
        );
    end component;

    component JZ is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            flag_z : in std_logic;
            saida  : out std_logic_vector(10 downto 0)
        );  
    end component;

    component HLT is
        port(
            ciclo  : in std_logic_vector(2 downto 0);
            hltout : out std_logic_vector(10 downto 0)
        );
    end component;

    signal sciclo: std_logic_vector(2 downto 0);
    signal b_nop, b_sta, b_lda, b_add, b_and, b_or, b_not, b_jmp, b_jn, b_jz, b_hlt : std_logic_vector(10 downto 0);

begin

    ucounter  : contador07  port map(clk, cl, sciclo);
    umux      : mux11x11    port map(b_nop, b_sta, b_lda, b_add, b_or, b_and, b_not, b_jmp, b_jn, b_jz, b_hlt, dec2uc, barramento_controle);
    ulda      : LDA         port map(sciclo, b_lda);
    unop      : NOP         port map(sciclo, b_nop);
    usta      : STA         port map(sciclo, b_sta);
    unot      : N_OT        port map(sciclo, b_not);
    uadd      : ADD         port map(sciclo, b_add);
    uor       : O_R         port map(sciclo, b_or);
    uand      : A_ND        port map(sciclo, b_and);
    ujmp      : JMP         port map(sciclo, b_jmp);
    ujn       : JN          port map(sciclo, NZ(1), b_jn);  
    ujz       : JZ          port map(sciclo, NZ(0), b_jz);
    uhlt      : HLT         port map(sciclo, b_hlt);

end architecture;
