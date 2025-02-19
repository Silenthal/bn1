#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Barrier
    push       {lr}
    ldr        r7,PTR_PTR_SD_Barrier_0_Init_08099b18
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Barrier_0_Init_08099b18:
    .word PTR_SD_Barrier_0_Init_08099b1c

PTR_SD_Barrier_0_Init_08099b1c:
    .word SD_Barrier_0_Init
    .word SD_Barrier_1_Activate
    .word SD_Barrier_2_Brighten
    .word SD_Barrier_3_Free


_ts SD_Barrier_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldr        r7,PTR_BYTE_ARRAY_08099b60
    ldrb       r1,[r5,#0x5]
    ldrb       r1,[r7,r1]
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_BYTE_ARRAY_08099b60:
    .word BYTE_ARRAY_08099b64

BYTE_ARRAY_08099b64:
    .byte 0x93
    .byte 0x82
    .byte 0x83
    .byte 0x84
    .byte 0x54
    .byte 0x55
    .byte 0x56
    .byte 0x57
    .byte 0x92

    .align 2, 0



_ts SD_Barrier_1_Activate
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08099ba6
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099ba6
    ldrb       r0,[r5,#0x5]
    ldrb       r1,[r5,#0x6]
    bl         S_Barrier_Activate
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08099ba6:
    pop        {pc}


_ts SD_Barrier_2_Brighten
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099bc2
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08099bc2:
    pop        {pc}


_ts SD_Barrier_3_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099bde
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099bde:
    pop        {pc}
