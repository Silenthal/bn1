#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_LifeVirusMeteorExplosion
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_LifeVirusMeteorExplosion_0_Init_08077e04
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_LifeVirusMeteorExplosion_0_Init_08077e04:
    .word PTR_A_LifeVirusMeteorExplosion_0_Init_08077e08

PTR_A_LifeVirusMeteorExplosion_0_Init_08077e08:
    .word A_LifeVirusMeteorExplosion_0_Init
    .word A_LifeVirusMeteorExplosion_1_Main
    .word A_LifeVirusMeteorExplosion_2_Free


_ts A_LifeVirusMeteorExplosion_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xfe
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x3
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x9c
    bl         Sound_PlaySE
    bl         A_LifeVirusMeteorExplosion_1_Main
    pop        {pc}


_nt A_LifeVirusMeteorExplosion_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_LifeVirusMeteorExplosion_1_0_08077e60
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_LifeVirusMeteorExplosion_1_0_08077e60:
    .word PTR_A_LifeVirusMeteorExplosion_1_0_08077e64

PTR_A_LifeVirusMeteorExplosion_1_0_08077e64:
    .word A_LifeVirusMeteorExplosion_1_0
    .word A_LifeVirusMeteorExplosion_1_1
    .word A_LifeVirusMeteorExplosion_1_2


_ts A_LifeVirusMeteorExplosion_1_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts A_LifeVirusMeteorExplosion_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0xc
    bne        LAB_08077e92
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_08077e92:
    pop        {pc}


_ts A_LifeVirusMeteorExplosion_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x14
    bne        LAB_08077ea8
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08077ea8:
    pop        {pc}


_nt A_LifeVirusMeteorExplosion_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_LifeVirusMeteorExplosion_2_0_08077ebc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_LifeVirusMeteorExplosion_2_0_08077eb8:
    .word A_LifeVirusMeteorExplosion_2_0

PTR_PTR_A_LifeVirusMeteorExplosion_2_0_08077ebc:
    .word PTR_A_LifeVirusMeteorExplosion_2_0_08077eb8


_ts A_LifeVirusMeteorExplosion_2_0
    push       {lr}
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ble        LAB_08077ed0
    ldrb       r1,[r5,#0x19]
    mov        r6,#0xc8
    bl         Attack_LifeVirusMeteorExplosion_Create
LAB_08077ed0:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_LifeVirusMeteorExplosion_Create
    push       {lr}
    push       {r0,r1,r5,r6}
    mov        r0,#0x46
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5,r6}
    tst        r7,r7
    beq        LAB_08077f0a
    ldrb       r3,[r5,#0x16]
    strb       r3,[r7,#0x16]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    ldrh       r1,[r7,#0x2e]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    mov        r0,#0x0
    strb       r0,[r7,#0x1a]
LAB_08077f0a:
    add        r0,r7,#0x0
    pop        {pc}


_nt A_LiveVirusMeteor_CreateExplosion
    push       {lr}
    mov        r0,#0x3
    mov        r1,#0x1
    mov        r6,#0xc8
    bl         Attack_LifeVirusMeteorExplosion_Create
    mov        r0,#0x3
    mov        r1,#0x2
    mov        r6,#0xc8
    bl         Attack_LifeVirusMeteorExplosion_Create
    mov        r0,#0x3
    mov        r1,#0x3
    mov        r6,#0xc8
    bl         Attack_LifeVirusMeteorExplosion_Create
    pop        {pc}
