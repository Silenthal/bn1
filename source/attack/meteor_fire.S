#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Meteor_Fire
    push       {lr}
    ldr        r0,PTR_PTR_A_Meteor_Fire_0_Init_08071584
    ldrb       r1,[r5,#Attack_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_A_Meteor_Fire_0_Init_080714d8:
    .word A_Meteor_Fire_0_Init
    .word A_Meteor_Fire_1_Main
    .word A_Meteor_Fire_2_Free


_ts A_Meteor_Fire_0_Init
    push       {lr}
    bl         A_Meteor_Fire_CheckClear
    bne        LAB_0807151e
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xe4
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Attack_family_b1]
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
    strb       r0,[r5,#Attack_state_s0]
LAB_0807151e:
    pop        {pc}


_ts A_Meteor_Fire_1_Main
    push       {lr}
    push       {r5}
    mov        r0,#0x1
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_08071540
    LoadMain mapEventState, r0, r0
    ldrb       r0,[r0,#0x8]
    ldrb       r1,[r5,#Attack_family_family]
    cmp        r0,r1
    bne        LAB_08071540
    mov        r0,#0x1
    b          LAB_08071542
LAB_08071540:
    mov        r0,#0x0
LAB_08071542:
    bl         SpritePtr_SetPaletteIndex
    bl         A_Meteor_Fire_CheckClear
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts A_Meteor_Fire_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts A_Meteor_Fire_CheckClear
    push       {lr}
    mov        r0,#0xa0
    LoadMain world, r7, r7
    ldrb       r7,[r7,#0x4]
    cmp        r7,#0x81
    beq        LAB_08071568
    mov        r0,#0xdf
LAB_08071568:
    push       {r5}
    ldrb       r1,[r5,#Attack_family_family]
    add        r0,r0,r1
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0807157e
    bl         Attack_Free
    mov        r0,#0x1
    pop        {pc}
LAB_0807157e:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Meteor_Fire_0_Init_08071584:
    .word PTR_A_Meteor_Fire_0_Init_080714d8
