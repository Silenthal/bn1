#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Swordy
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Swordy_0_Init_0805d78c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Swordy_0_Init_0805d78c:
    .word PTR_R_Swordy_0_Init_0805d790

PTR_R_Swordy_0_Init_0805d790:
    .word R_Swordy_0_Init
    .word R_Swordy_1_Main
    .word R_Swordy_2_Free


_ts R_Swordy_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x28
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    str        r1,[r0,#0xc]
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    ldr        r7,PTR_listSwordyStealCountProperties_0805d840
    ldrb       r0,[r5,#0x4]
    add        r0,r0,r0
    add        r7,r7,r0
    ldrb       r1,[r7,#0x0]
    str        r1,[r5,#0x68]
    ldrb       r1,[r7,#0x1]
    strb       r1,[r5,#0x1a]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    bne        LAB_0805d834
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    ldr        r4,[r5,#0x4]
    bl         Attack_SwordySlash_Create
    str        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805d834
    mov        r1,#0x0
    strb       r1,[r0,#0x14]
LAB_0805d834:
    bl         R_Swordy_1_Main
    pop        {pc}

listSwordyStealCountProperties:
    .byte 2, EL_None
    .byte 5, EL_Fire
    .byte 5, EL_Water

PTR_listSwordyStealCountProperties_0805d840:
    .word listSwordyStealCountProperties


_ts R_Swordy_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805d8a8
    bl         Battle_IsInputLocked
    bne        LAB_0805d8a8
    bl         Routine_CheckPoisonDrain
    ldrb       r0,[r5,#0x16]
    bl         Battle_GetBattleFlagBuffer
    beq        LAB_0805d870
    mov        r0,#0x0
    str        r0,[r5,#0x68]
LAB_0805d870:
    bl         SpritePtr_ResetPalette
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_0805d914
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0805d8a8
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0805d8a8:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0805d8dc
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Swordy_1_0_Spawn_0805d8f0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805d8ce
    mov        r0,#0x9
    b          LAB_0805d8d0
LAB_0805d8ce:
    mov        r0,#0xf
LAB_0805d8d0:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805d8ee
LAB_0805d8dc:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0805d8ee:
    pop        {pc}

PTR_PTR_R_Swordy_1_0_Spawn_0805d8f0:
    .word PTR_R_Swordy_1_0_Spawn_0805d8f4

PTR_R_Swordy_1_0_Spawn_0805d8f4:
    .word R_Swordy_1_0_Spawn
    .word R_Swordy_1_1_Wait
    .word R_Swordy_1_2_Decide
    .word R_Swordy_1_3_Move
    .word R_Swordy_1_4_Steal
    .word R_Swordy_1_5_Sword
    .word R_Swordy_1_6_LongSword
    .word R_Swordy_1_7_WideSword

PanelFlag_0805d914:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Swordy_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Swordy_1_0_0_0805d940
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Swordy_1_0_0_0805d930:
    .word R_Swordy_1_0_0
    .word R_Swordy_1_0_1
    .word R_Swordy_1_0_2
    .word R_Swordy_1_0_3

PTR_PTR_R_Swordy_1_0_0_0805d940:
    .word PTR_R_Swordy_1_0_0_0805d930


_ts R_Swordy_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805d966
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r4,[r5,#0x4]
    bl         Attack_SwordySlash_Create
    str        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805d962
    mov        r1,#0x4
    strb       r1,[r0,#0x14]
LAB_0805d962:
    bl         ResetBattleSpawnAnimationState
LAB_0805d966:
    pop        {pc}


_ts R_Swordy_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805d97a
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_0805d97a:
    pop        {pc}


_ts R_Swordy_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805d998
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805d994
    mov        r1,#0x0
    strb       r1,[r0,#0x14]
LAB_0805d994:
    bl         Battle_PriorityQueueRemove
LAB_0805d998:
    pop        {pc}


_nt R_Swordy_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805d9ae
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d9ae:
    pop        {pc}


_ts R_Swordy_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805d9ca
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805d9ca:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805d9dc
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d9dc:
    pop        {pc}


_nt R_Swordy_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Swordy_1_2_0_Next_0805da08
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805d9fc
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805d9fc:
    pop        {pc}

    .align 2, 0


PTR_R_Swordy_1_2_0_Next_0805da00:
    .word R_Swordy_1_2_0_Next
    .word R_Swordy_1_2_1_Decide

PTR_PTR_R_Swordy_1_2_0_Next_0805da08:
    .word PTR_R_Swordy_1_2_0_Next_0805da00


_ts R_Swordy_1_2_0_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Swordy_1_2_1_Decide
    pop        {pc}


_ts R_Swordy_1_2_1_Decide
    push       {lr}
    bl         R_Swordy_IncreaseRoutineCounter
    bne        LAB_0805dab6
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    bl         R_Swordy_ArePanelsReadyToSteal
    beq        LAB_0805da4c
    ldrb       r0,[r5,#0x5]
    cmp        r0,#0x3
    bmi        LAB_0805da4c
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    ldr        r0,[r5,#0x68]
    tst        r0,r0
    beq        LAB_0805da4c
    sub        r0,#0x1
    str        r0,[r5,#0x68]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0805dab6
LAB_0805da4c:
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0805da5e
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    bl         R_Swordy_IsTargetInColumn
    tst        r0,r0
    bne        LAB_0805da7c
LAB_0805da5e:
    bl         R_Swordy_GetMoveOffset
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    tst        r3,r3
    bne        LAB_0805daae
    bl         R_Swordy_IsPanelWalkable
    tst        r0,r0
    bne        LAB_0805daae
    mov        r0,#0x1
    bl         R_Swordy_IsTargetInRow
    tst        r0,r0
    beq        LAB_0805da94
LAB_0805da7c:
    mov        r0,#0x14
    ldrb       r1,[r5,#0x4]
    tst        r1,r1
    beq        LAB_0805da86
    mov        r0,#0x1c
LAB_0805da86:
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    b          LAB_0805dab6
LAB_0805da94:
    mov        r0,#0x3
    bl         R_Swordy_IsTargetInRow
    tst        r0,r0
    beq        LAB_0805daae
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    b          LAB_0805dab6
LAB_0805daae:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805dab6:
    pop        {pc}


_ts R_Swordy_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Swordy_1_3_0_StartMove_0805dac8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Swordy_1_3_0_StartMove_0805dac8:
    .word PTR_R_Swordy_1_3_0_StartMove_0805dacc

PTR_R_Swordy_1_3_0_StartMove_0805dacc:
    .word R_Swordy_1_3_0_StartMove
    .word R_Swordy_1_3_1_EndMove
    .word R_Swordy_1_3_2_Next


_ts R_Swordy_1_3_0_StartMove
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         R_Swordy_IsPanelWalkable
    tst        r0,r0
    beq        LAB_0805db28
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
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_0805db30
LAB_0805db28:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805db30:
    pop        {pc}


_nt R_Swordy_1_3_1_EndMove
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805db6a
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
LAB_0805db6a:
    pop        {pc}


_ts R_Swordy_1_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805db90
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805db90:
    pop        {pc}


_nt R_Swordy_1_4_Steal
    push       {lr}
    mov        r0,#0x2
    mov        r1,#0x2
    ldrb       r2,[r5,#0x16]
    mov        r3,#0xa
    bl         ScreenDim_Alloc
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Swordy_1_5_Sword
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Swordy_1_5_0_Prepare_0805dbbc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Swordy_1_5_0_Prepare_0805dbbc:
    .word PTR_R_Swordy_1_5_0_Prepare_0805dbc0

PTR_R_Swordy_1_5_0_Prepare_0805dbc0:
    .word R_Swordy_1_5_0_Prepare
    .word R_Swordy_1_5_1_StartAnim
    .word R_Swordy_1_5_2_Sword_Start
    .word R_Swordy_1_5_3_Sword_End
    .word R_Swordy_1_5_4_EndAnim
    .word R_Swordy_1_5_5_Reset
    .word R_Swordy_1_5_6_Next


_ts R_Swordy_1_5_0_Prepare
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Swordy_1_5_1_StartAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dc06
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dbfe
    bl         Attack_SwordySlash_Hide
LAB_0805dbfe:
    mov        r0,#0x9
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805dc06:
    pop        {pc}


_ts R_Swordy_1_5_2_Sword_Start
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dc46
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dc20
    mov        r1,#0x1
    strb       r1,[r0,#0x14]
    bl         Attack_SwordySlash_Show
LAB_0805dc20:
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    push       {r5}
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    mov        r3,#0x28
    mov        r4,#0x88
    mov        r6,#0x0
    mov        r7,#0x3
    bl         Attack_QuickAttack_Create
    pop        {r5}
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
LAB_0805dc46:
    pop        {pc}


_ts R_Swordy_1_5_3_Sword_End
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dc64
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dc5c
    mov        r1,#0x5
    strb       r1,[r0,#0x14]
LAB_0805dc5c:
    mov        r0,#0x4
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0805dc64:
    pop        {pc}


_nt R_Swordy_1_5_4_EndAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dc82
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dc7a
    bl         Attack_SwordySlash_Hide
LAB_0805dc7a:
    mov        r0,#0xc
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strb       r0,[r5,#0xa]
LAB_0805dc82:
    pop        {pc}


_ts R_Swordy_1_5_5_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dca4
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dc9c
    mov        r1,#0x0
    strb       r1,[r0,#0x14]
    bl         Attack_SwordySlash_Show
LAB_0805dc9c:
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x18
    strb       r0,[r5,#0xa]
LAB_0805dca4:
    pop        {pc}


_nt R_Swordy_1_5_6_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dcb8
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805dcb8:
    pop        {pc}


_nt R_Swordy_1_6_LongSword
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Swordy_1_6_0_RaiseSword_0805dcc8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Swordy_1_6_0_RaiseSword_0805dcc8:
    .word PTR_R_Swordy_1_6_0_RaiseSword_0805dccc

PTR_R_Swordy_1_6_0_RaiseSword_0805dccc:
    .word R_Swordy_1_6_0_RaiseSword
    .word R_Swordy_1_6_1_Prepare
    .word R_Swordy_1_6_2_StartAnim
    .word R_Swordy_1_6_3_LongSword
    .word R_Swordy_1_6_4_EndAnim
    .word R_Swordy_1_6_5_Reset
    .word R_Swordy_1_6_6_Next


_ts R_Swordy_1_6_0_RaiseSword
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Swordy_1_6_1_Prepare
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dd12
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dd0a
    bl         Attack_SwordySlash_Hide
LAB_0805dd0a:
    mov        r0,#0x1a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805dd12:
    pop        {pc}


_ts R_Swordy_1_6_2_StartAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dd30
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xb
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
LAB_0805dd30:
    pop        {pc}


_nt R_Swordy_1_6_3_LongSword
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dd68
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dd4a
    mov        r1,#0x3
    strb       r1,[r0,#0x14]
    bl         Attack_SwordySlash_Show
LAB_0805dd4a:
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    ldr        r7,PTR_listSwordyLongSwordProperties_0805dd70
    ldrb       r2,[r5,#0x4]
    add        r2,r2,r2
    add        r7,r7,r2
    ldrb       r2,[r7,#0x0]
    ldrb       r3,[r7,#0x1]
    bl         R_Swordy_CreateLongSwordAttack
LAB_0805dd68:
    pop        {pc}

listSwordyLongSwordProperties:
    .byte 60, EL_None
    .byte 60, EL_Fire
    .byte 80, EL_Water

PTR_listSwordyLongSwordProperties_0805dd70:
    .word listSwordyLongSwordProperties


_ts R_Swordy_1_6_4_EndAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dd90
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805dd88
    bl         Attack_SwordySlash_Hide
LAB_0805dd88:
    mov        r0,#0xc
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strb       r0,[r5,#0xa]
LAB_0805dd90:
    pop        {pc}


_nt R_Swordy_1_6_5_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ddb2
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805ddaa
    mov        r1,#0x0
    strb       r1,[r0,#0x14]
    bl         Attack_SwordySlash_Show
LAB_0805ddaa:
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x18
    strb       r0,[r5,#0xa]
LAB_0805ddb2:
    pop        {pc}


_ts R_Swordy_1_6_6_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ddc6
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ddc6:
    pop        {pc}


_ts R_Swordy_1_7_WideSword
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Swordy_1_7_0_RaiseSword_0805ddd8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Swordy_1_7_0_RaiseSword_0805ddd8:
    .word PTR_R_Swordy_1_7_0_RaiseSword_0805dddc

PTR_R_Swordy_1_7_0_RaiseSword_0805dddc:
    .word R_Swordy_1_7_0_RaiseSword
    .word R_Swordy_1_7_1_Prepare
    .word R_Swordy_1_7_2_StartAnim
    .word R_Swordy_1_7_3
    .word R_Swordy_1_7_4_EndAnim
    .word R_Swordy_1_7_5_Reset
    .word R_Swordy_1_7_6_Next


_ts R_Swordy_1_7_0_RaiseSword
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Swordy_1_7_1_Prepare
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805de22
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805de1a
    bl         Attack_SwordySlash_Hide
LAB_0805de1a:
    mov        r0,#0x1a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805de22:
    pop        {pc}


_ts R_Swordy_1_7_2_StartAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805de3a
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xb
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0805de3a:
    pop        {pc}


_ts R_Swordy_1_7_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805de78
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805de54
    mov        r1,#0x6
    strb       r1,[r0,#0x14]
    bl         Attack_SwordySlash_Show
LAB_0805de54:
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    ldr        r7,PTR_listSwordyWideSwordProperties_0805de80
    ldrb       r2,[r5,#0x4]
    add        r2,r2,r2
    add        r7,r7,r2
    ldrb       r2,[r7,#0x0]
    ldrb       r3,[r7,#0x1]
    bl         R_Swordy_CreateWideSwordAttack
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
LAB_0805de78:
    pop        {pc}

listSwordyWideSwordProperties:
    .byte 60, EL_None
    .byte 60, EL_Fire
    .byte 80, EL_Water

PTR_listSwordyWideSwordProperties_0805de80:
    .word listSwordyWideSwordProperties


_ts R_Swordy_1_7_4_EndAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dea0
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805de98
    bl         Attack_SwordySlash_Hide
LAB_0805de98:
    mov        r0,#0xc
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strb       r0,[r5,#0xa]
LAB_0805dea0:
    pop        {pc}


_nt R_Swordy_1_7_5_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805dec2
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0805deba
    mov        r1,#0x0
    strb       r1,[r0,#0x14]
    bl         Attack_SwordySlash_Show
LAB_0805deba:
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x18
    strb       r0,[r5,#0xa]
LAB_0805dec2:
    pop        {pc}


_ts R_Swordy_1_7_6_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ded6
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ded6:
    pop        {pc}


_ts R_Swordy_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Swordy_2_0_Delete_0805def0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Swordy_2_0_Delete_0805dee8:
    .word R_Swordy_2_0_Delete
    .word R_Swordy_2_1_Free

PTR_PTR_R_Swordy_2_0_Delete_0805def0:
    .word PTR_R_Swordy_2_0_Delete_0805dee8


_ts R_Swordy_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    push       {r5}
    ldr        r5,[r5,#0x5c]
    tst        r5,r5
    beq        LAB_0805df0e
    bl         Attack_Free
LAB_0805df0e:
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt R_Swordy_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805df3c
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805df3c:
    pop        {pc}


_nt R_Swordy_IncreaseRoutineCounter
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    cmp        r0,#0x28
    mov        pc,lr


_ts R_Swordy_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_0805df74
    bl         Field_GetPanelFlags
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_0805df74
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0805df74
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805df74
    mov        r2,#0x1
LAB_0805df74:
    add        r0,r2,#0x0
    pop        {pc}


_ts R_Swordy_GetMoveOffset
    push       {lr}
    bl         Entity_CompareToPlayerRow
    mov        r3,#0x0
    tst        r0,r0
    beq        LAB_0805df8a
    bmi        LAB_0805df88
    mov        r3,#0x2
LAB_0805df88:
    add        r3,#0x2
LAB_0805df8a:
    ldr        r7,PTR_CellPosition_0805df9c
    ldrsb      r2,[r7,r3]
    add        r7,#0x1
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
    ldrsb      r2,[r7,r3]
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r2
    pop        {pc}

PTR_CellPosition_0805df9c:
    .word CellPosition_0805dfa0

CellPosition_0805dfa0:
    cell_pos -1, 0
    cell_pos 0, -1
    cell_pos 0, 1


_nt R_Swordy_CreateLongSwordAttack
    push       {lr}
    sub        sp,#0x8
    mov        r6,sp
    str        r2,[r6,#0x0]
    str        r3,[r6,#0x4]
    mov        r3,#0x0
LAB_0805dfb2:
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r2,r0,#0x0
    pop        {r0,r1}
    tst        r2,r2
    bne        LAB_0805dfd2
    push       {r0,r1,r3,r5,r6}
    ldrb       r2,[r5,#0x16]
    ldr        r3,[r6,#0x0]
    mov        r4,#0x88
    ldr        r6,[r6,#0x4]
    mov        r7,#0x3
    bl         Attack_QuickAttack_Create
    pop        {r0,r1,r3,r5,r6}
LAB_0805dfd2:
    sub        r0,#0x1
    add        r3,#0x1
    cmp        r3,#0x3
    bmi        LAB_0805dfb2
    add        sp,#0x8
    pop        {pc}


_nt R_Swordy_CreateWideSwordAttack
    push       {lr}
    sub        sp,#0x8
    mov        r6,sp
    str        r2,[r6,#0x0]
    str        r3,[r6,#0x4]
    sub        r1,#0x1
    mov        r3,#0x0
LAB_0805dfec:
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r2,r0,#0x0
    pop        {r0,r1}
    tst        r2,r2
    bne        LAB_0805e00c
    push       {r0,r1,r3,r5,r6}
    ldrb       r2,[r5,#0x16]
    ldr        r3,[r6,#0x0]
    mov        r4,#0x88
    ldr        r6,[r6,#0x4]
    mov        r7,#0x3
    bl         Attack_QuickAttack_Create
    pop        {r0,r1,r3,r5,r6}
LAB_0805e00c:
    add        r1,#0x1
    add        r3,#0x1
    cmp        r3,#0x3
    bmi        LAB_0805dfec
    add        sp,#0x8
    pop        {pc}


_ts R_Swordy_IsTargetInRow
    push       {lr}
    add        r3,r0,#0x0
    mov        r0,#0x0
LAB_0805e01e:
    tst        r3,r3
    beq        LAB_0805e03e
    push       {r0,r3}
    ldrb       r0,[r5,#0x18]
    sub        r0,r0,r3
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r3}
    mov        r1,#0x10
    tst        r2,r1
    bne        LAB_0805e03c
    sub        r3,#0x1
    b          LAB_0805e01e
LAB_0805e03c:
    mov        r0,#0x1
LAB_0805e03e:
    pop        {pc}


_ts R_Swordy_IsTargetInColumn
    push       {lr}
    mov        r1,#0x0
LAB_0805e044:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x10
    tst        r2,r3
    bne        LAB_0805e05e
    add        r1,#0x1
    cmp        r1,#0x4
    bmi        LAB_0805e044
    mov        r0,#0x0
    b          LAB_0805e060
LAB_0805e05e:
    mov        r0,#0x1
LAB_0805e060:
    pop        {pc}


_nt R_Swordy_ArePanelsReadyToSteal
    push       {lr}
    mov        r0,#0x2
    mov        r1,#0x1
LAB_0805e068:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    mov        r2,#0x2
    tst        r0,r2
    pop        {r0,r1}
    beq        LAB_0805e080
    add        r1,#0x1
    cmp        r1,#0x3
    ble        LAB_0805e068
    mov        r0,#0x0
    b          LAB_0805e082
LAB_0805e080:
    mov        r0,#0x1
LAB_0805e082:
    pop        {pc}
