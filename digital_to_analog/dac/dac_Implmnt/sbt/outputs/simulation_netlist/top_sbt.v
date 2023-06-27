// ******************************************************************************

// iCEcube Netlister

// Version:            2020.12.27943

// Build Date:         Dec  9 2020 18:18:12

// File Generated:     Jun 26 2023 19:07:48

// Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

// Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

// ******************************************************************************

// Verilog file for cell "top" view "INTERFACE"

module top (
    bit3,
    bit1,
    bit4,
    bit2,
    bit0);

    output bit3;
    output bit1;
    output bit4;
    output bit2;
    output bit0;

    wire N__157;
    wire N__156;
    wire N__155;
    wire N__148;
    wire N__147;
    wire N__146;
    wire N__139;
    wire N__138;
    wire N__137;
    wire N__130;
    wire N__129;
    wire N__128;
    wire N__121;
    wire N__120;
    wire N__119;
    wire N__102;
    wire N__99;
    wire N__98;
    wire N__95;
    wire N__92;
    wire N__89;
    wire N__86;
    wire N__85;
    wire N__80;
    wire N__77;
    wire VCCG0;
    wire GNDG0;
    wire CONSTANT_ONE_NET;
    wire _gnd_net_;

    IO_PAD bit1_obuf_iopad (
            .OE(N__157),
            .DIN(N__156),
            .DOUT(N__155),
            .PACKAGEPIN(bit1));
    defparam bit1_obuf_preio.NEG_TRIGGER=1'b0;
    defparam bit1_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO bit1_obuf_preio (
            .PADOEN(N__157),
            .PADOUT(N__156),
            .PADIN(N__155),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(GNDG0),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD bit2_obuf_iopad (
            .OE(N__148),
            .DIN(N__147),
            .DOUT(N__146),
            .PACKAGEPIN(bit2));
    defparam bit2_obuf_preio.NEG_TRIGGER=1'b0;
    defparam bit2_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO bit2_obuf_preio (
            .PADOEN(N__148),
            .PADOUT(N__147),
            .PADIN(N__146),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__85),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD bit4_obuf_iopad (
            .OE(N__139),
            .DIN(N__138),
            .DOUT(N__137),
            .PACKAGEPIN(bit4));
    defparam bit4_obuf_preio.NEG_TRIGGER=1'b0;
    defparam bit4_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO bit4_obuf_preio (
            .PADOEN(N__139),
            .PADOUT(N__138),
            .PADIN(N__137),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__98),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD bit0_obuf_iopad (
            .OE(N__130),
            .DIN(N__129),
            .DOUT(N__128),
            .PACKAGEPIN(bit0));
    defparam bit0_obuf_preio.NEG_TRIGGER=1'b0;
    defparam bit0_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO bit0_obuf_preio (
            .PADOEN(N__130),
            .PADOUT(N__129),
            .PADIN(N__128),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__102),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD bit3_obuf_iopad (
            .OE(N__121),
            .DIN(N__120),
            .DOUT(N__119),
            .PACKAGEPIN(bit3));
    defparam bit3_obuf_preio.NEG_TRIGGER=1'b0;
    defparam bit3_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO bit3_obuf_preio (
            .PADOEN(N__121),
            .PADOUT(N__120),
            .PADIN(N__119),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(GNDG0),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IoInMux I__18 (
            .O(N__102),
            .I(N__99));
    LocalMux I__17 (
            .O(N__99),
            .I(N__95));
    IoInMux I__16 (
            .O(N__98),
            .I(N__92));
    Span4Mux_s0_h I__15 (
            .O(N__95),
            .I(N__89));
    LocalMux I__14 (
            .O(N__92),
            .I(N__86));
    Sp12to4 I__13 (
            .O(N__89),
            .I(N__80));
    Span12Mux_s0_h I__12 (
            .O(N__86),
            .I(N__80));
    IoInMux I__11 (
            .O(N__85),
            .I(N__77));
    Odrv12 I__10 (
            .O(N__80),
            .I(CONSTANT_ONE_NET));
    LocalMux I__9 (
            .O(N__77),
            .I(CONSTANT_ONE_NET));
    VCC VCC (
            .Y(VCCG0));
    GND GND (
            .Y(GNDG0));
    GND GND_Inst (
            .Y(_gnd_net_));
    defparam CONSTANT_ONE_LUT4_LC_32_26_0.C_ON=1'b0;
    defparam CONSTANT_ONE_LUT4_LC_32_26_0.SEQ_MODE=4'b0000;
    defparam CONSTANT_ONE_LUT4_LC_32_26_0.LUT_INIT=16'b1111111111111111;
    LogicCell40 CONSTANT_ONE_LUT4_LC_32_26_0 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(CONSTANT_ONE_NET),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
endmodule // top
