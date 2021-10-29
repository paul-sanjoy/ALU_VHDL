--Author: Sanjoy Paul;
---------------------------------------------------------------

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY alu_tb IS
  END alu_tb;

  ARCHITECTURE behavior OF alu_tb IS 

  -- Component Declaration
          COMPONENT alu
          Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           cin : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR(7 downto 0);
			  cout : out  STD_LOGIC);
			  
          END COMPONENT;

          signal a,b: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
			 signal cin : STD_lOGIC := '0' ;
			 signal sel : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
			 signal y : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
			 signal cout : STD_lOGIC := '0' ;
          

  BEGIN

  -- Component Instantiation
          uut: alu PORT MAP(
                  a => a ,
                  b => b ,
						cin => cin ,
						sel => sel ,
						y => y ,
						cout => cout
						);


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	  
	  a <= "11111111" ; -- a= 255
	  b <= "00000010" ; -- b= 2
	  cin <= '1' ; --cin= 1
	  
	  sel <= "0000"; --a
	  wait for 20 ns;
	  
	  sel <= "0001"; --a+1
	  wait for 20 ns;

	  sel <= "0010"; --a-1
	  wait for 20 ns;

	  sel <= "0011"; --b
	  wait for 20 ns;

	  sel <= "0100"; --b+1
	  wait for 20 ns;

	  sel <= "0101"; --b-1
	  wait for 20 ns;

	  sel <= "0110"; --a+b
	  wait for 20 ns;

	  sel <= "0111"; --a+b+cin
	  wait for 20 ns;

	  sel <= "1000"; --not a
	  wait for 20 ns;

	  sel <= "1001"; --not b
	  wait for 20 ns;

	  sel <= "1010"; --a and b
	  wait for 20 ns;

	  sel <= "1011"; --a or b
	  wait for 20 ns;

	  sel <= "1100"; --a nand b
	  wait for 20 ns;

	  sel <= "1101"; --a nor b
	  wait for 20 ns;

	  sel <= "1110"; --a xor b
	  wait for 20 ns;

	  sel <= "1111"; --a xnor b
	  wait for 20 ns;

     END PROCESS tb;
  --  End Test Bench 

  END;
