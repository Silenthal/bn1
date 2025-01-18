#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_FloshellMiniBomb
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_FloshellMiniBomb_0_Init_08074070
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellMiniBomb_0_Init_08074070:
    .word PTR_A_FloshellMiniBomb_0_Init_08074074

PTR_A_FloshellMiniBomb_0_Init_08074074:
    .word A_FloshellMiniBomb_0_Init
    .word A_FloshellMiniBomb_1_Main
    .word A_FloshellMiniBomb_2_Free


_ts A_FloshellMiniBomb_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x75
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    bl         A_FloshellMiniBomb_1_Main
    pop        {pc}


_nt A_FloshellMiniBomb_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_FloshellMiniBomb_1_0_080740c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellMiniBomb_1_0_080740c4:
    .word PTR_A_FloshellMiniBomb_1_0_080740c8

PTR_A_FloshellMiniBomb_1_0_080740c8:
    .word A_FloshellMiniBomb_1_0


_ts A_FloshellMiniBomb_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740dc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740dc:
    .word PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740e0

PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740e0:
    .word A_FloshellMiniBomb_1_0_0_SetGravity
    .word A_FloshellMiniBomb_1_0_1_Explode
    .word A_FloshellMiniBomb_1_0_2_Next


_ts A_FloshellMiniBomb_1_0_0_SetGravity
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    push       {r0,r1,r5}
    ldr        r2,[r5,#0x28]
    ldr        r3,[r5,#0x2c]
    sub        r0,r0,r2
    sub        r1,r1,r3
    add        r3,r0,#0x0
    add        r0,r1,#0x0
    add        r1,r3,#0x0
    bl         VectorToAngle
    ldr        r1,DAT_0807413c
    bl         AngleToOffset
    add        r2,r0,#0x0
    add        r3,r1,#0x0
    pop        {r0,r1,r5}
    str        r2,[r5,#0x44]
    str        r3,[r5,#0x48]
    mov        r3,#0x0
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    ldr        r4,DAT_0807413c
    ldr        r6,DAT_08074138
    bl         Field_CalculateGravityZ
    str        r0,[r5,#0x4c]
    strh       r1,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_08074138:
    .word 0xFFFFE000

DAT_0807413c:
    .word 0x1E000


_ts A_FloshellMiniBomb_1_0_1_Explode
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08074188
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807415e
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741a8
LAB_0807415e:
    ldrb       r0,[r5,#0x6]
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x7]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    push       {r5}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
    mov        r6,#0x28
    bl         Effect_BombExplosion_Create
    pop        {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741a8
LAB_08074188:
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_080741ac
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    ldr        r0,[r5,#0x44]
    ldr        r1,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x48]
    ldr        r1,[r5,#0x2c]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
LAB_080741a8:
    pop        {pc}

    .align 2, 0


DAT_080741ac:
    .word 0xFFFFE000


_ts A_FloshellMiniBomb_1_0_2_Next
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080741c6
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741de
LAB_080741c6:
    mov        r1,#0x30
    tst        r0,r1
    beq        LAB_080741d2
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741de
LAB_080741d2:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080741de
    bl         A_FloshellMiniBomb_2_Free
LAB_080741de:
    pop        {pc}


_ts A_FloshellMiniBomb_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_FloshellMiniBomb_Create
    push       {r5,lr}
    push       {r5}
    mov        r0,#0x2a
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    tst        r7,r7
    beq        LAB_080741fe
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_080741fe:
    pop        {r5,pc}
