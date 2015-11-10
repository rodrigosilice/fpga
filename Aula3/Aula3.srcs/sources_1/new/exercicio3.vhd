----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2015 22:13:33
-- Design Name: 
-- Module Name: Exercicio3 - Behavioral
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

entity Exercicio3 is
   Port (  clk : in std_logic;
           rst : in std_logic;
           led : out std_logic;
           in_sw: in std_logic_vector(2 downto 0)
           
         );
end Exercicio3;

architecture Behavioral of Exercicio3 is

begin
signal cnt : integer range 0 to 100_000_000 := 0;
    signal led_i : std_logic := '0';

begin
    contador:process(clk, rst)
    begin
        if(rst = '1') then
            cnt <= 0;
        elsif(rising_edge(clk)) then
        
            case in_sw is
            when "00"
                if (cnt = 100_000_000) then
                    cnt <= 0;
                    led_i<= not led_i;
                else
                    cnt <= cnt + 1;
                end if;
                
        end if;
    end process;

    led <= led_i;

end Behavioral;
