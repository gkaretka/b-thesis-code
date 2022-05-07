----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2019 03:13:26 PM
-- Design Name: 
-- Module Name: dac_reg - Behavioral
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

entity dac_reg is
    Port (  clk :in std_logic;
            resetn              : in std_logic;
            dac_ch0     : in std_logic_vector(15 downto 0);
            dac_ch1     : in std_logic_vector(15 downto 0);
            oe_dac      : in std_logic;
            m_axis_data_tdata : out STD_LOGIC_VECTOR (31 downto 0);
            m_axis_data_tvalid : out STD_LOGIC);
end dac_reg;

architecture Behavioral of dac_reg is

signal out_r : std_logic_vector(31 downto 0);

begin

dac_reg: process (clk) 
begin
   if rising_edge(clk) then
      if resetn='0' then 
         out_r <= (others => '0');
      elsif oe_dac = '0' then
         out_r <= (others => '0');
         else
       --  out_r <= s_axis_data_tdata(31 downto 16);
		-- out_r <=  "00" & STD_LOGIC_VECTOR((RESIZE(signed(dac_ch0),14))) & "00" & STD_LOGIC_VECTOR((RESIZE(signed(dac_ch1),14)));
		out_r <= "00" & dac_ch1(15 downto 2) & "00" & dac_ch0(15 downto 2);
      end if;
   end if;
end process; 

m_axis_data_tdata <= out_r;
m_axis_data_tvalid <= '1';

end Behavioral;
