#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc" 


_ts ScreenDim_LifeSaver
    push       {lr}
    ldr        r7,PTR_PTR_SD_LifeSaver_0_0809b82c
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_LifeSaver_0_0809b82c:
    .word PTR_SD_LifeSaver_0_0809b830

PTR_SD_LifeSaver_0_0809b830:
    .word SD_LifeSaver_0
    .word SD_LifeSaver_1
    .word SD_LifeSaver_2
    .word SD_LifeSaver_3


_ts SD_LifeSaver_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0xec
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


_nt SD_LifeSaver_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809b8aa
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b8aa
    ldrb       r0,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    bl         Routine_LifeSaver_Create
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0x60
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809b8aa:
    pop        {pc}


_ts SD_LifeSaver_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    cmp        r0,#0x1
    bne        LAB_0809b8c4
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809b8c4:
    pop        {pc}


_nt SD_LifeSaver_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809b8f0
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    ldr        r1,DAT_0809b8f4
    ldrb       r0,[r5,#0x6]
    mov        r2,#0x1
    bl         R_Player_SetInvisible
    mov        r0,#0x91
    bl         Sound_PlaySongImmediate
    bl         ScreenDim_Free
LAB_0809b8f0:
    pop        {pc}

    .align 2, 0


DAT_0809b8f4:
    .word 0x708
