#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_BigStraight
    push       {lr}
    ldr        r7,PTR_PTR_SD_BigStraight_0_Init_0809a484
    ldrb       r0,[r5,#ScreenDim_state_s0]
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
    SD_SetTimer 0x1e
    mov        r1,#CD_PA_BigStraight
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_nt SD_BigStraight_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809a4fe
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809a4fe
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    ldrh       r6,[r5,#ScreenDim_damage]
    bl         Routine_BigStraight_Create
    SD_SetTimer 0x60
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a4fe:
    pop        {pc}


_ts SD_BigStraight_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809a51a
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
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
