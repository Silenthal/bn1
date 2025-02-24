#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_GutsShoot
    push       {lr}
    ldr        r7,PTR_PTR_SD_GutsShoot_0_Init_0809a548
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_GutsShoot_0_Init_0809a548:
    .word PTR_SD_GutsShoot_0_Init_0809a54c

PTR_SD_GutsShoot_0_Init_0809a54c:
    .word SD_GutsShoot_0_Init
    .word SD_GutsShoot_1
    .word SD_GutsShoot_2
    .word SD_GutsShoot_3


_ts SD_GutsShoot_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    mov        r1,#CD_PA_GutsShoot
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_nt SD_GutsShoot_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809a5d0
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809a5d0
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    ldrh       r6,[r5,#ScreenDim_damage]
    push       {r0,r4,r6}
    bl         Routine_GutsShoot_GutsMan_Create
    pop        {r0,r4,r6}
    bl         Routine_GutsShoot_MegaMan_Create
    mov        r0,#0xde
    bl         Sound_PlaySE
    SD_SetTimer 0xc0
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a5d0:
    pop        {pc}


_nt SD_GutsShoot_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809a5f0
    bl         ScreenDim_WarpPlayerIn
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a5f0:
    pop        {pc}


_nt SD_GutsShoot_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a60c
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a60c:
    pop        {pc}

    .align 2, 0

