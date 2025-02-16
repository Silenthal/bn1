#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


EP_68_A_Candle_Param0_ARRAY_08076b74:
    .byte 0x14, 0x1E
    .byte 0x32, 0x0C
    .byte 0x0A, 0x08


_nt Attack_Candle
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Candle_0_Init_08076b94
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_Candle_0_Init_08076b88:
    .word A_Candle_0_Init
    .word A_Candle_1_Main
    .word A_Candle_2_Free

PTR_PTR_A_Candle_0_Init_08076b94:
    .word PTR_A_Candle_0_Init_08076b88


_ts A_Candle_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xad
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x19
    lsr        r0,r0,#0x19
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x19
    lsr        r0,r0,#0x18
    ldr        r7,PTR_EP_68_A_Candle_Param0_ARRAY_08076c1c
    add        r7,r7,r0
    str        r7,[r5,#Attack_param_68]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    mov        r0,#0xa
    strh       r0,[r5,#Attack_damage]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    mov        r0,#0x4
    strh       r0,[r5,#Attack_counterA]
    FieldObject_Create 0x1c, 0x60
    ldr        r0,[r5,#Attack_param_60]
    mov        r1,#0xa
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    ldr        r0,DAT_08076c20
    strh       r0,[r5,#Attack_counterB]
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_Candle_1_Main
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_EP_68_A_Candle_Param0_ARRAY_08076c1c:
    .word EP_68_A_Candle_Param0_ARRAY_08076b74

DAT_08076c20:
    .word 0xBB8


_ts A_Candle_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08076c4a
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    b          LAB_08076c5c
LAB_08076c4a:
    bl         A_Candle_CheckDamage
    tst        r0,r0
    bne        LAB_08076c5c
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Candle_1_0_CheckPlacement_08076c64
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08076c5c:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Candle_1_0_CheckPlacement_08076c64:
    .word PTR_A_Candle_1_0_CheckPlacement_08076c68

PTR_A_Candle_1_0_CheckPlacement_08076c68:
    .word A_Candle_1_0_CheckPlacement
    .word A_Candle_1_1_AddHP


_ts A_Candle_1_0_CheckPlacement
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08076cb0
    ldr        r7,[r5,#Attack_param_68]
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08076c9a
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_08076c9a:
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076cb0:
    pop        {pc}


_nt A_Candle_1_1_AddHP
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08076ce8
    ldr        r7,[r5,#Attack_param_68]
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#Attack_counterA]
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_08076cea
    ldr        r7,[r5,#Attack_param_6C]
    ldrh       r0,[r7,#0x20]
    tst        r0,r0
    beq        LAB_08076cea
    ldrh       r1,[r7,#0x22]
    cmp        r0,r1
    beq        LAB_08076cea
    mov        r0,#0x1
    push       {r5}
    ldr        r5,[r5,#Attack_param_6C]
    bl         FieldObject_AddHp
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
LAB_08076ce8:
    pop        {pc}
LAB_08076cea:
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    pop        {pc}


_ts A_Candle_2_Free
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
    beq        LAB_08076d18
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_08076d18:
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08076d28
    mov        r0,#0x0
    ldr        r7,[r5,#Attack_param_64]
    tst        r7,r7
    beq        LAB_08076d28
    str        r0,[r7,#0x0]
LAB_08076d28:
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_Candle_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08076d8e
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_08076da8
    bl         Battle_IsInputLocked
    bne        LAB_08076d8e
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x19
    bcs        LAB_08076d5a
    ldrh       r0,[r5,#Attack_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    bls        LAB_08076d8e
LAB_08076d5a:
    mov        r0,#0xa
    ldr        r1,[r5,#Attack_param_60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08076da8
    push       {r1,r7}
    ldr        r7,PTR_PanelFlag_ARRAY_08076dac
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r1,r7}
    bne        LAB_08076d8e
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08076da8
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08076da2
LAB_08076d8e:
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_08076da2:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08076da8:
    mov        r0,#0x0
    pop        {pc}

PTR_PanelFlag_ARRAY_08076dac:
    .word PanelFlag_ARRAY_08076db0

PanelFlag_ARRAY_08076db0:
    .word PF_EnemyOccupied | PF_Solid | PF_Break
    .word PF_PlayerOccupied | PF_Solid | PF_Break


_ts Attack_Candle_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x3c
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_08076dd4
    str        r0,[r4,#0x64]
    str        r4,[r0,#0x0]
    str        r5,[r4,#0x6c]
    strb       r6,[r4,#0x16]
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
LAB_08076dd4:
    pop        {pc}

    .align 2, 0

