#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_WaterSpray
    push       {lr}
    ldr        r0,PTR_PTR_E_WaterSpray_0_Init_0807c30c
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_WaterSpray_0_Init_0807c274:
    .word E_WaterSpray_0_Init
    .word E_WaterSpray_1_Main
    .word E_WaterSpray_2_Free
    .word E_WaterSpray_3_CheckFlag


_ts E_WaterSpray_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xe1
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
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
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0



_ts E_WaterSpray_1_Main
    push       {lr}
    push       {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0807c2d8
    mov        r0,#0x1
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0xc
    strb       r0,[r5,#0x8]
LAB_0807c2d8:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0



_ts E_WaterSpray_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts E_WaterSpray_3_CheckFlag
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807c304
    push       {r5}
    mov        r0,#0xd7
    bl         Flag_SetBase
    pop        {r5}
    bl         Effect_Free
    pop        {pc}
LAB_0807c304:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0


PTR_PTR_E_WaterSpray_0_Init_0807c30c:
    .word PTR_E_WaterSpray_0_Init_0807c274
