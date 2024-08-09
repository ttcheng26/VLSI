library ieee;
use ieee.std_logic_1164.all;

entity My_DFF is
port(
	 clk: in std_logic;
	 Q_in: in std_logic_vector(7 downto 0);
	 Q_out: out std_logic_vector(7 downto 0));
end My_DFF;

architecture behavior of My_DFF is
begin
	process(clk)
		begin
			if(clk'EVENT and clk='1') then
				Q_out <= Q_in;
		end if;
	end process;
end behavior;