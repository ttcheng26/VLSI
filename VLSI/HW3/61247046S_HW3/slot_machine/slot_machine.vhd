entity slot_machine is
port(
		C, B1, B2, clk: in bit;
		A, T1, T2:out bit);
end slot_machine;

architecture behavior of slot_machine is
 type four_state is (s1, s2, s3, s4);
 signal p_state, n_state: four_state;

begin
	process(clk)
	begin
		if clk'EVENT and clk='1' then
			p_state <= n_state;
		end if;
	end process;
	
	process(p_state, C)
	begin
		case p_state is
			when s1=>
			    A <= '0';
				T1 <= '0';
				T2 <= '0';
				if C='1' then
					n_state <= s2;
				else
					n_state <= s1;
				end if;
				
			when s2=>
			    A <= '1';
				if (B1='1' or (B1='1' and B2='1')) then
					n_state <= s3;								
				elsif B2='1' then
					n_state <= s4;								
				else
					n_state <= s2;
				end if;
				
			when s3=>
				A <= '0';
				T1 <= '1';
				n_state <= s1;

			when s4=>
			    A <= '0';
				T2 <= '1';	
				n_state <= s1;

		end case;
	end process;
end behavior;
					
