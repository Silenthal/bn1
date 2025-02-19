#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_AirBlowing
    push       {lr}
    ldr        r0,PTR_PTR_E_AirBlowing_0_Init_0807e648
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_AirBlowing_0_Init_0807e5b8:
    .word E_AirBlowing_0_Init
    .word E_AirBlowing_1_Main
    .word E_AirBlowing_2_Free


_ts E_AirBlowing_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r1,#0x89
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    ldrb       r2,[r5,#Effect_family_family]
    tst        r2,r2
    beq        LAB_0807e5de
    mov        r0,#0x1
    bl         SpritePtr_SetFlipType
LAB_0807e5de:
    mov        r0,#0x3c
    strb       r0,[r5,#Effect_family_b2]
    mov        r0,#0x4
    strb       r0,[r5,#Effect_frameIndexCurr]
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


_ts E_AirBlowing_1_Main
    push       {lr}
    ldrb       r0,[r5,#Effect_family_b2]
    sub        r0,#0x1
    strb       r0,[r5,#Effect_family_b2]
    beq        E_AirBlowing_2_Free
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_AirBlowing_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_AirBlowing_Create
    push       {lr}
    push       {r5}
    push       {r1}
    mov        r1,#0x36
    ldr        r2,DAT_0807e64c
    ldr        r3,DAT_0807e650
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x19
    bl         Effect_Alloc
    mov        r6,#0x4
    strh       r6,[r5,#Effect_frameIndexCurr]
    pop        {r1}
    str        r1,[r5,#Effect_obj_60]
    pop        {r5}
    pop        {pc}

    .align 2, 0


PTR_PTR_E_AirBlowing_0_Init_0807e648:
    .word PTR_E_AirBlowing_0_Init_0807e5b8

DAT_0807e64c:
    .word 0x168

DAT_0807e650:
    .word 0xFFFFFFA0
