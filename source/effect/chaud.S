#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Chaud
    push       {lr}
    ldr        r0,PTR_PTR_E_Chaud_0_Init_0807fa90
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_Chaud_0_Init_0807f9cc:
    .word E_Chaud_0_Init
    .word E_Chaud_1_Main
    .word E_Chaud_2_Free


_ts E_Chaud_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xa
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
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
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    pop        {pc}


_nt E_Chaud_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_Chaud_1_0_0807fa94
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

    .align 2, 0


PTR_E_Chaud_1_0_0807fa20:
    .word E_Chaud_1_0


_ts E_Chaud_1_0
    mov        r0,#0xde
    bl         Flag_GetBase
    beq        LAB_0807fa4a
    mov        r0,#0xde
    bl         Flag_ClearBase
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x10]
    add        r0,#0x4
    mov        r1,#0x7
    and        r0,r1
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_0807fa4a:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_Chaud_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_Chaud_1_Create
    push       {lr}
    mov        r1,#0x1e
    ldr        r2,DAT_0807fa98
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x2b
    bl         Effect_Alloc
    mov        r0,#0x1
    strh       r0,[r5,#0x14]
    pop        {pc}


_nt Effect_Chaud_2_Create
    push       {lr}
    mov        r1,#0x96
    ldr        r2,DAT_0807fa9c
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x2b
    bl         Effect_Alloc
    mov        r0,#0x1
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Chaud_0_Init_0807fa90:
    .word PTR_E_Chaud_0_Init_0807f9cc

PTR_PTR_E_Chaud_1_0_0807fa94:
    .word PTR_E_Chaud_1_0_0807fa20

DAT_0807fa98:
    .word -220

DAT_0807fa9c:
    .word -60
