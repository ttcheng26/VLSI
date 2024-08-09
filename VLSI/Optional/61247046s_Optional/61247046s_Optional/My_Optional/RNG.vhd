library ieee;
use ieee.std_logic_1164.all;
entity RNG is
  port(seed : in std_logic_vector(63 downto 0);
       clk, sel : in std_logic;
       rng_out : out std_logic_vector(63 downto 0)
   );
end RNG;
architecture structure of RNG is
type CA_input is array (63 downto 0) of std_logic_vector(3 downto 0);
component CA 
   port( adr : in std_logic_vector(3 downto 0) ;
         clk, sel, init : in std_logic;
         Y : out std_logic 
);
end component;

signal my_CA_input: CA_input;
signal my_CA_output: std_logic_vector(63 downto 0);
begin

process (my_CA_output)
   variable j,k,l : integer;
   begin
     for i in 63 downto 0 loop
      j := i-1;
      if j<0 then j:= 63; end if;
      k := i+2;
      if k>63 then k:=k-64; end if;
      l := i+1;
      if l>63 then l:=l-64; end if;
      my_CA_input(i)<=my_CA_output(i) & my_CA_output(j) 
                             & my_CA_output(k) & my_CA_output(l);
     end loop ;
   end process ;

CA_generate: for n in 63 downto 0 generate
              CA_Array : CA   port map (adr => my_CA_input(n),
                               clk => clk, sel => sel, init => seed(n),
                                 Y => my_CA_output(n));
             end generate ;

rng_out <= my_CA_output;

end structure;
