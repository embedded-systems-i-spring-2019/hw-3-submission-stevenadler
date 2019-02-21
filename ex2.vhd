library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4t1 is
    port (
        D3,D2,D1,D0 : in std_logic_vector(7 downto 0);
        sel         : in std_logic_vector(1 downto 0);
        mux_out      : out std_logic_vector(7 downto 0));
end mux4t1;

architecture mux of mux4t1 is
begin
    mux_out <=  D3 when (sel = "00") else
                D2 when (sel = "01") else
                D1 when (sel = "10") else
                D0 when (sel = "11");
end mux;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ex2 is
    port (
        X, Y, Z    : in std_logic_vector(7 downto 0);
        MS         : in std_logic_vector(1 downto 0);
        CLK,DS     : in std_logic;
        RA, RB     : out std_logic_vector(7 downto 0)
    );
end ex2;

architecture Behavioral of ex2 is

component mux
    port (
        D3,D2,D1,D0 : in std_logic_vector(7 downto 0);
        sel : in std_logic_vector(1 downto 0);
        mux_out : out std_logic_vector(7 downto 0)
    );
end component;

                
    signal mux_result  : std_logic_vector(7 downto 0);
    signal dec_resulta : std_logic;
    signal dec_resultb : std_logic;
    signal rega_result : std_logic_vector(7 downto 0);
    signal regb_result : std_logic_vector(7 downto 0);

begin

dec_resultb <= DS;
dec_resulta <= not DS;

m1: mux
    port map ( D3 => X,
               D2 => Y,
               D1 => Z,
               D0 => regb_result,
               sel => MS,
               mux_out => mux_result);

rega: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (dec_resulta = '1') then
                rega_result <= mux_result;
            end if;
        end if;
        RA <= rega_result;
    end process;
regb: process(CLK) -- process
    begin
        if (rising_edge(CLK)) then
            if (dec_resultb = '1') then
                regb_result <= rega_result;
            end if;
        end if;
        RB <= regb_result;
    end process;
    

end Behavioral;
