----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2015 21:50:50
-- Design Name: 
-- Module Name: exercicio3 - Behavioral
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

ENTITY exercicio3 IS
END exercicio3;


ARCHITECTURE bhv OF exercicio3 IS
-- Declaracoes sinais e constantes
    signal slv : std_logic_vector(7 downto 0);
    signal s : signed(7 downto 0);
    signal us : unsigned(7 downto 0);
    signal i : integer range 0 to 12;

BEGIN

    -- Signed
    slv <= std_logic_vector(s);
    us <= unsigned(std_logic_vector(s));
    i <= to_integer(s);
    -- std_logic_vector
    s <= signed(slv);
    us <= unsigned(slv);
    i <=  to_integer(unsigned(slv));
    -- unsigned
    slv <=std_logic_vector(us);
    s <= signed(std_logic_vector(us));
    i <= to_integer(us);
    -- integer
    slv <= std_logic_vector(to_signed(i,8));
    s <= to_signed(i,8);
    us <= to_unsigned(i,8);


END bhv;
