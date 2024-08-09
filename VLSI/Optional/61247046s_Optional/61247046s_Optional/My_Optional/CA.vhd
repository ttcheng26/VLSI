library ieee;
use ieee.std_logic_1164.all;
entity CA is
   port( adr : in std_logic_vector(3 downto 0) ;
         clk, sel, init : in std_logic;
         Y : out std_logic 
);
end CA;
architecture behavior of CA is
signal X: std_logic;
begin
  with adr select
    X <= '0' when "0000",
         '1' when "0001",
         '1' when "0010",
         '0' when "0011",
         '0' when "0100",
         '0' when "0101",
         '0' when "0110",
         '1' when "0111",
         '1' when "1000",
         '1' when "1001",
         '1' when "1010",
         '0' when "1011",
         '0' when "1100",
         '1' when "1101",
         '0' when "1110",
         '1' when "1111",
         '1' when others;
process(clk)
     begin
      if (clk'EVENT and clk = '1')  then
		if (sel = '0') then
			Y <= init;
		else
			Y <= X;
		end if;
      end if;
     end process;
end behavior;
  