--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:20:23 04/08/2015
-- Design Name:   
-- Module Name:   D:/marsaler/vyuka/MSWR2015/cv8_9_BPSK_QPSK_LinzStyle/Lab4_students/TB1.vhd
-- Project Name:  Lab4_students
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 USE ieee.std_logic_signed.ALL;
USE std.textio.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB1 IS
END TB1;
 
ARCHITECTURE behavior OF TB1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bpsk_mod
    PORT(
         FIRout : OUT  std_logic_vector(15 downto 0);
         ROMout : OUT  std_logic_vector(15 downto 0);
         CNTout : OUT  std_logic_vector(3 downto 0);
         reset : in std_logic;
         clk : IN  std_logic;
         clk4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	SIGNAL wr_enable:     STD_LOGIC := '0';
 	--Outputs
   signal FIRout : std_logic_vector(15 downto 0);
   signal ROMout : std_logic_vector(15 downto 0);
   signal CNTout : std_logic_vector(3 downto 0);
   signal clk4 : std_logic;
   signal reset : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant clk4_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bpsk_mod PORT MAP (
          FIRout => FIRout,
          ROMout => ROMout,
          CNTout => CNTout,
          clk => clk,
          reset => reset,
          clk4 => clk4
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
      reset<='0', '1' after 20 ns, '0' after 30 ns;
      -- insert stimulus here 

      wait;
   end process;




PROCESS BEGIN
	 wr_enable <= '0'; WAIT FOR clk_period/2;
    wr_enable <= '1'; WAIT FOR clk_period/2;
  END PROCESS; 

write_input: PROCESS

    VARIABLE number: INTEGER := 0;                  -- jeden element, ktery vzdy zapisujes souboru

    TYPE file_integer IS FILE OF INTEGER;           -- definice typu souboru s primo ulozenymi integery
    VARIABLE jeden_radek: line;                     -- jedno cislo na jeden radek (v ASCII souboru)
    FILE File_ID_1: file_integer;                   -- identifikator datoveho souboru
    FILE File_ID_2: text;                           -- identifikator textoveho souboru

    VARIABLE pocet_zapsanych_cisel: INTEGER := 0;   -- pocitadlo

  BEGIN
    FILE_OPEN(File_ID_1, "filt_out_1.txt", WRITE_MODE);
    FILE_OPEN(File_ID_2, "filt_out_2.txt", WRITE_MODE);

    WHILE NOT (pocet_zapsanych_cisel = 1000) LOOP

      WAIT UNTIL wr_enable = '0';
      number := CONV_INTEGER(FIRout);
      WRITE (File_ID_1, number);

      WRITE (jeden_radek, INTEGER'image(number));
      WRITELINE (File_ID_2,jeden_radek);

      pocet_zapsanych_cisel := pocet_zapsanych_cisel + 1;

    END LOOP;

    FILE_CLOSE(File_ID_1);
    FILE_CLOSE(File_ID_2);
    WAIT;
  END PROCESS;



END;
