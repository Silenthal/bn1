#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Pipe_2
    push       {lr}
    ldr        r0,PTR_PTR_E_Pipe_2_0_Init_0807f224
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_Pipe_2_0_Init_0807f188:
    .word E_Pipe_2_0_Init
    .word E_Pipe_2_1_Main
    .word E_Pipe_2_2_Free


_ts E_Pipe_2_0_Init
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r7,[r7,#0x6]
    lsr        r7,r7,#0x4
    cmp        r7,#0x2
    beq        LAB_0807f1a8
    bl         Effect_Free
    pop        {pc}
LAB_0807f1a8:
    bl         FUN_0807f1ec
    mov        r0,#0x1
    ldr        r1,DAT_0807f228
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x5]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_Pipe_2_1_Main
    push       {lr}
    bl         FUN_0807f1ec
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_Pipe_2_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts FUN_0807f1ec
    push       {lr}
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    bne        LAB_0807f20a
    mov        r0,#0x3
    push       {r0,r5}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x20
    add        r0,#0xe4
    bl         Flag_GetBase
    pop        {r0,r5}
    bne        LAB_0807f21e
    mov        r0,#0x1
    b          LAB_0807f21e
LAB_0807f20a:
    mov        r0,#0x3
    push       {r0,r5}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x20
    add        r0,#0xe4
    bl         Flag_GetBase
    pop        {r0,r5}
    beq        LAB_0807f21e
    mov        r0,#0x1
LAB_0807f21e:
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Pipe_2_0_Init_0807f224:
    .word PTR_E_Pipe_2_0_Init_0807f188

DAT_0807f228:
    .word 0x102
