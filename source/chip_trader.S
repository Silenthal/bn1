#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start InitChipTraderFromScript
InitChipTraderFromScript:
    push       { lr }
    push       { r0 }
    bl         InitChipTrader
    pop        { r0 }
    ldr        r5,PTR_gChipTrader_08020108
    strh       r0,[r5,#0x4]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrh       r0,[r7,#0x4]
    strh       r0,[r7,#0xc]
    pop        { pc }
thumb_func_end InitChipTraderFromScript

thumb_func_start InitChipTrader
InitChipTrader:
    push       { lr }
    ldr        r0,PTR_gChipTrader_08020108
    mov        r1,#0x40
    bl         memset0_32
    pop        { pc }
thumb_func_end InitChipTrader

thumb_func_start ChipTrader_Main
ChipTrader_Main:
    push       { lr }
    ldr        r5,PTR_gChipTrader_08020108
    ldr        r0,PTR_JT_R5_2007530_20110_0802010c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end ChipTrader_Main

PTR_gChipTrader_08020108:
    .word gChipTrader
PTR_JT_R5_2007530_20110_0802010c:
    .word JT_R5_2007530_20110
JT_R5_2007530_20110:

    .word 0x802012c+1
    .word 0x80201c8+1
    .word 0x80201c8+1
    .word 0x8020218+1
    .word 0x80201f0+1
    .word 0x8020218+1
    .word 0x8020308+1

    .end

