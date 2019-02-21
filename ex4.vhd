library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex4 is
    port (
        X,Y         : in std_logic_vector(7 downto 0);
        CLK,S1,S0   : in std_logic;
        LDA,LDB,RD  : in std_logic;
        RA,RB          : out std_logic_vector(7 downto 0)
    );

end ex4;

architecture Behavioral of ex4 is

    signal mux0_result : std_logic_vector(7 downto 0);
    signal mux1_result : std_logic_vector(7 downto 0);
    signal rega_result : std_logic_vector(7 downto 0);
    signal regb_result : std_logic_vector(7 downto 0);
    signal anda_result : std_logic;
    signal andb_result : std_logic;

begin
rega_1: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (anda_result = '1') then
                rega_result <= mux1_result;
            end if;
        end if;
        RA <= rega_result;
    end process;
regb_1: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (andb_result = '1') then
                regb_result <= mux0_result;
            end if;
        end if;
        RB <= regb_result;
    end process;
    
anda_result <= LDA and RD;
andb_result <= LDB and not RD;

with S0 select
    mux0_result <= X when '1',
                   Y when '0',
                   (others => '0') when others;
with S1 select
    mux1_result <= regb_result when '1',
                   Y when '0',
                   (others => '0') when others;
end Behavioral;
