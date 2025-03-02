#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Ammonicule
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_Ammonicule_0_Init_080653a0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Ammonicule_0_Init_080653a0:
    .word PTR_R_Ammonicule_0_Init_080653a4

PTR_R_Ammonicule_0_Init_080653a4:
    .word R_Ammonicule_0_Init
    .word R_Ammonicule_1_Main
    .word R_Ammonicule_2_Free


_ts R_Ammonicule_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x44
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#Actor_family_family]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    FieldObject_Create PFI_Self_Actor, 0x60
    ldr        r7,[r5,#Actor_param_60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    FieldObject_CreateInitMoving 0x64, inherit_element=1
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    mov        r0,#0x0
    str        r0,[r5,#Actor_diff_y]
    strb       r0,[r5,#Actor_b1b]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldr        r7,PTR_DAT_08065434
    ldrb       r0,[r5,#Actor_family_family]
    add        r0,r0,r0
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         Attack_AmmoniculeBubbleWrap_Create
    str        r0,[r5,#Actor_param_5C]
    pop        {pc}

PTR_DAT_08065434:
    .word DAT_08065438

DAT_08065438:
    .byte 0x0A
    .byte 0xB4
    .byte 0x14
    .byte 0xB4
    .byte 0x28
    .byte 0x64


_nt R_Ammonicule_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_080654a2
    bl         Battle_IsInputLocked
    bne        LAB_080654a2
    bl         Routine_CheckPoisonDrain
    ldr        r7,[r5,#Actor_param_60]
    ldrh       r0,[r5,#Actor_cPos_x]
    ldr        r1,PanelFlag_08065508
    ldrb       r2,[r5,#Actor_element]
    ldr        r3,[r7,#0x14]
    ldr        r4,[r7,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#Actor_param_60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldr        r0,[r5,#Actor_param_5C]
    tst        r0,r0
    beq        LAB_08065486
    bl         A_AmmoniculeBubbleWrap_ApplyDamage
    strb       r0,[r5,#Actor_b1b]
LAB_08065486:
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_080654a2
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_080654a2:
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    beq        LAB_080654d6
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_080654ec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_080654c8
    mov        r0,#0x9
    b          LAB_080654ca
LAB_080654c8:
    mov        r0,#PFI_Moving
LAB_080654ca:
    ldr        r1,[r5,#Actor_param_60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_080654e8
LAB_080654d6:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_SetDeletedFlag
LAB_080654e8:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_080654ec:
    .word PTR_R_Actor_1_0_Spawn_080654f0

PTR_R_Actor_1_0_Spawn_080654f0:
    .word R_Actor_1_0_Spawn
    .word R_Ammonicule_1_1_Wait
    .word R_Ammonicule_1_2_Decide
    .word R_Ammonicule_1_3_Move
    .word R_Ammonicule_1_4_AquaTower
    .word R_Ammonicule_1_5_Idle

PanelFlag_08065508:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Ammonicule_1_0
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Ammonicule_1_0_0_08065534
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Ammonicule_1_0_0_08065524:
    .word R_Ammonicule_1_0_0
    .word R_Ammonicule_1_0_1
    .word R_Ammonicule_1_0_2
    .word R_Ammonicule_1_0_3

PTR_PTR_R_Ammonicule_1_0_0_08065534:
    .word PTR_R_Ammonicule_1_0_0_08065524


_ts R_Ammonicule_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0806554a
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    bl         ResetBattleSpawnAnimationState
LAB_0806554a:
    pop        {pc}


_ts R_Ammonicule_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0806555e
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
LAB_0806555e:
    pop        {pc}


_ts R_Ammonicule_1_0_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08065572
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
    bl         Battle_PriorityQueueRemove
LAB_08065572:
    pop        {pc}


_ts R_Ammonicule_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_08065588
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08065588:
    pop        {pc}


_nt R_Ammonicule_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_080655a4
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_080655a4:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080655ba
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x6e
    strh       r0,[r5,#Actor_counterA]
LAB_080655ba:
    pop        {pc}


_ts R_Ammonicule_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Ammonicule_1_2_0_Reset_080655e4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080655da
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_080655da:
    pop        {pc}

PTR_R_Ammonicule_1_2_0_Reset_080655dc:
    .word R_Ammonicule_1_2_0_Reset
    .word R_Ammonicule_1_2_1_Decide

PTR_PTR_R_Ammonicule_1_2_0_Reset_080655e4:
    .word PTR_R_Ammonicule_1_2_0_Reset_080655dc


_ts R_Ammonicule_1_2_0_Reset
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Ammonicule_1_2_1_Decide
    push       {lr}
    sub        sp,#0x4
    ldrb       r0,[r5,#Actor_b1b]
    tst        r0,r0
    beq        LAB_0806560a
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    strb       r0,[r5,#Actor_b1b]
    b          LAB_08065654
LAB_0806560a:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08065654
    LoadMain battle, r7, r7
    ldr        r7,[r7,#Battle_actorListPlayer]
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r7,#0x19]
    ldrb       r2,[r5,#Actor_cPos_y]
    cmp        r1,r2
    beq        LAB_0806564c
LAB_08065622:
    push       {r0,r1,r2}
    bl         R_Ammonicule_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1,r2}
    bne        LAB_0806563e
    cmp        r1,r2
    bgt        LAB_08065636
    add        r1,#0x1
    b          LAB_08065638
LAB_08065636:
    sub        r1,#0x1
LAB_08065638:
    cmp        r1,r2
    beq        LAB_0806564c
    b          LAB_08065622
LAB_0806563e:
    strb       r0,[r5,#Actor_family_b2]
    strb       r1,[r5,#Actor_family_b3]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_state_s2]
    b          LAB_08065654
LAB_0806564c:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_state_s2]
LAB_08065654:
    add        sp,#0x4
    pop        {pc}


_ts R_Ammonicule_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s3]
    ldr        r7,PTR_PTR_R_Ammonicule_1_3_0_TeleportStart_08065668
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Ammonicule_1_3_0_TeleportStart_08065668:
    .word PTR_R_Ammonicule_1_3_0_TeleportStart_0806566c

PTR_R_Ammonicule_1_3_0_TeleportStart_0806566c:
    .word R_Ammonicule_1_3_0_TeleportStart
    .word R_Ammonicule_1_3_1_TeleportEnd
    .word R_Ammonicule_1_3_2_Next


_ts R_Ammonicule_1_3_0_TeleportStart
    push       {lr}
    ldrb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r5,#Actor_family_b3]
    bl         R_Ammonicule_IsPanelWalkable
    tst        r0,r0
    beq        LAB_080656ba
    ldrb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r5,#Actor_family_b3]
    ldr        r7,[r5,#Actor_param_64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x3
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    b          LAB_080656c2
LAB_080656ba:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080656c2:
    pop        {pc}


_ts R_Ammonicule_1_3_1_TeleportEnd
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_080656fc
    ldrb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r5,#Actor_family_b3]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    push       {r5}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x3
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s3]
LAB_080656fc:
    pop        {pc}


_nt R_Ammonicule_1_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08065716
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
LAB_08065716:
    pop        {pc}


_ts R_Ammonicule_1_4_AquaTower
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Ammonicule_1_4_0_StartAnim_08065728
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Ammonicule_1_4_0_StartAnim_08065728:
    .word PTR_R_Ammonicule_1_4_0_StartAnim_0806572c

PTR_R_Ammonicule_1_4_0_StartAnim_0806572c:
    .word R_Ammonicule_1_4_0_StartAnim
    .word R_Ammonicule_1_4_1_AquaTower
    .word R_Ammonicule_1_4_2_Next


_ts R_Ammonicule_1_4_0_StartAnim
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Ammonicule_1_4_1_AquaTower
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08065782
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806577a
    push       {r5}
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r2,#0x0
    mov        r4,#0x2
    mov        r3,#0x3
    ldr        r7,PTR_listAmmoniculeWaterTowerDamage_08065788
    ldrb       r6,[r5,#Actor_family_family]
    ldrb       r6,[r7,r6]
    bl         Attack_Tower_Create
    pop        {r5}
LAB_0806577a:
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_08065782:
    pop        {pc}

listAmmoniculeWaterTowerDamage:
    .byte 0x50
    .byte 0x78
    .byte 0xA0

    .align 2, 0


PTR_listAmmoniculeWaterTowerDamage_08065788:
    .word listAmmoniculeWaterTowerDamage


_ts R_Ammonicule_1_4_2_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_080657a2
    mov        r0,#0x6e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080657a2:
    pop        {pc}


_ts R_Ammonicule_1_5_Idle
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Ammonicule_1_5_0_080657b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Ammonicule_1_5_0_080657b4:
    .word PTR_R_Ammonicule_1_5_0_080657b8

PTR_R_Ammonicule_1_5_0_080657b8:
    .word R_Ammonicule_1_5_0
    .word R_Ammonicule_1_5_1


_ts R_Ammonicule_1_5_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Ammonicule_1_5_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080657e4
    mov        r0,#0x0
    strb       r0,[r5,#Actor_b1b]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080657e4:
    pop        {pc}


_nt R_Ammonicule_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Ammonicule_2_0_Delete_080657fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Ammonicule_2_0_Delete_080657f4:
    .word R_Ammonicule_2_0_Delete
    .word R_Ammonicule_2_1_Free

PTR_PTR_R_Ammonicule_2_0_Delete_080657fc:
    .word PTR_R_Ammonicule_2_0_Delete_080657f4


_ts R_Ammonicule_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    pop        {pc}


_ts R_Ammonicule_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806583e
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806583e:
    pop        {pc}


_ts R_Ammonicule_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_0806586e
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_0806586e
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0806586e
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806586e
    mov        r2,#0x1
    add        r0,r2,#0x0
LAB_0806586e:
    add        r0,r2,#0x0
    pop        {pc}

    .align 2, 0

