#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"
    
    .set FUN_08001be8        ,0x8001BE8
    .set FUN_08002484        ,0x8002484
    .set FUN_08001b00        ,0x8001b00
    .set FUN_080027f4        ,0x80027f4
    .set FUN_08001950        ,0x8001950
    .set FUN_08000c0c        ,0x8000c0c
    .set FUN_080063b2        ,0x80063b2
    .set FUN_08013658        ,0x8013658
    .set FUN_0801996c        ,0x801996c
    .set FUN_08001bdc        ,0x8001bdc
    .set FUN_08001d60        ,0x8001d60


    .syntax unified

    .text

    .thumb

thumb_func_start AgbMain
AgbMain:
    bl         InitializeMainState
    LoadStateTo r0, Main_manager
    movs       r1,#0x14
    strb       r1,[r0]
LAB_08000290:
    bl         Main_SoftResetCheck
    bl         Main_WaitFrames
    bl         FUN_08001be8
    bl         Video_ApplySettings
    ldr        r0,=0x3006ff5
    mov        lr,pc
    bx         r0
    bl         FUN_08002484
    bl         FUN_08001b00
    bl         Dma_TransferListStartAll
    bl         FUN_080027f4
    bl         FUN_08001950
    bl         ReadInput
    mov        r0,r10
    ldr        r0,[r0,#0x50]
    ldrh       r1,[r0]
    adds       r1,#0x1
    strh       r1,[r0]
    bl         FUN_08000c0c
    ldr        r0,=_Fun_08000300
    mov        r7,r10
    ldr        r1,[r7]
    ldrb       r1,[r1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080063b2
    tst        r0,r0
    beq        LAB_080002e6
    bl         Fade_Apply
LAB_080002e6:
    bl         FUN_08013658
    bl         FUN_0801996c
    bl         FUN_08001bdc
    bl         FUN_08001d60
    b          LAB_08000290
thumb_func_end AgbMain

    .pool

_Fun_08000300:
    .word 0x8010424+1
    .word 0x8004130+1
    .word 0x8005864+1
    .word 0x8017504+1
    .word 0x8018968+1
    .word 0x8018ca4+1
    .word 0x8019808+1
    .word 0x801e8ac+1
    .word 0x801ff78+1
    .word 0x80200f8+1
    .word 0x80214a4+1

    .end
