#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TrafficLight_2
    push       {lr}
    ldr        r0,PTR_PTR_E_TrafficLight_2_0_Init_0807ebcc
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TrafficLight_2_0_Init_0807eb28:
    .word E_TrafficLight_2_0_Init
    .word E_TrafficLight_2_1_Main
    .word E_TrafficLight_2_2_Free


_ts E_TrafficLight_2_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    ldr        r1,DAT_0807ebd0
    bl         Sprite_InitSpritePtr
    ldrb       r1,[r5,#Effect_family_b3]
    tst        r1,r1
    beq        LAB_0807eb52
    mov        r0,#0x0
    cmp        r1,#0x1
    beq        LAB_0807eb60
    mov        r0,#0x2
    b          LAB_0807eb60
LAB_0807eb52:
    LoadMain mapEventState, r7, r7
    ldrb       r0,[r7,#MapEventState_b8]
    ldrb       r1,[r5,#Effect_family_b1]
    tst        r1,r1
    beq        LAB_0807eb60
    ldrb       r0,[r7,#MapEventState_b9]
LAB_0807eb60:
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Effect_family_family]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x0
    ldrb       r1,[r5,#Effect_family_b2]
    cmp        r1,#0x0
    bne        LAB_0807eb8c
    ldr        r0,INT_0807ebd4
LAB_0807eb8c:
    bl         SpritePtr_SetObjectExcludeFlags
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}

    .align 2, 0



_ts E_TrafficLight_2_1_Main
    push       {lr}
    ldrb       r1,[r5,#Effect_family_b3]
    tst        r1,r1
    beq        LAB_0807ebaa
    mov        r0,#0x0
    cmp        r1,#0x1
    beq        LAB_0807ebb8
    mov        r0,#0x2
    b          LAB_0807ebb8
LAB_0807ebaa:
    LoadMain mapEventState, r7, r7
    ldrb       r0,[r7,#MapEventState_b8]
    ldrb       r1,[r5,#Effect_family_b1]
    tst        r1,r1
    beq        LAB_0807ebb8
    ldrb       r0,[r7,#MapEventState_b9]
LAB_0807ebb8:
    bl         SpritePtr_SetPaletteIndex
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0



_ts E_TrafficLight_2_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}

PTR_PTR_E_TrafficLight_2_0_Init_0807ebcc:
    .word PTR_E_TrafficLight_2_0_Init_0807eb28

DAT_0807ebd0:
    .word 0x10D

INT_0807ebd4:
    .word 0x8000000
