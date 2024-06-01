#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_MoleHole
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_MoleHole_0_Init_0807b3a4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_MoleHole_0_Init_0807b398:
    .word A_MoleHole_0_Init
    .word A_MoleHole_1_Main
    .word A_MoleHole_2_Free

PTR_PTR_A_MoleHole_0_Init_0807b3a4:
    .word PTR_A_MoleHole_0_Init_0807b398


_ts A_MoleHole_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x65
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x4
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0xf
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_MoleHole_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts A_MoleHole_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_MoleHole_1_0_0807b40c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_MoleHole_1_0_0807b40c:
    .word PTR_A_MoleHole_1_0_0807b410

PTR_A_MoleHole_1_0_0807b410:
    .word A_MoleHole_1_0
    .word A_MoleHole_1_1


_ts A_MoleHole_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807b436
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_0807b436
    mov        r0,#0x5
    strh       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807b436:
    pop        {pc}


_ts A_MoleHole_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807b448
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807b448:
    pop        {pc}


_nt A_MoleHole_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_MoleHole_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x5b
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    beq        LAB_0807b470
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0807b470:
    pop        {pc}

    .align 2, 0

