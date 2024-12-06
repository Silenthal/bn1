#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Candle
    push       {lr}
    ldr        r7,PTR_PTR_SD_Candle_0_Init_08099cb8
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Candle_0_Init_08099cb8:
    .word PTR_SD_Candle_0_Init_08099cbc

PTR_SD_Candle_0_Init_08099cbc:
    .word SD_Candle_0_Init
    .word SD_Candle_1
    .word SD_Candle_2
    .word SD_Candle_3


_ts SD_Candle_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x73
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


_ts SD_Candle_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08099d68
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099d68
    ldrb       r0,[r5,#0x6]
    bl         R_Player_ClearOwnedEntity
    ldrb       r0,[r5,#0x6]
    push       {r0}
    bl         Field_GetAttackDirectionOffset
    add        r2,r0,#0x0
    pop        {r6}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r4,[r5,#0x5]
    push       {r5}
    lsl        r0,r6,#0x2
    add        r0,#0x40
    ldr        r5,[r7,r0]
    ldr        r7,[r5,#0x74]
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r2
    ldrb       r2,[r5,#0x19]
    add        r0,r7,#0x0
    add        r0,#0x50
    bl         Attack_Candle_Create
    pop        {r5}
    tst        r4,r4
    beq        LAB_08099d60
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_08099d60:
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08099d68:
    pop        {pc}


_nt SD_Candle_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099d84
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08099d84:
    pop        {pc}


_nt SD_Candle_3
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099da0
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099da0:
    pop        {pc}

    .align 2, 0

