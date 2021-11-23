----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2021 08:32:33
-- Design Name: 
-- Module Name: pll_tb - Behavioral
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

entity pll_tb is
end pll_tb;

architecture tb of pll_tb is
signal input, clock, reset : std_logic;

begin
UUT : entity work.pll port map(input => input, clock =>Clock, reset => Reset);

    clk : process
    begin
    clock <= '0';
    wait for 10ns;
    clock <= '1';
    wait for 10ns;
    end process clk;
    
    rst : process 
    begin
    reset <= '1';
    wait for 2ns;
    reset <= '0';
    wait;
    end process rst;
    
    inp : process
    begin
    input <= '0';
    wait for 13ns;
    input <= '1';
    wait for 13ns;
    end process inp; 
end tb;
