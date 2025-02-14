#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_ElectricField
    push       {lr}
    ldr        r0,PTR_PTR_E_ElectricField_0_Init_0807f688
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_ElectricField_0_Init_0807f608:
    .word E_ElectricField_0_Init
    .word E_ElectricField_1_Main
    .word E_ElectricField_2_Free


_ts E_ElectricField_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_0807f68c
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x4]
    strb       r0,[r5,#0x14]
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
    mov        r0,#0x1e
    strb       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_ElectricField_1_Main
    push       {lr}
    push       {r5}
    bl         SpritePtr_ProcessFrameDelay
    pop        {r5}
    ldrb       r0,[r5,#0x1c]
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    tst        r0,r0
    bne        LAB_0807f66e
    mov        r0,#0x1e
    strb       r0,[r5,#0x1c]
    mov        r0,#0x8d
    bl         Sound_PlaySE
LAB_0807f66e:
    pop        {pc}


_ts E_ElectricField_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_ElectricField_Create
    push       {lr}
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x27
    bl         Effect_Alloc
    pop        {pc}

PTR_PTR_E_ElectricField_0_Init_0807f688:
    .word PTR_E_ElectricField_0_Init_0807f608

DAT_0807f68c:
    .word 0x108
