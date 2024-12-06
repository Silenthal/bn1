#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_WoodMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_WoodMan_0_Init_08098470
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_WoodMan_0_Init_08098464:
    .word SD_WoodMan_0_Init
    .word SD_WoodMan_1_Main
    .word SD_WoodMan_2_Free

PTR_PTR_SD_WoodMan_0_Init_08098470:
    .word PTR_SD_WoodMan_0_Init_08098464


_ts SD_WoodMan_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xa9
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


_ts SD_WoodMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_WoodMan_1_0_PlayerWarpOut_080984c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_WoodMan_1_0_PlayerWarpOut_080984b4:
    .word SD_WoodMan_1_0_PlayerWarpOut
    .word SD_WoodMan_1_1
    .word SD_WoodMan_1_2
    .word SD_WoodMan_1_3

PTR_PTR_SD_WoodMan_1_0_PlayerWarpOut_080984c4:
    .word PTR_SD_WoodMan_1_0_PlayerWarpOut_080984b4


_ts SD_WoodMan_1_0_PlayerWarpOut
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_080984fe
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_080984fe
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_080984fe:
    pop        {pc}


_ts SD_WoodMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809851a
    push       {r5}
    ldrb       r0,[r5,#0x5]
    ldrb       r1,[r5,#0x6]
    bl         Actor_WoodManChip_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809851a:
    pop        {pc}


_ts SD_WoodMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809852c
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
LAB_0809852c:
    pop        {pc}


_nt SD_WoodMan_1_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809854a
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809854a:
    pop        {pc}


_ts SD_WoodMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_08098564
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_08098564:
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809857a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809857a:
    pop        {pc}
