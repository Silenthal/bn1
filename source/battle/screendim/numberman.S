#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_NumberMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_NumberMan_0_Init_080989ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_NumberMan_0_Init_080989a0:
    .word SD_NumberMan_0_Init
    .word SD_NumberMan_1_Main
    .word SD_NumberMan_2_Free

PTR_PTR_SD_NumberMan_0_Init_080989ac:
    .word PTR_SD_NumberMan_0_Init_080989a0


_ts SD_NumberMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_NumbrMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_NumberMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_NumberMan_1_0_080989fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_NumberMan_1_0_080989f0:
    .word SD_NumberMan_1_0
    .word SD_NumberMan_1_1
    .word SD_NumberMan_1_2

PTR_PTR_SD_NumberMan_1_0_080989fc:
    .word PTR_SD_NumberMan_1_0_080989f0


_ts SD_NumberMan_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08098a36
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08098a36
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x1e
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_08098a36:
    pop        {pc}


_ts SD_NumberMan_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098a6e
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldr        r7,PTR_DAT_08098a70
    ldrb       r4,[r5,#ScreenDim_subFamily]
    ldrb       r6,[r7,r4]
    bl         Routine_NumberMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098a6e:
    pop        {pc}

PTR_DAT_08098a70:
    .word DAT_08098a74

DAT_08098a74:
    .byte 0x0A
    .byte 0x14
    .byte 0x1E


_ts SD_NumberMan_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_08098a8e
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098a8e:
    pop        {pc}


_ts SD_NumberMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_08098aa8
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098aa8:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_08098abe
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098abe:
    pop        {pc}
