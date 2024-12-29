#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


USHORT_ARRAY_08098fec:
    .short 0x28
    .short 0x4B
    .short 0x96


_nt ScreenDim_TimeBomb
    push       {lr}
    ldr        r7,PTR_PTR_SD_TimeBomb_0_08099000
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_SD_TimeBomb_0_08099000:
    .word PTR_SD_TimeBomb_0_08099004

PTR_SD_TimeBomb_0_08099004:
    .word SD_TimeBomb_0
    .word SD_TimeBomb_1
    .word SD_TimeBomb_2
    .word SD_TimeBomb_3
    .word SD_TimeBomb_4


_ts SD_TimeBomb_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x61
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


_ts SD_TimeBomb_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809907c
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809907c
    ldrb       r0,[r5,#0x6]
    bl         R_Player_ClearOwnedEntity
    mov        r0,#0x15
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809907c:
    pop        {pc}


_nt SD_TimeBomb_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_080990ce
    ldrb       r0,[r5,#0x6]
    bl         Field_FindEmptyEnemyPanelForward
    tst        r0,r0
    beq        LAB_080990c6
    push       {r0,r1}
    ldrb       r0,[r5,#0x6]
    bl         Battle_GetPlayer
    pop        {r0,r1}
    ldr        r3,[r7,#0x74]
    add        r3,#0x50
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldrb       r4,[r5,#0x5]
    ldrh       r6,[r5,#0xc]
    ldrb       r0,[r5,#0x6]
    bl         Attack_TimeBomb_Chip_Create
    tst        r7,r7
    beq        LAB_080990c6
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    ldr        r6,PTR_USHORT_ARRAY_080990d0
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x1
    ldrh       r0,[r6,r0]
    strh       r0,[r7,#0x22]
    strh       r0,[r7,#0x20]
LAB_080990c6:
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_080990ce:
    pop        {pc}

PTR_USHORT_ARRAY_080990d0:
    .word USHORT_ARRAY_08098fec
    .word DAT_080990d8

DAT_080990d8:
    .byte 0x01
    .byte 0x03
    .byte 0x12
    .byte 0x20


_ts SD_TimeBomb_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_080990f6
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_080990f6:
    pop        {pc}


_ts SD_TimeBomb_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099112
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099112:
    pop        {pc}
