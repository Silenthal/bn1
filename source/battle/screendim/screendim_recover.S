#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set ScreenDim_HidePlayer, 0x80572d2
    .set FUN_08057300, 0x8057300
    .set BattleMessage_Load, 0x8017884
    .set BattleMessage_Main, 0x80178ec
    .set BattleMessage_Disable, 0x8017954

    .text


_ts ScreenDim_Recover
    push       {lr}
    ldr        r7,PTR_PTR_SD_Recover_0_Init
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

.align 2, 0
PTR_PTR_SD_Recover_0_Init:
    .word PTR_SD_Recover_0_Init
PTR_SD_Recover_0_Init:
    .word SD_Recover_0_Init
    .word SD_Recover_1_Main
    .word SD_Recover_2_FadeIn
    .word SD_Recover_3_Free


_ts SD_Recover_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x43
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


_ts SD_Recover_1_Main
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_080983ec
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_080983ec
    ldr        r7,[r5,#0x14]
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0xe
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_080983c0
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_080983c0:
    pop        {r5}
    ldr        r0,PTR_listRecoverHPAmounts_080983f0
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x1
    ldrh       r0,[r0,r1]
    ldr        r7,[r5,#0x14]
    ldrh       r1,[r7,#0x20]
    tst        r1,r1
    beq        LAB_080983de
    add        r0,r0,r1
    ldrh       r1,[r7,#0x22]
    cmp        r0,r1
    bls        LAB_080983dc
    add        r0,r1,#0x0
LAB_080983dc:
    strh       r0,[r7,#0x20]
LAB_080983de:
    mov        r0,#0x72
    bl         Sound_PlaySongImmediate
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_080983ec:
    pop        {pc}

.align 2, 0
PTR_listRecoverHPAmounts_080983f0: .word listRecoverHPAmounts
listRecoverHPAmounts:
.short  10, 30, 50, 80, 120, 150, 200, 300


_ts SD_Recover_2_FadeIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809841e
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809841e:
    pop        {pc}


_ts SD_Recover_3_Free
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809843a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809843a:
    pop        {pc}


_ts ScreenDim_Recover_Create
    push       {r5,lr}
    push       {r0}
    mov        r0,#0x0
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    pop        {r0}
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    str        r0,[r7,#0x14]
    pop        {r5,pc}

.align 2, 0