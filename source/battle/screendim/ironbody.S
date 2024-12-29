#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_IronBody
    push       {lr}
    ldr        r7,PTR_PTR_SD_IronBody_0_Init_08099bf0
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_IronBody_0_Init_08099bf0:
    .word PTR_SD_IronBody_0_Init_08099bf4

PTR_SD_IronBody_0_Init_08099bf4:
    .word SD_IronBody_0_Init
    .word SD_IronBody_1_Apply
    .word SD_IronBody_2_FadeIn
    .word SD_IronBody_3_Free


_ts SD_IronBody_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0x67
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


_nt SD_IronBody_1_Apply
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08099c6c
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099c6c
    ldrb       r0,[r5,#0x6]
    bl         R_Player_ApplyIronBody
    mov        r0,#0xd0
    bl         Sound_PlaySongImmediate
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08099c6c:
    pop        {pc}


_nt SD_IronBody_2_FadeIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099c88
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08099c88:
    pop        {pc}


_nt SD_IronBody_3_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099ca4
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099ca4:
    pop        {pc}

    .align 2, 0

