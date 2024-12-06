#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_DeathStorm
    push       {lr}
    ldr        r7,PTR_PTR_SD_DeathStorm_0_Init_0809a620
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_DeathStorm_0_Init_0809a620:
    .word PTR_SD_DeathStorm_0_Init_0809a624

PTR_SD_DeathStorm_0_Init_0809a624:
    .word SD_DeathStorm_0_Init
    .word SD_DeathStorm_1
    .word SD_DeathStorm_2
    .word SD_DeathStorm_3


_ts SD_DeathStorm_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0xea
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


_nt SD_DeathStorm_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a69a
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a69a
    ldrb       r0,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    ldrh       r6,[r5,#0xc]
    bl         Routine_DeathStorm_Create
    mov        r0,#0xc0
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809a69a:
    pop        {pc}


_ts SD_DeathStorm_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a6b6
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809a6b6:
    pop        {pc}


_ts SD_DeathStorm_3
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a6d2
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a6d2:
    pop        {pc}
