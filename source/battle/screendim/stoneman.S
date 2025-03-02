#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_StoneMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
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
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_StoneMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_StoneMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
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
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08099432
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08099432
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x3c
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#ScreenDim_state_s3]
LAB_08099432:
    pop        {pc}


_ts SD_StoneMan_1_1_Chip
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099454
    push       {r5}
    ldrb       r1,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    bl         Routine_StoneMan_Chip_Create
    pop        {r5}
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08099454:
    pop        {pc}


_nt SD_StoneMan_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_08099466
    mov        r0,#0xc
    strb       r0,[r5,#ScreenDim_state_s1]
    SD_SetTimer 0x1e
LAB_08099466:
    pop        {pc}


_ts SD_StoneMan_1_3_WarpIn
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099484
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#ScreenDim_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_08099484:
    pop        {pc}


_nt SD_StoneMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_0809949e
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809949e:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_080994b4
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080994b4:
    pop        {pc}

    .align 2, 0

