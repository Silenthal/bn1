#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_LanBed
    push       {lr}
    ldr        r0,PTR_PTR_R_LanBed_0_Init_0805b1f4
    ldrb       r1,[r5,#Actor_state_s0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_R_LanBed_0_Init_0805b164:
    .word R_LanBed_0_Init
    .word R_LanBed_1_Main
    .word R_LanBed_2_Free


_ts R_LanBed_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x12
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
    strb       r0,[r5,#Actor_state_s0]
    pop        {pc}

    .align 2, 0



_ts R_LanBed_1_Main
    ldr        r0,PTR_PTR_R_LanBed_1_0_SetAnimation_0805b1f8
    ldrb       r1,[r5,#Actor_state_s1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_R_LanBed_1_0_SetAnimation_0805b1b0:
    .word R_LanBed_1_0_SetAnimation
    .word R_LanBed_1_1_WaitAnim


_ts R_LanBed_2_Free
    push       {lr}
    bl         Actor_Free
    pop        {pc}


_ts R_LanBed_1_0_SetAnimation
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    mov        r0,#0xd9
    LoadMain world, r1, r1
    ldrb       r1,[r1,#0x6]
    mov        r2,#0x20
    and        r1,r2
    beq        LAB_0805b1d6
    mov        r0,#0x9c
LAB_0805b1d6:
    bl         Flag_GetBase
    beq        LAB_0805b1ea
    mov        r0,#0x1
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
LAB_0805b1ea:
    pop        {pc}


_ts R_LanBed_1_1_WaitAnim
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

PTR_PTR_R_LanBed_0_Init_0805b1f4:
    .word PTR_R_LanBed_0_Init_0805b164

PTR_PTR_R_LanBed_1_0_SetAnimation_0805b1f8:
    .word PTR_R_LanBed_1_0_SetAnimation_0805b1b0
