#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_StoneMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_StoneMan_0_Init_080993a4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_StoneMan_0_Init_08099398:
    .word SD_StoneMan_0_Init
    .word SD_StoneMan_1_Main
    .word SD_StoneMan_2_Free

PTR_PTR_SD_StoneMan_0_Init_080993a4:
    .word PTR_SD_StoneMan_0_Init_08099398


_ts SD_StoneMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xb2
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


_ts SD_StoneMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_StoneMan_1_0_ShowMessage_080993f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_StoneMan_1_0_ShowMessage_080993e8:
    .word SD_StoneMan_1_0_ShowMessage
    .word SD_StoneMan_1_1_Chip
    .word SD_StoneMan_1_2_Wait
    .word SD_StoneMan_1_3_WarpIn

PTR_PTR_SD_StoneMan_1_0_ShowMessage_080993f8:
    .word PTR_SD_StoneMan_1_0_ShowMessage_080993e8


_ts SD_StoneMan_1_0_ShowMessage
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08099432
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099432
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_08099432:
    pop        {pc}


_ts SD_StoneMan_1_1_Chip
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099454
    push       {r5}
    ldrb       r1,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    bl         Routine_StoneMan_Chip_Create
    pop        {r5}
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_08099454:
    pop        {pc}


_nt SD_StoneMan_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_08099466
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
LAB_08099466:
    pop        {pc}


_ts SD_StoneMan_1_3_WarpIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099484
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08099484:
    pop        {pc}


_nt SD_StoneMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809949e
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809949e:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_080994b4
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080994b4:
    pop        {pc}

    .align 2, 0

