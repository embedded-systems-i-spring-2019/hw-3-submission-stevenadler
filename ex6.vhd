library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex6 is
    port (
        A,B,C         : in std_logic_vector(7 downto 0);
        CLK,SEL1,SEL2   : in std_logic;
        RAP,RBP          : out std_logic_vector(7 downto 0)
    );

end ex6;

architecture Behavioral of ex6 is

    signal mux_result : std_logic_vector(7 downto 0);
    signal dec_resulta : std_logic;
    signal dec_resultb : std_logic;

begin
rega: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (dec_resulta = '1') then
                RAP <= mux_result;
            end if;
        end if;
    end process;
regb: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (dec_resultb = '1') then
                RBP <= C;
            end if;
        end if;
    end process;
    
dec_resulta <= SEL2;
dec_resultb <= not SEL2;

with SEL1 select
    mux_result <= A when '1',
                  B when '0',
                   (others => '0') when others;

end Behavioral;
