library ieee;
use ieee.std_logic_1164.all;

entity ULA is
    port(
        x           : in std_logic_vector(7 downto 0);
        y           : in std_logic_vector(7 downto 0);        
        ULA_op      : in std_logic_vector(2 downto 0);
        resultado   : out std_logic_vector(7 downto 0);
        NZ          : out std_logic_vector(1 downto 0)
    );
end entity;

architecture logic of ULA is

    component fadder8 is
      port (
        a, b : in std_logic_vector(7 downto 0);
        cin  : in std_logic;
        s    : out std_logic_vector(7 downto 0);
        cout : out std_logic
      );
    end component;

    component or_logic8b is
    port(
        x : in std_logic_vector(7 downto 0);
        y : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0)
    );
    end component;

    component and_logic8b is
    port(
        x : in std_logic_vector(7 downto 0);
        y : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0)
    );
    end component;

    component not_logic8b is
    port(
        x : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0)
    );
    end component;
    
    signal sadd, sor, sand, snot, s_resultado: std_logic_vector(7 downto 0);

begin

    resultado <= s_resultado;

    ufadder : fadder8     port map (x, y, '0', sadd);
    uor     : or_logic8b  port map (x, y, sor);
    uand    : and_logic8b port map (x, y , sand);
    unot    : not_logic8b port map (x, snot);

    s_resultado <= snot when ULA_op = "100" else
                   sand when ULA_op = "011" else
                   sor  when ULA_op = "010" else
                   sadd when ULA_op = "001" else
                   y    when ULA_op = "000";  

    NZ(1) <= s_resultado(7);
    NZ(0) <= not(s_resultado(7) or s_resultado(6) or s_resultado(5) or s_resultado(4) or s_resultado(3) or s_resultado(2) or s_resultado(1) or s_resultado(0));

end architecture;     
