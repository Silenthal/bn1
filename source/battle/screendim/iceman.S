#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_IceMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_IceMan_0_08099274
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_IceMan_0_08099268:
    .word SD_IceMan_0
    .word SD_IceMan_1
    .word SD_IceMan_2

PTR_PTR_SD_IceMan_0_08099274:
    .word PTR_SD_IceMan_0_08099268


_ts SD_IceMan_0
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xb5
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


_ts SD_IceMan_1
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_IceMan_1_0_080992c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_IceMan_1_0_080992b8:
    .word SD_IceMan_1_0
    .word SD_IceMan_1_1
    .word SD_IceMan_1_2

PTR_PTR_SD_IceMan_1_0_080992c4:
    .word PTR_SD_IceMan_1_0_080992b8


_ts SD_IceMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_080992fe
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_080992fe
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_080992fe:
    pop        {pc}


_ts SD_IceMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099334
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#0x6]
    ldrh       r6,[r5,#0xc]
    bl         Routine_IceMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_08099334:
    pop        {pc}

    .align 2, 0

    .word DAT_0809933c

DAT_0809933c:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0



_ts SD_IceMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_08099356
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08099356:
    pop        {pc}


_ts SD_IceMan_2
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_08099370
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_08099370:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_08099386
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099386:
    pop        {pc}
