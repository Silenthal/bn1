#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_FloorBreak
    push       {lr}
    ldr        r0,PTR_PTR_E_FloorBreak_0_Init_0807f704
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_FloorBreak_0_Init_0807f6a0:
    .word E_FloorBreak_0_Init
    .word E_FloorBreak_1_Main
    .word E_FloorBreak_2_Free


_ts E_FloorBreak_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xf5
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
    mov        r0,#0x1e
    strb       r0,[r5,#0x4]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0



_ts E_FloorBreak_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x1
    strb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_0807f6f4
    mov        r0,#0x2
    strb       r0,[r5,#0x8]
LAB_0807f6f4:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0



_ts E_FloorBreak_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}

PTR_PTR_E_FloorBreak_0_Init_0807f704:
    .word PTR_E_FloorBreak_0_Init_0807f6a0
