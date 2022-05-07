----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2019 00:05:32
-- Design Name: 
-- Module Name: fir_filt_reg - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fir_filt_reg is
    Port ( 
        clk                 : in std_logic; 
        resetn              : in std_logic;
        data_out            : out std_logic_vector(15 downto 0);
        s_axis_data_tdata   : in std_logic_vector(15 downto 0);
        s_axis_data_tvalid  : in std_logic
    );
end fir_filt_reg;

architecture Behavioral of fir_filt_reg is

signal out_r : std_logic_vector(15 downto 0);
begin

filt_reg: process (clk) 
begin
   if rising_edge(clk) then
      if resetn='0' then 
         out_r <= (others => '0');
      elsif s_axis_data_tvalid = '1' then
       --  out_r <= s_axis_data_tdata(31 downto 16);
		out_r <= s_axis_data_tdata(15 downto 0);
      end if;
   end if;
end process; 

data_out <= out_r;
end Behavioral;
