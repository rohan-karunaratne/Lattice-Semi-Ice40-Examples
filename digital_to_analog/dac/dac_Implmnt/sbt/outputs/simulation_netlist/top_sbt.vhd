-- ******************************************************************************

-- iCEcube Netlister

-- Version:            2020.12.27943

-- Build Date:         Dec  9 2020 18:18:06

-- File Generated:     Jun 26 2023 19:07:48

-- Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

-- Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

-- ******************************************************************************

-- VHDL file for cell "top" view "INTERFACE"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library ice;
use ice.vcomponent_vital.all;

-- Entity of top
entity top is
port (
    bit3 : out std_logic;
    bit1 : out std_logic;
    bit4 : out std_logic;
    bit2 : out std_logic;
    bit0 : out std_logic);
end top;

-- Architecture of top
-- View name is \INTERFACE\
architecture \INTERFACE\ of top is

signal \N__157\ : std_logic;
signal \N__156\ : std_logic;
signal \N__155\ : std_logic;
signal \N__148\ : std_logic;
signal \N__147\ : std_logic;
signal \N__146\ : std_logic;
signal \N__139\ : std_logic;
signal \N__138\ : std_logic;
signal \N__137\ : std_logic;
signal \N__130\ : std_logic;
signal \N__129\ : std_logic;
signal \N__128\ : std_logic;
signal \N__121\ : std_logic;
signal \N__120\ : std_logic;
signal \N__119\ : std_logic;
signal \N__102\ : std_logic;
signal \N__99\ : std_logic;
signal \N__98\ : std_logic;
signal \N__95\ : std_logic;
signal \N__92\ : std_logic;
signal \N__89\ : std_logic;
signal \N__86\ : std_logic;
signal \N__85\ : std_logic;
signal \N__80\ : std_logic;
signal \N__77\ : std_logic;
signal \VCCG0\ : std_logic;
signal \GNDG0\ : std_logic;
signal \CONSTANT_ONE_NET\ : std_logic;
signal \_gnd_net_\ : std_logic;

signal bit1_wire : std_logic;
signal bit2_wire : std_logic;
signal bit4_wire : std_logic;
signal bit0_wire : std_logic;
signal bit3_wire : std_logic;

begin
    bit1 <= bit1_wire;
    bit2 <= bit2_wire;
    bit4 <= bit4_wire;
    bit0 <= bit0_wire;
    bit3 <= bit3_wire;

    \bit1_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__157\,
            DIN => \N__156\,
            DOUT => \N__155\,
            PACKAGEPIN => bit1_wire
        );

    \bit1_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__157\,
            PADOUT => \N__156\,
            PADIN => \N__155\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \GNDG0\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \bit2_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__148\,
            DIN => \N__147\,
            DOUT => \N__146\,
            PACKAGEPIN => bit2_wire
        );

    \bit2_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__148\,
            PADOUT => \N__147\,
            PADIN => \N__146\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__85\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \bit4_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__139\,
            DIN => \N__138\,
            DOUT => \N__137\,
            PACKAGEPIN => bit4_wire
        );

    \bit4_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__139\,
            PADOUT => \N__138\,
            PADIN => \N__137\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__98\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \bit0_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__130\,
            DIN => \N__129\,
            DOUT => \N__128\,
            PACKAGEPIN => bit0_wire
        );

    \bit0_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__130\,
            PADOUT => \N__129\,
            PADIN => \N__128\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__102\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \bit3_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__121\,
            DIN => \N__120\,
            DOUT => \N__119\,
            PACKAGEPIN => bit3_wire
        );

    \bit3_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__121\,
            PADOUT => \N__120\,
            PADIN => \N__119\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \GNDG0\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \I__18\ : IoInMux
    port map (
            O => \N__102\,
            I => \N__99\
        );

    \I__17\ : LocalMux
    port map (
            O => \N__99\,
            I => \N__95\
        );

    \I__16\ : IoInMux
    port map (
            O => \N__98\,
            I => \N__92\
        );

    \I__15\ : Span4Mux_s0_h
    port map (
            O => \N__95\,
            I => \N__89\
        );

    \I__14\ : LocalMux
    port map (
            O => \N__92\,
            I => \N__86\
        );

    \I__13\ : Sp12to4
    port map (
            O => \N__89\,
            I => \N__80\
        );

    \I__12\ : Span12Mux_s0_h
    port map (
            O => \N__86\,
            I => \N__80\
        );

    \I__11\ : IoInMux
    port map (
            O => \N__85\,
            I => \N__77\
        );

    \I__10\ : Odrv12
    port map (
            O => \N__80\,
            I => \CONSTANT_ONE_NET\
        );

    \I__9\ : LocalMux
    port map (
            O => \N__77\,
            I => \CONSTANT_ONE_NET\
        );

    \VCC\ : VCC
    port map (
            Y => \VCCG0\
        );

    \GND\ : GND
    port map (
            Y => \GNDG0\
        );

    \GND_Inst\ : GND
    port map (
            Y => \_gnd_net_\
        );

    \CONSTANT_ONE_LUT4_LC_32_26_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111111111111"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \_gnd_net_\,
            lcout => \CONSTANT_ONE_NET\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );
end \INTERFACE\;
