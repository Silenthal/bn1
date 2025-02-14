#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_WoodTower
    push       {lr}
    ldr        r7,PTR_PTR_A_WoodTower_0_Init_0806f814
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_WoodTower_0_Init_0806f808:
    .word A_WoodTower_0_Init
    .word A_WoodTower_1_Main
    .word A_WoodTower_2_Free

PTR_PTR_A_WoodTower_0_Init_0806f814:
    .word PTR_A_WoodTower_0_Init_0806f808


_ts A_WoodTower_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x71
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0806f87e
    bl         FieldObject_Alloc
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    mov        r1,#0x8
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x18]
    strb       r1,[r0,#0x2]
    strb       r1,[r0,#0x4]
    ldrb       r1,[r5,#0x19]
    strb       r1,[r0,#0x3]
    strb       r1,[r0,#0x5]
    str        r0,[r5,#0x60]
    pop        {pc}
LAB_0806f87e:
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x9c
    bl         Sound_PlaySE
    bl         A_WoodTower_1_Main
    pop        {pc}


_ts A_WoodTower_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0806f8c6
    ldr        r0,[r5,#0x60]
    bl         FieldObject_DisableIfDeleted
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    beq        LAB_0806f8c6
    bl         A_WoodTower_2_Free
    pop        {pc}
LAB_0806f8c6:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    add        r1,r0,#0x0
    mov        r2,#0x1
    tst        r1,r2
    bne        LAB_0806f8da
    bl         A_WoodTower_2_Free
LAB_0806f8da:
    ldr        r7,PTR_PTR_A_WoodTower_1_0_0806f8f8
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0


PTR_A_WoodTower_1_0_0806f8ec:
    .word A_WoodTower_1_0
    .word A_WoodTower_1_1
    .word A_WoodTower_1_2

PTR_PTR_A_WoodTower_1_0_0806f8f8:
    .word PTR_A_WoodTower_1_0_0806f8ec


_ts A_WoodTower_1_0
    push       {lr}
    mov        r1,#0x0
    ldrh       r0,[r5,#0x1c]
    ldr        r7,PTR_listWoodTowerActiveFrames_0806f960
    ldrb       r0,[r7,r0]
    tst        r0,r0
    beq        LAB_0806f90c
    mov        r1,#0x8
LAB_0806f90c:
    ldr        r7,[r5,#0x60]
    strb       r1,[r7,#0xc]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806f95c
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    cmp        r0,#0x3
    bne        LAB_0806f95c
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0806f948
    ldr        r6,PTR_PanelFlag_ARRAY_0806f964
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r0,[r6,r0]
    ldr        r7,[r5,#0x60]
    str        r0,[r7,#0xc]
    mov        r0,#0x32
    strh       r0,[r7,#0x8]
LAB_0806f948:
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x9c
    bl         Sound_PlaySE
LAB_0806f95c:
    pop        {pc}

    .align 2, 0


PTR_listWoodTowerActiveFrames_0806f960:
    .word listWoodTowerActiveFrames

PTR_PanelFlag_ARRAY_0806f964:
    .word PanelFlag_ARRAY_0806f968

PanelFlag_ARRAY_0806f968:
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy

listWoodTowerActiveFrames:
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00


_nt A_WoodTower_1_1
    push       {lr}
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_0806f9c0
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0806f9c0
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    add        r1,r0,#0x0
    ldr        r2,PTR_PanelFlag_ARRAY_0806f9d4
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r2,[r2,r0]
    tst        r1,r2
    beq        LAB_0806f9c0
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x1
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806f9b8
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
LAB_0806f9b8:
    pop        {r5}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0806f9c0:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806f9d0
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
LAB_0806f9d0:
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_0806f9d4:
    .word PanelFlag_ARRAY_0806f9d8

PanelFlag_ARRAY_0806f9d8:
    .word PF_EnemyOccupied
    .word PF_PlayerOccupied


_ts A_WoodTower_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806f9f4
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
LAB_0806f9f4:
    pop        {pc}


_nt A_WoodTower_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_0806fa26
    bl         A_WoodTower_TestOwnPanelFlag
    beq        LAB_0806fa20
    push       {r5}
    ldr        r7,PTR_PanelFlag_ARRAY_0806fa34
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r4,[r7,r0]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x24]
    mov        r6,#0x4
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r5}
LAB_0806fa20:
    bl         Attack_Free
    pop        {pc}
LAB_0806fa26:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_0806fa34:
    .word PanelFlag_ARRAY_0806f968


_ts Attack_WoodTower_Create
    push       {r5,lr}
    push       {r0,r1,r2,r3,r6}
    mov        r0,#0x2
    bl         Attack_Alloc
    tst        r5,r5
    pop        {r0,r1,r2,r3,r6}
    beq        LAB_0806fa62
    tst        r3,r3
    beq        LAB_0806fa50
    mov        r4,#0xd
    strb       r4,[r5,#0x0]
LAB_0806fa50:
    strb       r2,[r5,#0x16]
    strb       r3,[r5,#0x5]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    strh       r6,[r5,#0x24]
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x0
    str        r0,[r5,#0x30]
LAB_0806fa62:
    pop        {r5,pc}


_ts A_WoodTower_TestOwnPanelFlag
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0806fa7c
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_0806fa7c:
    .word PanelFlag_ARRAY_0806fa80

PanelFlag_ARRAY_0806fa80:
    .word PF_ActorEnemy
    .word PF_ActorPlayer
