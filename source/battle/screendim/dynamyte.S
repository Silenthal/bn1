#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Dynamyte
    push       {lr}
    ldr        r7,PTR_PTR_SD_Dynamyte_0_0809af80
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Dynamyte_0_0809af80:
    .word PTR_SD_Dynamyte_0_0809af84

PTR_SD_Dynamyte_0_0809af84:
    .word SD_Dynamyte_0
    .word SD_Dynamyte_1
    .word SD_Dynamyte_2
    .word SD_Dynamyte_3
    .word SD_Dynamyte_4


_ts SD_Dynamyte_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x19
    lsr        r1,r1,#0x19
    add        r1,#0x8b
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


_ts SD_Dynamyte_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809affa
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x19
    bcs        LAB_0809aff2
    ldrb       r0,[r5,#0x6]
    bl         R_Player_ClearOwnedEntity
LAB_0809aff2:
    mov        r0,#0x30
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809affa:
    pop        {pc}


_ts SD_Dynamyte_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b042
    ldrb       r0,[r5,#0x6]
    push       {r0}
    bl         Field_GetAttackDirectionOffset
    pop        {r1}
    LoadMain battle, r7, r7
    lsl        r1,r1,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#0xc]
    ldr        r0,[r7,#0x74]
    add        r0,#0x50
    ldrb       r7,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    bl         Attack_Dynamyte_Create
    tst        r4,r4
    beq        LAB_0809b03a
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_0809b03a:
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809b042:
    pop        {pc}
    .word DAT_0809b048

DAT_0809b048:
    .byte 0x01
    .byte 0x03
    .byte 0x12
    .byte 0x20


_ts SD_Dynamyte_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b066
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_0809b066:
    pop        {pc}


_ts SD_Dynamyte_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809b082
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b082:
    pop        {pc}
