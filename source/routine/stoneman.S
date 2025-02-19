#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_StoneMan
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_StoneMan_0_Init_0805f3c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_StoneMan_0_Init_0805f3c4:
    .word PTR_R_StoneMan_0_Init_0805f3c8

PTR_R_StoneMan_0_Init_0805f3c8:
    .word R_StoneMan_0_Init
    .word R_StoneMan_1_Main
    .word R_StoneMan_2_Free


_ts R_StoneMan_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x3a
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
    mov        r0,#0x0
    strb       r0,[r5,#Actor_family_b3]
    strb       r0,[r5,#Actor_b1b]
    strb       r0,[r5,#Actor_bc]
    bl         SpritePtr_ObjModeSemiTransparent
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    FieldObject_Create PFI_Self_Actor, 0x60
    ldr        r0,[r5,#Actor_param_60]
    ldr        r0,[r5,#Actor_pos_curr_y]
    mov        r1,#0x1
    lsl        r1,r1,#0x10
    sub        r0,r0,r1
    str        r0,[r5,#Actor_pos_curr_y]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_nt R_StoneMan_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bc]
    mov        r0,#0x3
    ldrb       r1,[r5,#Actor_b1b]
    tst        r1,r1
    beq        LAB_0805f45a
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_0805f456
    mov        r0,#0x1
LAB_0805f456:
    sub        r1,#0x1
    strb       r1,[r5,#Actor_b1b]
LAB_0805f45a:
    strb       r0,[r5,#Actor_header_entityFlags]
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_0805f4b2
    ldrb       r0,[r5,#Actor_b1b]
    tst        r0,r0
    bne        LAB_0805f4b2
    bl         Battle_IsInputLocked
    bne        LAB_0805f4b2
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#Actor_param_60]
    ldrh       r0,[r5,#Actor_cPos_x]
    ldr        r1,PanelFlag_0805f51c
    ldrb       r2,[r5,#Actor_element]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#Actor_param_60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0805f4b2
    cmp        r0,#0x64
    bmi        LAB_0805f4a0
    mov        r1,#0x1
    strb       r0,[r5,#Actor_bc]
LAB_0805f4a0:
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0805f4b2:
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    beq        LAB_0805f4e6
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_StoneMan_1_0_Spawn_0805f4fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_0805f4d8
    mov        r0,#0x9
    b          LAB_0805f4da
LAB_0805f4d8:
    mov        r0,#PFI_Moving
LAB_0805f4da:
    ldr        r1,[r5,#Actor_param_60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_0805f4f8
LAB_0805f4e6:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_SetDeletedFlag
LAB_0805f4f8:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_StoneMan_1_0_Spawn_0805f4fc:
    .word PTR_R_StoneMan_1_0_Spawn_0805f500

PTR_R_StoneMan_1_0_Spawn_0805f500:
    .word R_StoneMan_1_0_Spawn
    .word R_StoneMan_1_1_Wait
    .word R_StoneMan_1_2_Decide
    .word R_StoneMan_1_3_RockCube
    .word R_StoneMan_1_4_Stones
    .word R_StoneMan_1_5_Laser
    .word R_StoneMan_1_6_Flinch

PanelFlag_0805f51c:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_StoneMan_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_StoneMan_1_0_0_0805f548
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_StoneMan_1_0_0_0805f538:
    .word R_StoneMan_1_0_0
    .word R_StoneMan_1_0_1
    .word R_StoneMan_1_0_2
    .word R_StoneMan_1_0_3

PTR_PTR_R_StoneMan_1_0_0_0805f548:
    .word PTR_R_StoneMan_1_0_0_0805f538


_ts R_StoneMan_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805f55e
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    bl         ResetBattleSpawnAnimationState
LAB_0805f55e:
    pop        {pc}


_ts R_StoneMan_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805f572
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
LAB_0805f572:
    pop        {pc}


_ts R_StoneMan_1_0_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f586
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
    bl         Battle_PriorityQueueRemove
LAB_0805f586:
    pop        {pc}


_ts R_StoneMan_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805f59c
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805f59c:
    pop        {pc}


_nt R_StoneMan_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0805f5b8
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0805f5b8:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805f5ca
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805f5ca:
    pop        {pc}


_ts R_StoneMan_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_StoneMan_1_2_0_0805f5f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_StoneMan_FlinchState
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805f5ee
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0805f5ee:
    pop        {pc}

PTR_R_StoneMan_1_2_0_0805f5f0:
    .word R_StoneMan_1_2_0
    .word R_StoneMan_1_2_1

PTR_PTR_R_StoneMan_1_2_0_0805f5f8:
    .word PTR_R_StoneMan_1_2_0_0805f5f0


_ts R_StoneMan_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    bl         R_StoneMan_1_2_1
    pop        {pc}


_ts R_StoneMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f634
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    ldrb       r0,[r5,#Actor_family_b3]
    ldr        r7,PTR_FuncState_0805f644
    ldrb       r1,[r7,r0]
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
    add        r0,#0x1
    cmp        r0,#0xd
    bmi        LAB_0805f632
    mov        r0,#0x0
LAB_0805f632:
    strb       r0,[r5,#Actor_family_b3]
LAB_0805f634:
    pop        {pc}

FuncState_0805f636:
    .byte FS_3
    .byte FS_4
    .byte FS_4
    .byte FS_4
    .byte FS_3
    .byte FS_4
    .byte FS_4
    .byte FS_4
    .byte FS_3
    .byte FS_4
    .byte FS_4
    .byte FS_4
    .byte FS_5

    .align 2, 0


PTR_FuncState_0805f644:
    .word FuncState_0805f636


_ts R_StoneMan_1_3_RockCube
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_StoneMan_1_3_0_StartAnim_0805f664
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_StoneMan_FlinchState
    pop        {pc}

    .align 2, 0


PTR_R_StoneMan_1_3_0_StartAnim_0805f65c:
    .word R_StoneMan_1_3_0_StartAnim
    .word R_StoneMan_1_3_1_RockCube

PTR_PTR_R_StoneMan_1_3_0_StartAnim_0805f664:
    .word PTR_R_StoneMan_1_3_0_StartAnim_0805f65c


_ts R_StoneMan_1_3_0_StartAnim
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_StoneMan_1_3_1_RockCube
    push       {lr}
    sub        sp,#0x14
    mov        r4,sp
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805f6c2
    push       {r4}
    add        r0,r4,#0x0
    mov        r1,#0x1
    ldr        r2,DAT_0805f6c8
    bl         Field_Search
    pop        {r4}
    tst        r1,r1
    beq        LAB_0805f6ba
    push       {r1,r4}
    add        r0,r4,#0x0
    mov        r2,#0x14
    bl         ArrayShuffle
    pop        {r1,r4}
    ldrb       r0,[r4,#0x0]
    bl         Field_IndexToCellXY
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x0
    mov        r3,#0x64
    mov        r4,#0x1
    mov        r6,#0x3c
    mov        r7,#0x0
    bl         Attack_Cube_Create
LAB_0805f6ba:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805f6c2:
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


DAT_0805f6c8:
    .word 0x812


_ts R_StoneMan_1_4_Stones
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_StoneMan_1_4_0_RaiseArms_0805f6f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_StoneMan_FlinchState
    pop        {pc}

    .align 2, 0


PTR_R_StoneMan_1_4_0_RaiseArms_0805f6e0:
    .word R_StoneMan_1_4_0_RaiseArms
    .word R_StoneMan_1_4_1_HitGround
    .word R_StoneMan_1_4_2_StartAttack
    .word R_StoneMan_1_4_3_Stones
    .word R_StoneMan_1_4_4_Next

PTR_PTR_R_StoneMan_1_4_0_RaiseArms_0805f6f4:
    .word PTR_R_StoneMan_1_4_0_RaiseArms_0805f6e0


_ts R_StoneMan_1_4_0_RaiseArms
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_StoneMan_1_4_1_HitGround
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f71e
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
LAB_0805f71e:
    pop        {pc}


_ts R_StoneMan_1_4_2_StartAttack
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f764
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    sub        r1,#0x1
    ldrb       r2,[r5,#Actor_owner]
    mov        r3,#0x1e
    mov        r4,#0x88
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    ldrb       r0,[r5,#Actor_cPos_x]
    add        r1,#0x2
    bl         Attack_QuickAttack_Create
    pop        {r5}
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x28
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x7e
    bl         Sound_PlaySE
LAB_0805f764:
    pop        {pc}


_nt R_StoneMan_1_4_3_Stones
    push       {lr}
    sub        sp,#0x20
    mov        r6,sp
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f7b6
    push       {r6}
    add        r0,r6,#0x0
    mov        r1,#0x1
    ldr        r2,DAT_0805f7d0
    bl         Field_Search
    pop        {r6}
    tst        r1,r1
    beq        LAB_0805f7ae
    push       {r1,r6}
    add        r0,r6,#0x0
    mov        r2,#0x14
    bl         ArrayShuffle
    pop        {r1,r6}
    cmp        r1,#0x3
    bmi        LAB_0805f798
    mov        r1,#0x3
LAB_0805f798:
    push       {r1,r6}
    ldrb       r0,[r6,#0x0]
    bl         Field_IndexToCellXY
    mov        r4,#0x0
    bl         Attack_Stone_Create
    pop        {r1,r6}
    add        r6,#0x1
    sub        r1,#0x1
    bne        LAB_0805f798
LAB_0805f7ae:
    mov        r0,#0x50
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_0805f7b6:
    add        sp,#0x20
    pop        {pc}


_nt R_StoneMan_1_4_4_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f7cc
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805f7cc:
    pop        {pc}

    .align 2, 0


DAT_0805f7d0:
    .word 0x802


_ts R_StoneMan_1_5_Laser
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_StoneMan_1_5_0_SinkArms_0805f7f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_StoneMan_1_5_0_SinkArms_0805f7e4:
    .word R_StoneMan_1_5_0_SinkArms
    .word R_StoneMan_1_5_1_Delay
    .word R_StoneMan_1_5_2_Laser
    .word R_StoneMan_1_5_3_Reset
    .word R_StoneMan_1_5_4_Next

PTR_PTR_R_StoneMan_1_5_0_SinkArms_0805f7f8:
    .word PTR_R_StoneMan_1_5_0_SinkArms_0805f7e4


_ts R_StoneMan_1_5_0_SinkArms
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x3
    strh       r0,[r5,#Actor_counterB]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_StoneMan_1_5_1_Delay
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f822
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
LAB_0805f822:
    pop        {pc}


_ts R_StoneMan_1_5_2_Laser
    push       {lr}
    sub        sp,#0x14
    mov        r6,sp
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f852
    bl         R_StoneMan_GetRandomCellInPlayerRow
    cmp        r0,#0xff
    beq        LAB_0805f840
    bl         Attack_StoneManLaser_Create
    str        r7,[r5,#Actor_param_5C]
LAB_0805f840:
    ldrh       r0,[r5,#Actor_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterB]
    bne        LAB_0805f84c
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_0805f84c:
    mov        r0,#0x18
    lsl        r0,r0,#0x4
    strh       r0,[r5,#Actor_counterA]
LAB_0805f852:
    add        sp,#0x14
    pop        {pc}


_nt R_StoneMan_1_5_3_Reset
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f86c
    mov        r0,#0x6
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
LAB_0805f86c:
    pop        {pc}


_nt R_StoneMan_1_5_4_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f880
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805f880:
    pop        {pc}


_nt R_StoneMan_1_6_Flinch
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_StoneMan_1_6_0_Flinch_0805f898
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_StoneMan_1_6_0_Flinch_0805f890:
    .word R_StoneMan_1_6_0_Flinch
    .word R_StoneMan_1_6_1_Wait

PTR_PTR_R_StoneMan_1_6_0_Flinch_0805f898:
    .word PTR_R_StoneMan_1_6_0_Flinch_0805f890


_ts R_StoneMan_1_6_0_Flinch
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x32
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_StoneMan_1_6_1_Wait
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrh       r0,[r5,#Actor_counterA]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0805f8c2
    bl         SpritePtr_EnableFlash
LAB_0805f8c2:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f8da
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x3c
    strb       r0,[r5,#Actor_b1b]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
LAB_0805f8da:
    pop        {pc}


_ts R_StoneMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_StoneMan_2_0_Delete_0805f8f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_StoneMan_2_0_Delete_0805f8ec:
    .word R_StoneMan_2_0_Delete
    .word R_StoneMan_2_1_Free

PTR_PTR_R_StoneMan_2_0_Delete_0805f8f4:
    .word PTR_R_StoneMan_2_0_Delete_0805f8ec


_ts R_StoneMan_2_0_Delete
    push       {lr}
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#Actor_counterA]
    pop        {pc}


_nt R_StoneMan_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805f930
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805f930:
    pop        {pc}


_nt R_StoneMan_GetRandomCellInPlayerRow
    push       {lr}
    sub        sp,#0x14
    mov        r4,sp
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x18]
    mov        r3,#0x0
LAB_0805f942:
    cmp        r0,#0x6
    bgt        LAB_0805f968
    mov        r1,#0x1
LAB_0805f948:
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x20
    tst        r0,r1
    pop        {r0,r1}
    bne        LAB_0805f95e
    lsl        r6,r0,#0x4
    orr        r6,r1
    strb       r6,[r4,r3]
    add        r3,#0x1
LAB_0805f95e:
    add        r1,#0x1
    cmp        r1,#0x4
    bmi        LAB_0805f948
    add        r0,#0x1
    b          LAB_0805f942
LAB_0805f968:
    mov        r0,#0xff
    tst        r3,r3
    beq        LAB_0805f984
    push       {r4,r7}
    add        r0,r4,#0x0
    add        r1,r3,#0x0
    add        r2,r3,#0x0
    bl         ArrayShuffle
    pop        {r4,r7}
    ldrb       r0,[r4,#0x0]
    mov        r1,#0xf
    and        r1,r0
    lsr        r0,r0,#0x4
LAB_0805f984:
    add        sp,#0x14
    pop        {pc}


_ts R_StoneMan_FlinchState
    ldrb       r0,[r5,#Actor_bc]
    tst        r0,r0
    beq        LAB_0805f996
    mov        r0,#0x18
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805f996:
    mov        pc,lr
