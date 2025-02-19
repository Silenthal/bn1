#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_ProtoMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_ProtoMan_0_Init_0809a918
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ProtoMan_0_Init_0809a90c:
    .word SD_ProtoMan_0_Init
    .word SD_ProtoMan_1_Main
    .word SD_ProtoMan_2_Free

PTR_PTR_SD_ProtoMan_0_Init_0809a918:
    .word PTR_SD_ProtoMan_0_Init_0809a90c


_ts SD_ProtoMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xa6
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


_ts SD_ProtoMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_ProtoMan_1_0_0809a968
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ProtoMan_1_0_0809a95c:
    .word SD_ProtoMan_1_0
    .word SD_ProtoMan_1_1
    .word SD_ProtoMan_1_2

PTR_PTR_SD_ProtoMan_1_0_0809a968:
    .word PTR_SD_ProtoMan_1_0_0809a95c


_ts SD_ProtoMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a9a2
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a9a2
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809a9a2:
    pop        {pc}


_ts SD_ProtoMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a9d8
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#0x6]
    ldrh       r6,[r5,#0xc]
    bl         Routine_ProtoMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809a9d8:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word DAT_0809a9e4
    .word DAT_0809a9e8

DAT_0809a9e4:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0


DAT_0809a9e8:
    .byte 0x01
    .byte 0x06


_nt SD_ProtoMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809aa00
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809aa00:
    pop        {pc}


_nt SD_ProtoMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809aa1a
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809aa1a:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809aa30
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809aa30:
    pop        {pc}

    .align 2, 0

