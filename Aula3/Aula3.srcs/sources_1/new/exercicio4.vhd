----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2015 22:12:51
-- Design Name: 
-- Module Name: exercicio4 - Behavioral
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

entity exercicio4 is
    Port ( 
        
        a_data      : in std_logic_vector(7 downto 0);
        b_data      : in std_logic_vector(7 downto 0);
        
        soma_ab       : out std_logic_vector(15 downto 0)
        
    
    );
end exercicio4;

architecture Behavioral of exercicio4 is

begin

    soma_ab <= std_logic_vector(unsigned(a_data) + unsigned(b_data));


end Behavioral;


--teste