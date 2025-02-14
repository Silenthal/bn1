#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Thunder
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Thunder_0_Init_08075e34
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Thunder_0_Init_08075e34:
    .word PTR_A_Thunder_0_Init_08075e38

PTR_A_Thunder_0_Init_08075e38:
    .word A_Thunder_0_Init
    .word A_Thunder_1_Main
    .word A_Thunder_2_Free


_ts A_Thunder_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x6b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r1,#0x3
    strb       r1,[r5,#0x0]
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x2d
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    bl         R_Actor_UpdateSpritePos
    bl         A_Thunder_1_Main
    pop        {pc}


_nt A_Thunder_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    ldr        r2,PTR_PanelFlag_ARRAY_08075efc
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r2,r1]
    tst        r0,r1
    beq        LAB_08075ec2
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    b          LAB_08075eec
LAB_08075ec2:
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08075ece
    bl         A_Thunder_1_0
    b          LAB_08075ed2
LAB_08075ece:
    bl         A_Thunder_1_1
LAB_08075ed2:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0xf
    blt        LAB_08075eec
    mov        r0,#0xbc
    bl         Sound_PlaySE
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
LAB_08075eec:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PTR_A_Thunder_1_0_08075ef4

PTR_A_Thunder_1_0_08075ef4:
    .word A_Thunder_1_0
    .word A_Thunder_1_1

PTR_PanelFlag_ARRAY_08075efc:
    .word PanelFlag_ARRAY_08075f00

PanelFlag_ARRAY_08075f00:
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid


_ts A_Thunder_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Thunder_1_0_0_08075f18
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Thunder_1_0_0_08075f18:
    .word PTR_A_Thunder_1_0_0_08075f1c

PTR_A_Thunder_1_0_0_08075f1c:
    .word A_Thunder_1_0_0
    .word A_Thunder_1_0_1
    .word A_Thunder_1_0_2


_ts A_Thunder_1_0_0
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r1,[r5,#0x44]
    mul        r1,r0
    str        r1,[r5,#0x44]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         A_Thunder_1_0_1
    pop        {pc}


_nt A_Thunder_1_0_1
    push       {lr}
    mov        r0,#0x1
    ldr        r1,[r5,#0x44]
    tst        r1,r1
    bge        LAB_08075f4a
    sub        r0,#0x2
LAB_08075f4a:
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x68]
    str        r1,[r5,#0x6c]
    bl         R_Actor_UpdateCellPos
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt A_Thunder_1_0_2
    push       {lr}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r1,r1,r0
    str        r1,[r5,#0x28]
    ldr        r2,[r5,#0x68]
    bl         R_Fishy_IsSpritePosAtCellPos
    tst        r0,r0
    beq        LAB_08075faa
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_IsOutOfBounds
    bne        LAB_08075f88
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x1
    strb       r0,[r5,#0xc]
    bne        LAB_08075f92
LAB_08075f88:
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08075fae
LAB_08075f92:
    mov        r0,#0x1
    ldr        r1,[r5,#0x44]
    tst        r1,r1
    bge        LAB_08075f9c
    sub        r0,#0x2
LAB_08075f9c:
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x68]
    str        r1,[r5,#0x6c]
LAB_08075faa:
    bl         R_Actor_UpdateCellPos
LAB_08075fae:
    pop        {pc}


_ts A_Thunder_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Thunder_1_1_0_08075fc0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Thunder_1_1_0_08075fc0:
    .word PTR_A_Thunder_1_1_0_08075fc4

PTR_A_Thunder_1_1_0_08075fc4:
    .word A_Thunder_1_1_0
    .word A_Thunder_1_1_1
    .word A_Thunder_1_1_2


_ts A_Thunder_1_1_0
    push       {lr}
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x1
    strb       r0,[r5,#0xc]
    bge        LAB_08075fe4
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0807600e
LAB_08075fe4:
    bl         A_Thunder_GetNextPanelNearPlayer
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    ldrb       r2,[r5,#0x18]
    cmp        r0,r2
    beq        LAB_08075ffe
    ldr        r0,[r5,#0x70]
    bgt        LAB_08075ff8
    neg        r0,r0
LAB_08075ff8:
    str        r0,[r5,#0x44]
    mov        r3,#0x4
    b          LAB_0807600c
LAB_08075ffe:
    ldrb       r2,[r5,#0x19]
    cmp        r1,r2
    ldr        r0,[r5,#0x70]
    bgt        LAB_08076008
    neg        r0,r0
LAB_08076008:
    str        r0,[r5,#0x48]
    mov        r3,#0x8
LAB_0807600c:
    strb       r3,[r5,#0xa]
LAB_0807600e:
    pop        {pc}


_ts A_Thunder_1_1_1
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r0,#0x0
    ldr        r1,[r5,#0x28]
    ldr        r0,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    bl         R_Fishy_IsSpritePosAtCellPos
    tst        r0,r0
    beq        LAB_0807603c
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
LAB_0807603c:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_nt A_Thunder_1_1_2
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    ldr        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x48]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    bl         R_Fishy_IsSpritePosAtCellPos
    tst        r0,r0
    beq        LAB_0807606e
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807606e:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_ts A_Thunder_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt Attack_Thunder_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6,r7}
    mov        r0,#0x38
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6,r7}
    tst        r4,r4
    beq        LAB_080760aa
    strb       r0,[r4,#0x18]
    strb       r1,[r4,#0x19]
    str        r2,[r4,#0x44]
    str        r2,[r4,#0x70]
    strb       r3,[r4,#0xc]
    strh       r6,[r4,#0x24]
    str        r7,[r4,#0x30]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r4,#0x16]
    mov        r0,#0x1
    strb       r0,[r4,#0x1a]
LAB_080760aa:
    add        r0,r4,#0x0
    pop        {pc}


_nt A_Thunder_GetNextPanelNearPlayer
    push       {lr}
    mov        r3,#0x0
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r2,[r7,#0x18]
    ldrb       r3,[r7,#0x19]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    sub        r0,r0,r2
    bpl        LAB_080760c6
    neg        r0,r0
LAB_080760c6:
    sub        r1,r1,r3
    bpl        LAB_080760cc
    neg        r1,r1
LAB_080760cc:
    cmp        r0,r1
    ble        LAB_080760e0
    ldrb       r0,[r5,#0x18]
    cmp        r0,r2
    bmi        LAB_080760da
    sub        r0,#0x1
    b          LAB_080760dc
LAB_080760da:
    add        r0,#0x1
LAB_080760dc:
    ldrb       r1,[r5,#0x19]
    b          LAB_080760ee
LAB_080760e0:
    ldrb       r1,[r5,#0x19]
    cmp        r1,r3
    bmi        LAB_080760ea
    sub        r1,#0x1
    b          LAB_080760ec
LAB_080760ea:
    add        r1,#0x1
LAB_080760ec:
    ldrb       r0,[r5,#0x18]
LAB_080760ee:
    pop        {pc}
