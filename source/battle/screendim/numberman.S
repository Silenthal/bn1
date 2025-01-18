#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_NumberMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_NumberMan_0_Init_080989ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_NumberMan_0_Init_080989a0:
    .word SD_NumberMan_0_Init
    .word SD_NumberMan_1_Main
    .word SD_NumberMan_2_Free

PTR_PTR_SD_NumberMan_0_Init_080989ac:
    .word PTR_SD_NumberMan_0_Init_080989a0


_ts SD_NumberMan_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xaf
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


_ts SD_NumberMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_NumberMan_1_0_080989fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_NumberMan_1_0_080989f0:
    .word SD_NumberMan_1_0
    .word SD_NumberMan_1_1
    .word SD_NumberMan_1_2

PTR_PTR_SD_NumberMan_1_0_080989fc:
    .word PTR_SD_NumberMan_1_0_080989f0


_ts SD_NumberMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08098a36
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098a36
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08098a36:
    pop        {pc}


_ts SD_NumberMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098a6e
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldr        r7,PTR_DAT_08098a70
    ldrb       r4,[r5,#0x5]
    ldrb       r6,[r7,r4]
    bl         Routine_NumberMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_08098a6e:
    pop        {pc}

PTR_DAT_08098a70:
    .word DAT_08098a74

DAT_08098a74:
    .byte 0x0A
    .byte 0x14
    .byte 0x1E

    .align 2, 0



_ts SD_NumberMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_08098a8e
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08098a8e:
    pop        {pc}


_ts SD_NumberMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_08098aa8
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_08098aa8:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_08098abe
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098abe:
    pop        {pc}
