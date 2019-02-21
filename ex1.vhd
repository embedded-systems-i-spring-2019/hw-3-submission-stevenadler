library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex1 is
    port (
        A, B    : in std_logic_vector(7 downto 0);
        CLK,SEL : in std_logic;
        LDA     : in std_logic;
        F       : out std_logic_vector(7 downto 0)
    );
end ex1;

architecture Behavioral of ex1 is

    signal s_mux_result : std_logic_vector(7 downto 0);

begin

    ra: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (LDA = '1') then
                F <= s_mux_result;
            end if;
        end if;
    end process;
    with SEL select
    s_mux_result <= A when '1',
                    B when '0',
                    (others => '0') when others;

end Behavioral;
