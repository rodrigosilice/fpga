----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2015 19:28:21
-- Design Name: 
-- Module Name: Projeto1 - Behavioral
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


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Projeto1 is
    generic(
        fclk : natural := 100; -- frequencia do clk (Mhz)
        f7s : natural := 100 -- frequencia de atualizacao dos displays (Hz)
    );
    port(
        clk : in STD_LOGIC;
        btnCpuReset : in STD_LOGIC;
        led : out STD_LOGIC_VECTOR (15 downto 0):=X"0000";
        seg : out STD_LOGIC_VECTOR (6 downto 0) := "0000000";
        an : out STD_LOGIC_VECTOR (7 downto 0) := X"00";
        dp : out STD_LOGIC
    );
end Projeto1;

architecture Behavioral of Projeto1 is
    
   type ram_type is array (7 downto 0) of integer range 0 to 9;
  signal RAM : ram_type:= (0,1,2,3,4,5,6,7);

--constant SS1_valor : integer range 0 to 9 := 2;
--constant SS1_valor : integer range 0 to 9 := 1;
constant SS1_valor : integer range 0 to 20 := 0;

signal display0 :std_logic_vector(6 downto 0) := "1000000";
signal display1 :std_logic_vector(6 downto 0) := "1111001";
signal display2 :std_logic_vector(6 downto 0) := "0100100";
signal display3 :std_logic_vector(6 downto 0) := "0110000";
signal display4 :std_logic_vector(6 downto 0) := "0011001";
signal display5 :std_logic_vector(6 downto 0) := "0010010";
signal display6 :std_logic_vector(6 downto 0) := "0000010";
signal display7 :std_logic_vector(6 downto 0) := "1111000";
signal display8 :std_logic_vector(6 downto 0) := "0000000";
signal display9 :std_logic_vector(6 downto 0) := "0010000";
 
signal saida :std_logic_vector(7 downto 0):=X"11";
signal saida1 :std_logic_vector(6 downto 0):="1111111";

signal cnt : integer range 0 to 100_000_000 := 0;
signal pos : integer range 0 to 7:=0;

signal numero : integer range 0 to 9 :=0;

signal led_i : std_logic := '0';

begin

contador:process(clk, btnCpuReset)
begin

    numero<=ram(pos);

    if(btnCpuReset = '0') then
        cnt <= 0;
        saida<="00000000";
    elsif(rising_edge(clk)) then
        if (cnt = fclk*8) then
            cnt <= 0;
            pos<=pos+1;
            if (pos>7) then
                pos <=0;
            end if;
        else
            cnt <= cnt + 1;   
        end if;
        Case pos is
               when 0 => saida<="11111110";
               when 1 => saida<="11111101";
               when 2 => saida<="11111011";
               when 3 => saida<="11110111";
               when 4 => saida<="11101111";
               when 5 => saida<="11011111";
               when 6 => saida<="10111111";
               when 7 => saida<="01111111";
        end case;
        
         Case numero is
                    when 0 => saida1<= display0; 
                    when 1 => saida1<= display1;
                    when 2 => saida1<= display2;
                    when 3 => saida1<= display3;
                    when 4 => saida1<= display4;
                    when 5 => saida1<= display5;
                    when 6 => saida1<= display6;
                    when 7 => saida1<= display7;
                    when 8 => saida1<= display8;
                    when 9 => saida1<= display9;
        end case;
        an<=saida;
        seg<=saida1;
    end if;
end process;

-- WITH pos SELECT
--                saida<="11111110" when 0,
--                       "11111101" when 1,
--                       "11111011" when 2,
--                       "11110111" when 3,
--                       "11101111" when 4,
--                       "11011111" when 5,
--                       "10111111" when 6,
--                       "01111111" when 7,
--                       "11111111" when others;
                       
-- WITH numero SELECT
--                saida1<= display0 when 0,
--                         display1  when 1,
--                         display2  when 2,
--                         display3  when 3,
--                         display4  when 4,
--                         display5  when 5,
--                         display6  when 6,
--                         display7  when 7,
--                         display8  when 8,
--                         display9  when 9;



end Behavioral;
