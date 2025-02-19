#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Piranha
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_Piranha_0_Init_0805e95c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Piranha_0_Init_0805e95c:
    .word PTR_R_Piranha_0_Init_0805e960

PTR_R_Piranha_0_Init_0805e960:
    .word R_Piranha_0_Init
    .word R_Piranha_1_Main
    .word R_Piranha_2_Free


_ts R_Piranha_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x3b
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
    strh       r0,[r5,#Actor_counterB]
    strb       r0,[r5,#Actor_family_b1]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    FieldObject_Create PFI_Self_Actor, 0x60
    ldr        r0,[r5,#Actor_param_60]
    ldr        r7,[r5,#Actor_param_60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    FieldObject_CreateInitMoving 0x64, inherit_element=1
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_Piranha_1_Main
    push       {lr}
    mov        r0,#0x6
    bl         Battle_GetBattleFlagMulti
    ldrb       r1,[r5,#Actor_family_b1]
    orr        r1,r0
    strb       r1,[r5,#Actor_family_b1]
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_0805ea40
    bl         Battle_IsInputLocked
    bne        LAB_0805ea40
    bl         Routine_CheckPoisonDrain
    bl         SpritePtr_DisableFlash
    ldr        r6,[r5,#Actor_param_60]
    ldrh       r0,[r5,#Actor_cPos_x]
    ldr        r1,PanelFlag_0805eaa4
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
    beq        LAB_0805ea40
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0805ea40:
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    beq        LAB_0805ea74
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Piranha_1_0_Spawn_0805ea88
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_0805ea66
    mov        r0,#0x9
    b          LAB_0805ea68
LAB_0805ea66:
    mov        r0,#PFI_Moving
LAB_0805ea68:
    ldr        r1,[r5,#Actor_param_60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_0805ea86
LAB_0805ea74:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_SetDeletedFlag
LAB_0805ea86:
    pop        {pc}

PTR_PTR_R_Piranha_1_0_Spawn_0805ea88:
    .word PTR_R_Piranha_1_0_Spawn_0805ea8c

PTR_R_Piranha_1_0_Spawn_0805ea8c:
    .word R_Piranha_1_0_Spawn
    .word R_Piranha_1_1_WaitForBattleStart
    .word R_Piranha_1_2_Wait
    .word R_Piranha_1_3_Move
    .word R_Piranha_1_4_Target
    .word R_Piranha_1_5_Arrow

PanelFlag_0805eaa4:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Piranha_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Piranha_1_0_0_ResetAnim_0805ead0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Piranha_1_0_0_ResetAnim_0805eac0:
    .word R_Piranha_1_0_0_ResetAnim
    .word R_Piranha_1_0_1_StartAnim
    .word R_Piranha_1_0_2_Wait
    .word R_Piranha_1_0_3_WaitForBattleStart

PTR_PTR_R_Piranha_1_0_0_ResetAnim_0805ead0:
    .word PTR_R_Piranha_1_0_0_ResetAnim_0805eac0


_ts R_Piranha_1_0_0_ResetAnim
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805eae6
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    bl         ResetBattleSpawnAnimationState
LAB_0805eae6:
    pop        {pc}


_ts R_Piranha_1_0_1_StartAnim
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805eafa
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
LAB_0805eafa:
    pop        {pc}


_ts R_Piranha_1_0_2_Wait
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805eb0e
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
    bl         Battle_PriorityQueueRemove
LAB_0805eb0e:
    pop        {pc}


_ts R_Piranha_1_0_3_WaitForBattleStart
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805eb24
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805eb24:
    pop        {pc}


_nt R_Piranha_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0805eb40
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0805eb40:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805eb52
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805eb52:
    pop        {pc}


_ts R_Piranha_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Piranha_1_2_0_ResetAnim_0805eb7c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805eb72
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0805eb72:
    pop        {pc}

PTR_R_Piranha_1_2_0_ResetAnim_0805eb74:
    .word R_Piranha_1_2_0_ResetAnim
    .word R_Piranha_1_2_1_Delay

PTR_PTR_R_Piranha_1_2_0_ResetAnim_0805eb7c:
    .word PTR_R_Piranha_1_2_0_ResetAnim_0805eb74


_ts R_Piranha_1_2_0_ResetAnim
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    bl         R_Piranha_1_2_1_Delay
    pop        {pc}


_ts R_Piranha_1_2_1_Delay
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805eba6
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805eba6:
    pop        {pc}


_ts R_Piranha_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Piranha_1_3_0_CheckMove_0805ebb8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Piranha_1_3_0_CheckMove_0805ebb8:
    .word PTR_R_Piranha_1_3_0_CheckMove_0805ebbc

PTR_R_Piranha_1_3_0_CheckMove_0805ebbc:
    .word R_Piranha_1_3_0_CheckMove
    .word R_Piranha_1_3_1_EndMove
    .word R_Piranha_1_3_2_Next


_ts R_Piranha_1_3_0_CheckMove
    push       {lr}
    bl         R_Piranha_CanMove
    cmp        r0,#0xff
    beq        LAB_0805ec10
    strb       r0,[r5,#Actor_family_b2]
    strb       r1,[r5,#Actor_family_b3]
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
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    mvn        r1,r1
    and        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x3
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    b          LAB_0805ec18
LAB_0805ec10:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ec18:
    pop        {pc}


_nt R_Piranha_1_3_1_EndMove
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805ec52
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
    mov        r4,#0x14
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x3
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_0805ec52:
    pop        {pc}


_ts R_Piranha_1_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805ec74
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ec74:
    pop        {pc}


_nt R_Piranha_1_4_Target
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Piranha_1_4_0_ChooseTargetOrAttack_0805ec9c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r0,[r5,#Actor_family_b1]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0805ec98
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    strb       r0,[r5,#Actor_family_b1]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
LAB_0805ec98:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Piranha_1_4_0_ChooseTargetOrAttack_0805ec9c:
    .word PTR_R_Piranha_1_4_0_ChooseTargetOrAttack_0805eca0

PTR_R_Piranha_1_4_0_ChooseTargetOrAttack_0805eca0:
    .word R_Piranha_1_4_0_ChooseTargetOrAttack
    .word R_Piranha_1_4_1_Target
    .word R_Piranha_1_4_2_Wait
    .word R_Piranha_1_4_3_Reset
    .word R_Piranha_1_4_4_Next


_ts R_Piranha_1_4_0_ChooseTargetOrAttack
    push       {lr}
    ldrb       r0,[r5,#Actor_family_b1]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0805ecce
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    strb       r0,[r5,#Actor_family_b1]
    bl         R_Piranha_1_5_Arrow
    b          LAB_0805ecd6
LAB_0805ecce:
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0805ecd6:
    pop        {pc}


_ts R_Piranha_1_4_1_Target
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805ecfc
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r3,#0x18
    lsl        r3,r3,#0x10
    mov        r4,#0x0
    bl         Attack_Arrow_Create
    str        r0,[r5,#Actor_param_5C]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_0805ecfc:
    pop        {pc}


_nt R_Piranha_1_4_2_Wait
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805ed10
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_0805ed10:
    pop        {pc}


_nt R_Piranha_1_4_3_Reset
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805ecfc
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    pop        {pc}


_ts R_Piranha_1_4_4_Next
    push       {lr}
    ldr        r7,[r5,#Actor_param_5C]
    tst        r7,r7
    beq        LAB_0805ed36
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0805ed3e
LAB_0805ed36:
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ed3e:
    pop        {pc}


_ts R_Piranha_1_5_Arrow
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Piranha_1_5_0_StartAnim_0805ed50
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Piranha_1_5_0_StartAnim_0805ed50:
    .word PTR_R_Piranha_1_5_0_StartAnim_0805ed54

PTR_R_Piranha_1_5_0_StartAnim_0805ed54:
    .word R_Piranha_1_5_0_StartAnim
    .word R_Piranha_1_5_1_Arrow
    .word R_Piranha_1_5_2_Wait
    .word R_Piranha_1_5_3_Reset
    .word R_Piranha_1_5_4_Next


_ts R_Piranha_1_5_0_StartAnim
    push       {lr}
    ldrb       r0,[r5,#Actor_family_b1]
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_0805ed7e
    mov        r0,#0x0
    strb       r0,[r5,#Actor_family_b1]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0805ed7e:
    pop        {pc}


_ts R_Piranha_1_5_1_Arrow
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805edb6
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r3,#0x18
    lsl        r3,r3,#0x10
    mov        r4,#0x1
    ldrb       r6,[r5,#Actor_family_family]
    ldr        r7,PTR_DAT_0805edbc
    ldrb       r6,[r7,r6]
    bl         Attack_Arrow_Create
    str        r0,[r5,#Actor_param_5C]
    mov        r0,#0x7d
    bl         Sound_PlaySE
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_0805edb6:
    pop        {pc}

DAT_0805edb8:
    .byte 0x32
    .byte 0x46
    .byte 0x78

    .align 2, 0


PTR_DAT_0805edbc:
    .word DAT_0805edb8


_ts R_Piranha_1_5_2_Wait
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805edd2
    mov        r0,#0x6
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_0805edd2:
    pop        {pc}


_ts R_Piranha_1_5_3_Reset
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805edb6
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x14
    strh       r0,[r5,#Actor_counterA]
    pop        {pc}


_nt R_Piranha_1_5_4_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805ee00
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ee00:
    pop        {pc}


_nt R_Piranha_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Piranha_2_0_Delete_0805ee18
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Piranha_2_0_Delete_0805ee10:
    .word R_Piranha_2_0_Delete
    .word R_Piranha_2_1_Free

PTR_PTR_R_Piranha_2_0_Delete_0805ee18:
    .word PTR_R_Piranha_2_0_Delete_0805ee10


_ts R_Piranha_2_0_Delete
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
    pop        {pc}


_ts R_Piranha_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805ee56
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805ee56:
    pop        {pc}


_ts R_Piranha_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_0805ee84
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_0805ee84
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805ee84
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0805ee84
    mov        r2,#0x1
LAB_0805ee84:
    add        r0,r2,#0x0
    pop        {pc}


_ts R_Piranha_CanMove
    push       {lr}
    bl         Rng_RandomUint
    mov        r2,#0x0
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0805eeae
LAB_0805ee96:
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    sub        r1,#0x1
    push       {r0,r1,r2}
    bl         R_Piranha_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1,r2}
    bne        LAB_0805eec6
    tst        r2,r2
    bne        LAB_0805eec4
    mov        r2,#0x1
LAB_0805eeae:
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    add        r1,#0x1
    push       {r0,r1,r2}
    bl         R_Piranha_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1,r2}
    bne        LAB_0805eec6
    tst        r2,r2
    beq        LAB_0805ee96
LAB_0805eec4:
    mov        r0,#0xff
LAB_0805eec6:
    pop        {pc}
