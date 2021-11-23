----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2021 12:35:26
-- Design Name: 
-- Module Name: crc5_checker - Behavioral
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

entity crc5_checker is
port (  data : in std_logic_vector (10 downto 0);
        crc5 : in std_logic_vector (4 downto 0);
        rst : in std_logic;
        clk : in std_logic;
        crc5_en : in std_logic;
        check : out std_logic_vector(1 downto 0));
end crc5_checker;

architecture Behavioral of crc5_checker is

signal index : integer;
signal new_reminder, prev_reminder : std_logic_vector (4 downto 0);
--signal data_bit,data_comp : std_logic;
--signal data_comp : std_logic;
begin
    
    checker : process (clk,rst,data,crc5) 
    --variable index : integer;
    variable xor_comp : std_logic;
    variable xor_comp_5 : std_logic_vector(4 downto 0);
    variable crc5_calc : std_logic_vector(4 downto 0);
    begin
        if(rst = '1' or crc5_en = '0') then 
            index <= 10;
            prev_reminder <= "11111";
            new_reminder <= "11111";
            check <= "00";
            
        else
            if(index >= 0 and crc5_en = '1') then
                new_reminder(4) <= prev_reminder(3);
                new_reminder(3) <= prev_reminder(2);
                new_reminder(2) <= prev_reminder(1) xor (data(index) xor prev_reminder(4));
                new_reminder(1) <= prev_reminder(0);
                new_reminder(0) <= (data(index) xor prev_reminder(4));
                
                --index <= index-1;
                --prev_reminder <= new_reminder;
            end if;
        end if;
        
        if(rising_edge(clk) and crc5_en = '1') then
            crc5_calc := new_reminder;
            prev_reminder <= new_reminder;
            index <= index-1;
        end if;
        
        if(index = -1 and crc5_en = '1') then
            if(crc5 = crc5_calc) then
                check <= "01";
            else
                check <= "11";
            end if;
        end if;
        
        if(crc5_en = '0') then
            check <= "00";
        end if;
    end process checker;

end Behavioral;
