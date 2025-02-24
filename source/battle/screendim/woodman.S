#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_WoodMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_WoodMan_0_Init_08098470
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_WoodMan_0_Init_08098464:
    .word SD_WoodMan_0_Init
    .word SD_WoodMan_1_Main
    .word SD_WoodMan_2_Free

PTR_PTR_SD_WoodMan_0_Init_08098470:
    .word PTR_SD_WoodMan_0_Init_08098464


_ts SD_WoodMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_WoodMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_WoodMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_WoodMan_1_0_PlayerWarpOut_080984c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_WoodMan_1_0_PlayerWarpOut_080984b4:
    .word SD_WoodMan_1_0_PlayerWarpOut
    .word SD_WoodMan_1_1
    .word SD_WoodMan_1_2
    .word SD_WoodMan_1_3

PTR_PTR_SD_WoodMan_1_0_PlayerWarpOut_080984c4:
    .word PTR_SD_WoodMan_1_0_PlayerWarpOut_080984b4


_ts SD_WoodMan_1_0_PlayerWarpOut
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_080984fe
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_080984fe
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x3c
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#ScreenDim_state_s3]
LAB_080984fe:
    pop        {pc}


_ts SD_WoodMan_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809851a
    push       {r5}
    ldrb       r0,[r5,#ScreenDim_subFamily]
    ldrb       r1,[r5,#ScreenDim_owner]
    bl         Actor_WoodManChip_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809851a:
    pop        {pc}


_ts SD_WoodMan_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809852c
    mov        r0,#0xc
    strb       r0,[r5,#ScreenDim_state_s1]
    SD_SetTimer 0x1e
LAB_0809852c:
    pop        {pc}


_nt SD_WoodMan_1_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809854a
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#ScreenDim_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809854a:
    pop        {pc}


_ts SD_WoodMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_08098564
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098564:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809857a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809857a:
    pop        {pc}
