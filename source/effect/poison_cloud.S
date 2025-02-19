#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_PoisonCloud
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_PoisonCloud_0_Init_0807fab0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_PoisonCloud_0_Init_0807fab0:
    .word PTR_E_PoisonCloud_0_Init_0807fab4

PTR_E_PoisonCloud_0_Init_0807fab4:
    .word E_PoisonCloud_0_Init
    .word E_PoisonCloud_1_Main
    .word E_PoisonCloud_2_Free


_ts E_PoisonCloud_0_Init
    push       {lr}
    ldrb       r0,[r5,#Effect_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xf5
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Effect_family_family]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x1
    strb       r0,[r5,#Effect_frameIndexCurr]
    strb       r0,[r5,#Effect_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x2
    lsl        r0,r0,#0x10
    str        r0,[r5,#Effect_diff_z]
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    bl         E_PoisonCloud_1_Main
    pop        {pc}


_nt E_PoisonCloud_1_Main
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    ldr        r0,[r5,#Effect_pos_curr_z]
    ldr        r1,[r5,#Effect_diff_z]
    add        r0,r0,r1
    str        r0,[r5,#Effect_pos_curr_z]
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807fb16
    mov        r0,#0x8
    str        r0,[r5,#Effect_state_s0]
LAB_0807fb16:
    pop        {pc}


_ts E_PoisonCloud_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_PoisonCloud_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x2c
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0807fb3c
    ldrb       r0,[r5,#Effect_header_entityFlags]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0807fb3c:
    pop        {pc}

    .align 2, 0

