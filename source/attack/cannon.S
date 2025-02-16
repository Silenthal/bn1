#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Cannon
    push       {lr}
    ldr        r7,PTR_PTR_A_Cannon_0_Init_0806fcac
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_A_Cannon_0_Init_0806fbf8:
    .word A_Cannon_0_Init
    .word A_Cannon_1_Main
    .word A_Cannon_2_Free


_ts A_Cannon_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x6d
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         SpritePtr_NoShadow
    pop        {pc}


_nt A_Cannon_1_Main
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Cannon_1_0_0806fcb0
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

PTR_A_Cannon_1_0_0806fc3c:
    .word A_Cannon_1_0
    .word A_Cannon_1_1
    .word A_Cannon_1_2


_ts A_Cannon_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806fc6a
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    mov        r0,#0x1
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x29
    strh       r0,[r5,#Attack_counterA]
LAB_0806fc6a:
    pop        {pc}


_ts A_Cannon_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    beq        LAB_0806fc78
    pop        {pc}
LAB_0806fc78:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    pop        {pc}


_ts A_Cannon_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    bne        LAB_0806fc98
    mov        r0,#0xc
    str        r0,[r5,#Attack_state_s0]
LAB_0806fc98:
    pop        {pc}


_nt A_Cannon_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_nt Attack_Cannon_Create
    push       {lr}
    mov        r0,#0x4
    bl         Attack_Alloc
    pop        {pc}

PTR_PTR_A_Cannon_0_Init_0806fcac:
    .word PTR_A_Cannon_0_Init_0806fbf8

PTR_PTR_A_Cannon_1_0_0806fcb0:
    .word PTR_A_Cannon_1_0_0806fc3c
