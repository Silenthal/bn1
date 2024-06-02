#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_StonePiece
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_StonePiece_0_Init_0807df38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_StonePiece_0_Init_0807df38:
    .word PTR_E_StonePiece_0_Init_0807df3c

PTR_E_StonePiece_0_Init_0807df3c:
    .word E_StonePiece_0_Init
    .word E_StonePiece_1_Main
    .word E_StonePiece_2_Free


_ts E_StonePiece_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x8a
    bl         Sprite_InitSpritePtr
    ldr        r0,[r5,#0x4]
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0xc]
    bl         SpritePtr_SetPriority
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    bl         E_StonePiece_1_Main
    pop        {pc}


_ts E_StonePiece_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_E_StonePiece_1_0_0807df90
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_StonePiece_1_0_0807df90:
    .word PTR_E_StonePiece_1_0_0807df94

PTR_E_StonePiece_1_0_0807df94:
    .word E_StonePiece_1_0
    .word E_StonePiece_1_1


_ts E_StonePiece_1_0
    push       {lr}
    ldr        r0,[r5,#0x44]
    ldr        r1,[r5,#0x28]
    add        r1,r1,r0
    str        r1,[r5,#0x28]
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_0807dfc4
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    str        r1,[r5,#0x30]
    tst        r1,r1
    bge        LAB_0807dfc0
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807dfc0:
    pop        {pc}

    .align 2, 0


DAT_0807dfc4:
    .word 0xFFFFD000


_ts E_StonePiece_1_1
    push       {lr}
    mov        r0,#0x5
    ldrh       r1,[r5,#0x1c]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_0807dfd6
    mov        r0,#0x7
LAB_0807dfd6:
    strb       r0,[r5,#0x0]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807dfe4
    bl         E_StonePiece_2_Free
LAB_0807dfe4:
    pop        {pc}


_nt E_StonePiece_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_nt Effect_StonePiece_Create
    push       {lr}
    push       {r0,r5,r6,r7}
    mov        r0,#0x13
    bl         Effect_Alloc
    add        r2,r5,#0x0
    pop        {r0,r5,r6,r7}
    beq        LAB_0807e00c
    strb       r0,[r2,#0xc]
    str        r6,[r2,#0x44]
    mov        r1,#0x0
    str        r1,[r2,#0x48]
    str        r7,[r2,#0x4c]
    mov        r1,#0x5
    strb       r1,[r2,#0x0]
LAB_0807e00c:
    pop        {pc}

    .align 2, 0

