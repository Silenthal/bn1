#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts Fade_Request
    mov        r2,#0x1
    neg        r2,r2
    push       { lr }
    LoadStateTo r5, Main_fade, r5
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
    LoadStateTo r0, Main_blend, r0
    strh       r2,[r0,#BlendSettings_m_blendControl]
LAB_08004b34:
    pop        { pc }

_ts Fade_Apply
    push       { lr }
    LoadStateTo r5, Main_fade, r5
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

_ts Fade_FadeIn
    push       { lr }
    LoadStateTo r0, Main_blend, r0
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

LAB_08004bce:
    pop {pc}

_ts Fade_FadeOut
    push       { lr }
    LoadStateTo r0, Main_blend, r0
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

_ts Fade_FadeOutSlight
    push       { lr }
    LoadStateTo r0, Main_blend, r0
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

_ts Fade_Init
    push       { lr }
    LoadStateTo r0, Main_fade, r0
    mov        r1,#0x8
    bl         memset0_32
    pop        { pc }

_ts InitFadeSettings
    push       { lr }
    bl         Fade_Init
    pop        { pc }

    .pool

global_label sinTable
    .short    0x0,     0x6,     0xC,    0x12
    .short   0x19,    0x1F,    0x25,    0x2B
    .short   0x31,    0x38,    0x3E,    0x44
    .short   0x4A,    0x50,    0x56,    0x5C
    .short   0x61,    0x67,    0x6D,    0x73
    .short   0x78,    0x7E,    0x83,    0x88
    .short   0x8E,    0x93,    0x98,    0x9D
    .short   0xA2,    0xA7,    0xAB,    0xB0
    .short   0xB5,    0xB9,    0xBD,    0xC1
    .short   0xC5,    0xC9,    0xCD,    0xD1
    .short   0xD4,    0xD8,    0xDB,    0xDE
    .short   0xE1,    0xE4,    0xE7,    0xEA
    .short   0xEC,    0xEE,    0xF1,    0xF3
    .short   0xF4,    0xF6,    0xF8,    0xF9
    .short   0xFB,    0xFC,    0xFD,    0xFE
    .short   0xFE,    0xFF,    0xFF,    0xFF
global_label cosTable
    .short  0x100,    0xFF,    0xFF,    0xFF
    .short   0xFE,    0xFE,    0xFD,    0xFC
    .short   0xFB,    0xF9,    0xF8,    0xF6
    .short   0xF4,    0xF3,    0xF1,    0xEE
    .short   0xEC,    0xEA,    0xE7,    0xE4
    .short   0xE1,    0xDE,    0xDB,    0xD8
    .short   0xD4,    0xD1,    0xCD,    0xC9
    .short   0xC5,    0xC1,    0xBD,    0xB9
    .short   0xB5,    0xB0,    0xAB,    0xA7
    .short   0xA2,    0x9D,    0x98,    0x93
    .short   0x8E,    0x88,    0x83,    0x7E
    .short   0x78,    0x73,    0x6D,    0x67
    .short   0x61,    0x5C,    0x56,    0x50
    .short   0x4A,    0x44,    0x3E,    0x38
    .short   0x31,    0x2B,    0x25,    0x1F
    .short   0x19,    0x12,     0xC,     0x6
    .short    0x0,  0xFFFA,  0xFFF4,  0xFFEE
    .short 0xFFE7,  0xFFE1,  0xFFDB,  0xFFD5
    .short 0xFFCF,  0xFFC8,  0xFFC2,  0xFFBC
    .short 0xFFB6,  0xFFB0,  0xFFAA,  0xFFA4
    .short 0xFF9F,  0xFF99,  0xFF93,  0xFF8D
    .short 0xFF88,  0xFF82,  0xFF7D,  0xFF78
    .short 0xFF72,  0xFF6D,  0xFF68,  0xFF63
    .short 0xFF5E,  0xFF59,  0xFF55,  0xFF50
    .short 0xFF4B,  0xFF47,  0xFF43,  0xFF3F
    .short 0xFF3B,  0xFF37,  0xFF33,  0xFF2F
    .short 0xFF2C,  0xFF28,  0xFF25,  0xFF22
    .short 0xFF1F,  0xFF1C,  0xFF19,  0xFF16
    .short 0xFF14,  0xFF12,  0xFF0F,  0xFF0D
    .short 0xFF0C,  0xFF0A,  0xFF08,  0xFF07
    .short 0xFF05,  0xFF04,  0xFF03,  0xFF02
    .short 0xFF02,  0xFF01,  0xFF01,  0xFF01
    .short 0xFF00,  0xFF01,  0xFF01,  0xFF01
    .short 0xFF02,  0xFF02,  0xFF03,  0xFF04
    .short 0xFF05,  0xFF07,  0xFF08,  0xFF0A
    .short 0xFF0C,  0xFF0D,  0xFF0F,  0xFF12
    .short 0xFF14,  0xFF16,  0xFF19,  0xFF1C
    .short 0xFF1F,  0xFF22,  0xFF25,  0xFF28
    .short 0xFF2C,  0xFF2F,  0xFF33,  0xFF37
    .short 0xFF3B,  0xFF3F,  0xFF43,  0xFF47
    .short 0xFF4B,  0xFF50,  0xFF55,  0xFF59
    .short 0xFF5E,  0xFF63,  0xFF68,  0xFF6D
    .short 0xFF72,  0xFF78,  0xFF7D,  0xFF82
    .short 0xFF88,  0xFF8D,  0xFF93,  0xFF99
    .short 0xFF9F,  0xFFA4,  0xFFAA,  0xFFB0
    .short 0xFFB6,  0xFFBC,  0xFFC2,  0xFFC8
    .short 0xFFCF,  0xFFD5,  0xFFDB,  0xFFE1
    .short 0xFFE7,  0xFFEE,  0xFFF4,  0xFFFA
    .short    0x0,     0x6,     0xC,    0x12
    .short   0x19,    0x1F,    0x25,    0x2B
    .short   0x31,    0x38,    0x3E,    0x44
    .short   0x4A,    0x50,    0x56,    0x5C
    .short   0x61,    0x67,    0x6D,    0x73
    .short   0x78,    0x7E,    0x83,    0x88
    .short   0x8E,    0x93,    0x98,    0x9D
    .short   0xA2,    0xA7,    0xAB,    0xB0
    .short   0xB5,    0xB9,    0xBD,    0xC1
    .short   0xC5,    0xC9,    0xCD,    0xD1
    .short   0xD4,    0xD8,    0xDB,    0xDE
    .short   0xE1,    0xE4,    0xE7,    0xEA
    .short   0xEC,    0xEE,    0xF1,    0xF3
    .short   0xF4,    0xF6,    0xF8,    0xF9
    .short   0xFB,    0xFC,    0xFD,    0xFE
    .short   0xFE,    0xFF,    0xFF,    0xFF
global_label tanTable
    .short    0x0,     0x6,     0xC,    0x12
    .short   0x19,    0x1F,    0x25,    0x2C
    .short   0x32,    0x39,    0x40,    0x46
    .short   0x4D,    0x54,    0x5B,    0x62
    .short   0x6A,    0x71,    0x79,    0x80
    .short   0x88,    0x91,    0x99,    0xA2
    .short   0xAB,    0xB4,    0xBD,    0xC7
    .short   0xD2,    0xDC,    0xE8,    0xF3
    .short   0xFF,   0x10C,   0x11A,   0x128
    .short  0x137,   0x148,   0x159,   0x16B
    .short  0x17F,   0x194,   0x1AB,   0x1C3
    .short  0x1DE,   0x1FC,   0x21D,   0x241
    .short  0x26A,   0x297,   0x2CB,   0x306
    .short  0x34B,   0x39D,   0x3FE,   0x474
    .short  0x506,   0x5C3,   0x6BD,   0x81B
    .short  0xA27,   0xD8E,  0x145A,  0x28BB

    .end
