----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2019 02:42:56 PM
-- Design Name: 
-- Module Name: status_reg_conc - Behavioral
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

entity status_reg_conc is
    Port ( sts_data : in STD_LOGIC_VECTOR (19 downto 0);
           sts_reg : out STD_LOGIC_VECTOR (31 downto 0));
end status_reg_conc;

architecture Behavioral of status_reg_conc is

begin

sts_reg <= "000000000000" & sts_data;

end Behavioral;
