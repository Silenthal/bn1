#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc" 


_ts ScreenDim_LifeSaver
    push       {lr}
    ldr        r7,PTR_PTR_SD_LifeSaver_0_0809b82c
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_LifeSaver_0_0809b82c:
    .word PTR_SD_LifeSaver_0_0809b830

PTR_SD_LifeSaver_0_0809b830:
    .word SD_LifeSaver_0
    .word SD_LifeSaver_1
    .word SD_LifeSaver_2
    .word SD_LifeSaver_3


_ts SD_LifeSaver_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    mov        r1,#CD_PA_LifeSaver
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_nt SD_LifeSaver_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809b8aa
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809b8aa
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    bl         Routine_LifeSaver_Create
    mov        r0,#0xde
    bl         Sound_PlaySE
    SD_SetTimer 0x60
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809b8aa:
    pop        {pc}


_ts SD_LifeSaver_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    cmp        r0,#0x1
    bne        LAB_0809b8c4
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809b8c4:
    pop        {pc}


_nt SD_LifeSaver_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809b8f0
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    ldr        r1,DAT_0809b8f4
    ldrb       r0,[r5,#ScreenDim_owner]
    mov        r2,#0x1
    bl         R_Player_SetInvisible
    mov        r0,#0x91
    bl         Sound_PlaySE
    bl         ScreenDim_Free
LAB_0809b8f0:
    pop        {pc}

    .align 2, 0


DAT_0809b8f4:
    .word 0x708
