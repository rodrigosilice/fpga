----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2015 20:37:03
-- Design Name: 
-- Module Name: Exercicio1 - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Exercicio1 is
    Port (
    -- Clk e rst
        clk : in std_logic; -- 100Mhz
        btnCpuReset : in std_logic; -- RST em '0'
    -- IOs
        sw : in std_logic_vector(15 downto 0);
        led : out std_logic_vector(15 downto 0)
       
     );
end Exercicio1;

architecture Behavioral of Exercicio1 is

    signal in_mux : std_logic_vector(2 downto 0);
    signal SS_mux : std_logic_vector(1 downto 0);
    signal out_mux : std_logic;

begin

    mux1: process(ss_mux, in_mux)
    begin
        if(ss_mux = "00") then
            out_mux <=in_mux(0);
        elsif (ss_mux = "01") then
            out_mux <=in_mux(1);
        else
            out_mux<=in_mux(2);
        end if;
        
    end process;

--    mux2: process(ss_mux, in_mux)
--    begin
--        case ss_mux is 
        
--        when "00" => out_mux <=in_mux(0);
--        when "01" => out_mux <=in_mux(1);
--        when Others => out_mux <=in_mux(2);
        
--        end case;
--    end process;            

    in_mux <= sw(2 downto 0);
    ss_mux <= sw(4 downto 3);
    led(0) <= out_mux;


end Behavioral;
