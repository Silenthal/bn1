#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listIceManDamage:
    .byte 0x1E
    .byte 0x1E
    .byte 0x3C
    .byte 0x00
    .byte 0x1E
    .byte 0x1E
    .byte 0x3C
    .byte 0x00
    .byte 0x1E
    .byte 0x1E
    .byte 0x3C
    .byte 0x00

listIceManActionChoice:
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_7
    .byte FS_7
    .byte FS_6
    .byte FS_6
    .byte FS_6
    .byte FS_6
    .byte FS_6


_ts Routine_IceMan
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_IceMan_0_Init_08060c30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_IceMan_0_Init_08060c30:
    .word PTR_R_IceMan_0_Init_08060c34

PTR_R_IceMan_0_Init_08060c34:
    .word R_IceMan_0_Init
    .word R_IceMan_1_Main
    .word R_IceMan_2_Free


_ts R_IceMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x2a
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
    str        r0,[r5,#Actor_param_5C]
    mov        r3,#0x68
    strh       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listIceManDamage_08060cc4
    add        r7,r7,r0
    str        r7,[r5,#Actor_param_7C]
    ldrb       r0,[r7,#0x3]
    strh       r0,[r5,#Actor_damage]
    mov        r0,#0x3
    strb       r0,[r5,#Actor_element]
    FieldObject_Create PFI_Self_Actor, 0x70, offset_reg=3
    FieldObject_Create PFI_Moving, 0x74, offset_reg=3
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_IceMan_1_Main
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_listIceManDamage_08060cc4:
    .word listIceManDamage


_ts R_IceMan_1_Main
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
    bne        LAB_08060cf4
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}
LAB_08060cf4:
    bl         R_IceMan_CheckDamage
    tst        r0,r0
    bne        LAB_08060d06
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08060d14
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08060d06:
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08060d14:
    .word PTR_R_Actor_1_0_Spawn_08060d18

PTR_R_Actor_1_0_Spawn_08060d18:
    .word R_Actor_1_0_Spawn
    .word R_IceMan_1_1_WaitForBattleStart
    .word R_IceMan_1_2_Wait
    .word R_IceMan_1_3_Decide
    .word R_IceMan_1_4_Flinch
    .word R_IceMan_1_5_IceCube
    .word R_IceMan_1_6_FreezeBomb
    .word R_IceMan_1_7_IceCubeAndKick


_ts R_IceMan_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_08060d52
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_08060d52:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08060d64
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08060d64:
    pop        {pc}


_nt R_IceMan_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_IceMan_1_2_0_08060d88
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08060d84
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_08060d84:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_IceMan_1_2_0_08060d88:
    .word PTR_R_IceMan_1_2_0_08060d8c

PTR_R_IceMan_1_2_0_08060d8c:
    .word R_IceMan_1_2_0
    .word R_IceMan_1_2_1


_ts R_IceMan_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    mov        r0,#0x30
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_IceMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08060dbc
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08060dbc:
    pop        {pc}


_nt R_IceMan_1_3_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_IceMan_1_3_0_Wait_08060dcc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_IceMan_1_3_0_Wait_08060dcc:
    .word PTR_R_IceMan_1_3_0_Wait_08060dd0

PTR_R_IceMan_1_3_0_Wait_08060dd0:
    .word R_IceMan_1_3_0_Wait
    .word R_IceMan_1_3_1_TeleportStart
    .word R_IceMan_1_3_2_TeleportEnd
    .word R_IceMan_1_3_3_Wait
    .word R_IceMan_1_3_4_Decide


_ts R_IceMan_1_3_0_Wait
    push       {lr}
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1f
    add        r0,#0x4
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_IceMan_1_3_1_TeleportStart
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    ldr        r1,PanelFlag_08060e74
    ldr        r2,PanelFlag_08060e78
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_08060e5c
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
    mov        r0,#0xa
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
    add        sp,#0x14
    pop        {pc}
LAB_08060e5c:
    bl         Rng_RandomUint
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x1c
    ldr        r7,PTR_listIceManActionChoice_08060f10
    ldrb       r1,[r7,r0]
    strb       r1,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PanelFlag_08060e74:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08060e78:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_IceMan_1_3_2_TeleportEnd
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08060ec0
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
    mov        r0,#0xa
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x14
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_08060ec0:
    pop        {pc}


_nt R_IceMan_1_3_3_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08060ed6
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_08060ed6:
    pop        {pc}


_ts R_IceMan_1_3_4_Decide
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08060f0e
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    strb       r0,[r5,r3]
    bmi        LAB_08060ef2
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_08060ef2:
    bl         Routine_IsPlayerFrozen
    mov        r1,#0x1c
    tst        r0,r0
    bne        LAB_08060f08
    bl         Rng_RandomUint
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x1c
    ldr        r7,PTR_listIceManActionChoice_08060f10
    ldrb       r1,[r7,r0]
LAB_08060f08:
    strb       r1,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08060f0e:
    pop        {pc}

PTR_listIceManActionChoice_08060f10:
    .word listIceManActionChoice


_ts R_IceMan_1_4_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_08060f40
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_08060f22
    bl         SpritePtr_EnableFlash
LAB_08060f22:
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_IceMan_1_4_0_Flinch_08060f30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_IceMan_1_4_0_Flinch_08060f30:
    .word PTR_R_IceMan_1_4_0_Flinch_08060f34

PTR_R_IceMan_1_4_0_Flinch_08060f34:
    .word R_IceMan_1_4_0_Flinch
    .word R_IceMan_1_4_1_Reset
    .word R_IceMan_1_4_2_Next

PTR_gFrameCounter_08060f40:
    .word gFrameCounter


_ts R_IceMan_1_4_0_Flinch
    push       {lr}
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    FieldObject_SetAttributeGroup PFI_Self_Object, 0x70
    mov        r0,#0x8
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xff
    strb       r0,[r5,#Actor_frameIndexLast]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r0,#0x32
    strh       r0,[r5,#Actor_counterA]
    bl         Field_AttackFree
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_IceMan_1_4_1_Reset
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08060f84
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_08060f84:
    pop        {pc}


_nt R_IceMan_1_4_2_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08060fa2
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r0,#0x5a
    mov        r3,#0x68
    strh       r0,[r5,r3]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08060fa2:
    pop        {pc}


_ts R_IceMan_1_5_IceCube
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_IceMan_1_5_0_Wait_08060fb4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_IceMan_1_5_0_Wait_08060fb4:
    .word PTR_R_IceMan_1_5_0_Wait_08060fb8

PTR_R_IceMan_1_5_0_Wait_08060fb8:
    .word R_IceMan_1_5_0_Wait
    .word R_IceMan_1_5_1_FindIceCubePanel
    .word R_IceMan_1_5_2_TeleportEnd
    .word R_IceMan_1_5_3_AnimStart
    .word R_IceMan_1_5_4_IceCube
    .word R_IceMan_1_5_5_Wait
    .word R_IceMan_1_5_6_Next


_ts R_IceMan_1_5_0_Wait
    push       {lr}
    mov        r0,#0x0
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_IceMan_1_5_1_FindIceCubePanel
    push       {lr}
    ldr        r0,[r5,#Actor_param_70]
    ldr        r0,[r0,#0x10]
    bl         FieldObject_UpdateField
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    add        r0,#0x1
    bl         R_IceMan_FindEmptyIceCubePanel
    tst        r0,r0
    beq        LAB_08061048
    ldrb       r2,[r5,#Actor_cPos_x]
    cmp        r0,r2
    bne        LAB_08061010
    ldrb       r2,[r5,#Actor_cPos_y]
    cmp        r1,r2
    bne        LAB_08061010
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_08061010:
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
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0xa
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_08061048:
    mov        r0,#0x18
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_IceMan_1_5_2_TeleportEnd
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061092
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0xa
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x14
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_08061092:
    pop        {pc}


_ts R_IceMan_1_5_3_AnimStart
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080610a8
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_080610a8:
    pop        {pc}


_nt R_IceMan_1_5_4_IceCube
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080610f6
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_counterA]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_080610f8
    mov        r0,#0x0
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#Actor_param_5C]
    mov        r0,#0x9d
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    push       {r0,r1}
    bl         Field_RepairPanel
    pop        {r1,r2}
    mov        r0,#0x3
    mov        r3,#0x64
    mov        r4,#0x6
    ldr        r7,[r5,#Actor_param_7C]
    ldrb       r6,[r7,#0x2]
    mov        r7,#0x0
    bl         Attack_Cube_Create
    mov        r0,#0x14
    strh       r0,[r5,#Actor_state_s2]
LAB_080610f6:
    pop        {pc}

DAT_080610f8:
    .word 0x890400


_ts R_IceMan_1_5_5_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806111c
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806111c
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
    bl         Field_AttackFree
    mov        r0,#0x18
    strh       r0,[r5,#Actor_state_s2]
LAB_0806111c:
    pop        {pc}


_nt R_IceMan_1_5_6_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806113e
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    add        r0,#0x1
    strb       r0,[r5,r3]
    cmp        r0,#0x3
    bmi        LAB_08061140
    mov        r0,#0x18
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806113e:
    pop        {pc}
LAB_08061140:
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_IceMan_1_6_FreezeBomb
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_IceMan_1_6_0_Throw_08061154
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_IceMan_1_6_0_Throw_08061154:
    .word PTR_R_IceMan_1_6_0_Throw_08061158

PTR_R_IceMan_1_6_0_Throw_08061158:
    .word R_IceMan_1_6_0_Throw
    .word R_IceMan_1_6_1_FreezeBomb
    .word R_IceMan_1_6_2_Wait
    .word R_IceMan_1_6_3_Next


_ts R_IceMan_1_6_0_Throw
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_IceMan_1_6_1_FreezeBomb
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080611b2
    LoadMain battle, r7, r7
    ldr        r7,[r7,#Battle_actorListPlayer]
    ldrb       r0,[r7,#0x18]
    lsl        r0,r0,#0x10
    ldrb       r1,[r7,#0x19]
    lsl        r1,r1,#0x18
    mov        r4,#0x3
    orr        r4,r0
    orr        r4,r1
    mov        r7,#0x28
    add        r7,r5,r7
    ldmia      r7!,{r1,r2,r3}
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x3
    ldr        r7,[r5,#Actor_param_7C]
    ldrb       r6,[r7,#0x1]
    bl         Attack_IceManBeetankBomb_Create
    mov        r0,#0x77
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_080611b2:
    pop        {pc}


_ts R_IceMan_1_6_2_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080611c8
    mov        r0,#0xb4
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_080611c8:
    pop        {pc}


_nt R_IceMan_1_6_3_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_080611dc
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080611dc:
    pop        {pc}


_nt R_IceMan_1_7_IceCubeAndKick
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_IceMan_1_7_0_TeleportStart_080611ec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_IceMan_1_7_0_TeleportStart_080611ec:
    .word PTR_R_IceMan_1_7_0_TeleportStart_080611f0

PTR_R_IceMan_1_7_0_TeleportStart_080611f0:
    .word R_IceMan_1_7_0_TeleportStart
    .word R_IceMan_1_7_1_TeleportEnd
    .word R_IceMan_1_7_2_IceCube
    .word R_IceMan_1_7_3_Wait
    .word R_IceMan_1_7_4_StartKick
    .word R_IceMan_1_7_5_Kick
    .word R_IceMan_1_7_6_Next


_ts R_IceMan_1_7_0_TeleportStart
    push       {lr}
    LoadMain battle, r7, r7
    ldr        r7,[r7,#Battle_actorListPlayer]
    ldrb       r0,[r7,#0x19]
    bl         R_IceMan_FindEmptyPanelInRow
    tst        r0,r0
    beq        LAB_08061256
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
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0xa
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_08061256:
    mov        r0,#0x18
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_IceMan_1_7_1_TeleportEnd
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080612c6
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
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0xa
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x14
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    add        r7,r0,#0x0
    mov        r2,#0x8
    lsl        r2,r2,#0x8
    tst        r7,r2
    bne        LAB_080612be
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_080612be:
    mov        r0,#0x6
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x14
    strh       r0,[r5,#Actor_state_s2]
LAB_080612c6:
    pop        {pc}


_ts FUN_080612c8
    mov        r0,#0x18
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_IceMan_1_7_2_IceCube
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806131e
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_counterA]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,FamilyDetail_08061320
    mov        r0,#0x0
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#Actor_param_5C]
    mov        r0,#0x9d
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    push       {r0,r1}
    bl         Field_RepairPanel
    pop        {r1,r2}
    mov        r0,#0x3
    mov        r3,#0x64
    mov        r4,#0x2
    ldr        r7,[r5,#Actor_param_7C]
    ldrb       r6,[r7,#0x2]
    mov        r7,#0x0
    bl         Attack_Cube_Create
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0806131e:
    pop        {pc}

FamilyDetail_08061320:
    .byte 0x00, 0x04, 0x89, 0x00


_ts R_IceMan_1_7_3_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061344
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08061344
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
    bl         Field_AttackFree
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_08061344:
    pop        {pc}


_nt R_IceMan_1_7_4_StartKick
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806135a
    mov        r0,#0x6
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x14
    strh       r0,[r5,#Actor_state_s2]
LAB_0806135a:
    pop        {pc}


_ts R_IceMan_1_7_5_Kick
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0806138c
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x28
    lsl        r0,r0,#0x10
    sub        r1,r1,r0
    mov        r0,#0x3
    ldr        r4,DAT_08061390
    ldr        r7,[r5,#Actor_param_7C]
    ldrb       r6,[r7,#0x3]
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    mov        r0,#0x99
    bl         Sound_PlaySE
    mov        r0,#0x18
    strh       r0,[r5,#Actor_state_s2]
LAB_0806138c:
    pop        {pc}

    .align 2, 0


DAT_08061390:
    .byte QE_SwordStrike, 0x00, PFI_Self_Grounded_Push, PFI_Target_Solid


_ts R_IceMan_1_7_6_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080613a8
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080613a8:
    pop        {pc}


_nt R_IceMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_IceMan_2_0_Delete_080613b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_IceMan_2_0_Delete_080613b8:
    .word PTR_R_IceMan_2_0_Delete_080613bc

PTR_R_IceMan_2_0_Delete_080613bc:
    .word R_IceMan_2_0_Delete
    .word R_IceMan_2_1_Free


_ts R_IceMan_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_Disable
    mov        r0,#0x8
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


_ts R_IceMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806140a
    ldr        r0,[r5,#Actor_param_70]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806140a:
    pop        {pc}


_ts R_IceMan_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_080614a8
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_0806147e
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806147e
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    bne        LAB_080614a8
    mov        r3,#0x68
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_0806144e
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_08061440
    FieldObject_SetAttributeGroup PFI_Self_Actor, 0x70
    b          LAB_080614a8
LAB_08061440:
    lsr        r0,r0,#0x1
    bcc        LAB_080614a8
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    b          LAB_080614a8
LAB_0806144e:
    FieldObject_GetDamage PFI_Target_Object, 0x70
    tst        r0,r0
    beq        LAB_080614a8
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_080614a8
    bl         Field_SubtractHP
    cmp        r0,#0x64
    bcc        LAB_08061474
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08061474:
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_0806149e
LAB_0806147e:
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
LAB_0806149e:
    mov        r0,#0x6f
    bl         Sound_PlaySE
    mov        r0,#0x0
    pop        {pc}
LAB_080614a8:
    mov        r0,#0x0
    pop        {pc}


_ts R_IceMan_FindEmptyIceCubePanel
    push       {lr}
    bl         R_IceMan_FindEmptyPanelInRow
    tst        r0,r0
    beq        LAB_080614d0
    push       {r0,r1}
    sub        r0,#0x1
    bl         FieldObject_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1}
    ldr        r2,DAT_080614dc
    tst        r7,r2
    bne        LAB_080614d2
    ldr        r2,DAT_080614d8
    and        r7,r2
    cmp        r7,r2
    bne        LAB_080614d2
LAB_080614d0:
    pop        {pc}
LAB_080614d2:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


DAT_080614d8:
    .word 0x0

DAT_080614dc:
    .word 0x820


_ts R_IceMan_FindEmptyPanelInRow
    push       {lr}
    push       {r0}
    add        r4,r0,#0x0
    mov        r0,#0x1
    ldr        r1,PanelFlag_08061520
    ldr        r2,PanelFlag_08061524
    bl         Field_GetColumnInRowLeftToRight
    tst        r0,r0
    pop        {r1}
    beq        LAB_0806151a
    ldrb       r2,[r5,#Actor_cPos_x]
    cmp        r0,r2
    bne        LAB_08061502
    ldrb       r2,[r5,#Actor_cPos_y]
    cmp        r1,r2
    beq        LAB_0806151a
LAB_08061502:
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1}
    ldr        r2,PanelFlag_0806152c
    tst        r7,r2
    bne        LAB_0806151c
    ldr        r2,PanelFlag_08061528
    and        r7,r2
    cmp        r7,r2
    bne        LAB_0806151c
LAB_0806151a:
    pop        {pc}
LAB_0806151c:
    mov        r0,#0x0
    pop        {pc}

PanelFlag_08061520:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08061524:
    .word 0

PanelFlag_08061528:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_0806152c:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid
