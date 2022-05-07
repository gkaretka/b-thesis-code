----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2019 23:20:09
-- Design Name: 
-- Module Name: bpsk_mod - Behavioral
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

entity bpsk_mod is
    Port ( FIRout, ROMout   : out  STD_LOGIC_VECTOR (15 downto 0);
			  CNTout   : out  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in  STD_LOGIC;
			  reset : in std_logic;
			  clk4 : out  STD_LOGIC);
end bpsk_mod;

architecture Behavioral of bpsk_mod is


begin

  
end Behavioral;
