----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2021 16:18:54
-- Design Name: 
-- Module Name: eop_detector - Behavioral
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

entity eop_detector is
port(   D_pos_input : in std_logic;
        D_neg_input : in std_logic;
        reset : in std_logic;
        clock : in std_logic;
        outp : out std_logic);
end eop_detector;

architecture Behavioral of eop_detector is
type eop_state_type  is (S0,S1,S2,S3); 
signal eop_state,next_eop_state:eop_state_type;
begin

    eop_detector : process (eop_state, D_pos_input,D_neg_input)
    begin
    case eop_state is
        when S0 =>
            if(D_pos_input = '0' and D_neg_input = '0') then next_eop_state <= S1; outp <= '0';
            else next_eop_state <= S0; outp <= '0';
            end if;
        when S1 => 
            if(D_pos_input = '0' and D_neg_input = '0') then next_eop_state <= S2; outp <= '0';
            else next_eop_state <= S0; outp <= '0';
            end if;
        when S2 =>
            if(D_pos_input = '0' and D_neg_input = '1') then next_eop_state <= S3; outp <= '0';
            else next_eop_state <= S0; outp <= '0';
            end if;
        when S3 =>
            outp <= '1';
            next_eop_state <= S0;
    end case;
    end process eop_detector;

    updation : process (clock,reset)
    begin
    if(reset = '1') then eop_state <= S0;
    elsif rising_edge(clock) then eop_state <= next_eop_state;
    end if;
    end process;
end Behavioral;
