#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_BigSnake
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_BigSnake_0_Init_0806be14
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnake_0_Init_0806be14:
    .word PTR_R_BigSnake_0_Init_0806be18

PTR_R_BigSnake_0_Init_0806be18:
    .word R_BigSnake_0_Init
    .word R_BigSnake_1_Main
    .word R_BigSnake_2_Free


_ts R_BigSnake_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x64
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_family_family]
    bl         SpritePtr_SetPaletteIndex
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r3,#0x62
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0xc8
    strh       r0,[r5,#Actor_damage]
    FieldObject_Create PFI_Self_Actor, 0x68
    FieldObject_Create PFI_Moving, 0x6c
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    bl         R_BigSnake_CreateBody
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_BigSnake_1_Main
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts R_BigSnake_1_Main
    push       {lr}
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x1
    bl         Field_CheckInterrupt
    tst        r0,r0
    beq        LAB_0806beb8
    mov        r0,#0x1
    mov        r3,#0x62
    strb       r0,[r5,r3]
LAB_0806beb8:
    bl         R_BigSnake_CheckDamage
    tst        r0,r0
    bne        LAB_0806beca
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806bed8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806beca:
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0806bed8:
    .word PTR_R_Actor_1_0_Spawn_0806bedc

PTR_R_Actor_1_0_Spawn_0806bedc:
    .word R_Actor_1_0_Spawn
    .word R_BigSnake_1_1_WaitForBattleStart
    .word R_BigSnake_1_2
    .word R_BigSnake_1_3
    .word R_BigSnake_1_4
    .word R_BigSnake_1_5


_ts R_BigSnake_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0806bf0e
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0806bf0e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806bf20
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806bf20:
    pop        {pc}


_nt R_BigSnake_1_2
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BigSnake_1_2_0_0806bf44
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806bf40
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0806bf40:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnake_1_2_0_0806bf44:
    .word PTR_R_BigSnake_1_2_0_0806bf48

PTR_R_BigSnake_1_2_0_0806bf48:
    .word R_BigSnake_1_2_0
    .word R_BigSnake_1_2_1


_ts R_BigSnake_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_BigSnake_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806bf82
    mov        r0,#0x1
    bl         Battle_SetBattleFlag
    mov        r0,#0x8
    strb       r0,[r5,#Actor_family_b3]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806bf82:
    pop        {pc}


_ts R_BigSnake_1_3
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BigSnake_1_3_0_0806bf94
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnake_1_3_0_0806bf94:
    .word PTR_R_BigSnake_1_3_0_0806bf98

PTR_R_BigSnake_1_3_0_0806bf98:
    .word R_BigSnake_1_3_0
    .word R_BigSnake_1_3_1


_ts R_BigSnake_1_3_0
    push       {lr}
    mov        r0,#0x0
    push       {r7}
    bl         FieldObject_UpdateField
    pop        {r7}
    bl         R_BigSnake_GetNextMovePanel
    tst        r0,r0
    beq        LAB_0806bfea
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#Actor_param_6C]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    ldr        r3,DAT_0806bff4
    ldrb       r2,[r5,#Actor_cPos_x]
    sub        r2,r0,r2
    mul        r2,r3
    str        r2,[r5,#Actor_diff_x]
    ldr        r3,DAT_0806bff8
    ldrb       r2,[r5,#Actor_cPos_y]
    sub        r2,r1,r2
    mul        r2,r3
    str        r2,[r5,#Actor_diff_y]
    mov        r0,#0x19
    strh       r0,[r5,#Actor_counterA]
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    bl         R_BigSnake_1_3_1
    pop        {pc}
LAB_0806bfea:
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

DAT_0806bff4:
    .word 0x19999

DAT_0806bff8:
    .word 0xF5C2


_ts R_BigSnake_1_3_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806c038
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#Actor_family_b3]
    sub        r0,#0x1
    strb       r0,[r5,#Actor_family_b3]
    beq        LAB_0806c052
    mov        r0,#0x1
    bl         Battle_SetBattleFlag
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0806c038:
    ldr        r0,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_diff_x]
    add        r0,r0,r2
    str        r0,[r5,#Actor_pos_curr_x]
    ldr        r1,[r5,#Actor_pos_curr_y]
    ldr        r2,[r5,#Actor_diff_y]
    add        r1,r1,r2
    str        r1,[r5,#Actor_pos_curr_y]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    pop        {pc}
LAB_0806c052:
    bl         R_BigSnake_Decide
    pop        {pc}


_ts R_BigSnake_1_4
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BigSnake_1_4_0_0806c068
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnake_1_4_0_0806c068:
    .word PTR_R_BigSnake_1_4_0_0806c06c

PTR_R_BigSnake_1_4_0_0806c06c:
    .word R_BigSnake_1_4_0
    .word R_BigSnake_1_4_1
    .word R_BigSnake_1_4_2
    .word R_BigSnake_1_4_3
    .word R_BigSnake_1_4_4


_ts R_BigSnake_1_4_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_BigSnake_1_4_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806c0ac
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_R_BigSnake_Shockwave_0806c0b0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_0806c0ac:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnake_Shockwave_0806c0b0:
    .word PTR_R_BigSnake_Shockwave_0806c0b4

PTR_R_BigSnake_Shockwave_0806c0b4:
    .word R_BigSnake_Shockwave
    .word R_BigSnake_Thunder
    .word R_BigSnake_Fireball


_ts R_BigSnake_1_4_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806c0d4
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_0806c0d4:
    pop        {pc}


_nt R_BigSnake_1_4_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806c0ea
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s2]
LAB_0806c0ea:
    pop        {pc}


_ts R_BigSnake_1_4_4
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806c0ea
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_BigSnake_1_5
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BigSnake_1_5_0_0806c124
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806c120
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0806c120:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnake_1_5_0_0806c124:
    .word PTR_R_BigSnake_1_5_0_0806c128

PTR_R_BigSnake_1_5_0_0806c128:
    .word R_BigSnake_1_5_0
    .word R_BigSnake_1_5_1


_ts R_BigSnake_1_5_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    mov        r0,#0xc8
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_BigSnake_1_5_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806c154
    bl         R_BigSnake_Decide
LAB_0806c154:
    pop        {pc}


_nt R_BigSnake_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_BigSnake_2_0_Delete_0806c164
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_BigSnake_2_0_Delete_0806c164:
    .word PTR_R_BigSnake_2_0_Delete_0806c168

PTR_R_BigSnake_2_0_Delete_0806c168:
    .word R_BigSnake_2_0_Delete
    .word R_BigSnake_2_1_Free


_ts R_BigSnake_2_0_Delete
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


_ts R_BigSnake_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806c1b2
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806c1b2:
    pop        {pc}


_ts R_BigSnake_Shockwave
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r1,r1,r0
    ldrb       r2,[r5,#Actor_cPos_y]
    add        r4,#0x3
    mov        r3,#0x0
    ldrh       r6,[r5,#Actor_damage]
    bl         Attack_Shockwave_Create
    pop        {pc}


_ts R_BigSnake_Thunder
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r2,DAT_0806c1ec
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r0,r0,r1
    ldrb       r1,[r5,#Actor_cPos_y]
    add        r3,#0x5
    mov        r4,#0x1
    ldrh       r6,[r5,#Actor_damage]
    mov        r7,#0x8
    lsl        r7,r7,#0x10
    bl         Attack_Thunder_Create
    pop        {pc}

    .align 2, 0


DAT_0806c1ec:
    .word 0xCCCC


_ts R_BigSnake_Fireball
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
    pop        {pc}


_nt R_BigSnake_Decide
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0806c256
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0806c260
    ldrh       r0,[r5,#Actor_hpCurrent]
    ldrh       r1,[r5,#Actor_hpMax]
    lsr        r1,r1,#0x2
    cmp        r0,r1
    bhi        LAB_0806c232
    bl         Rng_RandomUint
    lsl        r0,r0,#0x1f
    bne        LAB_0806c260
    b          LAB_0806c244
LAB_0806c232:
    ldrh       r0,[r5,#Actor_hpCurrent]
    ldrh       r1,[r5,#Actor_hpMax]
    lsr        r1,r1,#0x1
    cmp        r0,r1
    bhi        LAB_0806c260
    bl         Rng_RandomUint
    lsl        r0,r0,#0x1e
    bne        LAB_0806c260
LAB_0806c244:
    push       {r0,r1}
    mov        r0,#0x28
    ldrb       r1,[r5,#Actor_family_family]
    add        r1,#0x80
    mov        r2,#0x1
    ldrh       r3,[r5,#Actor_damage]
    bl         ScreenDim_Alloc
    pop        {r0,r1}
LAB_0806c256:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0806c260:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_BigSnake_GetNextMovePanel
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x8
    mov        r7,sp
    ldr        r6,PTR_CellPosition_ARRAY_0806c2cc
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r2,#0x0
    mov        r3,#0x6
LAB_0806c280:
    push       {r0,r1,r2,r3,r6,r7}
    add        r7,r7,r2
    ldrsb      r4,[r6,r3]
    add        r0,r0,r4
    add        r3,#0x1
    ldrsb      r4,[r6,r3]
    add        r1,r1,r4
    strb       r0,[r7,#0x0]
    strb       r1,[r7,#0x1]
    bl         R_BigSnake_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1,r2,r3,r6,r7}
    beq        LAB_0806c29e
    add        r2,#0x2
LAB_0806c29e:
    sub        r3,#0x2
    bpl        LAB_0806c280
    lsr        r2,r2,#0x1
    beq        LAB_0806c2c0
    push       {r2,r7}
    bl         Rng_RandomInt
    pop        {r2,r7}
    add        r1,r2,#0x0
    bl         Mod
    lsl        r2,r0,#0x1
    ldrb       r0,[r7,r2]
    add        r2,#0x1
    ldrb       r1,[r7,r2]
    add        sp,#0x8
    pop        {pc}
LAB_0806c2c0:
    add        sp,#0x8
    mov        r0,#0x0
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed

PTR_CellPosition_ARRAY_0806c2cc:
    .word CellPosition_ARRAY_0806c2d0

CellPosition_ARRAY_0806c2d0:
    cell_pos 0, 1
    cell_pos 0, -1
    cell_pos 1, 0
    cell_pos -1, 0


_ts R_BigSnake_IsPanelWalkable
    push       {lr}
    bl         FieldObject_GetPanelFlags
    ldr        r1,PanelFlag_0806c2f8
    tst        r0,r1
    bne        LAB_0806c2f0
    ldr        r1,PanelFlag_0806c2f4
    and        r0,r1
    cmp        r0,r1
    bne        LAB_0806c2f0
    mov        r0,#0x1
    pop        {pc}
LAB_0806c2f0:
    mov        r0,#0x0
    pop        {pc}

PanelFlag_0806c2f4:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_0806c2f8:
    .word PF_PlayerOccupied | PF_Teleporting | PF_Solid


_ts R_BigSnake_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0806c358
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_0806c330
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806c330
    FieldObject_GetDamage PFI_Target_Object, 0x68
    tst        r0,r0
    beq        LAB_0806c358
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0806c358
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0806c34e
LAB_0806c330:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_0806c34e:
    bl         SpritePtr_EnableFlash
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0806c358:
    mov        r0,#0x0
    pop        {pc}


_ts R_BigSnake_CreateBody
    push       {lr}
    ldrb       r0,[r5,#Actor_cPos_x]
    add        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    add        r2,r5,#0x0
    ldrb       r4,[r5,#Actor_family_family]
    push       {r0,r1,r4}
    bl         Routine_BigSnakeBody_Create
    pop        {r0,r1,r4}
    add        r1,#0x1
    add        r2,r7,#0x0
    bl         Routine_BigSnakeBody_Create
    pop        {pc}

    .align 2, 0

