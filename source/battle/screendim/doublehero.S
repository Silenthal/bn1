#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_DoubleHero
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_DoubleHero_0_Init_0809b914
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_DoubleHero_0_Init_0809b908:
    .word SD_DoubleHero_0_Init
    .word SD_DoubleHero_1
    .word SD_DoubleHero_2_Free

PTR_PTR_SD_DoubleHero_0_Init_0809b914:
    .word PTR_SD_DoubleHero_0_Init_0809b908


_ts SD_DoubleHero_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xed
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


_ts SD_DoubleHero_1
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_DoubleHero_1_0_0809b964
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_DoubleHero_1_0_0809b958:
    .word SD_DoubleHero_1_0
    .word SD_DoubleHero_1_1
    .word SD_DoubleHero_1_2

PTR_PTR_SD_DoubleHero_1_0_0809b964:
    .word PTR_SD_DoubleHero_1_0_0809b958


_ts SD_DoubleHero_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809b99e
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b99e
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809b99e:
    pop        {pc}


_ts SD_DoubleHero_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b9d4
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x6]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#0xc]
    mov        r4,#0x0
    push       {r0,r1,r2}
    bl         Routine_2xHeroMegaMan_Create
    pop        {r0,r1,r2}
    bl         Routine_2xHeroProtoMan_Create
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809b9d4:
    pop        {pc}


_nt SD_DoubleHero_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    cmp        r0,#0x2
    bne        LAB_0809b9e6
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809b9e6:
    pop        {pc}


_ts SD_DoubleHero_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809ba00
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809ba00:
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809ba16
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809ba16:
    pop        {pc}
