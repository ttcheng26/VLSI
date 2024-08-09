library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity My_Optional is
port(
	 clk, en: in std_logic;
	 sel: in std_logic;
	 seed: in std_logic_vector(63 downto 0);
	 result: out std_logic_vector(3 downto 0));
end My_Optional;

architecture behavior of My_Optional is
	component RNG is
		port(seed : in std_logic_vector(63 downto 0);
			 clk, sel : in std_logic;
		     rng_out : out std_logic_vector(63 downto 0)
	        );
	end component;

	signal rng_output : std_logic_vector(63 downto 0);
	signal mod_output : std_logic_vector(3 downto 0);

	signal reg_output : std_logic_vector(3 downto 0);

begin
	RNG_inst : RNG port map(seed => seed,
							clk => clk,
							sel => sel,
							rng_out => rng_output);
	process(clk)
	  variable dec_value : integer;
	begin
	  if rising_edge(clk) then
		dec_value := to_integer(unsigned(rng_output));
		
		mod_output <= std_logic_vector(to_unsigned(dec_value mod 6, mod_output'length));
	  end if;
	end process;

	process(clk)
	begin
	 if rising_edge(clk) then
       if en='1' then
		reg_output <= mod_output;
	   end if;
     end if;
	end process;
	
	result <= reg_output;
end behavior;
