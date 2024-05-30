#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Meteor
    push       {lr}
    ldr        r0,PTR_PTR_A_Meteor_0_Init_080714c4
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_A_Meteor_0_Init_080713ac:
    .word A_Meteor_0_Init
    .word A_Meteor_1_Main
    .word A_Meteor_2_Free
    .word A_Meteor_3
    .word A_Meteor_4
    .word A_Meteor_5


_ts A_Meteor_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xe5
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoZClip
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_Meteor_1_Main
    pop        {pc}

    .align 2, 0



_ts A_Meteor_1_Main
    push       {lr}
    ldrh       r0,[r5,#0x2a]
    sub        r0,#0x8
    strh       r0,[r5,#0x2a]
    ldrh       r0,[r5,#0x32]
    sub        r0,#0x4
    strh       r0,[r5,#0x32]
    cmp        r0,#0x0
    bgt        LAB_08071442
    push       {r5}
    mov        r0,#0x0
    mov        r1,#0xa
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x0
    strh       r0,[r5,#0x32]
    mov        r0,#0xc
    strb       r0,[r5,#0x8]
    mov        r0,#0x76
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x9
    bne        LAB_0807142c
    push       {r5}
    mov        r0,#0xda
    bl         Flag_SetBase
    pop        {r5}
LAB_0807142c:
    mov        r0,#0x1
    mov        r1,#0xda
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
LAB_08071442:
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts A_Meteor_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807147e
    mov        r0,#0x10
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    mov        r1,#0xe4
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x5]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
LAB_0807147e:
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts A_Meteor_4
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080714ae
    mov        r0,#0x14
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_080714ae:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts A_Meteor_5
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts A_Meteor_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}

PTR_PTR_A_Meteor_0_Init_080714c4:
    .word PTR_A_Meteor_0_Init_080713ac
