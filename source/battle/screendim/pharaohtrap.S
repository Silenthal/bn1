#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_PharaohTrap
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_PharaohTrap_0_Init_0809ad20
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_PharaohTrap_0_Init_0809ad14:
    .word SD_PharaohTrap_0_Init
    .word SD_PharaohTrap_1_Main
    .word SD_PharaohTrap_2_Free

PTR_PTR_SD_PharaohTrap_0_Init_0809ad20:
    .word PTR_SD_PharaohTrap_0_Init_0809ad14


_ts SD_PharaohTrap_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    mov        r1,#CD_PharaohTrap
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_nt SD_PharaohTrap_1_Main
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_PharaohTrap_1_0_0809ad70
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_SD_PharaohTrap_1_0_0809ad60:
    .word SD_PharaohTrap_1_0
    .word SD_PharaohTrap_1_1
    .word SD_PharaohTrap_1_2
    .word SD_PharaohTrap_1_3

PTR_PTR_SD_PharaohTrap_1_0_0809ad70:
    .word PTR_SD_PharaohTrap_1_0_0809ad60


_ts SD_PharaohTrap_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809ada6
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809ada6
    SD_SetTimer_B 0x3c
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#ScreenDim_state_s3]
LAB_0809ada6:
    pop        {pc}


_ts SD_PharaohTrap_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809adc0
    ldr        r0,[r5,#ScreenDim_param_14]
    bl         A_PharaohTrap_PlaceTrap
    mov        r0,#0x1
    strb       r0,[r5,#ScreenDim_state_s3]
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809adc0:
    pop        {pc}


_nt SD_PharaohTrap_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809add2
    mov        r0,#0xc
    strb       r0,[r5,#ScreenDim_state_s1]
    SD_SetTimer 0x1e
LAB_0809add2:
    pop        {pc}


_ts SD_PharaohTrap_1_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809ade6
    mov        r0,#0x8
    strh       r0,[r5,#ScreenDim_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809ade6:
    pop        {pc}


_ts SD_PharaohTrap_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_0809ae00
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809ae00:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_0809ae16
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809ae16:
    pop        {pc}
