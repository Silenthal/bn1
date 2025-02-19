#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_080686e4:
    .byte 0x5A
    .byte 0x00
    .byte 0x18
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte 0x5A
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x01
    .byte 0x00
    .byte 0x5A
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x01

    .align 2, 0



_ts Routine_CanDevil
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_CanDevil_0_Init_08068710
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_CanDevil_0_Init_08068710:
    .word PTR_R_CanDevil_0_Init_08068714

PTR_R_CanDevil_0_Init_08068714:
    .word R_CanDevil_0_Init
    .word R_CanDevil_1_Main
    .word R_CanDevil_2_Free


_ts R_CanDevil_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x60
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_family_family]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x3
    ldr        r7,PTR_DAT_080687b0
    add        r7,r7,r0
    str        r7,[r5,#Actor_param_70]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldr        r7,PTR_listCanDevilFireballDamage_080687ac
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x1
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#Actor_damage]
    FieldObject_Create PFI_Self_Actor, 0x68
    FieldObject_Create PFI_Moving, 0x6c, offset_reg=3
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    mov        r0,#0x5c
    add        r0,r0,r5
    mov        r1,#0x6
    ldrb       r2,[r5,#Actor_cPos_y]
    ldrb       r4,[r5,#Actor_family_family]
    add        r4,#0x80
    ldrb       r6,[r5,#Actor_owner]
    bl         Attack_Candle_Create
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_CanDevil_1_Main
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_listCanDevilFireballDamage_080687ac:
    .word listCanDevilFireballDamage

PTR_DAT_080687b0:
    .word DAT_080686e4

listCanDevilFireballDamage:
    .short 0x64
    .short 0x96
    .short 0xC8


_nt R_CanDevil_1_Main
    push       {lr}
    ldr        r1,[r5,#Actor_param_5C]
    tst        r1,r1
    bne        LAB_080687ca
    mov        r0,#0x62
    lsl        r0,r0,#0x18
    bl         SpritePtr_SetObjectExcludeFlags
LAB_080687ca:
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080687f4
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_SetDeletedFlag
    b          LAB_08068848
LAB_080687f4:
    bl         Battle_IsInputLocked
    bne        LAB_08068848
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_0806882c
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806882c
    FieldObject_GetDamage PFI_Target_Object, 0x68
    tst        r0,r0
    beq        LAB_08068848
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08068848
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_08068842
LAB_0806882c:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    pop        {pc}
LAB_08068842:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08068848:
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08068868
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08068868:
    .word PTR_R_Actor_1_0_Spawn_0806886c

PTR_R_Actor_1_0_Spawn_0806886c:
    .word R_Actor_1_0_Spawn
    .word R_CanDevil_1_1_Wait
    .word R_CanDevil_1_2_Decide
    .word R_CanDevil_1_3_Move
    .word R_CanDevil_1_4_Fireball


_ts R_CanDevil_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0806889a
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0806889a:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080688ac
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080688ac:
    pop        {pc}


_nt R_CanDevil_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_CanDevil_1_2_0_080688d0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080688cc
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_080688cc:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_CanDevil_1_2_0_080688d0:
    .word PTR_R_CanDevil_1_2_0_080688d4

PTR_R_CanDevil_1_2_0_080688d4:
    .word R_CanDevil_1_2_0
    .word R_CanDevil_1_2_1


_ts R_CanDevil_1_2_0
    push       {lr}
    ldr        r7,[r5,#Actor_param_70]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldr        r7,[r5,#Actor_param_70]
    ldrh       r0,[r7,#0x0]
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_CanDevil_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08068902
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08068902:
    pop        {pc}


_ts R_CanDevil_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_CanDevil_1_3_0_0806891c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_CanDevil_1_3_0_08068914:
    .word R_CanDevil_1_3_0
    .word R_CanDevil_1_3_1

PTR_PTR_R_CanDevil_1_3_0_0806891c:
    .word PTR_R_CanDevil_1_3_0_08068914


_ts R_CanDevil_1_3_0
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,[r5,#Actor_param_70]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#Actor_counterA]
    mov        r2,#0x1
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x19]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r3,#0x61
    strb       r0,[r5,r3]
    cmp        r1,r0
    beq        LAB_08068984
    bcc        LAB_08068946
    neg        r2,r2
LAB_08068946:
    ldr        r7,[r5,#Actor_param_70]
    ldr        r0,[r7,#0x4]
    mul        r0,r2
    str        r0,[r5,#Actor_diff_y]
    add        r1,r1,r2
    ldrb       r0,[r5,#Actor_cPos_x]
    push       {r1}
    bl         FieldObject_GetPanelFlags
    pop        {r1}
    ldr        r2,PanelFlag_08068994
    tst        r0,r2
    bne        LAB_08068984
    ldr        r2,PanelFlag_08068990
    and        r0,r2
    cmp        r0,r2
    bne        LAB_08068984
    ldrb       r0,[r5,#Actor_cPos_x]
    ldr        r7,[r5,#Actor_param_6C]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Enable
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_08068984:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

    .align 2, 0


PanelFlag_08068990:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08068994:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_CanDevil_1_3_1
    push       {lr}
    ldr        r0,[r5,#Actor_pos_curr_y]
    ldr        r1,[r5,#Actor_diff_y]
    add        r0,r0,r1
    str        r0,[r5,#Actor_pos_curr_y]
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08068a08
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r2,#0x1
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    ldrb       r1,[r5,#Actor_cPos_y]
    cmp        r1,r0
    beq        LAB_08068a0a
    bcc        LAB_080689d6
    neg        r2,r2
LAB_080689d6:
    add        r1,r1,r2
    ldrb       r0,[r5,#Actor_cPos_x]
    push       {r1}
    bl         FieldObject_GetPanelFlags
    pop        {r1}
    ldr        r2,PanelFlag_08068a18
    tst        r0,r2
    bne        LAB_08068a0a
    ldr        r2,PanelFlag_08068a14
    and        r0,r2
    cmp        r0,r2
    bne        LAB_08068a0a
    ldrb       r0,[r5,#Actor_cPos_x]
    ldr        r7,[r5,#Actor_param_6C]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Enable
    ldr        r7,[r5,#Actor_param_70]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#Actor_counterA]
LAB_08068a08:
    pop        {pc}
LAB_08068a0a:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

PanelFlag_08068a14:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08068a18:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_CanDevil_1_4_Fireball
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_CanDevil_1_4_0_08068a30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_CanDevil_1_4_0_08068a2c:
    .word R_CanDevil_1_4_0

PTR_PTR_R_CanDevil_1_4_0_08068a30:
    .word PTR_R_CanDevil_1_4_0_08068a2c


_ts R_CanDevil_1_4_0
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r1,r1,r0
    ldrb       r2,[r5,#Actor_cPos_y]
    mov        r3,#0x0
    mov        r4,#0x1
    ldrh       r6,[r5,#Actor_damage]
    bl         Attack_MagicFire_Create
    mov        r0,#0xb6
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_CanDevil_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_CanDevil_2_0_08068a68
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_CanDevil_2_0_08068a68:
    .word PTR_R_CanDevil_2_0_08068a6c

PTR_R_CanDevil_2_0_08068a6c:
    .word R_CanDevil_2_0
    .word R_CanDevil_2_1


_ts R_CanDevil_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    pop        {pc}


_ts R_CanDevil_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08068ac0
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_5C]
    tst        r0,r0
    beq        LAB_08068ab8
    mov        r1,#0x1
    strb       r1,[r0,#0x5]
LAB_08068ab8:
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08068ac0:
    pop        {pc}

    .align 2, 0

