#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Anubis
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Anubis_0_Init_08076910
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Anubis_0_Init_08076904:
    .word A_Anubis_0_Init
    .word A_Anubis_1_Main
    .word A_Anubis_2_Free

PTR_PTR_A_Anubis_0_Init_08076910:
    .word PTR_A_Anubis_0_Init_08076904


_ts A_Anubis_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xb1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0xa0
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_diff_z]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    mov        r0,#0x64
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    FieldObject_Create 0x1c, 0x60
    ldr        r0,[r5,#Attack_param_60]
    mov        r1,#0xa
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    ldr        r0,DAT_0807698c
    strh       r0,[r5,#Attack_counterB]
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_Anubis_1_Main
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


DAT_0807698c:
    .word 0xBB8


_ts A_Anubis_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         A_Anubis_CheckDamage
    tst        r0,r0
    bne        LAB_080769ae
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Anubis_1_0_Drop_080769b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_080769ae:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_Anubis_1_0_Drop_080769b4:
    .word PTR_A_Anubis_1_0_Drop_080769b8

PTR_A_Anubis_1_0_Drop_080769b8:
    .word A_Anubis_1_0_Drop
    .word A_Anubis_1_1_ApplyPoison


_ts A_Anubis_1_0_Drop
    push       {lr}
    ldr        r0,[r5,#Attack_pos_curr_z]
    ldr        r1,[r5,#Attack_diff_z]
    sub        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_z]
    bgt        LAB_08076a16
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080769f6
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_080769f6:
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076a16:
    pop        {pc}


_ts A_Anubis_1_1_ApplyPoison
    push       {lr}
    mov        r0,#0x1c
    add        r0,r0,r5
    ldrb       r1,[r5,#Attack_owner]
    bl         Routine_SetPoisonDrain
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_08076a74
    ldrh       r0,[r5,#Attack_counterA]
    cmp        r0,#0x10
    bne        LAB_08076a74
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterA]
    sub        sp,#0x14
    mov        r0,sp
    ldrb       r3,[r5,#Attack_owner]
    lsl        r1,r3,#0x3
    ldr        r6,PTR_listAnubisFilters_08076a78
    add        r6,r6,r1
    ldr        r1,[r6,#0x0]
    ldr        r2,[r6,#0x4]
    push       {r0}
    bl         Field_SearchWithOwner
    pop        {r0}
    tst        r1,r1
    beq        LAB_08076a72
    add        r2,r1,#0x0
    push       {r0}
    bl         ArrayShuffle
    pop        {r0}
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x1
    bl         Effect_PoisonCloud_Create
LAB_08076a72:
    add        sp,#0x14
LAB_08076a74:
    pop        {pc}

    .align 2, 0


PTR_listAnubisFilters_08076a78:
    .word listAnubisFilters

listAnubisFilters:
    .word PF_Walkable | PF_EnemyTerritory
    .word 0
    .word PF_Walkable
    .word PF_EnemyTerritory


_ts A_Anubis_2_Free
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
    beq        LAB_08076ab4
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_08076ab4:
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08076ac4
    ldr        r7,[r5,#Attack_param_64]
    tst        r7,r7
    beq        LAB_08076ac4
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_08076ac4:
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_Anubis_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08076b24
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_08076b3e
    bl         Battle_IsInputLocked
    bne        LAB_08076b24
    ldrh       r0,[r5,#Attack_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    bls        LAB_08076b24
    mov        r0,#0xa
    ldr        r1,[r5,#Attack_param_60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08076b3e
    push       {r1,r7}
    ldr        r7,PTR_PanelFlag_ARRAY_08076b44
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r1,r7}
    bne        LAB_08076b24
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08076b3e
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08076b38
LAB_08076b24:
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_08076b38:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08076b3e:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_08076b44:
    .word PanelFlag_ARRAY_08076b48

PanelFlag_ARRAY_08076b48:
    .word PF_EnemyOccupied | PF_Solid | PF_Break
    .word PF_PlayerOccupied | PF_Solid | PF_Break


_ts Attack_Anubis_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x3b
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    beq        LAB_08076b70
    str        r0,[r4,#0x64]
    tst        r0,r0
    beq        LAB_08076b68
    str        r4,[r0,#0x0]
LAB_08076b68:
    strb       r7,[r4,#0x16]
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
    strh       r6,[r4,#0x24]
LAB_08076b70:
    pop        {pc}

    .align 2, 0

