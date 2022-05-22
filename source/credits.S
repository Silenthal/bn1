#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start InitCredits
InitCredits:
    push       { lr }
    .byte 0xFC, 0x48 @ ldr        r0,PTR_gCredits_0802188c
    mov        r1,#0x10
    bl         memset0_32
    pop        { pc }
thumb_func_end InitCredits

thumb_func_start Credits_Main
Credits_Main:
    push       { lr }
    .byte 0xFA, 0x4D @ ldr        r5,PTR_gCredits_08021890
    .byte 0xFA, 0x48 @ ldr        r0,PTR_JT_R5_20070D0_214B4_08021894
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end Credits_Main

jumpTableCreditsMain:
    .word 0x80214c0+1
    .word 0x8021534+1
    .word 0x8021564+1
    
    .end
