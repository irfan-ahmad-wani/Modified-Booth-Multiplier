library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BoothMultiplier is
  Port (
    multiplier : in STD_LOGIC_VECTOR(15 downto 0);
    multplcnt : in STD_LOGIC_VECTOR(15 downto 0);
    Partial_product_1 : buffer STD_LOGIC_VECTOR(31 downto 0);
    Partial_product_2 : buffer STD_LOGIC_VECTOR(31 downto 0);
    Partial_product_3 : buffer STD_LOGIC_VECTOR(31 downto 0);
    Partial_product_4 : buffer STD_LOGIC_VECTOR(31 downto 0);
    Partial_product_5 : buffer STD_LOGIC_VECTOR(31 downto 0);
    Partial_product_6 : buffer STD_LOGIC_VECTOR(31 downto 0);
    Partial_product_7 : buffer STD_LOGIC_VECTOR(31 downto 0);
    Partial_product_8 : buffer STD_LOGIC_VECTOR(31 downto 0)
    
    
  );
end BoothMultiplier;

architecture Behavioral of BoothMultiplier is

begin


  process(multiplier)
  begin
   -- Initialization of partial_product----
    Partial_product_1 <= (others => '0');
      case multiplier(1 downto 0) is
        when "00" => 
          Partial_product_1 <= (others => '0');
        when "01" =>
          Partial_product_1(31 downto 0) <= Partial_product_1(31 downto 16)& multplcnt;
        when "10" =>    
         Partial_product_1(31 downto 0) <=not Partial_product_1(31 downto 17) & ( not multplcnt +1)&'0';
        when "11" =>
          Partial_product_1(31 downto 0) <= not Partial_product_1(31 downto 16)&(not multplcnt +1);
       when others => 
     
          
        Partial_product_1 <= (others => '0');
      end case;
  
  end process;
  
  ---------22222222----------------------------
   process(multiplier)
  begin
  
    Partial_product_2 <= (others => '0');
   
      case multiplier(3 downto 1) is
        when "000"|"111" => 
          Partial_product_2 <= (others => '0');
        when "001" |"010" =>
          Partial_product_2(31 downto 0) <=Partial_product_2 (31 downto 18)& multplcnt&"00";
        when "011" =>
          Partial_product_2(31 downto 0 ) <= Partial_product_2 (31 downto 19)& multplcnt & "000";
        when "100" =>    
         Partial_product_2(31 downto 0) <=not Partial_product_2 (31 downto 19)&( not multplcnt +1)&"000";
       
           
        when "101"| "110" =>
          Partial_product_2(31 downto 0) <= not Partial_product_2 (31 downto 18)&not multplcnt +1&"00";
        when others =>
          Partial_product_2 <= (others => '0');
      end case;
  
  end process;
  ---------------------------------------33333333333---------------
   process(multiplier)
  begin
    
    Partial_product_3 <= (others => '0');
   
      case multiplier(5 downto 3) is
        when "000"|"111" => 
          Partial_product_3 <= (others => '0');
        when "001" |"010" =>
          Partial_product_3(31 downto 0) <=Partial_product_3 (31 downto 20)& multplcnt&"0000";
        when "011" =>
          Partial_product_3(31 downto 0 ) <= Partial_product_3 (31 downto 21)&  multplcnt & "00000";
        when "100" =>    
         Partial_product_3(31 downto 0) <=not Partial_product_3 (31 downto 21)&( not multplcnt +1)&"00000";
       
           
        when "101"| "110" =>
          Partial_product_3(31 downto 0) <= not Partial_product_3 (31 downto 20)&not multplcnt +1&"0000";
        when others =>
          
          Partial_product_3 <= (others => '0');
      end case;
 
  end process;
  ------------4444-------------------
   process(multiplier)
  begin
    
    Partial_product_4 <= (others => '0');
   
      case multiplier(7 downto 5) is
        when "000"|"111" => 
          Partial_product_4 <= (others => '0');
        when "001" |"010" =>
          Partial_product_4(31 downto 0) <=Partial_product_4 (31 downto 22)&  multplcnt &"000000";
        when "011" =>
          Partial_product_4(31 downto 0 ) <=Partial_product_4 (31 downto 23)&  multplcnt & "0000000";
        when "100" =>    
         Partial_product_4(31 downto 0) <=not Partial_product_4 (31 downto 23)&( not multplcnt +1)&"0000000";
       
           
        when "101"| "110" =>
          Partial_product_4(31 downto 0) <= not Partial_product_4 (31 downto 22)&not multplcnt +1&"000000";
        when others =>
         
          Partial_product_4 <= (others => '0');
      end case;
  
  end process;
   ---------555555----------------------------
   process(multiplier)
  begin
    
    Partial_product_5 <= (others => '0');
    
      case multiplier(9 downto 7) is
        when "000"|"111" => 
          Partial_product_5 <= (others => '0');
        when "001" |"010" =>
          Partial_product_5(31 downto 0) <=Partial_product_5 (31 downto 24)& multplcnt&"00000000";
        when "011" =>
          Partial_product_5(31 downto 0 ) <= Partial_product_5 (31 downto 25)& multplcnt & "000000000";
        when "100" =>    
         Partial_product_5(31 downto 0) <=not Partial_product_5 (31 downto 25)&( not multplcnt +1)&"000000000";
        when "101"| "110" =>
          Partial_product_5(31 downto 0) <= not Partial_product_5 (31 downto 24)&not multplcnt +1&"00000000";
        when others =>
          Partial_product_5 <= (others => '0');
      end case;
  
  end process;
  -----------------------6666--------------------
   process(multiplier)
  begin
    Partial_product_6 <= (others => '0');
      case multiplier(11 downto 9) is
        when "000"|"111" => 
          Partial_product_6 <= (others => '0');
        when "001" |"010" =>
          Partial_product_6(31 downto 0) <=Partial_product_6 (31 downto 26)& multplcnt&"0000000000";
        when "011" =>
          Partial_product_6(31 downto 0 ) <= Partial_product_6 (31 downto 27)&  multplcnt & "00000000000";
        when "100" =>    
         Partial_product_6(31 downto 0) <=not Partial_product_6 (31 downto 27)&( not multplcnt +1)&"00000000000";
       
           
        when "101"| "110" =>
          Partial_product_6(31 downto 0) <= not Partial_product_6 (31 downto 26)&not multplcnt +1&"0000000000";
        when others =>
        
          Partial_product_6 <= (others => '0');
      end case;
 
  end process;
  ------------777777777777777------
   process(multiplier)
  begin
    
    Partial_product_7 <= (others => '0');
    
 
      case multiplier(13 downto 11) is
        when "000"|"111" => 
          Partial_product_7 <= (others => '0');
        when "001" |"010" =>
          Partial_product_7(31 downto 0) <=Partial_product_7 (31 downto 28)&  multplcnt &"000000000000";
        when "011" =>
          Partial_product_7(31 downto 0 ) <=Partial_product_7 (31 downto 29)&  multplcnt & "0000000000000";
        when "100" =>    
         Partial_product_7(31 downto 0) <=not Partial_product_7 (31 downto 29)&( not multplcnt +1)&"0000000000000";       
        when "101"| "110" =>
          Partial_product_7(31 downto 0) <= not Partial_product_7 (31 downto 28)&not multplcnt +1&"000000000000";
        when others =>         
          Partial_product_7 <= (others => '0');
      end case;
  
  ----------------88888888888888888----------------------
  end process;
  
process(multiplier)
  begin
   
    Partial_product_8 <= (others => '0');
  
      case multiplier(15 downto 13) is
        when "000"|"111" => 
          Partial_product_8 <= (others => '0');
        when "001" |"010" =>
          Partial_product_8(31 downto 0) <=Partial_product_8 (31 downto 30)& multplcnt&"00000000000000";
        when "011" =>
          Partial_product_8(31 downto 0 ) <= Partial_product_8 (31)&  multplcnt & "000000000000000";
        when "100" =>    
         Partial_product_8(31 downto 0) <=not Partial_product_8 (31)&( not multplcnt +1)&"000000000000000";
                 
        when "101"| "110" =>
          Partial_product_8(31 downto 0) <= not Partial_product_8 (31 downto 30)&not multplcnt +1&"00000000000000";
        when others =>
         
          Partial_product_8 <= (others => '0');
      end case;
  end process;
  
end Behavioral;