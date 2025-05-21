#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Pipe
    push       {lr}
    ldr        r0,PTR_PTR_E_Pipe_0_Init_0807f16c
    ldrb       r1,[r5,#Effect_state_s0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_Pipe_0_Init_0807f0d0:
    .word E_Pipe_0_Init
    .word E_Pipe_1_Main
    .word E_Pipe_2_Free
    .word E_Pipe_3


_ts E_Pipe_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    ldr        r1,DAT_0807f170
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Effect_family_b1]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    LoadMain world, r7, r7
    ldrb       r7,[r7,#World_storyFlag]
    lsr        r7,r7,#0x4
    cmp        r7,#0x2
    beq        LAB_0807f11e
    mov        r0,#0xc
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}
LAB_0807f11e:
    mov        r0,#0x0
    ldrb       r1,[r5,#Effect_family_b2]
    cmp        r1,#0xff
    bne        LAB_0807f128
    ldr        r0,DAT_0807f174
LAB_0807f128:
    bl         SpritePtr_SetObjectExcludeFlags
    bl         FUN_0807f154
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}


_ts E_Pipe_1_Main
    push       {lr}
    bl         FUN_0807f154
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_Pipe_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts E_Pipe_3
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts FUN_0807f154
    push       {lr}
    push       {r5}
    Flag_GetBase 0xE3
    pop        {r5}
    beq        LAB_0807f168
    mov        r0,#0x0
    bl         SpritePtr_SetObjectExcludeFlags
LAB_0807f168:
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Pipe_0_Init_0807f16c:
    .word PTR_E_Pipe_0_Init_0807f0d0

DAT_0807f170:
    .word 0x102

DAT_0807f174:
    .word 0x20000000
