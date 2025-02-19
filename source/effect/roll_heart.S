#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_RollHeart
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_RollHeart_0_Init_080800a4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_RollHeart_0_Init_080800a4:
    .word PTR_E_RollHeart_0_Init_080800a8

PTR_E_RollHeart_0_Init_080800a8:
    .word E_RollHeart_0_Init
    .word E_RollHeart_1_Main
    .word E_RollHeart_2_Free


_ts E_RollHeart_0_Init
    push       {lr}
    ldrb       r0,[r5,#Effect_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xc7
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strb       r0,[r5,#Effect_frameIndexCurr]
    strb       r0,[r5,#Effect_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x4
    lsl        r0,r0,#0x10
    str        r0,[r5,#Effect_diff_z]
    mov        r0,#0x4
    str        r0,[r5,#Effect_state_s0]
    bl         E_RollHeart_1_Main
    pop        {pc}


_ts E_RollHeart_1_Main
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    ldr        r0,[r5,#Effect_pos_curr_z]
    ldr        r1,[r5,#Effect_diff_z]
    sub        r0,r0,r1
    str        r0,[r5,#Effect_pos_curr_z]
    bgt        LAB_080800fc
    mov        r0,#0x8
    str        r0,[r5,#Effect_state_s0]
LAB_080800fc:
    pop        {pc}


_nt E_RollHeart_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_nt Effect_RollHeart_Create
    push       {r5,lr}
    mov        r0,#0x32
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5,pc}

    .align 2, 0

