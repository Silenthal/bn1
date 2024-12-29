#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Escape
    push       {lr}
    ldrb       r0,[r5,#0x0]
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
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x52
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts SD_Escape_1
    push       {lr}
    ldrb       r0,[r5,#0x1]
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
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08098cb8
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098cb8
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x7c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08098cb8:
    pop        {pc}


_nt SD_Escape_1_1_CheckEscapable
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098cdc
    mov        r0,#0x8
    bl         Flag_GetSystem
    tst        r0,r0
    bne        LAB_08098cd4
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    pop        {pc}
LAB_08098cd4:
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
LAB_08098cdc:
    pop        {pc}


_nt SD_Escape_1_2_Wait
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098cec
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
LAB_08098cec:
    pop        {pc}


_nt SD_Escape_1_3_WarpIn
    push       {lr}
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}


_nt SD_Escape_1_4_FadeOut
    push       {lr}
    mov        r0,#0x8
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
    pop        {pc}


_nt SD_Escape_2_Failure
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_08098d26
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_08098d26:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_08098d34
    bl         ScreenDim_Free
LAB_08098d34:
    pop        {pc}


_nt SD_Escape_3_Success
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_08098d54
    ldrb       r0,[r5,#0x6]
    bl         Battle_EndNow
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098d54:
    pop        {pc}

    .align 2, 0

