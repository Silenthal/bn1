#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Megalian
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Megalian_0_Init_08066a1c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Megalian_0_Init_08066a1c:
    .word PTR_R_Megalian_0_Init_08066a20

PTR_R_Megalian_0_Init_08066a20:
    .word R_Megalian_0_Init
    .word R_Megalian_1_Main
    .word R_Megalian_2_Free


_ts R_Megalian_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x53
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    bl         FUN_08066fac
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0xc]
    strh       r0,[r5,#0x1e]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    ldr        r7,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldrb       r4,[r5,#0x4]
    ldr        r7,PTR_DAT_08066ad8
    ldrb       r6,[r5,#0x4]
    ldrb       r6,[r7,r6]
    bl         Attack_MegalianHead_Create
    str        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_08066aba
    bl         A_Megalian_HideHead
LAB_08066aba:
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    bne        LAB_08066acc
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_08066acc:
    bl         R_Megalian_1_Main
    pop        {pc}

DAT_08066ad2:
    .byte 0x64
    .byte 0xA0
    .byte 0xF0

    .align 2, 0


PTR_DAT_08066ad8:
    .word DAT_08066ad2


_ts R_Megalian_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08066b54
    bl         Battle_IsInputLocked
    bne        LAB_08066b54
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_08066bbc
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_08066b2e
    ldrb       r0,[r5,#0x4]
    add        r0,#0x1
    bl         R_Actor_IsShieldPopped
    tst        r0,r0
    beq        LAB_08066b2e
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
LAB_08066b2e:
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08066b3e
    ldrh       r1,[r7,#0x20]
    add        r0,r0,r1
LAB_08066b3e:
    tst        r0,r0
    beq        LAB_08066b54
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08066b54:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_08066b88
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08066ba0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08066b7a
    mov        r0,#0x9
    b          LAB_08066b7c
LAB_08066b7a:
    mov        r0,#0xf
LAB_08066b7c:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08066b9a
LAB_08066b88:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08066b9a:
    bl         R_Megalian_CheckAuraDisplay
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_08066ba0:
    .word PTR_R_Actor_1_0_Spawn_08066ba4

PTR_R_Actor_1_0_Spawn_08066ba4:
    .word R_Actor_1_0_Spawn
    .word R_Megalian_1_1_Wait
    .word R_Megalian_1_2_Decide
    .word R_Megalian_1_3_Move
    .word R_Megalian_1_4_None
    .word R_Megalian_1_5_Attack

PanelFlag_08066bbc:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Megalian_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08066be2
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08066be2:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08066c02
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_08066bfe
    bl         A_Megalian_ShowHead
LAB_08066bfe:
    mov        r0,#0x6e
    strh       r0,[r5,#0x1c]
LAB_08066c02:
    pop        {pc}


_ts R_Megalian_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Megalian_1_2_0_08066c2c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08066c22
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08066c22:
    pop        {pc}

PTR_R_Megalian_1_2_0_08066c24:
    .word R_Megalian_1_2_0
    .word R_Megalian_1_2_1

PTR_PTR_R_Megalian_1_2_0_08066c2c:
    .word PTR_R_Megalian_1_2_0_08066c24


_ts R_Megalian_1_2_0
    push       {lr}
    mov        r2,#0x4
    strb       r2,[r5,#0xa]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Megalian_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08066c80
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    beq        LAB_08066c58
    bl         R_Megalian_GetNextMovePanel
    cmp        r0,#0xff
    bne        LAB_08066c6a
    b          LAB_08066c7c
LAB_08066c58:
    bl         R_Megalian_GetPanelInPlayerRow
    cmp        r0,#0xff
    bne        LAB_08066c6a
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08066c80
LAB_08066c6a:
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         R_Megalian_1_3_Move
    b          LAB_08066c80
LAB_08066c7c:
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08066c80:
    pop        {pc}


_nt R_Megalian_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Megalian_1_3_0_08066c90
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Megalian_1_3_0_08066c90:
    .word PTR_R_Megalian_1_3_0_08066c94

PTR_R_Megalian_1_3_0_08066c94:
    .word R_Megalian_1_3_0
    .word R_Megalian_1_3_1
    .word R_Megalian_1_3_2


_ts R_Megalian_1_3_0
    push       {lr}
    ldrh       r0,[r5,#0x6]
    ldrh       r1,[r5,#0x18]
    cmp        r0,r1
    bne        LAB_08066cb4
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    b          LAB_08066cfa
LAB_08066cb4:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    mvn        r1,r1
    and        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_08066cf2
    bl         A_Megalian_HideHead
LAB_08066cf2:
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08066cfa:
    pop        {pc}


_ts R_Megalian_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08066d34
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    push       {r5}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#0x30]
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x14
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08066d34:
    pop        {pc}


_nt R_Megalian_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08066d74
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_08066d52
    bl         A_Megalian_ShowHead
LAB_08066d52:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    ldrh       r0,[r5,#0x1e]
    tst        r0,r0
    beq        LAB_08066d6c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08066d74
LAB_08066d6c:
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08066d74:
    pop        {pc}


_nt R_Megalian_1_4_None
    push       {lr}
    pop        {pc}


_nt R_Megalian_1_5_Attack
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Megalian_1_5_0_08066d94
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Megalian_1_5_0_08066d88:
    .word R_Megalian_1_5_0
    .word R_Megalian_1_5_1
    .word R_Megalian_1_5_2

PTR_PTR_R_Megalian_1_5_0_08066d94:
    .word PTR_R_Megalian_1_5_0_08066d88


_ts R_Megalian_1_5_0
    push       {lr}
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Megalian_1_5_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08066dc2
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08066db8
    mov        r0,#0x1
    strb       r0,[r7,#0x1b]
LAB_08066db8:
    mov        r0,#0xbd
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08066dc2:
    pop        {pc}


_ts R_Megalian_1_5_2
    push       {lr}
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08066dd2
    ldrb       r0,[r7,#0x1b]
    tst        r0,r0
    bne        LAB_08066dc2
LAB_08066dd2:
    mov        r0,#0x2
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Megalian_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Megalian_2_0_Delete_08066df8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Megalian_2_0_Delete_08066df0:
    .word R_Megalian_2_0_Delete
    .word R_Megalian_2_1_Free

PTR_PTR_R_Megalian_2_0_Delete_08066df8:
    .word PTR_R_Megalian_2_0_Delete_08066df0


_ts R_Megalian_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Megalian_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08066e3a
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08066e3a:
    pop        {pc}


_ts R_Actor_IsShieldPopped
    push       {lr}
    sub        sp,#0x8
    mov        r1,#0x0
    str        r1,[sp,#0x0]
    mov        r1,#0x0
    add        r1,r1,r2
    add        r1,r1,r3
    add        r1,r1,r4
    add        r1,r1,r6
    add        r1,r1,r7
    tst        r0,r0
    bne        LAB_08066e68
    cmp        r1,#0x64
    blt        LAB_08066e5c
    mov        r1,#0x1
    str        r1,[sp,#0x0]
LAB_08066e5c:
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
    mov        r6,#0x0
    mov        r7,#0x0
    b          LAB_08066eb6
LAB_08066e68:
    cmp        r0,#0x1
    bne        LAB_08066e82
    tst        r3,r3
    bne        LAB_08066e74
    cmp        r1,#0xa
    blt        LAB_08066e78
LAB_08066e74:
    mov        r1,#0x1
    str        r1,[sp,#0x0]
LAB_08066e78:
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r6,#0x0
    mov        r7,#0x0
    b          LAB_08066eb6
LAB_08066e82:
    cmp        r0,#0x2
    bne        LAB_08066e9c
    tst        r6,r6
    bne        LAB_08066e8e
    cmp        r1,#0x28
    blt        LAB_08066e92
LAB_08066e8e:
    mov        r1,#0x1
    str        r1,[sp,#0x0]
LAB_08066e92:
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
    mov        r7,#0x0
    b          LAB_08066eb6
LAB_08066e9c:
    cmp        r0,#0x3
    bne        LAB_08066eb6
    tst        r4,r4
    bne        LAB_08066ea8
    cmp        r1,#0x50
    blt        LAB_08066eac
LAB_08066ea8:
    mov        r1,#0x1
    str        r1,[sp,#0x0]
LAB_08066eac:
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r6,#0x0
    mov        r7,#0x0
    b          LAB_08066eb6
LAB_08066eb6:
    ldr        r0,[sp,#0x0]
    add        sp,#0x8
    pop        {pc}


_ts R_Megalian_GetNextMovePanel
    push       {lr}
    sub        sp,#0x18
    mov        r0,#0xff
    str        r0,[sp,#0x14]
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,PanelFlag_08066ef0
    bl         Field_Search
    tst        r1,r1
    beq        LAB_08066ee8
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r0,sp
    ldrb       r0,[r0,r1]
    bl         Field_IndexToCellXY
    b          LAB_08066eea
LAB_08066ee8:
    ldr        r0,[sp,#0x14]
LAB_08066eea:
    add        sp,#0x18
    pop        {pc}

    .align 2, 0


PanelFlag_08066ef0:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_Megalian_GetPanelInPlayerRow
    push       {r5,lr}
    sub        sp,#0x28
    mov        r0,#0xff
    str        r0,[sp,#0x24]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x19]
    mov        r3,#0x0
    mov        r4,sp
    ldrb       r2,[r5,#0x4]
    add        r2,#0x4
    mov        r0,#0x4
LAB_08066f0e:
    cmp        r0,r2
    bgt        LAB_08066f32
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1}
    mov        r7,#0x3
    and        r7,r6
    cmp        r7,#0x3
    bne        LAB_08066f2e
    ldr        r7,PanelFlag_08066fa8
    tst        r6,r7
    bne        LAB_08066f2e
    strb       r0,[r4,r3]
    add        r3,#0x1
LAB_08066f2e:
    add        r0,#0x1
    b          LAB_08066f0e
LAB_08066f32:
    tst        r3,r3
    beq        LAB_08066f50
    push       {r1}
    push       {r3}
    bl         Rng_RandomInt
    pop        {r3}
    add        r1,r3,#0x0
    bl         SWI_Div
    add        r2,r1,#0x0
    pop        {r1}
    mov        r4,sp
    ldrb       r0,[r4,r2]
    b          LAB_08066fa2
LAB_08066f50:
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x19]
    mov        r3,#0x0
    mov        r4,sp
    mov        r0,#0x4
LAB_08066f5e:
    cmp        r0,#0x6
    bgt        LAB_08066f82
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1}
    mov        r7,#0x3
    and        r7,r6
    cmp        r7,#0x3
    bne        LAB_08066f7e
    ldr        r7,PanelFlag_08066fa8
    tst        r6,r7
    bne        LAB_08066f7e
    strb       r0,[r4,r3]
    add        r3,#0x1
LAB_08066f7e:
    add        r0,#0x1
    b          LAB_08066f5e
LAB_08066f82:
    tst        r3,r3
    beq        LAB_08066fa0
    push       {r1}
    push       {r3}
    bl         Rng_RandomInt
    pop        {r3}
    add        r1,r3,#0x0
    bl         SWI_Div
    add        r2,r1,#0x0
    pop        {r1}
    mov        r4,sp
    ldrb       r0,[r4,r2]
    b          LAB_08066fa2
LAB_08066fa0:
    ldr        r0,[sp,#0x24]
LAB_08066fa2:
    add        sp,#0x28
    pop        {r5,pc}

    .align 2, 0


PanelFlag_08066fa8:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts FUN_08066fac
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_INT_ARRAY_08066fbc
    ldr        r0,[r7,r0]
    bl         SpritePtr_SetObjectExcludeFlags
    pop        {pc}

PTR_INT_ARRAY_08066fbc:
    .word INT_ARRAY_08066fc0

INT_ARRAY_08066fc0:
    .word 0x180000
    .word 0x280000
    .word 0x300000


_ts R_Megalian_CheckAuraDisplay
    push       {lr}
    ldrb       r0,[r5,#0xd]
    tst        r0,r0
    bne        LAB_08066fe4
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    bne        LAB_0806700a
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
    b          LAB_0806700a
LAB_08066fe4:
    cmp        r0,#0x1
    bne        LAB_08066ffc
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806700a
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x2
    strb       r0,[r5,#0xd]
    b          LAB_0806700a
LAB_08066ffc:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806700a
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
LAB_0806700a:
    pop        {pc}
