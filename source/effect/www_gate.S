#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set DAT_0c000000, 0xC000000


_ts Effect_WWWGate
    push       {lr}
    ldr        r0,PTR_PTR_E_WWWGate_0_Init_0807dccc
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_WWWGate_0_Init_0807dae8:
    .word E_WWWGate_0_Init
    .word E_WWWGate_1_Main
    .word E_WWWGate_2_Free


_ts E_WWWGate_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xec
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    ldr        r2,[r5,#0x60]
    add        r1,r2,#0x0
    mov        r0,#0x3f
    and        r2,r0
    str        r2,[r5,#0x60]
    mov        r0,#0xc0
    and        r1,r0
    cmp        r1,#0x80
    beq        LAB_0807db48
    cmp        r1,#0x40
    beq        LAB_0807db42
    ldr        r0,DAT_0807dcd0
    bl         SpritePtr_SetObjectExcludeFlags
    b          LAB_0807db48
LAB_0807db42:
    ldr        r0,PTR_DAT_0807dcd4
    bl         SpritePtr_SetObjectExcludeFlags
LAB_0807db48:
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}


_nt E_WWWGate_1_Main
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x60]
    ldr        r0,PTR_BYTE_ARRAY_0807dcd8
    ldrb       r0,[r0,r1]
    bl         Flag_GetBase
    pop        {r5}
    beq        E_WWWGate_2_Free
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_WWWGate_2_Free
    mov        r0,#0x91
    bl         Sound_PlaySE
    bl         Effect_Free
    pop        {pc}


_nt Effect_WWWGate_Create
    push       {lr}
    push       {r5}
    push       {r1}
    mov        r0,#0x3f
    and        r1,r0
    ldr        r0,PTR_USHORT_ARRAY_ARRAY_0807dcdc
    mov        r2,#0x8
    mul        r2,r1
    add        r0,r0,r2
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
    ldrh       r6,[r0,#0x6]
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x10
    mov        r4,#0x0
    bl         Effect_Alloc
    strh       r6,[r5,#0x14]
    pop        {r1}
    str        r1,[r5,#0x60]
    pop        {r5}
    mov        r0,#0x3f
    and        r1,r0
    push       {r5}
    ldr        r0,PTR_BYTE_ARRAY_0807dce0
    ldrb       r0,[r0,r1]
    bl         Flag_SetBase
    pop        {r5}
    pop        {pc}

USHORT_ARRAY_ARRAY_0807dbb4:
    .short 0xFEB2
    .short 0x118
    .short 0x0
    .short 0x1
    .short 0x82
    .short 0x8E
    .short 0x40
    .short 0x2
    .short 0xFF84
    .short 0x82
    .short 0x40
    .short 0x3
    .short 0x42
    .short 0x96
    .short 0x0
    .short 0x1
    .short 0xFF82
    .short 0x96
    .short 0x0
    .short 0x1
    .short 0x122
    .short 0xB8
    .short 0x0
    .short 0x0
    .short 0x132
    .short 0x46
    .short 0x0
    .short 0x1
    .short 0x126
    .short 0xFF8C
    .short 0x40
    .short 0x0
    .short 0xFF86
    .short 0x19A
    .short 0x40
    .short 0x3
    .short 0x1B0
    .short 0x10
    .short 0x40
    .short 0x1
    .short 0xFF82
    .short 0xFFEA
    .short 0x0
    .short 0x2
    .short 0x1FA
    .short 0x4
    .short 0x0
    .short 0x1
    .short 0xB8
    .short 0xA6
    .short 0x0
    .short 0x3
    .short 0xF0
    .short 0xB0
    .short 0x40
    .short 0x3
    .short 0x108
    .short 0x14
    .short 0x40
    .short 0x1
    .short 0x48
    .short 0xB4
    .short 0x40
    .short 0x2
    .short 0x48
    .short 0x34
    .short 0x40
    .short 0x2
    .short 0x88
    .short 0x130
    .short 0x0
    .short 0x1
    .short 0x8
    .short 0xFF70
    .short 0x0
    .short 0x2
    .short 0xFEF0
    .short 0x110
    .short 0x40
    .short 0x3
    .short 0xFEA8
    .short 0xB8
    .short 0x40
    .short 0x1
    .short 0xFE28
    .short 0xFFF8
    .short 0x40
    .short 0x1
    .short 0xFE28
    .short 0xFFF8
    .short 0x60
    .short 0x1
    .short 0xD8
    .short 0xFF80
    .short 0x40
    .short 0x3
    .short 0x108
    .short 0xC0
    .short 0x40
    .short 0x3
    .short 0x120
    .short 0xFF08
    .short 0x0
    .short 0x0
    .short 0x1D0
    .short 0x10
    .short 0x0
    .short 0x0
    .short 0x178
    .short 0x10
    .short 0x40
    .short 0x0
    .short 0xD0
    .short 0xFEB0
    .short 0x0
    .short 0x0
    .short 0xFF9A
    .short 0x72
    .short 0x0
    .short 0x1
    .short 0xFF82
    .short 0x170
    .short 0x40
    .short 0x0

BYTE_ARRAY_0807dcac:
    .byte 0xA5
    .byte 0xA9
    .byte 0xAB
    .byte 0xAE
    .byte 0xB1
    .byte 0xB9
    .byte 0xBC
    .byte 0x24
    .byte 0x13
    .byte 0x16
    .byte 0x52
    .byte 0x57
    .byte 0x67
    .byte 0xB8
    .byte 0xB9
    .byte 0xBA
    .byte 0xBB
    .byte 0xBC
    .byte 0xBD
    .byte 0xBE
    .byte 0xBF
    .byte 0xC0
    .byte 0xC0
    .byte 0x77
    .byte 0x7A
    .byte 0x7D
    .byte 0x80
    .byte 0x83
    .byte 0x86
    .byte 0x89
    .byte 0x8C

    .align 2, 0


PTR_PTR_E_WWWGate_0_Init_0807dccc:
    .word PTR_E_WWWGate_0_Init_0807dae8

DAT_0807dcd0:
    .word 0x1C000000

PTR_DAT_0807dcd4:
    .word DAT_0c000000

PTR_BYTE_ARRAY_0807dcd8:
    .word BYTE_ARRAY_0807dcac

PTR_USHORT_ARRAY_ARRAY_0807dcdc:
    .word USHORT_ARRAY_ARRAY_0807dbb4

PTR_BYTE_ARRAY_0807dce0:
    .word BYTE_ARRAY_0807dcac
