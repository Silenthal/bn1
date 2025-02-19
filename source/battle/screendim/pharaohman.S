#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_PharaohMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_PharaohMan_0_Init_0809b0a0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_PharaohMan_0_Init_0809b094:
    .word SD_PharaohMan_0_Init
    .word SD_PharaohMan_1
    .word SD_PharaohMan_2_Free

PTR_PTR_SD_PharaohMan_0_Init_0809b0a0:
    .word PTR_SD_PharaohMan_0_Init_0809b094


_ts SD_PharaohMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x94
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts SD_PharaohMan_1
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_PharaohMan_1_0_0809b0f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_PharaohMan_1_0_0809b0e4:
    .word SD_PharaohMan_1_0
    .word SD_PharaohMan_1_1
    .word SD_PharaohMan_1_2
    .word SD_PharaohMan_1_3

PTR_PTR_SD_PharaohMan_1_0_0809b0f4:
    .word PTR_SD_PharaohMan_1_0_0809b0e4


_ts SD_PharaohMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809b12e
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b12e
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_0809b12e:
    pop        {pc}


_ts SD_PharaohMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b14a
    push       {r5}
    ldrb       r1,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    bl         Routine_PharaohMan_Chip_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809b14a:
    pop        {pc}


_ts SD_PharaohMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809b15c
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
LAB_0809b15c:
    pop        {pc}


_nt SD_PharaohMan_1_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b17a
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809b17a:
    pop        {pc}


_ts SD_PharaohMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809b194
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809b194:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809b1aa
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b1aa:
    pop        {pc}
