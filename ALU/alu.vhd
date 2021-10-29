----------------------------------------------------------------------------------
--Author: Sanjoy Paul; 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;



entity alu is
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           cin : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR(7 downto 0);
			  cout : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

--temporary signal declaration.
signal reg : STD_LOGIC_VECTOR(8 downto 0);

begin

	process(a, b, cin ,sel,reg )
	begin
		case (sel) is
		
		when "0000" =>
		y <= a ;
		cout <= '0';
		
		when "0001" =>
		reg <=  ('0' & a)+1;
		y <= reg(7 downto 0);
		cout <= reg(8);
		
		when "0010" =>
		y <= a - 1 ;
		cout <= '0';
		
		when "0011" =>
		y <= b ;
		
		when "0100" =>
		reg <= ('0' & b) + 1 ;
		y <= reg(7 downto 0);
		cout <= reg(8);
		
		when "0101" =>
		y <= b - 1 ;
		cout <= '0';
		
		when "0110" =>
		reg <= ('0' & a) + ('0' & b) ;
		y <= reg(7 downto 0);
		cout <= reg(8);
		
		when "0111" =>
		reg <= ('0' & a) + ('0' & b) + cin;
		y <= reg(7 downto 0);
		cout <= reg(8);
		
		when "1000" =>
		y <= not a ;
		cout <= '0';
		
		when "1001" =>
		y <= not b ;
		cout <= '0';
		
		when "1010" =>
		y <= a and b ;
		cout <= '0';
		
		when "1011" =>
		y <= a or b;
		cout <= '0';
		
		when "1100" =>
		y <= a nand b ;
		cout <= '0';
		
		when "1101" =>
		y <= a nor b ;
		cout <= '0';
		
		when "1110" =>
		y <= a xor b;
		cout <= '0';
		
		when "1111" =>
		y <= a xnor b;
		cout <= '0';
		
		when others =>
		NULL;
	
		end case;
	end process;

end Behavioral;

