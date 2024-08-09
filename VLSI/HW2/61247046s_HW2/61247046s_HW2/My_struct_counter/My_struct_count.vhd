library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity My_struct_count is
port(
	   clk: in std_logic;
	   Q:out std_logic_vector(7 downto 0));
end My_struct_count;

architecture structural of My_struct_count is
  component My_DFF
    port(
      clk: in std_logic;
      Q_in: in std_logic_vector(7 downto 0);
      Q_out: out std_logic_vector(7 downto 0)
    );
  end component;

  component counter
    port(
      add_A: in std_logic_vector(7 downto 0);
      add_B: in std_logic_vector(7 downto 0);
      sum : out std_logic_vector(7 downto 0)
    );
  end component;

  signal Q_in, Q_out : std_logic_vector(7 downto 0); 
  constant B : std_logic_vector(7 downto 0) := "00000011";
begin
  C1: My_DFF port map(clk, Q_in, Q_out);
  C2: counter port map(Q_out, B, Q_in);
  Q <= Q_out; 
end structural;
