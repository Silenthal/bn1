#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Remobit_Chip
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_RemobitC_0_Init_08076fc8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_RemobitC_0_Init_08076fbc:
    .word A_RemobitC_0_Init
    .word A_RemobitC_1_Main
    .word A_RemobitC_2_Free

PTR_PTR_A_RemobitC_0_Init_08076fc8:
    .word PTR_A_RemobitC_0_Init_08076fbc


_ts A_RemobitC_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x4b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x4
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0xa0
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x0
    str        r0,[r5,#Attack_param_5C]
    str        r0,[r5,#Attack_param_68]
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_diff_z]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    mov        r0,#0xa
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    FieldObject_Create PFI_Self_Extension_Moving, Attack_param_60
    ldr        r0,[r5,#Attack_param_60]
    mov        r1,#0xa
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    ldr        r0,DAT_08077050
    strh       r0,[r5,#Attack_counterB]
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_RemobitC_1_Main
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

DAT_08077050:
    .word 0xBB8


_ts A_RemobitC_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         A_RemobitC_CheckDamage
    tst        r0,r0
    bne        LAB_08077072
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_RemobitC_1_0_08077078
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08077072:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_RemobitC_1_0_08077078:
    .word PTR_A_RemobitC_1_0_0807707c

PTR_A_RemobitC_1_0_0807707c:
    .word A_RemobitC_1_0
    .word A_RemobitC_1_1


_ts A_RemobitC_1_0
    push       {lr}
    ldr        r0,[r5,#Attack_pos_curr_z]
    ldr        r1,[r5,#Attack_diff_z]
    sub        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_z]
    bgt        LAB_08077108
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080770be
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_080770be:
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x28
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    lsl        r0,r0,#0x7
    orr        r4,r0
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#Attack_param_68]
    ldrb       r4,[r5,#Attack_family_family]
    ldr        r3,PTR_DAT_0807710c
    lsl        r2,r4,#0x2
    ldr        r3,[r3,r2]
    ldrh       r6,[r5,#Attack_damage]
    bl         Attack_Remobit_Create
    str        r0,[r5,#Attack_param_5C]
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08077108:
    pop        {pc}

    .align 2, 0


PTR_DAT_0807710c:
    .word DAT_08077110

DAT_08077110:
    .byte 0xCC
    .byte 0x4C
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x00
    .byte 0x00
    .byte 0x33
    .byte 0xB3

    .align 2, 0



_ts A_RemobitC_1_1
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_08077128
    pop        {pc}
LAB_08077128:
    ldr        r7,[r5,#Attack_param_5C]
    tst        r7,r7
    beq        LAB_0807713a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0x0
    str        r0,[r5,#Attack_param_5C]
LAB_0807713a:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}


_ts A_RemobitC_2_Free
    push       {lr}
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_08077168
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_08077168:
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08077174
    mov        r0,#0x0
    ldr        r7,[r5,#Attack_param_64]
    str        r0,[r7,#0x0]
LAB_08077174:
    ldr        r7,[r5,#Attack_param_68]
    tst        r7,r7
    beq        LAB_08077184
    push       {r5}
    add        r5,r7,#0x0
    bl         Effect_Free
    pop        {r5}
LAB_08077184:
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_RemobitC_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_080771e4
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_08077204
    bl         Battle_IsInputLocked
    bne        LAB_080771e4
    ldrh       r0,[r5,#Attack_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    bls        LAB_080771e4
    FieldObject_GetDamage PFI_Target_Object, Attack_param_60
    tst        r0,r0
    beq        LAB_08077204
    push       {r1,r7}
    ldr        r7,PTR_PanelFlag_ARRAY_08077208
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r1,r7}
    bne        LAB_080771e4
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08077204
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08077204
LAB_080771e4:
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    ldr        r7,[r5,#Attack_param_5C]
    tst        r7,r7
    beq        LAB_080771fc
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0x0
    str        r0,[r5,#Attack_param_5C]
LAB_080771fc:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_08077204:
    mov        r0,#0x0
    pop        {pc}

PTR_PanelFlag_ARRAY_08077208:
    .word PanelFlag_ARRAY_0807720c

PanelFlag_ARRAY_0807720c:
    .word PF_EnemyOccupied | PF_Solid | PF_Break
    .word PF_PlayerOccupied | PF_Solid | PF_Break


_ts Attack_Remobit_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x3e
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    beq        LAB_08077230
    str        r0,[r4,#0x64]
    str        r4,[r0,#0x0]
    strb       r7,[r4,#0x16]
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
    strh       r6,[r4,#0x24]
LAB_08077230:
    pop        {pc}

    .align 2, 0

