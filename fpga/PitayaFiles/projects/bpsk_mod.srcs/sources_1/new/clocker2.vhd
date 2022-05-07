----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:18:44 03/22/2016 
-- Design Name: 
-- Module Name:    clocker2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clocker2 is
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
			  clock_enable : in  STD_LOGIC;
           clk4o : out  STD_LOGIC;
           clk64o : out  STD_LOGIC;
           clk256o : out  STD_LOGIC;
           clk4n    :   out std_logic;
           clk64n   :   out std_logic;
           clk256n  :   out std_logic);
	--		  cnt64out: out std_logic_vector (5 downto 0));
end clocker2;

architecture Behavioral of clocker2 is

signal count4: unsigned(1 downto 0);
signal count64: unsigned(5 downto 0);
signal count256: unsigned(7 downto 0);
signal clk4 : std_logic;
signal clk64 : std_logic;
signal clk256 : std_logic;

begin
--cnt64out<=std_logic_vector(count64);
cnt4: process (clk) 
begin
   if rising_edge(clk) then
      if resetn='0' then 
         count4 <= (others => '0');
      elsif clock_enable='1' then
         count4 <= count4 + 1;
			if count4="00" then
				clk4<='1';
			else 
				clk4<='0';
			end if ;			
      end if;
   end if;
end process; 

cnt64: process (clk) 
begin
   if rising_edge(clk) then
      if resetn='0' then 
         count64 <= (others => '0');
      elsif clock_enable='1' then
         count64 <= count64 + 1;
			if count64="000000" then
				clk64<='1';
			else 
				clk64<='0';
			end if ;			
      end if;
   end if;
end process; 

cnt256: process (clk) 
begin
   if rising_edge(clk) then
      if resetn='0' then 
         count256 <= (others => '0');
      elsif clock_enable='1' then
         count256 <= count256 + 1;
			if count256="00000000" then
				clk256<='1';
			else 
				clk256<='0';
			end if ;			
      end if;
   end if;
end process; 



clk4n <= not clk4;
clk64n <= not clk64;
clk256n <= not clk256;

clk4o <= clk4;
clk64o <= clk64;
clk256o <= clk256;


end Behavioral;

