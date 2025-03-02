#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Escape
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_Escape_0_08098c20
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Escape_0_08098c10:
    .word SD_Escape_0
    .word SD_Escape_1
    .word SD_Escape_2_Failure
    .word SD_Escape_3_Success

PTR_PTR_SD_Escape_0_08098c20:
    .word PTR_SD_Escape_0_08098c10


_ts SD_Escape_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_Escape
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_Escape_1
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_Escape_1_0_ShowMessage_08098c64
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Escape_1_0_ShowMessage_08098c64:
    .word PTR_SD_Escape_1_0_ShowMessage_08098c68

PTR_SD_Escape_1_0_ShowMessage_08098c68:
    .word SD_Escape_1_0_ShowMessage
    .word SD_Escape_1_1_CheckEscapable
    .word SD_Escape_1_2_Wait
    .word SD_Escape_1_3_WarpIn
    .word SD_Escape_1_4_FadeOut


_ts SD_Escape_1_0_ShowMessage
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08098cb8
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08098cb8
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x7c
    bl         Sound_PlaySE
    SD_SetTimer_B 0x1
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_08098cb8:
    pop        {pc}


_nt SD_Escape_1_1_CheckEscapable
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098cdc
    Flag_GetSystem F_SYSTEM_NO_ESCAPE
    tst        r0,r0
    bne        LAB_08098cd4
    mov        r0,#0x10
    strb       r0,[r5,#ScreenDim_state_s1]
    pop        {pc}
LAB_08098cd4:
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
    SD_SetTimer_B 0x3c
LAB_08098cdc:
    pop        {pc}


_nt SD_Escape_1_2_Wait
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098cec
    mov        r0,#0xc
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098cec:
    pop        {pc}


_nt SD_Escape_1_3_WarpIn
    push       {lr}
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
    pop        {pc}


_nt SD_Escape_1_4_FadeOut
    push       {lr}
    Fade_Request FT_FadeOutToBlackExceptBG0, 0x4, save_r5=1
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
    pop        {pc}


_nt SD_Escape_2_Failure
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_08098d26
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098d26:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_08098d34
    bl         ScreenDim_Free
LAB_08098d34:
    pop        {pc}


_nt SD_Escape_3_Success
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_08098d54
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         Battle_EndNow
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098d54:
    pop        {pc}

    .align 2, 0

