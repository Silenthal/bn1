#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Repair
    push       {lr}
    ldr        r7,PTR_PTR_SD_Repair_0_Init_08098d68
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Repair_0_Init_08098d68:
    .word PTR_SD_Repair_0_Init_08098d6c

PTR_SD_Repair_0_Init_08098d6c:
    .word SD_Repair_0_Init
    .word SD_Repair_1_Main
    .word SD_Repair_2_FadeIn
    .word SD_Repair_3_Free


_ts SD_Repair_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x58
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


_ts SD_Repair_1_Main
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08098e0c
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098e0c
    sub        sp,#0x14
    mov        r0,sp
    ldr        r7,PTR_BYTE_ARRAY_08098e10
    ldrb       r3,[r5,#0x6]
    add        r7,r7,r3
    ldrb       r1,[r7,#0x0]
    ldrb       r2,[r7,#0x2]
    push       {r0}
    bl         Field_Search
    pop        {r7}
LAB_08098de8:
    sub        r1,#0x1
    bmi        LAB_08098dfc
    push       {r1,r7}
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
    bl         Field_RepairPanel
    pop        {r1,r7}
    b          LAB_08098de8
LAB_08098dfc:
    add        sp,#0x14
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x79
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08098e0c:
    pop        {pc}

    .align 2, 0


PTR_BYTE_ARRAY_08098e10:
    .word BYTE_ARRAY_08098e14

BYTE_ARRAY_08098e14:
    .byte 0x00
    .byte 0x02

BYTE_ARRAY_08098e16:
    .byte 0x02
    .byte 0x00


_ts SD_Repair_2_FadeIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098e32
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08098e32:
    pop        {pc}


_ts SD_Repair_3_Free
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08098e4e
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098e4e:
    pop        {pc}
