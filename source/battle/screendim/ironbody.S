#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_IronBody
    push       {lr}
    ldr        r7,PTR_PTR_SD_IronBody_0_Init_08099bf0
    ldrb       r0,[r5,#ScreenDim_state_s0]
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
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    mov        r1,#CD_IronBody
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_nt SD_IronBody_1_Apply
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08099c6c
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08099c6c
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         R_Player_ApplyIronBody
    mov        r0,#0xd0
    bl         Sound_PlaySE
    SD_SetTimer 0x3c
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099c6c:
    pop        {pc}


_nt SD_IronBody_2_FadeIn
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099c88
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
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

