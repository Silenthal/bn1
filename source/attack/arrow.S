#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Arrow
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Arrow_0_Init_08072dc0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Arrow_0_Init_08072dc0:
    .word PTR_A_Arrow_0_Init_08072dc4

PTR_A_Arrow_0_Init_08072dc4:
    .word A_Arrow_0_Init
    .word A_Arrow_1_Main
    .word A_Arrow_2_Free


_ts A_Arrow_0_Init
    push       {lr}
    mov        r1,#0x8f
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    beq        LAB_08072ddc
    mov        r1,#0x8e
LAB_08072ddc:
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    beq        LAB_08072e2c
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    push       {r0}
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#Attack_diff_x]
    pop        {r0}
    bl         SpritePtr_SetFlipType
    FieldObject_Create PFI_Self_Grounded, Attack_param_60
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
LAB_08072e2c:
    bl         A_Arrow_1_Main
    pop        {pc}


_nt A_Arrow_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Arrow_1_0_08072e48
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Arrow_1_0_08072e48:
    .word PTR_A_Arrow_1_0_08072e4c

PTR_A_Arrow_1_0_08072e4c:
    .word A_Arrow_1_0
    .word A_Arrow_1_1
    .word A_Arrow_1_2


_ts A_Arrow_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_08072e68
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
LAB_08072e68:
    mov        r0,#0x1
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_08072eaa
    ldr        r0,[r5,#Attack_pos_curr_x]
    ldr        r1,DAT_08072eb4
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_x]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_IsOutOfBounds
    bne        LAB_08072eaa
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldr        r1,PanelFlag_08072eb8
    tst        r0,r1
    beq        LAB_08072eb2
    bl         R_Actor_UpdateSpritePos
    ldrh       r0,[r5,#0x2E]
    add        r0,#0x1
    strh       r0,[r5,#0x2E]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    b          LAB_08072eb2
LAB_08072eaa:
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08072eb2:
    pop        {pc}

DAT_08072eb4:
    .word 0xFFFE0000

PanelFlag_08072eb8:
    .word PF_PlayerOccupied | PF_Solid


_ts A_Arrow_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_08072ecc
    mov        r0,#0x4
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
LAB_08072ecc:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072ee0
    ldr        r1,[r5,#Attack_diff_x]
    ldrb       r0,[r5,#Attack_cPos_x]
    add        r0,r0,r1
    strb       r0,[r5,#Attack_cPos_x]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_state_s2]
LAB_08072ee0:
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_IsOutOfBounds
    bne        LAB_08072efe
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_08072f20
    ldr        r1,[r7,r1]
    tst        r0,r1
    beq        LAB_08072f0c
LAB_08072efe:
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
LAB_08072f0c:
    bl         R_Actor_UpdateSpritePos
    ldrh       r0,[r5,#0x2E]
    sub        r0,#0x2
    strh       r0,[r5,#0x2E]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_UpdateCellPosition
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_08072f20:
    .word PanelFlag_ARRAY_08072f24

PanelFlag_ARRAY_08072f24:
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid


_ts A_Arrow_1_2
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Arrow_1_2_0_08072f3c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Arrow_1_2_0_08072f3c:
    .word PTR_A_Arrow_1_2_0_08072f40

PTR_A_Arrow_1_2_0_08072f40:
    .word A_Arrow_1_2_0
    .word A_Arrow_1_2_1
    .word A_Arrow_1_2_2


_ts A_Arrow_1_2_0
    push       {lr}
    mov        r0,#0x8
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x1
    bl         Battle_SetBattleFlag
    mov        r0,#0x98
    bl         Sound_PlaySE
    pop        {pc}


_ts A_Arrow_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072f7e
    mov        r0,#0x16
    strb       r0,[r5,#Attack_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
LAB_08072f7e:
    pop        {pc}


_ts A_Arrow_1_2_2
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072f98
    mov        r0,#0x2
    bl         Battle_SetBattleFlag
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08072f98:
    pop        {pc}


_nt A_Arrow_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    beq        LAB_08072fa8
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
LAB_08072fa8:
    bl         Attack_Free
    pop        {pc}


_nt Attack_Arrow_Create
    push       {r5,lr}
    ldrb       r2,[r5,#Attack_owner]
    push       {r0,r1,r2,r6}
    mov        r0,#0x22
    bl         Attack_Alloc
    pop        {r0,r1,r2,r6}
    tst        r5,r5
    beq        LAB_08072fe4
    strb       r2,[r5,#Attack_owner]
    strh       r6,[r5,#Attack_damage]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    beq        LAB_08072fde
    ldrh       r0,[r5,#0x2E]
    sub        r0,#0x1
    strh       r0,[r5,#0x2E]
    b          LAB_08072fe4
LAB_08072fde:
    ldrh       r0,[r5,#0x2E]
    add        r0,#0x1
    strh       r0,[r5,#0x2E]
LAB_08072fe4:
    add        r0,r5,#0x0
    pop        {r5,pc}
