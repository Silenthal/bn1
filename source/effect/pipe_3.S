#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Pipe_3
    push       {lr}
    ldr        r0,PTR_PTR_E_Pipe_3_0_Init_0807f2ec
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_Pipe_3_0_Init_0807f23c:
    .word E_Pipe_3_0_Init
    .word E_Pipe_3_1_Main
    .word E_Pipe_3_2_Free


_ts E_Pipe_3_0_Init
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r7,[r7,#0x6]
    lsr        r7,r7,#0x4
    cmp        r7,#0x2
    beq        LAB_0807f25c
    bl         Effect_Free
    pop        {pc}
LAB_0807f25c:
    mov        r0,#0x0
    bl         FUN_0807f2a8
    mov        r0,#0x1
    ldr        r1,DAT_0807f2f0
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x5]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0



_ts E_Pipe_3_1_Main
    push       {lr}
    mov        r0,#0x1
    bl         FUN_0807f2a8
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0



_ts E_Pipe_3_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts FUN_0807f2a8
    push       {lr}
    tst        r0,r0
    beq        LAB_0807f2b6
    mov        r0,#0xef
    bl         Flag_GetBase
    beq        LAB_0807f2e8
LAB_0807f2b6:
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    bne        LAB_0807f2d2
    mov        r0,#0x3
    push       {r0,r5}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x20
    add        r0,#0xe4
    bl         Flag_GetBase
    pop        {r0,r5}
    bne        LAB_0807f2e6
    mov        r0,#0x1
    b          LAB_0807f2e6
LAB_0807f2d2:
    mov        r0,#0x3
    push       {r0,r5}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x20
    add        r0,#0xe4
    bl         Flag_GetBase
    pop        {r0,r5}
    beq        LAB_0807f2e6
    mov        r0,#0x1
LAB_0807f2e6:
    strb       r0,[r5,#0x0]
LAB_0807f2e8:
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Pipe_3_0_Init_0807f2ec:
    .word PTR_E_Pipe_3_0_Init_0807f23c

DAT_0807f2f0:
    .word 0x102
