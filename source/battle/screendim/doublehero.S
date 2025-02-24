#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_DoubleHero
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_DoubleHero_0_Init_0809b914
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_DoubleHero_0_Init_0809b908:
    .word SD_DoubleHero_0_Init
    .word SD_DoubleHero_1
    .word SD_DoubleHero_2_Free

PTR_PTR_SD_DoubleHero_0_Init_0809b914:
    .word PTR_SD_DoubleHero_0_Init_0809b908


_ts SD_DoubleHero_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_PA_DoubleHero
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_DoubleHero_1
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_DoubleHero_1_0_0809b964
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_DoubleHero_1_0_0809b958:
    .word SD_DoubleHero_1_0
    .word SD_DoubleHero_1_1
    .word SD_DoubleHero_1_2

PTR_PTR_SD_DoubleHero_1_0_0809b964:
    .word PTR_SD_DoubleHero_1_0_0809b958


_ts SD_DoubleHero_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809b99e
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809b99e
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x1e
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809b99e:
    pop        {pc}


_ts SD_DoubleHero_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809b9d4
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#ScreenDim_damage]
    mov        r4,#0x0
    push       {r0,r1,r2}
    bl         Routine_2xHeroMegaMan_Create
    pop        {r0,r1,r2}
    bl         Routine_2xHeroProtoMan_Create
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809b9d4:
    pop        {pc}


_nt SD_DoubleHero_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    cmp        r0,#0x2
    bne        LAB_0809b9e6
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809b9e6:
    pop        {pc}


_ts SD_DoubleHero_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_0809ba00
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809ba00:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809ba16
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809ba16:
    pop        {pc}
