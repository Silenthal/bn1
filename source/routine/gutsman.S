#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listGutsManDamage:
    .word listGutsManV1Damage
    .word listGutsManV2Damage
    .word listGutsManV3Damage

listGutsManV1Damage:
    .short 20
    .short 20
    .short 30
    .short 20

listGutsManV2Damage:
    .short 40
    .short 40
    .short 60
    .short 40

listGutsManV3Damage:
    .short 60
    .short 60
    .short 90
    .short 60

DAT_0805c0f0:
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x00
    .byte 0x00


_ts Routine_GutsMan
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_GutsMan_0_Init_0805c11c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsMan_0_Init_0805c11c:
    .word PTR_R_GutsMan_0_Init_0805c120

PTR_R_GutsMan_0_Init_0805c120:
    .word R_GutsMan_0_Init
    .word R_GutsMan_1_Main
    .word R_GutsMan_2_Free


_ts R_GutsMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x22
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r3,#0x68
    strh       r0,[r5,r3]
    mov        r3,#0x62
    mov        r0,#0x3
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listGutsManDamage_0805c1b4
    ldr        r7,[r7,r0]
    str        r7,[r5,#Actor_param_78]
    ldrh       r0,[r7,#0x6]
    strh       r0,[r5,#Actor_damage]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_element]
    FieldObject_Create PFI_Self_Actor, 0x70, offset_reg=3
    FieldObject_Create PFI_Moving, 0x74, offset_reg=3
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_GutsMan_1_Main
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_listGutsManDamage_0805c1b4:
    .word listGutsManDamage


_ts R_GutsMan_1_Main
    push       {lr}
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0805c1e4
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}
LAB_0805c1e4:
    bl         R_GutsMan_CheckDamage
    tst        r0,r0
    bne        LAB_0805c1f6
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0805c204
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0805c1f6:
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0805c204:
    .word PTR_R_Actor_1_0_Spawn_0805c208

PTR_R_Actor_1_0_Spawn_0805c208:
    .word R_Actor_1_0_Spawn
    .word R_GutsMan_1_1_Ready
    .word R_GutsMan_1_2_Wait
    .word R_GutsMan_1_3_Move
    .word R_GutsMan_1_4_Flinch
    .word R_GutsMan_1_5_GutsHammer
    .word R_GutsMan_1_6_TeleportBeforeAttack
    .word R_GutsMan_1_7_GutsPunch


_ts R_GutsMan_1_1_Ready
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0805c242
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c242:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805c254
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c254:
    pop        {pc}


_nt R_GutsMan_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsMan_1_2_0_Wait_0805c278
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805c274
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0805c274:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsMan_1_2_0_Wait_0805c278:
    .word PTR_R_GutsMan_1_2_0_Wait_0805c27c

PTR_R_GutsMan_1_2_0_Wait_0805c27c:
    .word R_GutsMan_1_2_0_Wait
    .word R_GutsMan_1_2_1_Next


_ts R_GutsMan_1_2_0_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_GutsMan_1_2_1_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805c2ac
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c2ac:
    pop        {pc}


_nt R_GutsMan_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsMan_1_3_0_StartMove_0805c2bc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_GutsMan_1_3_0_StartMove_0805c2bc:
    .word PTR_R_GutsMan_1_3_0_StartMove_0805c2c0

PTR_R_GutsMan_1_3_0_StartMove_0805c2c0:
    .word R_GutsMan_1_3_0_StartMove
    .word R_GutsMan_1_3_1_EndMove
    .word R_GutsMan_1_3_2_Next


_ts R_GutsMan_1_3_0_StartMove
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    ldr        r1,DAT_0805c334
    ldr        r2,DAT_0805c338
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_0805c32c
    mov        r2,#0x14
    push       {r0}
    bl         ArrayShuffle
    pop        {r0}
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#Actor_param_74]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    add        sp,#0x14
    pop        {pc}
LAB_0805c32c:
    bl         R_GutsMan_DecideAttack
    add        sp,#0x14
    pop        {pc}

DAT_0805c334:
    .word 0x3

DAT_0805c338:
    .word 0xC20


_ts R_GutsMan_1_3_1_EndMove
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c380
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c380:
    pop        {pc}


_nt R_GutsMan_1_3_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c392
    bl         R_GutsMan_DecideAttack
LAB_0805c392:
    pop        {pc}


_ts R_GutsMan_1_4_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_0805c3c0
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_0805c3a2
    bl         SpritePtr_EnableFlash
LAB_0805c3a2:
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsMan_1_4_0_StartAnim_0805c3b0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsMan_1_4_0_StartAnim_0805c3b0:
    .word PTR_R_GutsMan_1_4_0_StartAnim_0805c3b4

PTR_R_GutsMan_1_4_0_StartAnim_0805c3b4:
    .word R_GutsMan_1_4_0_StartAnim
    .word R_GutsMan_1_4_1_Recover
    .word R_GutsMan_1_4_2_Next

PTR_gFrameCounter_0805c3c0:
    .word gFrameCounter


_ts R_GutsMan_1_4_0_StartAnim
    push       {lr}
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    FieldObject_SetAttributeGroup PFI_Self_Object, 0x70
    mov        r0,#0x6
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xff
    strb       r0,[r5,#Actor_frameIndexLast]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r0,#0x32
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_GutsMan_1_4_1_Recover
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805c400
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c400:
    pop        {pc}


_nt R_GutsMan_1_4_2_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805c426
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r0,#0x5a
    mov        r3,#0x68
    strh       r0,[r5,r3]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    bl         Battle_PriorityQueueRemove
    bl         Battle_PriorityQueueEnqueue
LAB_0805c426:
    pop        {pc}


_ts R_GutsMan_1_5_GutsHammer
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsMan_1_5_0_StartAnim_0805c438
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsMan_1_5_0_StartAnim_0805c438:
    .word PTR_R_GutsMan_1_5_0_StartAnim_0805c43c

PTR_R_GutsMan_1_5_0_StartAnim_0805c43c:
    .word R_GutsMan_1_5_0_StartAnim
    .word R_GutsMan_1_5_1_Attack
    .word R_GutsMan_1_5_2_Recover
    .word R_GutsMan_1_5_3_Next


_ts R_GutsMan_1_5_0_StartAnim
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_GutsMan_1_5_1_Attack
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805c4e0
    ldrb       r0,[r5,#Actor_state_s3]
    tst        r0,r0
    bne        LAB_0805c482
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r1,r1,r0
    ldrb       r2,[r5,#Actor_cPos_y]
    mov        r3,#0x0
    mov        r4,#0x2
    ldr        r7,[r5,#Actor_param_78]
    ldrh       r6,[r7,#0x0]
    bl         Attack_Shockwave_Create
    b          LAB_0805c4dc
LAB_0805c482:
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805c4dc
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x2
    mov        r1,#0x2d
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x28
    lsl        r0,r0,#0x10
    sub        r1,r1,r0
    mov        r0,#0x0
    mov        r4,#QE_SwordStrike @ effect_type
    mov        r6,#PFI_Target_Solid @ effect_target
    lsl        r6,r6,#0x18
    orr        r4,r6
    mov        r6,#PFI_Self_Block @ attribute
    lsl        r6,r6,#0x10
    orr        r4,r6
    ldr        r7,[r5,#Actor_param_78]
    ldrh       r6,[r7,#0x2]
    mov        r7,#0x8
    bl         Attack_SharpStrike_Create
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
LAB_0805c4ce:
    sub        r0,#0x1
    push       {r0,r1}
    bl         Field_CrackPanel
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0805c4ce
LAB_0805c4dc:
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c4e0:
    pop        {pc}


_nt R_GutsMan_1_5_2_Recover
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c4f6
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c4f6:
    pop        {pc}


_ts R_GutsMan_1_5_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c50c
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c50c:
    pop        {pc}


_nt R_GutsMan_1_6_TeleportBeforeAttack
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsMan_1_6_0_Teleport_0805c51c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_GutsMan_1_6_0_Teleport_0805c51c:
    .word PTR_R_GutsMan_1_6_0_Teleport_0805c520

PTR_R_GutsMan_1_6_0_Teleport_0805c520:
    .word R_GutsMan_1_6_0_Teleport
    .word R_GutsMan_1_6_1_Land
    .word R_GutsMan_1_6_2_Decide


_ts R_GutsMan_1_6_0_Teleport
    push       {lr}
    sub        sp,#0x4
    mov        r7,sp
    mov        r0,#0x0
    mov        r1,#0x0
    bl         Field_FindWalkablePlayerPanelsLeft
    tst        r1,r1
    beq        LAB_0805c574
    add        r0,r7,#0x0
    mov        r2,#0x6
    push       {r7}
    bl         ArrayShuffle
    pop        {r7}
    ldrb       r0,[r7,#0x0]
    bl         Field_IndexToCellXY
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#Actor_param_74]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    add        sp,#0x4
    pop        {pc}
LAB_0805c574:
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
    add        sp,#0x4
    pop        {pc}


_ts R_GutsMan_1_6_1_Land
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c5aa
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c5aa:
    pop        {pc}


_ts R_GutsMan_1_6_2_Decide
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c5dc
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x10
    tst        r0,r1
    bne        LAB_0805c5d4
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r1,#0x1
    lsl        r1,r1,#0x8
    strh       r1,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0805c5d4:
    mov        r0,#0x1c
    strb       r0,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0805c5dc:
    pop        {pc}


_nt R_GutsMan_1_7_GutsPunch
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsMan_1_7_0_StartAnim_0805c5ec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_GutsMan_1_7_0_StartAnim_0805c5ec:
    .word PTR_R_GutsMan_1_7_0_StartAnim_0805c5f0

PTR_R_GutsMan_1_7_0_StartAnim_0805c5f0:
    .word R_GutsMan_1_7_0_StartAnim
    .word R_GutsMan_1_7_1_Attack
    .word R_GutsMan_1_7_2_Next


_ts R_GutsMan_1_7_0_StartAnim
    push       {lr}
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_GutsMan_1_7_1_Attack
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805c63a
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    mov        r3,#0x20
    lsl        r3,r3,#0x10
    mov        r0,#0x28
    lsl        r0,r0,#0x10
    sub        r1,r1,r0
    mov        r0,#0x0
    ldr        r4,DAT_0805c63c
    ldr        r7,[r5,#Actor_param_78]
    ldrh       r6,[r7,#0x4]
    mov        r7,#0x8
    bl         Attack_SharpStrike_Create
    mov        r0,#0x7f
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_0805c63a:
    pop        {pc}

DAT_0805c63c:
    strike_attribute PFI_Self_Push, effect_target=PFI_Target_Solid, effect_type=QE_SimpleHit


_ts R_GutsMan_1_7_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c654
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c654:
    pop        {pc}


_nt R_GutsMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_GutsMan_2_0_Delete_0805c664
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_GutsMan_2_0_Delete_0805c664:
    .word PTR_R_GutsMan_2_0_Delete_0805c668

PTR_R_GutsMan_2_0_Delete_0805c668:
    .word R_GutsMan_2_0_Delete
    .word R_GutsMan_2_1_Free


_ts R_GutsMan_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_Disable
    mov        r0,#0x6
    strb       r0,[r5,#Actor_frameIndexCurr]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    pop        {pc}


_ts R_GutsMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805c6b6
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805c6b6:
    pop        {pc}


_ts R_GutsMan_DecideAttack
    push       {lr}
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldr        r1,PanelFlag_0805c700
    tst        r0,r1
    bne        LAB_0805c6e8
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    strb       r0,[r5,r3]
    tst        r0,r0
    bmi        LAB_0805c6dc
    mov        r0,#0x14
    mov        r1,#0x0
    b          LAB_0805c6f2
LAB_0805c6dc:
    mov        r3,#0x62
    mov        r0,#0x3
    strb       r0,[r5,r3]
    mov        r0,#0x18
    mov        r1,#0x0
    b          LAB_0805c6f2
LAB_0805c6e8:
    mov        r3,#0x62
    mov        r0,#0x3
    strb       r0,[r5,r3]
    mov        r0,#0x1c
    mov        r1,#0x0
LAB_0805c6f2:
    lsl        r1,r1,#0x8
    strb       r0,[r5,#Actor_state_s1]
    strh       r1,[r5,#Actor_state_s2]
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word DAT_0805c0f0

PanelFlag_0805c700:
    .word PF_PlayerOccupied | PF_Solid


_ts R_GutsMan_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0805c7a0
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_0805c776
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0805c776
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    bne        LAB_0805c7a0
    mov        r3,#0x68
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_0805c746
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_0805c738
    FieldObject_SetAttributeGroup PFI_Self_Actor, 0x70
    b          LAB_0805c7a0
LAB_0805c738:
    lsr        r0,r0,#0x1
    bcc        LAB_0805c7a0
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    b          LAB_0805c7a0
LAB_0805c746:
    FieldObject_GetDamage PFI_Target_Object, 0x70
    tst        r0,r0
    beq        LAB_0805c7a0
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0805c7a0
    bl         Field_SubtractHP
    cmp        r0,#0x3c
    bcc        LAB_0805c76c
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c76c:
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_0805c796
LAB_0805c776:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_SetDeletedFlag
    FieldObject_SetAttributeGroup PFI_Self_Object, 0x70
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_0805c796:
    mov        r0,#0x6f
    bl         Sound_PlaySE
    mov        r0,#0x0
    pop        {pc}
LAB_0805c7a0:
    mov        r0,#0x0
    pop        {pc}
