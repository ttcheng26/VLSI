library ieee;
use ieee.std_logic_1164.all;

entity MY_DECODER_4to16 is
port(
			A : in std_logic_vector(3 downto 0);
			B : out std_logic_vector(15 downto 0)
			);
end MY_DECODER_4to16;

architecture DATAFLOW of MY_DECODER_4to16 is
begin
	with A select
		B <= "0000000000000011" when "0000",
			 "0000000000000110" when "0001",
			 "0000000000001100" when "0010",
			 "0000000000011000" when "0011",
			 "0000000000110000" when "0100",
			 "0000000001100000" when "0101",
			 "0000000011000000" when "0110",
			 "0000000110000000" when "0111",
			 "0000001100000000" when "1000",
			 "0000011000000000" when "1001",
			 "0000110000000000" when "1010",
			 "0001100000000000" when "1011",
			 "0011000000000000" when "1100",
			 "0110000000000000" when "1101",
			 "1100000000000000" when "1110",
			 "0000000000000000" when "1111";
end DATAFLOW;