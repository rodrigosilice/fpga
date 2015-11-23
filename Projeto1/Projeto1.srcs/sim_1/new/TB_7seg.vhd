

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_7seg is
end tb_7seg;

architecture Behavioral of tb_7seg is
    
--------------------------
-- componentes
--------------------------

    -- Declaramos aqui a utilizacao do componente
    COMPONENT Projeto1 is
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
     end COMPONENT;
   
--------------------------
-- sinais
--------------------------
    signal s_clk      : std_logic := '0';
    signal s_btnCpuReset   : std_logic;
           
--------------------------
-- constant
-------------------------- 
--constant half_period : time := 0.005 ns;   --100 Mhz
constant half_period : time := 0.5 ns;   -- 10Khz

  
begin
    u1 : projeto1
    GENERIC MAP(
        fclk => 10_000,
        f7s => 100
    )
    PORT MAP(
        clk => s_clk,
        btnCpuReset => s_btnCpuReset,
        led => OPEN,
        seg => OPEN,
        an => OPEN,
        dp => OPEN
    );
 
    
    -- Aqui mapeamos o compomente
    
--------------------------
-- clk
--------------------------
process
begin
    s_clk <= not s_clk;
    wait for half_period; -- meio periodo
    s_clk <= not s_clk;
    wait for half_period; -- meio periodo
end process;

--------------------------
-- btn_in 
--------------------------
process

begin
s_btnCpuReset <= '0';
wait for 10 ns;
s_btnCpuReset <= '1';

      
wait;
end process;


end Behavioral;