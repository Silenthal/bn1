#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_ElecManEscape
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_ElecManEscape_0_08099850
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ElecManEscape_0_08099844:
    .word SD_ElecManEscape_0
    .word SD_ElecManEscape_1
    .word SD_ElecManEscape_2

PTR_PTR_SD_ElecManEscape_0_08099850:
    .word PTR_SD_ElecManEscape_0_08099844


_ts SD_ElecManEscape_0
    push       {lr}
    Fade_Request FT_FadeOutToBlack, 0x4, save_r5=1
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s0]
    pop        {pc}


_ts SD_ElecManEscape_1
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s0]
    pop        {pc}


_ts SD_ElecManEscape_2
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_08099886
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         Battle_EndNow
    bl         ScreenDim_Free
LAB_08099886:
    pop        {pc}
