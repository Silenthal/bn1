#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_GutsShoot
    push       {lr}
    ldr        r7,PTR_PTR_SD_GutsShoot_0_Init_0809a548
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_GutsShoot_0_Init_0809a548:
    .word PTR_SD_GutsShoot_0_Init_0809a54c

PTR_SD_GutsShoot_0_Init_0809a54c:
    .word SD_GutsShoot_0_Init
    .word SD_GutsShoot_1
    .word SD_GutsShoot_2
    .word SD_GutsShoot_3


_ts SD_GutsShoot_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0xeb
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


_nt SD_GutsShoot_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a5d0
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a5d0
    ldrb       r0,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    ldrh       r6,[r5,#0xc]
    push       {r0,r4,r6}
    bl         Routine_GutsShoot_GutsMan_Create
    pop        {r0,r4,r6}
    bl         Routine_GutsShoot_MegaMan_Create
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc0
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809a5d0:
    pop        {pc}


_nt SD_GutsShoot_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a5f0
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809a5f0:
    pop        {pc}


_nt SD_GutsShoot_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a60c
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a60c:
    pop        {pc}

    .align 2, 0

