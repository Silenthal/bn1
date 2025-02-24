#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_PharaohMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_PharaohMan_0_Init_0809b0a0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_PharaohMan_0_Init_0809b094:
    .word SD_PharaohMan_0_Init
    .word SD_PharaohMan_1
    .word SD_PharaohMan_2_Free

PTR_PTR_SD_PharaohMan_0_Init_0809b0a0:
    .word PTR_SD_PharaohMan_0_Init_0809b094


_ts SD_PharaohMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_PharoMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_PharaohMan_1
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_PharaohMan_1_0_0809b0f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_PharaohMan_1_0_0809b0e4:
    .word SD_PharaohMan_1_0
    .word SD_PharaohMan_1_1
    .word SD_PharaohMan_1_2
    .word SD_PharaohMan_1_3

PTR_PTR_SD_PharaohMan_1_0_0809b0f4:
    .word PTR_SD_PharaohMan_1_0_0809b0e4


_ts SD_PharaohMan_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809b12e
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809b12e
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x3c
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#ScreenDim_state_s3]
LAB_0809b12e:
    pop        {pc}


_ts SD_PharaohMan_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809b14a
    push       {r5}
    ldrb       r1,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    bl         Routine_PharaohMan_Chip_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809b14a:
    pop        {pc}


_ts SD_PharaohMan_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809b15c
    mov        r0,#0xc
    strb       r0,[r5,#ScreenDim_state_s1]
    SD_SetTimer 0x1e
LAB_0809b15c:
    pop        {pc}


_nt SD_PharaohMan_1_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809b17a
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#ScreenDim_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809b17a:
    pop        {pc}


_ts SD_PharaohMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_0809b194
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809b194:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809b1aa
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b1aa:
    pop        {pc}
