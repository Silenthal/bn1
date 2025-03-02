#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listPopperParams:
    .byte 0x3C
    .byte 0x00
    .byte 0x00
    .byte 0x64
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x8C
    .byte 0x3C
    .byte 0x00
    .byte 0x08
    .byte 0xB4


_ts Routine_Popper
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_Popper_0_Init_080628c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Popper_0_Init_080628c8:
    .word PTR_R_Popper_0_Init_080628cc

PTR_R_Popper_0_Init_080628cc:
    .word R_Popper_0_Init
    .word R_Popper_1_Main
    .word R_Popper_2_Free


_ts R_Popper_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x4c
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_family_family]
    bl         SpritePtr_SetPaletteIndex
    ldr        r0,[r5,#Actor_pos_curr_x]
    ldr        r1,[r5,#Actor_pos_curr_y]
    mov        r2,#0xd0
    lsl        r2,r2,#0x10
    str        r2,[r5,#Actor_pos_curr_z]
    mov        r7,#0x50
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x0
    mov        r3,#0x0
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listPopperParams_08062960
    add        r7,r7,r0
    str        r7,[r5,#Actor_param_70]
    ldrb       r0,[r7,#0x2]
    mov        r3,#0x60
    strb       r0,[r5,r3]
    ldrb       r0,[r7,#0x3]
    strh       r0,[r5,#Actor_damage]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    FieldObject_Create PFI_Self_Actor, 0x74, offset_reg=3
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    FieldObject_Create PFI_Moving, 0x78, offset_reg=3
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_Popper_1_Main
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_listPopperParams_08062960:
    .word listPopperParams


_ts R_Popper_1_Main
    push       {lr}
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_DisableIfDeleted
    bl         R_Popper_CheckDamage
    tst        r0,r0
    bne        LAB_0806297e
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806298c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806297e:
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0806298c:
    .word PTR_R_Actor_1_0_Spawn_08062990

PTR_R_Actor_1_0_Spawn_08062990:
    .word R_Actor_1_0_Spawn
    .word R_Popper_1_1_Wait
    .word R_Popper_1_2_Decide
    .word R_Popper_1_3_Move
    .word R_Popper_1_4_WoodTower


_ts R_Popper_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_080629be
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_080629be:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080629d0
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080629d0:
    pop        {pc}


_nt R_Popper_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Popper_1_2_0_Wait_080629f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080629f0
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_080629f0:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Popper_1_2_0_Wait_080629f4:
    .word PTR_R_Popper_1_2_0_Wait_080629f8

PTR_R_Popper_1_2_0_Wait_080629f8:
    .word R_Popper_1_2_0_Wait
    .word R_Popper_1_2_1_Decide


_ts R_Popper_1_2_0_Wait
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r0,r1
    ldr        r7,[r5,#Actor_param_70]
    ldrh       r1,[r7,#0x0]
    add        r0,r0,r1
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Popper_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08062a48
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_08062a40
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_08062a40:
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08062a48:
    pop        {pc}


_nt R_Popper_1_3_Move
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_cPos_x]
    mov        r1,#0x4
    mov        r2,#0x0
    sub        sp,#0x4
    mov        r7,sp
    add        r6,r7,#0x0
LAB_08062a5e:
    sub        r1,#0x1
    beq        LAB_08062a8a
    ldrb       r3,[r5,#Actor_cPos_y]
    cmp        r1,r3
    beq        LAB_08062a5e
    push       {r0,r1,r2,r6,r7}
    bl         FieldObject_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r6,r7}
    ldr        r4,PanelFlag_08062ac8
    tst        r3,r4
    bne        LAB_08062a5e
    ldr        r4,PanelFlag_08062ac4
    and        r3,r4
    cmp        r3,r4
    bne        LAB_08062a5e
    strb       r0,[r6,#0x0]
    strb       r1,[r6,#0x1]
    add        r6,#0x2
    add        r2,#0x1
    b          LAB_08062a5e
LAB_08062a8a:
    sub        r2,#0x1
    bmi        LAB_08062ab6
    push       {r2,r7}
    bl         Rng_RandomUint
    pop        {r2,r7}
    and        r0,r2
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    ldr        r7,[r5,#Actor_param_78]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
LAB_08062ab6:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    add        sp,#0x4
    pop        {pc}

    .align 2, 0


PanelFlag_08062ac4:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08062ac8:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_Popper_1_4_WoodTower
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Popper_1_4_0_StartAnim_08062ae0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Popper_1_4_0_StartAnim_08062ae0:
    .word PTR_R_Popper_1_4_0_StartAnim_08062ae4

PTR_R_Popper_1_4_0_StartAnim_08062ae4:
    .word R_Popper_1_4_0_StartAnim
    .word R_Popper_1_4_1_Drop
    .word R_Popper_1_4_2_WoodTower
    .word R_Popper_1_4_3_Wait
    .word R_Popper_1_4_4_Rise


_ts R_Popper_1_4_0_StartAnim
    push       {lr}
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    str        r0,[r5,#Actor_diff_z]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_Popper_1_4_1_Drop
    push       {lr}
    ldr        r0,[r5,#Actor_pos_curr_z]
    ldr        r1,[r5,#Actor_diff_z]
    sub        r0,r0,r1
    str        r0,[r5,#Actor_pos_curr_z]
    lsr        r0,r0,#0x10
    cmp        r0,#0x58
    bgt        LAB_08062b22
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Enable
    b          LAB_08062b28
LAB_08062b22:
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
LAB_08062b28:
    ldr        r0,[r5,#Actor_pos_curr_z]
    mov        r1,#0x40
    lsl        r1,r1,#0x10
    cmp        r0,r1
    bgt        LAB_08062b46
    str        r1,[r5,#Actor_pos_curr_z]
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_08062b46:
    pop        {pc}


_ts R_Popper_1_4_2_WoodTower
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08062b96
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    ldrh       r0,[r5,#Actor_hpCurrent]
    ldrh       r1,[r5,#Actor_hpMax]
    sub        r0,r1,r0
    lsr        r1,r1,#0x2
    cmp        r0,r1
    bmi        LAB_08062b76
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    bmi        LAB_08062b76
    strb       r0,[r5,r3]
    add        r0,r5,#0x0
    mov        r1,#0x4
    bl         ScreenDim_Recover_Create
    b          LAB_08062b8e
LAB_08062b76:
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#Battle_actorListPlayer]
    mov        r2,#0x2c
    add        r2,r2,r7
    mov        r3,#0x4
    mov        r4,#0x3
    ldrh       r6,[r5,#Actor_damage]
    bl         Attack_Tower_Create
LAB_08062b8e:
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_08062b96:
    pop        {pc}


_ts R_Popper_1_4_3_Wait
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08062bb0
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    str        r0,[r5,#Actor_diff_z]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_08062bb0:
    pop        {pc}


_nt R_Popper_1_4_4_Rise
    push       {lr}
    ldr        r0,[r5,#Actor_pos_curr_z]
    ldr        r1,[r5,#Actor_diff_z]
    add        r0,r0,r1
    str        r0,[r5,#Actor_pos_curr_z]
    lsr        r0,r0,#0x10
    cmp        r0,#0x58
    bgt        LAB_08062bca
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Enable
    b          LAB_08062bd0
LAB_08062bca:
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
LAB_08062bd0:
    ldr        r0,[r5,#Actor_pos_curr_z]
    mov        r1,#0xd0
    lsl        r1,r1,#0x10
    cmp        r0,r1
    bmi        LAB_08062bea
    str        r1,[r5,#Actor_pos_curr_z]
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_ClearDeletedFlag
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08062bea:
    pop        {pc}


_ts R_Popper_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Popper_2_0_08062bfc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Popper_2_0_08062bfc:
    .word PTR_R_Popper_2_0_08062c00

PTR_R_Popper_2_0_08062c00:
    .word R_Popper_2_0
    .word R_Popper_2_1


_ts R_Popper_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    pop        {pc}


_ts R_Popper_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08062c4e
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_78]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08062c4e:
    pop        {pc}


_ts R_Popper_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08062cb4
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_08062c92
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_08062c92
    ldr        r1,[r5,#Actor_param_74]
    ldrb       r0,[r1,#0x0]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_08062cb4
    mov        r0,#PFI_Target_Object
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08062cb4
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08062cb4
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_08062caa
LAB_08062c92:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Actor_param_74]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_08062caa:
    mov        r0,#0x6f
    bl         Sound_PlaySE
    mov        r0,#0x0
    pop        {pc}
LAB_08062cb4:
    mov        r0,#0x0
    pop        {pc}
