library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex5 is
    port (
        A,B,C         : in std_logic_vector(7 downto 0);
        CLK,SL1,SL2   : in std_logic;
        RAX,RBX          : out std_logic_vector(7 downto 0)
    );

end ex5;

architecture Behavioral of ex5 is

    signal mux_result : std_logic_vector(7 downto 0);
    signal dec_resulta : std_logic;
    signal dec_resultb : std_logic;

begin
rega: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (dec_resulta = '1') then
                RAX <= A;
            end if;
        end if;
    end process;
regb: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (dec_resultb = '1') then
                RBX <= mux_result;
            end if;
        end if;
    end process;
    
dec_resulta <= SL1;
dec_resultb <= not SL1;

with SL2 select
    mux_result <= B when '1',
                  C when '0',
                   (others => '0') when others;

end Behavioral;
