library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex3 is
    port (
        X,Y         : in std_logic_vector(7 downto 0);
        CLK,S1,S0   : in std_logic;
        LDA,LDB     : in std_logic;
        RB          : out std_logic_vector(7 downto 0)
    );

end ex3;

architecture Behavioral of ex3 is

    signal mux0_result : std_logic_vector(7 downto 0);
    signal mux1_result : std_logic_vector(7 downto 0);
    signal rega_result : std_logic_vector(7 downto 0);
    signal regb_result : std_logic_vector(7 downto 0);

begin
rega: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (LDA = '1') then
                rega_result <= mux0_result;
            end if;
        end if;
    end process;
regb: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (LDB = '1') then
                regb_result <= mux1_result;
            end if;
        end if;
        RB <= regb_result;
    end process;
with S0 select
    mux0_result <= X when '1',
                   regb_result when '0',
                   (others => '0') when others;
with S1 select
    mux1_result <= rega_result when '1',
                   Y when '0',
                   (others => '0') when others;
end Behavioral;
