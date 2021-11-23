----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 12:03:10
-- Design Name: 
-- Module Name: nrzi_decoding - Behavioral
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

entity nrzi_decoding is
    port (  inp : in std_logic;
            prev_inp : in std_logic;
            data_stuffed : out std_logic);
end nrzi_decoding;

architecture Behavioral of nrzi_decoding is

begin
    data_stuffed <= '1' when (inp = prev_inp) else
                    '0';

end Behavioral;
