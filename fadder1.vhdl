library ieee;
use ieee.std_logic_1164.all;

entity fadder1 is

      port (
      a, b : in std_logic;
      cin  : in std_logic;
      s    : out std_logic;
      cout : out std_logic
      );

end fadder1;

architecture behavior_tb of fadder1 is

begin
  s <= (a xor b) xor cin;

  cout <= (a and cin) or (b and cin) or (a and b);
end architecture;
