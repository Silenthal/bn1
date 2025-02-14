#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TallExplosion
    push       {lr}
    ldr        r0,PTR_PTR_E_TallExplosion_0_Init_0807c260
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_TallExplosion_0_Init_0807c200:
    .word E_TallExplosion_0_Init
    .word E_TallExplosion_1_Main
    .word E_TallExplosion_2_Free


_ts E_TallExplosion_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xda
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0



_ts E_TallExplosion_1_Main
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807c250
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
LAB_0807c250:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0



_ts E_TallExplosion_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}

PTR_PTR_E_TallExplosion_0_Init_0807c260:
    .word PTR_E_TallExplosion_0_Init_0807c200
