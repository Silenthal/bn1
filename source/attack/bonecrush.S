#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


BYTE_ARRAY_ARRAY_08074a38:
    .byte 0xA1
    .byte 0x00
    .byte 0x78
    .byte 0x00
    .byte 0xA1
    .byte 0x00
    .byte 0x64
    .byte 0x00
    .byte 0xA1
    .byte 0x00
    .byte 0x50
    .byte 0x00


_ts Attack_BoneCrush
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_BoneCrush_0_Init_08074a60
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_BoneCrush_0_Init_08074a54:
    .word A_BoneCrush_0_Init
    .word A_BoneCrush_1_Main
    .word A_BoneCrush_2_Free

PTR_PTR_A_BoneCrush_0_Init_08074a60:
    .word PTR_A_BoneCrush_0_Init_08074a54


_ts A_BoneCrush_0_Init
    push       {lr}
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_08074af8
    ldr        r7,PTR_BYTE_ARRAY_ARRAY_08074b00
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    str        r7,[r5,#Attack_param_60]
    bl         Field_IsEntityCellPositionValid
    beq        LAB_08074af8
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r1,[r7,#0x0]
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldr        r7,[r5,#Attack_param_60]
    ldrh       r0,[r7,#0x2]
    ldrb       r1,[r5,#Attack_family_b1]
    tst        r1,r1
    beq        LAB_08074ac8
    add        r2,r0,#0x0
    lsr        r2,r1
    add        r2,#0x14
    add        r0,r0,r2
LAB_08074ac8:
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_family_b1]
    mov        r0,#0x3c
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    FieldObject_Create PFI_Self_BreakingChaser, Attack_param_64
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_BoneCrush_1_Main
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_08074af8:
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


PTR_BYTE_ARRAY_ARRAY_08074b00:
    .word BYTE_ARRAY_ARRAY_08074a38


_ts A_BoneCrush_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08074b24
    bl         SpritePtr_DisableShadow
    b          LAB_08074b28
LAB_08074b24:
    bl         SpritePtr_EnableShadow
LAB_08074b28:
    bl         A_BoneCrush_CheckDamage
    tst        r0,r0
    bne        LAB_08074b3a
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_BoneCrush_1_0_Wait_08074b48
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08074b3a:
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BoneCrush_1_0_Wait_08074b48:
    .word PTR_A_BoneCrush_1_0_Wait_08074b4c

PTR_A_BoneCrush_1_0_Wait_08074b4c:
    .word A_BoneCrush_1_0_Wait
    .word A_BoneCrush_1_1_Move


_ts A_BoneCrush_1_0_Wait
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08074b66
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08074b66:
    pop        {pc}


_ts A_BoneCrush_1_1_Move
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_BoneCrush_1_1_0_CheckMove_08074b78
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BoneCrush_1_1_0_CheckMove_08074b78:
    .word PTR_A_BoneCrush_1_1_0_CheckMove_08074b7c

PTR_A_BoneCrush_1_1_0_CheckMove_08074b7c:
    .word A_BoneCrush_1_1_0_CheckMove
    .word A_BoneCrush_1_1_1_Move


_ts A_BoneCrush_1_1_0_CheckMove
    push       {lr}
    mov        r0,#0x0
    str        r0,[r5,#Attack_diff_x]
    str        r0,[r5,#Attack_diff_y]
    bl         A_BoneCrush_GetNextMove
    cmp        r0,#0xff
    beq        LAB_08074ba2
    tst        r0,r0
    bne        LAB_08074b9e
    bl         A_BoneCrush_MoveX
    b          LAB_08074ba2
LAB_08074b9e:
    bl         A_BoneCrush_MoveY
LAB_08074ba2:
    mov        r0,#0x14
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Attack_state_s2]
    pop        {pc}


_ts A_BoneCrush_1_1_1_Move
    push       {lr}
    ldr        r0,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_diff_x]
    add        r0,r0,r2
    str        r0,[r5,#Attack_pos_curr_x]
    ldr        r1,[r5,#Attack_pos_curr_y]
    ldr        r2,[r5,#Attack_diff_y]
    add        r1,r1,r2
    str        r1,[r5,#Attack_pos_curr_y]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08074bdc
    ldr        r7,[r5,#Attack_param_60]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08074bdc:
    pop        {pc}


_nt A_BoneCrush_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08074bea
    ldr        r7,[r5,#Attack_param_68]
    str        r0,[r7,#0x0]
LAB_08074bea:
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    ldr        r1,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_pos_curr_y]
    mov        r3,#0x0
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    bl         Attack_Free
    pop        {pc}


_ts A_BoneCrush_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08074c52
    FieldObject_GetDamage PFI_Target_Extension, Attack_param_64
    tst        r0,r0
    beq        LAB_08074c60
    mov        r1,#0x10
    tst        r0,r1
    beq        LAB_08074c34
    mov        r0,#0x0
    strh       r0,[r5,#Attack_hpCurrent]
    mov        r0,#0x1
    ldr        r3,[r5,#Attack_pos_curr_z]
    bl         Field_CreateBusterEffect
    b          LAB_08074c42
LAB_08074c34:
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08074c60
    bl         Field_SubtractHP
LAB_08074c42:
    mov        r0,#0x6f
    bl         Sound_PlaySE
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08074c60
LAB_08074c52:
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_08074c60:
    mov        r0,#0x0
    pop        {pc}


_ts A_BoneCrush_GetNextMove
    @@ -1 = Collision
    @@ 0 = Move forward
    @@ 1 = Move up
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r2,[r7,#0x18]
    sub        r0,r2,r0
    ldrb       r3,[r7,#0x19]
    sub        r1,r3,r1
    bne        LAB_08074c82
    tst        r0,r0
    bne        LAB_08074c82
    mov        r0,#0xff
    pop        {pc}
LAB_08074c82:
    tst        r0,r0
    bpl        LAB_08074c88
    neg        r0,r0
LAB_08074c88:
    tst        r1,r1
    bpl        LAB_08074c8e
    neg        r1,r1
LAB_08074c8e:
    cmp        r0,r1
    bmi        LAB_08074c96
    mov        r0,#0x0
    pop        {pc}
LAB_08074c96:
    mov        r0,#0x1
    pop        {pc}


_nt A_BoneCrush_MoveX
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r2,[r7,#0x18]
    sub        r0,r2,r0
    beq        LAB_08074cd6
    asr        r0,r0,#0x1f
    lsl        r0,r0,#0x1
    add        r0,#0x1
    push       {r0}
    ldrb       r1,[r5,#Attack_cPos_x]
    add        r0,r0,r1
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x40
    lsl        r1,r1,#0x10
    tst        r0,r1
    pop        {r0}
    bne        LAB_08074cce
    ldr        r1,DAT_08074cd8
    mul        r0,r1
    str        r0,[r5,#Attack_diff_x]
    pop        {pc}
LAB_08074cce:
    bl         A_BoneCrush_MoveY
    tst        r0,r0
    bne        LAB_08074cd6
LAB_08074cd6:
    pop        {pc}

DAT_08074cd8:
    .word 0x20000


_ts A_BoneCrush_MoveY
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_y]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r2,[r7,#0x19]
    sub        r0,r2,r0
    beq        LAB_08074d18
    asr        r0,r0,#0x1f
    lsl        r0,r0,#0x1
    add        r0,#0x1
    push       {r0}
    ldrb       r1,[r5,#Attack_cPos_y]
    add        r1,r1,r0
    ldrb       r0,[r5,#Attack_cPos_x]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x40
    lsl        r1,r1,#0x10
    tst        r0,r1
    pop        {r0}
    bne        LAB_08074d10
    ldr        r1,DAT_08074d1c
    mul        r0,r1
    str        r0,[r5,#Attack_diff_y]
    pop        {pc}
LAB_08074d10:
    bl         A_BoneCrush_MoveX
    tst        r0,r0
    bne        LAB_08074d18
LAB_08074d18:
    pop        {pc}

    .align 2, 0


DAT_08074d1c:
    .word 0x13333


_ts Attack_BoneCrush_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x2f
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    str        r7,[r0,#0x0]
    tst        r7,r7
    beq        LAB_08074d40
    str        r0,[r7,#0x68]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_08074d40:
    pop        {pc}

    .align 2, 0

