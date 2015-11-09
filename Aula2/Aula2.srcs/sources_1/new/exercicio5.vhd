----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2015 22:24:54
-- Design Name: 
-- Module Name: exercicio5 - Behavioral
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

entity exercicio5 is
    Port (
            in0      : in std_logic;
            in1      : in std_logic;
            in2      : in std_logic;
            addr     : in std_logic_vector(1 downto 0);
            
            dout     : in std_logic
    
     );
end exercicio5;

architecture Behavioral of exercicio5 is

begin

    dout <= in0 when addr = "00" else
            in1 when addr = "01" else
            in2 when addr = "10" else
            "0";
    
    with addr select
        dout <= in0 when "00" 
                in1 when "01"
                in2 when "10"
                "0" when others;
    

end Behavioral;
