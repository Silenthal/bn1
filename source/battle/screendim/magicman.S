#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_MagicMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_MagicMan_0_Init_0809b3b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_MagicMan_0_Init_0809b3a8:
    .word SD_MagicMan_0_Init
    .word SD_MagicMan_1_Main
    .word SD_MagicMan_2_Free

PTR_PTR_SD_MagicMan_0_Init_0809b3b4:
    .word PTR_SD_MagicMan_0_Init_0809b3a8


_ts SD_MagicMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_MagicMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_MagicMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_MagicMan_1_0_0809b408
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_MagicMan_1_0_0809b3f8:
    .word SD_MagicMan_1_0
    .word SD_MagicMan_1_1
    .word SD_MagicMan_1_2
    .word SD_MagicMan_1_3

PTR_PTR_SD_MagicMan_1_0_0809b408:
    .word PTR_SD_MagicMan_1_0_0809b3f8


_ts SD_MagicMan_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809b442
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809b442
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x3c
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#ScreenDim_state_s3]
LAB_0809b442:
    pop        {pc}


_ts SD_MagicMan_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809b45a
    ldrb       r2,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    bl         Routine_MagicMan_Chip_Create
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809b45a:
    pop        {pc}


_ts SD_MagicMan_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809b46c
    mov        r0,#0xc
    strb       r0,[r5,#ScreenDim_state_s1]
    SD_SetTimer 0xa
LAB_0809b46c:
    pop        {pc}


_nt SD_MagicMan_1_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809b484
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    strh       r0,[r5,#ScreenDim_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809b484:
    pop        {pc}


_nt SD_MagicMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_0809b49e
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809b49e:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_0809b4b4
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b4b4:
    pop        {pc}

    .align 2, 0

