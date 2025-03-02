#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_PoweredCannon
    push       {lr}
    ldr        r7,PTR_PTR_SD_PoweredCannon_0_Init_080986b8
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_PoweredCannon_0_Init_080986b8:
    .word PTR_SD_PoweredCannon_0_Init_080986bc

PTR_SD_PoweredCannon_0_Init_080986bc:
    .word SD_PoweredCannon_0_Init
    .word SD_PoweredCannon_1_ShowMessage
    .word SD_PoweredCannon_2_FadeIn
    .word SD_PoweredCannon_3_Free


_ts SD_PoweredCannon_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_PA_PoweredCannon
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_PoweredCannon_1_ShowMessage
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08098734
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08098734
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    mov        r6,#0xc8
    bl         Routine_PoweredCannon_Create
    SD_SetTimer 0xc0
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098734:
    pop        {pc}


_nt SD_PoweredCannon_2_FadeIn
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098750
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098750:
    pop        {pc}


_nt SD_PoweredCannon_3_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809876c
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809876c:
    pop        {pc}

    .align 2, 0

