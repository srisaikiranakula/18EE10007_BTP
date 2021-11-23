----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 12:25:23
-- Design Name: 
-- Module Name: start_of_packet_detector - Behavioral
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

entity start_of_packet_detector is
port (  D_pos_input : in std_logic;
        D_neg_input : in std_logic;
        reset : in std_logic;
        clock : in std_logic;
        outp : out std_logic);
end start_of_packet_detector;

architecture Behavioral of start_of_packet_detector is
type sop_state_type  is (S0,S1,S2,S3,S4,S5,S6,S7,S8); 
signal sop_state,next_sop_state:sop_state_type;
begin

    sop_detector : process (sop_state, D_pos_input,D_neg_input)
    begin
    case sop_state is
    when S0 => 
        if(D_pos_input = '1' and D_neg_input = '0') then next_sop_state <= S1; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if;
    when S1 => 
        if(D_pos_input = '0' and D_neg_input = '1') then next_sop_state <= S2; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if;
    when S2 => 
        if(D_pos_input = '1' and D_neg_input = '0') then next_sop_state <= S3; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if;
    when S3 => 
        if(D_pos_input = '0' and D_neg_input = '1') then next_sop_state <= S4; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if;  
    when S4 => 
        if(D_pos_input = '1' and D_neg_input = '0') then next_sop_state <= S5; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if;
    when S5 => 
        if(D_pos_input = '0' and D_neg_input = '1') then next_sop_state <= S6; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if; 
    when S6 => 
        if(D_pos_input = '1' and D_neg_input = '0') then next_sop_state <= S7; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if; 
    when S7 => 
        if(D_pos_input = '1' and D_neg_input = '0') then next_sop_state <= S8; outp <= '0';
        else next_sop_state <= S0; outp <= '0';
        end if; 
    when S8 => 
        outp <= '1';
        next_sop_state <= S0;
    end case;
    end process;
    
    updation : process (clock,reset)
    begin
    if(reset = '1') then sop_state <= S0;
    elsif rising_edge(clock) then sop_state <= next_sop_state;
    end if;
    end process;
end Behavioral;
