#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TrafficBarrier
    push       {lr}
    ldr        r0,PTR_PTR_E_TrafficBarrier_0_Init_0807e770
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TrafficBarrier_0_Init_0807e704:
    .word E_TrafficBarrier_0_Init
    .word E_TrafficBarrier_1_Main
    .word E_TrafficBarrier_2_Free


_ts E_TrafficBarrier_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_0807e774
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
    bl         E_TrafficBarrier_1_Main
    pop        {pc}

    .align 2, 0



_ts E_TrafficBarrier_1_Main
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    ldr        r7,PTR_DAT_0807e778
    ldrb       r0,[r7,#0x5]
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x1
    and        r1,r2
    cmp        r0,r1
    beq        LAB_0807e760
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_0807e760:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0



_ts E_TrafficBarrier_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}

PTR_PTR_E_TrafficBarrier_0_Init_0807e770:
    .word PTR_E_TrafficBarrier_0_Init_0807e704

DAT_0807e774:
    .word 0x109

PTR_DAT_0807e778:
    .word gTraffic
