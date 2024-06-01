#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Ratty
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Ratty_0_Init_080623b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Ratty_0_Init_080623b8:
    .word PTR_R_Ratty_0_Init_080623bc

PTR_R_Ratty_0_Init_080623bc:
    .word R_Ratty_0_Init
    .word R_Ratty_1_Main
    .word R_Ratty_2_Free


_ts R_Ratty_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x41
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
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
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
    mov        r0,#0x0
    str        r0,[r5,#0x48]
    strb       r0,[r5,#0x1b]
    strh       r0,[r5,#0x1e]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_nt R_Ratty_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08062496
    bl         Battle_IsInputLocked
    bne        LAB_08062496
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_080624f8
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
    beq        LAB_08062496
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08062496:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_080624ca
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_080624e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_080624bc
    mov        r0,#0x9
    b          LAB_080624be
LAB_080624bc:
    mov        r0,#0xf
LAB_080624be:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_080624dc
LAB_080624ca:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
LAB_080624dc:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_080624e0:
    .word PTR_R_Actor_1_0_Spawn_080624e4

PTR_R_Actor_1_0_Spawn_080624e4:
    .word R_Actor_1_0_Spawn
    .word R_Ratty_1_1_Wait
    .word R_Ratty_1_2_Decide
    .word R_Ratty_1_3_Move
    .word R_Ratty_1_4_Ratton

PanelFlag_080624f8:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Ratty_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Ratty_1_0_0_08062524
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Ratty_1_0_0_08062514:
    .word R_Ratty_1_0_0
    .word R_Ratty_1_0_1
    .word R_Ratty_1_0_2
    .word R_Ratty_1_0_3

PTR_PTR_R_Ratty_1_0_0_08062524:
    .word PTR_R_Ratty_1_0_0_08062514


_ts R_Ratty_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0806253a
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0806253a:
    pop        {pc}


_ts R_Ratty_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0806254e
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_0806254e:
    pop        {pc}


_ts R_Ratty_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062562
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_08062562:
    pop        {pc}


_ts R_Ratty_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_08062578
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08062578:
    pop        {pc}


_nt R_Ratty_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08062594
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08062594:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080625a6
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080625a6:
    pop        {pc}


_ts R_Ratty_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Ratty_1_2_0_SetSprite_080625d0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080625c6
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_080625c6:
    pop        {pc}

PTR_R_Ratty_1_2_0_SetSprite_080625c8:
    .word R_Ratty_1_2_0_SetSprite
    .word R_Ratty_1_2_1_Decide

PTR_PTR_R_Ratty_1_2_0_SetSprite_080625d0:
    .word PTR_R_Ratty_1_2_0_SetSprite_080625c8


_ts R_Ratty_1_2_0_SetSprite
    push       {lr}
    bl         R_Ratty_GetSpriteIndex
    mov        r1,#0x0
    add        r0,r0,r1
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x4]
    add        r1,r0,r0
    add        r0,r0,r1
    ldr        r7,PTR_BYTE_ARRAY_ARRAY_08062604
    add        r7,r7,r0
    ldrb       r0,[r7,r2]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Ratty_1_2_1_Decide
    pop        {pc}

BYTE_ARRAY_ARRAY_080625f8:
    .byte 0x28
    .byte 0x1E
    .byte 0x0F
    .byte 0x23
    .byte 0x19
    .byte 0x0A
    .byte 0x23
    .byte 0x19
    .byte 0x0A

    .align 2, 0


PTR_BYTE_ARRAY_ARRAY_08062604:
    .word BYTE_ARRAY_ARRAY_080625f8


_ts R_Ratty_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062626
    mov        r0,#0xc
    ldrh       r1,[r5,#0x1e]
    cmp        r1,#0x4
    bmi        LAB_08062620
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x10
LAB_08062620:
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08062626:
    pop        {pc}


_ts R_Ratty_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Ratty_1_3_0_TeleportStart_08062644
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Ratty_1_3_0_TeleportStart_08062638:
    .word R_Ratty_1_3_0_TeleportStart
    .word R_Ratty_1_3_1_TeleportEnd
    .word R_Ratty_1_3_2_Next

PTR_PTR_R_Ratty_1_3_0_TeleportStart_08062644:
    .word PTR_R_Ratty_1_3_0_TeleportStart_08062638


_ts R_Ratty_1_3_0_TeleportStart
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    bl         R_Ratty_ChooseNextMovePanel
    cmp        r0,#0xff
    bne        LAB_08062662
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806269e
LAB_08062662:
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
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
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806269e:
    pop        {pc}


_ts R_Ratty_1_3_1_TeleportEnd
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080626d8
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
LAB_080626d8:
    pop        {pc}


_nt R_Ratty_1_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080626fa
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080626fa:
    pop        {pc}


_ts R_Ratty_1_4_Ratton
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Ratty_1_4_0_StartAnim_08062718
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Ratty_1_4_0_StartAnim_0806270c:
    .word R_Ratty_1_4_0_StartAnim
    .word R_Ratty_1_4_1_Ratton
    .word R_Ratty_1_4_2_Next

PTR_PTR_R_Ratty_1_4_0_StartAnim_08062718:
    .word PTR_R_Ratty_1_4_0_StartAnim_0806270c


_ts R_Ratty_1_4_0_StartAnim
    push       {lr}
    bl         R_Ratty_GetSpriteIndex
    mov        r1,#0x3
    add        r0,r0,r1
    strb       r0,[r5,#0x14]
    mov        r0,#0xb
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_Ratty_1_4_1_Ratton
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062756
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    ldrb       r4,[r5,#0x4]
    bl         Attack_Ratton_Create
    mov        r0,#0xaf
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08062756:
    pop        {pc}


_ts R_Ratty_1_4_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806276a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806276a:
    pop        {pc}


_ts R_Ratty_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Ratty_2_0_Delete_08062784
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Ratty_2_0_Delete_0806277c:
    .word R_Ratty_2_0_Delete
    .word R_Ratty_2_1_Free

PTR_PTR_R_Ratty_2_0_Delete_08062784:
    .word PTR_R_Ratty_2_0_Delete_0806277c


_ts R_Ratty_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
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


_ts R_Ratty_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080627c2
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_080627c2:
    pop        {pc}


_ts R_Ratty_ChooseNextMovePanel
    push       {lr}
    sub        sp,#0x20
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,PanelFlag_0806282c
    bl         Field_Search
    mov        r0,#0xff
    tst        r1,r1
    beq        LAB_08062826
    mov        r0,sp
    add        r2,sp,#0x14
    push       {r1}
    bl         R_Ratty_WherePanelsAreNotInSelfRow
    pop        {r2}
    tst        r1,r1
    beq        LAB_08062814
    add        r2,r1,#0x0
    add        r0,sp,#0x14
    mov        r1,sp
    push       {r2}
    bl         memcpy_8
    pop        {r1}
    mov        r0,sp
    add        r2,sp,#0x14
    push       {r1}
    bl         R_Ratty_WherePanelsAreNotInPlayerRow
    pop        {r2}
    tst        r1,r1
    beq        LAB_08062814
    add        r2,r1,#0x0
    add        r0,sp,#0x14
    mov        r1,sp
    push       {r2}
    bl         memcpy_8
    pop        {r2}
LAB_08062814:
    add        r1,r2,#0x0
    mov        r0,sp
    mov        r2,#0x14
    bl         ArrayShuffle
    mov        r0,sp
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
LAB_08062826:
    add        sp,#0x20
    pop        {pc}

    .align 2, 0


PanelFlag_0806282c:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_Ratty_WherePanelsAreNotInSelfRow
    push       {lr}
    add        r7,r0,#0x0
    add        r6,r2,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
LAB_0806283a:
    push       {r1}
    ldrb       r0,[r7,r3]
    push       {r0}
    bl         Field_IndexToCellXY
    pop        {r0}
    ldrb       r2,[r5,#0x19]
    cmp        r1,r2
    beq        LAB_08062850
    strb       r0,[r6,r4]
    add        r4,#0x1
LAB_08062850:
    pop        {r1}
    add        r3,#0x1
    cmp        r3,r1
    bmi        LAB_0806283a
    add        r1,r4,#0x0
    pop        {pc}


_ts R_Ratty_WherePanelsAreNotInPlayerRow
    push       {r5,lr}
    add        r7,r0,#0x0
    add        r6,r2,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
LAB_08062866:
    push       {r1}
    ldrb       r0,[r7,r3]
    push       {r0}
    bl         Field_IndexToCellXY
    pop        {r0}
    mov        r5,r10
    ldr        r5,[r5,#0xc]
    ldr        r5,[r5,#0x40]
    ldrb       r2,[r5,#0x19]
    cmp        r1,r2
    beq        LAB_08062882
    strb       r0,[r6,r4]
    add        r4,#0x1
LAB_08062882:
    pop        {r1}
    add        r3,#0x1
    cmp        r3,r1
    bmi        LAB_08062866
    add        r1,r4,#0x0
    pop        {r5,pc}


_nt R_Ratty_GetSpriteIndex
    mov        r2,#0x0
    ldrh       r1,[r5,#0x20]
    ldrh       r0,[r5,#0x22]
    lsr        r0,r0,#0x1
    cmp        r1,r0
    bge        LAB_080628a2
    mov        r2,#0x1
    lsr        r0,r0,#0x1
    bge        LAB_080628a2
    mov        r2,#0x2
LAB_080628a2:
    add        r0,r2,#0x0
    mov        pc,lr

    .align 2, 0

