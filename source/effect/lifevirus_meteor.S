#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_LifeVirusMeteor
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_LifeVirusMeteor_0_Init_080809cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_LifeVirusMeteor_0_Init_080809cc:
    .word PTR_E_LifeVirusMeteor_0_Init_080809d0

PTR_E_LifeVirusMeteor_0_Init_080809d0:
    .word E_LifeVirusMeteor_0_Init
    .word E_LifeVirusMeteor_1_Main
    .word E_LifeVirusMeteor_2_Free


_ts E_LifeVirusMeteor_0_Init
    push       {lr}
    mov        r1,#0xcd
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x3
    mov        r1,#0x2
    bl         Battle_CellCoordsToSprite
    mov        r3,#0xd0
    lsl        r3,r3,#0x10
    add        r0,r0,r3
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    str        r3,[r5,#0x30]
    mov        r0,#0x0
    sub        r0,#0x4
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x44]
    str        r0,[r5,#0x4c]
    mov        r0,#0xe1
    bl         Sound_PlaySE
    bl         E_LifeVirusMeteor_1_Main
    pop        {pc}


_nt E_LifeVirusMeteor_1_Main
    push       {lr}
    ldr        r0,[r5,#0x44]
    ldr        r1,[r5,#0x28]
    add        r1,r1,r0
    str        r1,[r5,#0x28]
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    str        r1,[r5,#0x30]
    bgt        LAB_08080a4a
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08080a4a:
    pop        {pc}


_ts E_LifeVirusMeteor_2_Free
    push       {lr}
    bl         A_LiveVirusMeteor_CreateExplosion
    bl         Effect_Free
    pop        {pc}


_ts Effect_LifeVirusMeteor_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x3a
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    beq        LAB_08080a6c
    ldrb       r2,[r5,#0x16]
    strb       r2,[r7,#0x16]
LAB_08080a6c:
    pop        {pc}

    .align 2, 0

