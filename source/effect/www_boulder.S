#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_WWWBoulder
    push       {lr}
    ldr        r0,PTR_PTR_E_WWWBoulder_0_Init_08080f2c
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_WWWBoulder_0_Init_08080e14:
    .word E_WWWBoulder_0_Init
    .word E_WWWBoulder_1_Main
    .word E_WWWBoulder_2_Free


_ts E_WWWBoulder_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    ldr        r7,PTR_USHORT_08080f30
    ldrb       r2,[r5,#Effect_family_family]
    ldrh       r1,[r7,r2]
    add        r2,#0x2
    ldrb       r2,[r7,r2]
    strb       r2,[r5,#Effect_frameIndexCurr]
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}


_ts E_WWWBoulder_1_Main
    push       {lr}
    Flag_GetBase 0xF9
    bne        E_WWWBoulder_2_Free
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_WWWBoulder_2_Free
    push       {r5}
    ldrh       r1,[r5,#0x2A]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    bl         Effect_TrafficExplosion_1_Create
    pop        {r5}
    push       {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    pop        {r5}
    mov        r3,#0x0
    ldr        r6,PTR_DAT_08080ec0
LAB_08080e92:
    push       {r3,r6}
    bl         Rng_RandomUint
    mov        r4,#0x3
    and        r4,r0
    add        r4,#0x1
    ldr        r1,[r5,#Effect_pos_curr_x]
    ldr        r2,[r5,#Effect_pos_curr_y]
    ldr        r3,[r5,#Effect_pos_curr_z]
    ldr        r7,[r6,#0x4]
    ldr        r6,[r6,#0x0]
    mov        r0,#0x1
    bl         Effect_StonePiece_Create
    pop        {r3,r6}
    add        r6,#0x8
    add        r3,#0x1
    cmp        r3,#0x4
    bmi        LAB_08080e92
    bl         Effect_Free
    pop        {pc}

    .align 2, 0


PTR_DAT_08080ec0:
    .word DAT_08080ec4

DAT_08080ec4:
    .word 0x8000

DAT_08080ec8:
    .word 0x28000

DAT_08080ecc:
    .byte 0x00
    .byte 0x80
    .byte -1
    .byte -1
    .byte 0x00
    .byte 0x00
    .byte 0x03
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x02
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte -1
    .byte -1
    .byte 0x00
    .byte 0x80
    .byte 0x01


_ts Effect_WWWBoulder_CreateEffect
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
    ldrh       r1,[r5,#0x2A]
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
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
    mov        r0,#0x3d
    bl         Effect_Alloc
    pop        {r5}
    pop        {pc}

    .align 2, 0


USHORT_08080f24:
    .short 0x8A

USHORT_08080f26:
    .short 0x0
    .short 0xD3
    .short 0x0

PTR_PTR_E_WWWBoulder_0_Init_08080f2c:
    .word PTR_E_WWWBoulder_0_Init_08080e14

PTR_USHORT_08080f30:
    .word USHORT_08080f24
