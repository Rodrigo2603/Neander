library ieee;
use ieee.std_logic_1164.all;

entity contador07 is
	port(
		clk : in  std_logic;
		cl : in  std_logic;
		v   : out std_logic_vector(2 downto 0)
	);
end entity;

architecture contar of contador07 is
	
	component ffjk is
		 port(
		     j, k   : in std_logic;
		     clk    : in std_logic;
		     pr, cl : in std_logic;
		     q, nq  : out std_logic
		 );
	end component;
	
	component ctrljk07 is
		port(
			qa   : in  std_logic_vector(2 downto 0);
			j, k : out std_logic_vector(2 downto 0)
		 );
	end component;
	
	signal sv 	    : std_logic_vector(2 downto 0) := "000";
	signal sj, sk   : std_logic_vector(2 downto 0);
	
begin
	v <= sv;
	
	-- ff do bit 0 ate 1
	gerador : for i in 0 to 2 generate
		ff : ffjk port map(sj(i), sk(i), clk, '1', cl, sv(i));
	end generate gerador;

	-- CTRL JK's
	uctrl : ctrljk07 port map(sv, sj, sk);

end architecture;
