----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2015 21:43:21
-- Design Name: 
-- Module Name: Exercicio2 - Behavioral
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

entity Exercicio2 is
    Port (
    -- Clk e rst
        clk : in std_logic; -- 100Mhz
        btnCpuReset : in std_logic; -- RST em '0'
    -- IOs
        sw : in std_logic_vector(15 downto 0);
        led : out std_logic_vector(15 downto 0)
       
         );
end Exercicio2;

architecture Behavioral of Exercicio2 is
    
    signal cnt : integer range 0 to 100_000_000 := 0;
    signal led_i : std_logic := '0';

begin
    contador:process(clk, btnCpuReset)
    begin
        if(btnCpuReset = '1') then
            cnt <= 0;
        elsif(rising_edge(clk)) then
            if (cnt = 100_000_000) then
                cnt <= 0;
                led_i<= not led_i;
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    led(0) <= led_i;

end Behavioral;
