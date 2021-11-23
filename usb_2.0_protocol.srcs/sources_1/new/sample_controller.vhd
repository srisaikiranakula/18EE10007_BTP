----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2021 18:29:16
-- Design Name: 
-- Module Name: sample_controller - Behavioral
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

entity sample_controller is
port (
        rst : in std_logic;
        start : in std_logic;
        eop : in std_logic;
        transmitter_enable : in std_logic;
        receiver_enable : out std_logic);
end sample_controller;

architecture Behavioral of sample_controller is
signal rcv : std_logic;
begin

    enabling : process (rst,start,eop) is
    begin
        case rst is
            when '1' => receiver_enable <= '0';
            when others =>
                case transmitter_enable is
                    when '1' => receiver_enable <= '0';
                    when others => 
                        case start is 
                            when '1' => receiver_enable <= '1';
                            when others => 
                                case eop is 
                                    when '1' => receiver_enable <= '0';
                                    when others => 
                                end case;
                        end case;
                end case;
        end case;
        
    end process enabling;

    
    
end Behavioral;
