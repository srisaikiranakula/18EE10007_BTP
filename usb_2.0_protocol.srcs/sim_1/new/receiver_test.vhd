----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.10.2021 15:28:13
-- Design Name: 
-- Module Name: receiver_test - Behavioral
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

entity receiver_test is
end receiver_test;

architecture Behavioral of receiver_test is

component receiver is
port (  clk : in std_logic;
        reset : in std_logic;
        input : in std_logic;
        start : out std_logic);
end component;
signal clock,reset,input : std_logic;
signal start : std_logic;
begin

dut : receiver port map(clk => clock, input => input, reset => reset , start => start);

clk : process 
begin 
clock <= '1';
wait for 10ns;
clock <= '0';
wait for 10ns;
end process clk;

inp : process 
begin
wait for 5ns;
input <= '0';
wait for 20ns;
input <= '1';
wait for 20ns;
input <= '0';
wait for 20ns;
input <= '1';
wait for 20ns;
input <= '0';
wait for 20ns;
input <= '1';
wait for 20ns;
input <= '0';
wait for 20ns;
end process inp;

rst : process 
begin
reset <= '1';
wait for 2ns;
reset <= '0';
wait;
end process rst;

end Behavioral;
