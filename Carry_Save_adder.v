-------------------Carry Save adder and ripple carry adder section to sum partial products
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity booth_multiplier is
port(partial_product_1,partial_product_2,partial_product_3,partial_product_4,partial_product_5,partial_product_6,partial_product_7,partial_product_8 : in std_logic_vector(31 downto 0));
 end booth_multiplier;

architecture arch of booth_multiplier is
signal co_csa1 : std_logic_vector(31 downto 0);
signal co_csa2 : std_logic_vector(31 downto 0);
signal co_csa3 : std_logic_vector(31 downto 0);
signal co_csa4 : std_logic_vector(31 downto 0);
signal co_csa5 : std_logic_vector(31 downto 0);
signal co_csa6 : std_logic_vector(31 downto 0);
signal sum_csa1 : std_logic_vector(31 downto 0);
signal sum_csa2 : std_logic_vector(31 downto 0);
signal sum_csa3 : std_logic_vector(31 downto 0);
signal sum_csa4 : std_logic_vector(31 downto 0);
signal sum_csa5 : std_logic_vector(31 downto 0);
signal sum_csa6 : std_logic_vector(31 downto 0);

SIGNAL rca_sum : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL rca_cout : STD_LOGIC;
signal cin_to_rca:  std_logic_vector(31 downto 0);

component CSA is
  port (p,q,r:in std_logic_vector(31 downto 0); 
  sm,cr: buffer std_logic_vector(31 downto 0));
end component;
COMPONENT rca is
        PORT (
            a, b: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            cin: IN STD_LOGIC;
            sout: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            cout: OUT STD_LOGIC
        );
    END COMPONENT;

  begin
  --stage1
     a0: CSA port map (p => partial_product_1,q => partial_product_2,r => partial_product_3,sm => sum_csa1,cr => co_csa1);
   --stage2
     a1:CSA port map (p => sum_csa1,q => co_csa1,r => partial_product_4,sm => sum_csa2,cr => co_csa2);
  --stage3
     a3:CSA port map (p => sum_csa2 , q => co_csa2,r => partial_product_5, sm => sum_csa3 ,cr => co_csa3);
     --stage 4
     a4:CSA port map (p => sum_csa3,q => co_csa3,r => partial_product_6,sm => sum_csa4,cr => co_csa4);
     --stage5
     a5: CSA port map (p => sum_csa4,q => co_csa4,r => partial_product_7,sm => sum_csa5,cr => co_csa5);
     --stage6
     a6: CSA port map (p => sum_csa5 ,q => co_csa5,r => partial_product_8,sm => sum_csa6,cr => co_csa6);
  ------32 16 bit ripple carry adder
     Ripple_carry_adder : rca PORT MAP (a => sum_csa6, b => co_csa6, cin => '0', sout =>rca_sum, cout => rca_cout);
  end arch;

library ieee;
use ieee.std_logic_1164.all;
entity CSA is
   port (p,q,r : in std_logic_vector(31 downto 0);
   sm,cr: buffer std_logic_vector(31 downto 0));
end CSA;

architecture behavioural of CSA is
  begin
 PROCESS(p, q, r)
 VARIABLE c: STD_LOGIC_VECTOR(31 DOWNTO 0);
 BEGIN
 
 FOR i IN 0 TO 31 LOOP
 sm(i) <= p(i) XOR q(i) XOR r(i);
 c(i) := (p(i) AND q(i)) OR (p(i) AND r(i)) OR (q(i) AND r(i));
 END LOOP;
 cr <= c;
 
 end process;
 end behavioural;
   
 ------ripple carry adder
LIBRARY ieee;
USE ieee.std_logic_1164.all;
 entity rca IS

 port (a, b: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
 cin: IN STD_LOGIC;
 sout: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
 cout: OUT STD_LOGIC);
end rca;
 --------------------------------------------------------
ARCHITECTURE structure OF rca IS
signal cin_to_rca:  std_logic_vector(31 downto 0);

BEGIN
 PROCESS(a, b, cin)
 variable d: STD_LOGIC_VECTOR(31 DOWNTO 0);
 BEGIN
 d(0) := cin ;
 FOR i IN 1 TO 31 LOOP
 sout(i) <= a(i) XOR b(i) XOR d(i);
 d(i) := (a(i) AND b(i)) OR (a(i) AND d(i-1)) OR (b(i) AND d(i-1));
 END LOOP;
 cout <= d(31);
 cin_to_rca <= d;
 END PROCESS;
 END ARCHITECTURE;