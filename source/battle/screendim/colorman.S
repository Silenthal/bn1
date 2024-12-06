#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_ColorMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_ColorMan_0_Init_0809a7b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ColorMan_0_Init_0809a7ac:
    .word SD_ColorMan_0_Init
    .word SD_ColorMan_1_Main
    .word SD_ColorMan_2_Free

PTR_PTR_SD_ColorMan_0_Init_0809a7b8:
    .word PTR_SD_ColorMan_0_Init_0809a7ac


_ts SD_ColorMan_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xbb
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


_ts SD_ColorMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_ColorMan_1_0_0809a808
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ColorMan_1_0_0809a7fc:
    .word SD_ColorMan_1_0
    .word SD_ColorMan_1_1
    .word SD_ColorMan_1_2

PTR_PTR_SD_ColorMan_1_0_0809a808:
    .word PTR_SD_ColorMan_1_0_0809a7fc


_ts SD_ColorMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a842
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a842
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809a842:
    pop        {pc}


_ts SD_ColorMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a8a0
    ldrb       r0,[r5,#0x6]
    mov        r1,r10
    ldr        r1,[r1,#0xc]
    ldrb       r1,[r1,#0x1a]
    eor        r1,r0
    ldr        r7,PTR_DAT_0809a8a8
    ldrb       r1,[r7,r1]
    mov        r2,#0x2
    ldrh       r6,[r5,#0xc]
    push       {r0,r1,r6}
    mov        r4,#0x0
    bl         Routine_ColorMan_Chip_Create
    pop        {r0,r1,r6}
    ldrb       r2,[r7,#0x0]
    mov        r3,#0x4
    orr        r2,r3
    strb       r2,[r7,#0x0]
    push       {r0,r1,r6}
    mov        r2,#0x3
    mov        r4,#0x0
    bl         Routine_MiniColorMan_Chip_Create
    pop        {r0,r1,r6}
    ldrb       r2,[r7,#0x0]
    mov        r3,#0x4
    orr        r2,r3
    strb       r2,[r7,#0x0]
    mov        r2,#0x1
    mov        r4,#0x1
    bl         Routine_MiniColorMan_Chip_Create
    ldrb       r2,[r7,#0x0]
    mov        r3,#0x4
    orr        r2,r3
    strb       r2,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809a8a0:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word DAT_0809a8ac

PTR_DAT_0809a8a8:
    .word DAT_0809a8b0

DAT_0809a8ac:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0


DAT_0809a8b0:
    .byte 0x01
    .byte 0x06


_nt SD_ColorMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809a8c8
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809a8c8:
    pop        {pc}


_nt SD_ColorMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809a8e2
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809a8e2:
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809a8f8
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a8f8:
    pop        {pc}

    .align 2, 0

