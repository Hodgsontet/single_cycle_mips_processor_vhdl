library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench_ram is
end testbench_ram;

architecture behave of testbench_ram is 
    signal I_RAM_EN:  std_logic := '0';
    signal I_RAM_RE:  std_logic := '0';
    signal I_RAM_WE:  std_logic := '0';
    signal I_RAM_ADDR: std_logic_vector (31 downto 0)   := (others=>'0');
    signal I_RAM_DATA: std_logic_vector (31 downto 0)   := (others=>'0');
    signal O_RAM_DATA: std_logic_vector(31 downto 0);
begin

    -- Design Under test
    DUT: entity work.RAM 
        port map(
          I_RAM_EN      => I_RAM_EN ,
          I_RAM_RE      => I_RAM_RE ,
          I_RAM_WE      => I_RAM_WE ,
          I_RAM_ADDR    => I_RAM_ADDR,
          I_RAM_DATA    => I_RAM_DATA,
          O_RAM_DATA    => O_RAM_DATA
        );
    -- Stimulus process
    stim_proc: process
        variable num_lines: integer := 32;
        -- The RAM range is 0x2000 - 0x20FF
        -- That is 8192 to 8447 in decimal
        variable address: integer := 8192;
    begin
        -- Hold Reset state for 10ns
        wait for 10 ns;
        --Test #01
        -- read the first 128 bytes of the RAM
        -- i.e. from 8192 to 8319
        -- 0x2000 - 0x207F
        for i in 0 to (num_lines-1) loop
            I_RAM_EN <= '1';
            I_RAM_RE <= '1';
            I_RAM_WE <= '0';
            I_RAM_ADDR <= std_logic_vector(to_unsigned(address, I_RAM_ADDR'length));
            wait for 10 ns;
            I_RAM_EN <= '0';
            address := address + 4;
            wait for 10 ns;
        end loop;
            -- Stop the RAM
            I_RAM_EN <= '0';
            I_RAM_RE <= '0';
            I_RAM_WE <= '0';
            wait for 10 ns;
        --Test #02
        -- Wrtie the first 8 bytes of the RAM without WE asserted
        -- i.e. from 8192 to 8199
        -- 0x2000 - 0x2007
            I_RAM_EN <= '1';
            I_RAM_RE <= '1';
            I_RAM_WE <= '0';
            I_RAM_ADDR <= x"00002000";
            I_RAM_DATA <= x"66778899";
            wait for 5 ns;
            I_RAM_EN <= '0';
            wait for 5 ns;
            I_RAM_EN <= '1';
            I_RAM_ADDR <= x"00002004";
            I_RAM_DATA <= x"AABBCCDD";
            wait for 5 ns;
            I_RAM_EN <= '0';
            wait for 5 ns;
            -- Stop the RAM
            I_RAM_EN <= '0';
            I_RAM_RE <= '0';
            I_RAM_WE <= '0';
            wait for 10 ns;
        --Test #03
        -- read the first 8 bytes of the RAM
        -- Verify that the RAM content cannot be over written
        -- if WE is not asserted
            I_RAM_EN <= '1';
            I_RAM_RE <= '1';
            I_RAM_ADDR <= x"00002000";
            wait for 10 ns;
            I_RAM_EN <= '0';
            wait for 10 ns;
            I_RAM_EN <= '1';
            I_RAM_ADDR <= x"00002004";
            wait for 10 ns;
            I_RAM_EN <= '0';
            wait for 10 ns;
            -- Stop the RAM
            I_RAM_EN <= '0';
            I_RAM_RE <= '0';
            I_RAM_WE <= '0';
            wait for 10 ns;
        --Test #04
        -- Wrtie the first 8 bytes of the RAM with WE asserted
        -- i.e. from 8192 to 8199
        -- 0x2000 - 0x2007
            I_RAM_EN <= '1';
            I_RAM_RE <= '0';
            I_RAM_WE <= '1';
            I_RAM_ADDR <= x"00002000";
            I_RAM_DATA <= x"66778899";
            wait for 5 ns;
            I_RAM_EN <= '0';
            wait for 5 ns;
            I_RAM_EN <= '1';
            I_RAM_ADDR <= x"00002004";
            I_RAM_DATA <= x"AABBCCDD";
            wait for 5 ns;
            I_RAM_EN <= '0';
            wait for 5 ns;
            -- Stop the RAM
            I_RAM_EN <= '0';
            I_RAM_RE <= '0';
            I_RAM_WE <= '0';
            wait for 10 ns;
            --Test #05
            -- read the first 8 bytes of the RAM
            -- Verify that the RAM content can be updated when needed
            I_RAM_EN <= '1';
            I_RAM_RE <= '1';
            I_RAM_WE <= '0';
            I_RAM_ADDR <= x"00002000";
            I_RAM_DATA <= x"00000000";
            wait for 10 ns;
            I_RAM_EN <= '0';
            wait for 10 ns;
            I_RAM_EN <= '1';
            I_RAM_RE <= '1';
            I_RAM_WE <= '0';
            I_RAM_ADDR <= x"00002004";
            wait for 10 ns;
            -- end of test
            -- disable the module
            I_RAM_EN <= '0';
            I_RAM_RE <= '0';
            I_RAM_WE <= '0';
            wait;

    end process stim_proc;
end behave;