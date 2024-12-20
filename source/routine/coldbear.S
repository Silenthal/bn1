#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_ColdBear
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_ColdBear_0_Init_08061544
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ColdBear_0_Init_08061544:
    .word PTR_R_ColdBear_0_Init_08061548

PTR_R_ColdBear_0_Init_08061548:
    .word R_ColdBear_0_Init
    .word R_ColdBear_1_Main
    .word R_ColdBear_2_Free


_ts R_ColdBear_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x3d
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
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0x1b]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_ColdBear_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0806162c
    bl         Battle_IsInputLocked
    bne        LAB_0806162c
    ldrb       r0,[r5,#0x16]
    bl         Battle_GetBattleFlagBuffer
    beq        LAB_080615f4
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
LAB_080615f4:
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_08061690
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
    beq        LAB_0806162c
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0806162c:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_08061660
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08061674
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08061652
    mov        r0,#0x9
    b          LAB_08061654
LAB_08061652:
    mov        r0,#0xf
LAB_08061654:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08061672
LAB_08061660:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08061672:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_08061674:
    .word PTR_R_Actor_1_0_Spawn_08061678

PTR_R_Actor_1_0_Spawn_08061678:
    .word R_Actor_1_0_Spawn
    .word R_ColdBear_1_1_Wait
    .word R_ColdBear_1_2_Decide
    .word R_ColdBear_1_3_Move
    .word R_ColdBear_1_4_IceCube
    .word R_ColdBear_1_5_Repair

PanelFlag_08061690:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_ColdBear_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColdBear_1_0_0_080616bc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_ColdBear_1_0_0_080616ac:
    .word R_ColdBear_1_0_0
    .word R_ColdBear_1_0_1
    .word R_ColdBear_1_0_2
    .word R_ColdBear_1_0_3

PTR_PTR_R_ColdBear_1_0_0_080616bc:
    .word PTR_R_ColdBear_1_0_0_080616ac


_ts R_ColdBear_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_080616d2
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_080616d2:
    pop        {pc}


_ts R_ColdBear_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_080616e6
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_080616e6:
    pop        {pc}


_ts R_ColdBear_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080616fa
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_080616fa:
    pop        {pc}


_ts R_ColdBear_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_08061710
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08061710:
    pop        {pc}


_nt R_ColdBear_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806172c
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806172c:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806173e
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806173e:
    pop        {pc}


_ts R_ColdBear_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColdBear_1_2_0_Wait_08061768
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806175e
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806175e:
    pop        {pc}

PTR_R_ColdBear_1_2_0_Wait_08061760:
    .word R_ColdBear_1_2_0_Wait
    .word R_ColdBear_1_2_1_Decide

PTR_PTR_R_ColdBear_1_2_0_Wait_08061768:
    .word PTR_R_ColdBear_1_2_0_Wait_08061760


_ts R_ColdBear_1_2_0_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    bl         R_ColdBear_1_2_1_Decide
    pop        {pc}


_ts R_ColdBear_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080617ac
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    bne        LAB_08061796
    ldrb       r0,[r5,#0x1b]
    cmp        r0,#0x3
    bge        LAB_080617a0
LAB_08061796:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_080617ac
LAB_080617a0:
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_080617ac:
    pop        {pc}


_nt R_ColdBear_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColdBear_1_3_0_CheckMove_080617c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_ColdBear_1_3_0_CheckMove_080617bc:
    .word R_ColdBear_1_3_0_CheckMove
    .word R_ColdBear_1_3_1_SetupMove
    .word R_ColdBear_1_3_2_Move

PTR_PTR_R_ColdBear_1_3_0_CheckMove_080617c8:
    .word PTR_R_ColdBear_1_3_0_CheckMove_080617bc


_ts R_ColdBear_1_3_0_CheckMove
    push       {lr}
    bl         R_ColdBear_GetNextMove
    cmp        r0,#0xff
    bne        LAB_080617e0
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806180c
LAB_080617e0:
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    ldrb       r2,[r5,#0x4]
    lsl        r2,r2,#0x2
    ldr        r7,PTR_listColdBearMoveSpeed_08061810
    ldr        r2,[r7,r2]
    ldrb       r0,[r5,#0x19]
    ldrb       r1,[r5,#0x7]
    cmp        r0,r1
    bmi        LAB_08061806
    neg        r2,r2
LAB_08061806:
    str        r2,[r5,#0x48]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806180c:
    pop        {pc}

    .align 2, 0


PTR_listColdBearMoveSpeed_08061810:
    .word listColdBearMoveSpeed

listColdBearMoveSpeed:
    .word 0x10000
    .word 0x18000
    .word 0x20000


_ts R_ColdBear_1_3_1_SetupMove
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x48]
    tst        r3,r3
    bmi        LAB_0806183a
    add        r2,r2,r3
    cmp        r2,r1
    bmi        LAB_08061852
    b          LAB_08061840
LAB_0806183a:
    add        r2,r2,r3
    cmp        r2,r1
    bgt        LAB_08061852
LAB_08061840:
    str        r2,[r5,#0x2c]
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    b          LAB_08061854
LAB_08061852:
    str        r2,[r5,#0x2c]
LAB_08061854:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_nt R_ColdBear_1_3_2_Move
    push       {lr}
    mov        r2,#0x1
    lsl        r2,r2,#0x10
    ldrh       r0,[r5,#0x1c]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0806186a
    neg        r2,r2
LAB_0806186a:
    ldr        r0,[r5,#0x48]
    tst        r0,r0
    bge        LAB_08061872
    neg        r2,r2
LAB_08061872:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r2}
    bl         Battle_CellCoordsToSprite
    pop        {r2}
    add        r1,r1,r2
    str        r1,[r5,#0x2c]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061896
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08061896:
    pop        {pc}


_ts R_ColdBear_1_4_IceCube
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColdBear_1_4_0_StartAnim_080618b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_ColdBear_1_4_0_StartAnim_080618a8:
    .word R_ColdBear_1_4_0_StartAnim
    .word R_ColdBear_1_4_1_Prepare
    .word R_ColdBear_1_4_2_IceCube
    .word R_ColdBear_1_4_3_Next

PTR_PTR_R_ColdBear_1_4_0_StartAnim_080618b8:
    .word PTR_R_ColdBear_1_4_0_StartAnim_080618a8


_ts R_ColdBear_1_4_0_StartAnim
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x23
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_ColdBear_1_4_1_Prepare
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080618e2
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
LAB_080618e2:
    pop        {pc}


_ts R_ColdBear_1_4_2_IceCube
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x2
    bne        LAB_08061916
    mov        r0,#0x3
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x3c
    mov        r4,#0x2
    lsl        r4,r4,#0x18
    mov        r7,#0x0
    orr        r4,r7
    ldr        r7,PTR_listIceBearIceCubeDamage_08061930
    ldrb       r6,[r5,#0x4]
    ldrb       r6,[r7,r6]
    mov        r7,#0x1b
    add        r7,r7,r5
    bl         Attack_Cube_Create
    mov        r0,#0x99
    bl         Sound_PlaySongImmediate
LAB_08061916:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061928
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_08061928:
    pop        {pc}

listIceBearIceCubeDamage:
    .byte 0x64
    .byte 0x3C
    .byte 0x3C

    .align 2, 0


PTR_listIceBearIceCubeDamage_08061930:
    .word listIceBearIceCubeDamage


_ts R_ColdBear_1_4_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061948
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08061948:
    pop        {pc}


_nt R_ColdBear_1_5_Repair
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColdBear_1_5_0_Repair_08061960
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_ColdBear_1_5_0_Repair_08061958:
    .word R_ColdBear_1_5_0_Repair
    .word R_ColdBear_1_5_1_Next

PTR_PTR_R_ColdBear_1_5_0_Repair_08061960:
    .word PTR_R_ColdBear_1_5_0_Repair_08061958


_ts R_ColdBear_1_5_0_Repair
    push       {lr}
    mov        r0,#0x9
    mov        r1,#0x0
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ColdBear_1_5_1_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061990
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08061990:
    push       {r5}
    ldr        r0,PTR_s__PANEL_RETURN_080619b0
    bl         Debug_Print
    pop        {r5}
    pop        {pc}

s__PANEL_RETURN_0806199c:
    .asciz "	\nPANEL RETURN !"

    .align 2, 0


PTR_s__PANEL_RETURN_080619b0:
    .word s__PANEL_RETURN_0806199c


_ts R_ColdBear_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_ColdBear_2_0_080619cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_ColdBear_2_0_080619c4:
    .word R_ColdBear_2_0
    .word R_ColdBear_2_1

PTR_PTR_R_ColdBear_2_0_080619cc:
    .word PTR_R_ColdBear_2_0_080619c4


_ts R_ColdBear_2_0
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


_ts R_ColdBear_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061a0a
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08061a0a:
    pop        {pc}


_ts R_ColdBear_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_08061a38
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08061a38
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_08061a38
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08061a38
    mov        r2,#0x1
LAB_08061a38:
    add        r0,r2,#0x0
    pop        {pc}


_ts R_ColdBear_GetNextMove
    push       {lr}
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    beq        LAB_08061a60
    ldrb       r1,[r5,#0x19]
    bmi        LAB_08061a4e
    add        r1,#0x1
    b          LAB_08061a50
LAB_08061a4e:
    sub        r1,#0x1
LAB_08061a50:
    ldrb       r0,[r5,#0x18]
    push       {r0,r1}
    bl         R_ColdBear_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08061a60
    b          LAB_08061a62
LAB_08061a60:
    mov        r0,#0xff
LAB_08061a62:
    pop        {pc}
