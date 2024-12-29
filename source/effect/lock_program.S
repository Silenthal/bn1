#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_LockProgram
    push       {lr}
    ldr        r0,PTR_PTR_E_LockProgram_0_Init_08080cfc
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_LockProgram_0_Init_08080bc4:
    .word E_LockProgram_0_Init
    .word E_LockProgram_1_Main
    .word E_LockProgram_2_Free


_ts E_LockProgram_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r7,PTR_USHORT_08080d00
    ldrb       r2,[r5,#0x4]
    ldrh       r1,[r7,r2]
    add        r2,#0x2
    ldrb       r2,[r7,r2]
    strb       r2,[r5,#0x14]
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
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x4
    bge        LAB_08080c1a
    LoadMain world, r0, r0
    ldrb       r0,[r0,#0x5]
    bl         SpritePtr_SetPaletteIndex
LAB_08080c1a:
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_LockProgram_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x4
    bne        LAB_08080c34
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08080c5e
    b          E_LockProgram_2_Free
LAB_08080c34:
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldr        r7,PTR_DAT_08080d04
    ldrb       r0,[r7,r1]
    bl         Flag_GetBase
    bne        E_LockProgram_2_Free
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x8
    beq        LAB_08080c5e
    mov        r0,#0xb4
    bl         Flag_GetBase
    beq        LAB_08080c5e
    mov        r0,#0xb4
    bl         Flag_ClearBase
    mov        r4,#0x4
    bl         E_LockProgram_CreateEffect
LAB_08080c5e:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

DAT_08080c64:
    .byte 0xB5
    .byte 0xB7
    .byte 0xFB
    .byte 0xFD
    .byte 0xE2

    .align 2, 0



_ts E_LockProgram_2_Free
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x8
    beq        LAB_08080c86
    push       {r5}
    ldrh       r1,[r5,#0x2a]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2e]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    bl         Effect_TrafficExplosion_1_Create
    pop        {r5}
LAB_08080c86:
    bl         Effect_Free
    pop        {pc}
    .word USHORT_08080c90

USHORT_08080c90:
    .short 0x8000
    .short 0x0
    .short 0x8000
    .short 0x2
    .short 0x8000
    .short -1
    .short 0x0
    .short 0x3
    .short 0x0
    .short 0x1
    .short 0x8000
    .short 0x2
    .short 0x8000
    .short -1
    .short 0x8000
    .short 0x1


_ts E_LockProgram_CreateEffect
    push       {lr}
    push       {r5}
    push       {r4}
    bl         Rng_RandomUint
    add        r6,r0,#0x0
    mov        r7,#0x7
    bl         Rng_RandomUint
    mov        r7,#0x1f
    and        r7,r0
    sub        r7,#0xf
    ldrh       r1,[r5,#0x2a]
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2e]
    lsl        r2,r2,#0x10
    mov        r7,#0x1f
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0xf
    ldrh       r3,[r5,#0x32]
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    pop        {r4}
    mov        r0,#0x3c
    bl         Effect_Alloc
    pop        {r5}
    pop        {pc}

    .align 2, 0


USHORT_08080cf0:
    .short 0x114

USHORT_08080cf2:
    .short 0x0
    .short 0xD3
    .short 0x0
    .short 0x115
    .short 0x0

PTR_PTR_E_LockProgram_0_Init_08080cfc:
    .word PTR_E_LockProgram_0_Init_08080bc4

PTR_USHORT_08080d00:
    .word USHORT_08080cf0

PTR_DAT_08080d04:
    .word DAT_08080c64
