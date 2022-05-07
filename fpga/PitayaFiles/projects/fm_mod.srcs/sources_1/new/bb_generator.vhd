----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2019 08:28:55 AM
-- Design Name: 
-- Module Name: bb_generator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bb_generator is
    Port ( clk : in STD_LOGIC;
           ce : in STD_LOGIC;
           resetn : in std_logic;
           btn_i : in std_logic;
           addr : out STD_LOGIC_VECTOR (15 downto 0);
           oe_out : out STD_LOGIC);
end bb_generator;

architecture Behavioral of bb_generator is

signal addr_cnt: unsigned(15 downto 0);
signal clr_cnt : std_logic := '0';

begin


ad_counter: process (clk) 
begin
   if rising_edge(clk) then
      if resetn='0' or clr_cnt = '1' then 
         addr_cnt <= (others => '0');
        elsif ce='1' then
            if addr_cnt < X"F745" then
                addr_cnt <= addr_cnt + 1;
                oe_out	<= '1';
            else 
                oe_out	<= '0';	
            end if;
       end if;
   end if;
end process; 

clr_proc : process(clk)
begin
    if rising_edge(clk) then
        if btn_i = '1' then
            clr_cnt <= '1';
        elsif addr_cnt < X"F745" then
            clr_cnt <= '0';
        end if;
    end if;
end process;

addr <= std_logic_vector(addr_cnt);

end Behavioral;
