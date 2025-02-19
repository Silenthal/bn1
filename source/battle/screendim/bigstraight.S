#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_BigStraight
    push       {lr}
    ldr        r7,PTR_PTR_SD_BigStraight_0_Init_0809a484
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_BigStraight_0_Init_0809a484:
    .word PTR_SD_BigStraight_0_Init_0809a488

PTR_SD_BigStraight_0_Init_0809a488:
    .word SD_BigStraight_0_Init
    .word SD_BigStraight_1
    .word SD_BigStraight_2
    .word SD_BigStraight_3_Free


_ts SD_BigStraight_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0xe8
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


_nt SD_BigStraight_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a4fe
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a4fe
    ldrb       r0,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    ldrh       r6,[r5,#0xc]
    bl         Routine_BigStraight_Create
    mov        r0,#0x60
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809a4fe:
    pop        {pc}


_ts SD_BigStraight_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a51a
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809a51a:
    pop        {pc}


_ts SD_BigStraight_3_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a536
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a536:
    pop        {pc}
