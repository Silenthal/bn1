#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start Fade_Request
Fade_Request:
    mov        r2,#0x1
    neg        r2,r2
    push       { lr }
    LoadStateTo r5, Main_fadeSettings, r5
    tst        r0,r0
    beq        LAB_08004b34
    push       { r0, r1, r2 }
    bl         Fade_Init
    pop        { r0, r1, r2 }
    strb       r0,[r5,#FadeSettings_m_fadeType]
    strb       r1,[r5,#FadeSettings_m_fadeStep]
    mov        r0,#TRUE
    strb       r0,[r5,#FadeSettings_m_isApplyFadeFunc]
    mov        r0,#TRUE
    strb       r0,[r5,#FadeSettings_m_isApplyFadeFunc] @ Yes, it's done twice
    mov        r0,#TRUE
    strb       r0,[r5,#FadeSettings_m_isFadeActive]
    mov        r0,#FALSE
    strb       r0,[r5,#FadeSettings_m_isFadeStarted]
    cmp        r2,#0x0
    blt        LAB_08004b34
    @ r2 is always -1, so the following is never executed
    LoadStateTo r0, Main_blendSettings, r0
    strh       r2,[r0,#BlendSettings_m_blendControl]
LAB_08004b34:
    pop        { pc }
thumb_func_end Fade_Request

thumb_func_start Fade_Apply
Fade_Apply:
    push       { lr }
    LoadStateTo r5, Main_fadeSettings, r5
    ldrb       r0,[r5,#FadeSettings_m_isApplyFadeFunc]
    mov        r1,#TRUE
    cmp        r0,r1
    bne        LAB_08004b56
    ldrb       r2,[r5,#FadeSettings_m_fadeType]
    ldr        r0,=fadeFuncArgList
    ldrb       r1,[r0,r2]
    lsl        r2,r2,#0x2
    ldr        r0,=fadeFuncList
    ldr        r0,[r0,r2]
    mov        lr,pc
    bx         r0
LAB_08004b56:
    pop        { pc }
thumb_func_end Fade_Apply

fadeFuncList:
    .word 0
    .word Fade_FadeIn
    .word Fade_FadeOut
    .word Fade_FadeIn
    .word Fade_FadeOut
    .word Fade_FadeIn
    .word Fade_FadeOutSlight
    .word Fade_FadeIn
    .word Fade_FadeOut
    .word Fade_FadeIn
    .word Fade_FadeOut
    .word Fade_FadeIn
    .word Fade_FadeOutSlight
    .word Fade_FadeIn
    .word Fade_FadeOut
fadeFuncArgList:
    .byte 0x00, 0xBF, 0xBF, 0xFF
    .byte 0xFF, 0xEE, 0xEE, 0xFE
    .byte 0xFE, 0xBE, 0xBE, 0xF7
    .byte 0xF7, 0x41, 0x41

thumb_func_start Fade_FadeIn
Fade_FadeIn:
    push       { lr }
    LoadStateTo r0, Main_blendSettings, r0
    strb       r1,[r0,#BlendSettings_m_bldCnt_Target1]
    ldrh       r1,[r0,#BlendSettings_m_blendControl]
    ldrb       r2,[r5,#FadeSettings_m_fadeStep]
    ldrb       r3,[r5,#FadeSettings_m_isFadeStarted]
    mov        r4,#TRUE
    strb       r4,[r5,#FadeSettings_m_isFadeStarted]
    tst        r3,r3
    beq        LAB_08004bbc
    sub        r1,r1,r2
LAB_08004bbc:
    mov        r2,#0x0
    cmp        r2,r1
    bge        LAB_08004bc6
    strh       r1,[r0,#BlendSettings_m_blendControl]
    pop        { pc }
LAB_08004bc6:
    strh       r2,[r0,#BlendSettings_m_blendControl]
    bl         Fade_Init
    pop        { pc }
thumb_func_end Fade_FadeIn

LAB_08004bce:
    pop {pc}

thumb_func_start Fade_FadeOut
Fade_FadeOut:
    push       { lr }
    LoadStateTo r0, Main_blendSettings, r0
    strb       r1,[r0,#BlendSettings_m_bldCnt_Target1]
    ldrh       r1,[r0,#BlendSettings_m_blendControl]
    ldrb       r2,[r5,#FadeSettings_m_fadeStep]
    add        r1,r1,r2
    ldr        r2,=0x100
    cmp        r1,r2
    bge        LAB_08004be8
    strh       r1,[r0,#BlendSettings_m_blendControl]
    pop        { pc }
LAB_08004be8:
    strh       r2,[r0,#BlendSettings_m_blendControl]
    mov        r0,#FALSE
    strb       r0,[r5,#FadeSettings_m_isFadeActive]
    pop        { pc }
thumb_func_end Fade_FadeOut

thumb_func_start Fade_FadeOutSlight
Fade_FadeOutSlight:
    push       { lr }
    LoadStateTo r0, Main_blendSettings, r0
    strb       r1,[r0,#BlendSettings_m_bldCnt_Target1]
    ldrh       r1,[r0,#BlendSettings_m_blendControl]
    ldrb       r2,[r5,#FadeSettings_m_fadeStep]
    add        r1,r1,r2
    mov        r2,#0x40
    cmp        r1,r2
    bge        LAB_08004c08
    strh       r1,[r0,#BlendSettings_m_blendControl]
    pop        { pc }
LAB_08004c08:
    strh       r2,[r0,#BlendSettings_m_blendControl]
    mov        r0,#FALSE
    strb       r0,[r5,#FadeSettings_m_isFadeActive]
    pop        { pc }
thumb_func_end Fade_FadeOutSlight

thumb_func_start Fade_Init
Fade_Init:
    push       { lr }
    LoadStateTo r0, Main_fadeSettings, r0
    mov        r1,#0x8
    bl         memset0_32
    pop        { pc }
thumb_func_end Fade_Init

thumb_func_start InitFadeSettings
InitFadeSettings:
    push       { lr }
    bl         Fade_Init
    pop        { pc }
thumb_func_end InitFadeSettings

    .pool

    .end
