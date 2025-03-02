#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_PuffyBubble
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_PuffyBubble_0_Init_080729d0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PuffyBubble_0_Init_080729d0:
    .word PTR_A_PuffyBubble_0_Init_080729d4

PTR_A_PuffyBubble_0_Init_080729d4:
    .word A_PuffyBubble_0_Init
    .word A_PuffyBubble_1_Main
    .word A_PuffyBubble_2_Free


_ts A_PuffyBubble_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x8d
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#Attack_family_family]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x3c
    strh       r0,[r5,#Attack_counterA]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    FieldObject_Create PFI_Self_Extension, Attack_param_60
    FieldObject_Create PFI_Moving, Attack_param_64
    ldr        r0,[r5,#Attack_param_64]
    mov        r1,#0x40
    lsl        r1,r1,#0x10
    str        r1,[r0,#0xc]
    bl         FieldObject_Disable
    mov        r0,#0x28
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    mov        r0,#0x1
    strb       r0,[r5,#Attack_canBeDamaged]
    strb       r0,[r5,#Attack_bc]
    bl         A_PuffyBubble_1_Main
    pop        {pc}


_ts A_PuffyBubble_1_Main
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x1
    beq        LAB_08072a5e
    ldr        r7,[r5,#Attack_param_68]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_08072a78
LAB_08072a5e:
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    ldrb       r0,[r5,#Attack_bc]
    tst        r0,r0
    beq        LAB_08072b28
    mov        r0,#0x0
    strb       r0,[r5,#Attack_bc]
    b          LAB_08072b28
LAB_08072a78:
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    ldr        r7,[r5,#Attack_param_60]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         SpritePtr_DisableFlash
    ldrb       r2,[r5,#Attack_canBeDamaged]
    tst        r2,r2
    beq        LAB_08072ae6
    bl         A_PuffyBubble_CheckPanelForTarget
    beq        LAB_08072ab2
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    strh       r0,[r5,#Attack_state_s2]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsSpread
    b          LAB_08072b28
LAB_08072ab2:
    ldr        r6,[r5,#Attack_param_60]
    ldrh       r0,[r5,#Attack_cPos_x]
    ldr        r1,PanelFlag_08072b3c
    ldrb       r2,[r5,#Attack_element]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#Attack_param_60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08072ae6
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08072ae6:
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_PuffyBubble_1_0_08072b2c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    ldr        r0,[r5,#Attack_param_60]
    ldrb       r1,[r5,#Attack_canBeDamaged]
    tst        r1,r1
    beq        LAB_08072b0a
    bl         FieldObject_Enable
    b          LAB_08072b0e
LAB_08072b0a:
    bl         FieldObject_Disable
LAB_08072b0e:
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08072b28
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    strh       r0,[r5,#Attack_state_s2]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsSpread
LAB_08072b28:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PuffyBubble_1_0_08072b2c:
    .word PTR_A_PuffyBubble_1_0_08072b30

PTR_A_PuffyBubble_1_0_08072b30:
    .word A_PuffyBubble_1_0
    .word A_PuffyBubble_1_1
    .word A_PuffyBubble_1_2

PanelFlag_08072b3c:
    .word PF_Player
    .word PF_Teleporting


_ts A_PuffyBubble_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_08072b5a
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0xab
    bl         Sound_PlaySE
LAB_08072b5a:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08072b70
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08072b70:
    pop        {pc}


_nt A_PuffyBubble_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_PuffyBubble_1_1_0_08072b80
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_PuffyBubble_1_1_0_08072b80:
    .word PTR_A_PuffyBubble_1_1_0_08072b84

PTR_A_PuffyBubble_1_1_0_08072b84:
    .word A_PuffyBubble_1_1_0
    .word A_PuffyBubble_1_1_1


_ts A_PuffyBubble_1_1_0
    push       {lr}
    bl         A_PuffyBubble_GetNextPanelTowardsPlayer
    strb       r0,[r5,#Attack_family_b2]
    strb       r1,[r5,#Attack_family_b3]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    ldr        r3,DAT_08072bbc
    str        r3,[r5,#Attack_diff_z]
    ldr        r4,DAT_08072bb8
    bl         Field_CalculateTrajectoryXY
    strh       r0,[r5,#Attack_counterA]
    str        r1,[r5,#Attack_diff_x]
    str        r2,[r5,#Attack_diff_y]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}

DAT_08072bb8:
    .word 0xFFFFF000

DAT_08072bbc:
    .word 0x28000


_ts A_PuffyBubble_1_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072c0c
    ldrb       r0,[r5,#Attack_family_b2]
    ldrb       r1,[r5,#Attack_family_b3]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r2,#0x0
    str        r2,[r5,#Attack_pos_curr_z]
    mov        r0,#0xac
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08072c06
    mov        r0,#0x0
    strb       r0,[r5,#Attack_bc]
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    strh       r0,[r5,#Attack_state_s2]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    b          LAB_08072c3a
LAB_08072c06:
    mov        r0,#0x0
    strb       r0,[r5,#Attack_state_s2]
    b          LAB_08072c3a
LAB_08072c0c:
    ldr        r0,[r5,#Attack_diff_z]
    ldr        r1,DAT_08072c3c
    add        r0,r0,r1
    str        r0,[r5,#Attack_diff_z]
    ldr        r0,[r5,#Attack_diff_x]
    ldr        r1,[r5,#Attack_pos_curr_x]
    add        r1,r1,r0
    str        r1,[r5,#Attack_pos_curr_x]
    ldr        r0,[r5,#Attack_diff_y]
    ldr        r1,[r5,#Attack_pos_curr_y]
    add        r1,r1,r0
    str        r1,[r5,#Attack_pos_curr_y]
    ldr        r0,[r5,#Attack_diff_z]
    ldr        r1,[r5,#Attack_pos_curr_z]
    add        r1,r1,r0
    str        r1,[r5,#Attack_pos_curr_z]
    mov        r0,#0x1
    mov        r2,#0x28
    lsl        r2,r2,#0x10
    cmp        r1,r2
    bmi        LAB_08072c38
    mov        r0,#0x0
LAB_08072c38:
    strb       r0,[r5,#Attack_canBeDamaged]
LAB_08072c3a:
    pop        {pc}

DAT_08072c3c:
    .word 0xFFFFF000


_ts A_PuffyBubble_1_2
    push       {lr}
    pop        {pc}


_ts A_PuffyBubble_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    tst        r0,r0
    bne        LAB_08072c74
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x7
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0xad
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Attack_bc]
    tst        r0,r0
    beq        LAB_08072c74
    bl         A_PuffyBubble_CreateBubbleEffect
LAB_08072c74:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072c96
    ldr        r7,[r5,#Attack_param_6C]
    tst        r7,r7
    beq        LAB_08072c86
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_08072c86:
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    beq        LAB_08072c92
    ldrb       r0,[r5,#Attack_bc]
    tst        r0,r0
    beq        LAB_08072c92
LAB_08072c92:
    bl         Attack_Free
LAB_08072c96:
    pop        {pc}


_ts A_PuffyBubble_GetNextPanelTowardsPlayer
    push       {lr}
    mov        r3,#0x0
    LoadMain battle, r7, r7
    ldr        r7,[r7,#Battle_actorListPlayer]
    ldrb       r2,[r7,#0x18]
    ldrb       r3,[r7,#0x19]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    sub        r0,r0,r2
    bpl        LAB_08072cb0
    neg        r0,r0
LAB_08072cb0:
    sub        r1,r1,r3
    bpl        LAB_08072cb6
    neg        r1,r1
LAB_08072cb6:
    cmp        r0,r1
    bmi        LAB_08072cca
    ldrb       r0,[r5,#Attack_cPos_x]
    cmp        r0,r2
    bmi        LAB_08072cc4
    sub        r0,#0x1
    b          LAB_08072cc6
LAB_08072cc4:
    add        r0,#0x1
LAB_08072cc6:
    ldrb       r1,[r5,#Attack_cPos_y]
    b          LAB_08072cd8
LAB_08072cca:
    ldrb       r1,[r5,#Attack_cPos_y]
    cmp        r1,r3
    bmi        LAB_08072cd4
    sub        r1,#0x1
    b          LAB_08072cd6
LAB_08072cd4:
    add        r1,#0x1
LAB_08072cd6:
    ldrb       r0,[r5,#Attack_cPos_x]
LAB_08072cd8:
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x40
    lsl        r3,r3,#0x10
    tst        r2,r3
    beq        LAB_08072cee
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
LAB_08072cee:
    push       {r0,r1}
    ldr        r7,[r5,#Attack_param_64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    pop        {r0,r1}
    pop        {pc}


_ts Attack_PuffyBubble_Create
    push       {r5,lr}
    ldrb       r2,[r5,#Attack_owner]
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x21
    bl         Attack_Alloc
    pop        {r0,r1,r2,r3,r6,r7}
    tst        r5,r5
    beq        LAB_08072d30
    str        r6,[r5,#Attack_param_68]
    str        r5,[r3,#0x0]
    str        r3,[r5,#Attack_param_6C]
    strh       r7,[r5,#Attack_damage]
    strb       r2,[r5,#Attack_owner]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r2,#0x0
    str        r2,[r5,#Attack_pos_curr_z]
LAB_08072d30:
    add        r0,r5,#0x0
    pop        {r5,pc}


_ts A_PuffyBubble_CreateBubbleEffect
    push       {lr}
    mov        r2,#0x0
LAB_08072d38:
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldr        r7,PTR_CellPosition_ARRAY_08072d84
    add        r3,r2,r2
    add        r7,r7,r3
    mov        r3,#0x0
    ldrsb      r3,[r7,r3]
    add        r0,r0,r3
    mov        r3,#0x1
    ldrsh      r3,[r7,r3]
    add        r1,r1,r3
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    pop        {r0,r1}
    bne        LAB_08072d6e
    push       {r2,r5}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldrb       r4,[r5,#Attack_family_family]
    add        r4,#0xc
    bl         Effect_QuickEffect_Create
    pop        {r2,r5}
LAB_08072d6e:
    add        r2,#0x1
    cmp        r2,#0x9
    bmi        LAB_08072d38
    mov        r0,#0xae
    ldrb       r1,[r5,#Attack_family_family]
    tst        r1,r1
    beq        LAB_08072d7e
    mov        r0,#0xa9
LAB_08072d7e:
    bl         Sound_PlaySE
    pop        {pc}

PTR_CellPosition_ARRAY_08072d84:
    .word CellPosition_ARRAY_08072d88

CellPosition_ARRAY_08072d88:
    cell_pos -1, -1
    cell_pos 0, -1
    cell_pos 1, -1
    cell_pos -1, 0
    cell_pos 0, 0
    cell_pos 1, 0
    cell_pos -1, 1
    cell_pos 0, 1
    cell_pos 1, 1


_nt A_PuffyBubble_CheckPanelForTarget
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x10
    and        r0,r1
    pop        {pc}

    .align 2, 0

