#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Drain
    push       {lr}
    ldr        r7,PTR_PTR_SD_Drain_0_Init_0809a6e4
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Drain_0_Init_0809a6e4:
    .word PTR_SD_Drain_0_Init_0809a6e8

PTR_SD_Drain_0_Init_0809a6e8:
    .word SD_Drain_0_Init
    .word SD_Drain_1_Main
    .word SD_Drain_2
    .word SD_Drain_3


_ts SD_Drain_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_Drain1
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_Drain_1_Main
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809a760
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809a760
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    ldrh       r6,[r5,#ScreenDim_damage]
    bl         Routine_Drain_Create
    SD_SetTimer 0x90
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a760:
    pop        {pc}


_nt SD_Drain_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809a77c
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a77c:
    pop        {pc}


_nt SD_Drain_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a798
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a798:
    pop        {pc}

    .align 2, 0

