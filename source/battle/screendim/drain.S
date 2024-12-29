#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Drain
    push       {lr}
    ldr        r7,PTR_PTR_SD_Drain_0_Init_0809a6e4
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Drain_0_Init_0809a6e4:
    .word PTR_SD_Drain_0_Init_0809a6e8

PTR_SD_Drain_0_Init_0809a6e8:
    .word SD_Drain_0_Init
    .word SD_Drain_1_Main
    .word SD_Drain_2
    .word SD_Drain_3


_ts SD_Drain_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x79
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


_ts SD_Drain_1_Main
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a760
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a760
    ldrb       r0,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    ldrh       r6,[r5,#0xc]
    bl         Routine_Drain_Create
    mov        r0,#0x90
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809a760:
    pop        {pc}


_nt SD_Drain_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a77c
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809a77c:
    pop        {pc}


_nt SD_Drain_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a798
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a798:
    pop        {pc}

    .align 2, 0

