#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_SnakeEgg
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_SnakeEgg_0_Init_080796a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_SnakeEgg_0_Init_0807969c:
    .word A_SnakeEgg_0_Init
    .word A_SnakeEgg_1_Main
    .word A_SnakeEgg_2_Free

PTR_PTR_A_SnakeEgg_0_Init_080796a8:
    .word PTR_A_SnakeEgg_0_Init_0807969c


_ts A_SnakeEgg_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    ldrb       r2,[r5,#Attack_family_family]
    lsr        r2,r2,#0x8
    bcs        LAB_080796ca
    mov        r1,#0xbf
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    b          LAB_080796d4
LAB_080796ca:
    mov        r1,#0xbe
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
LAB_080796d4:
    mov        r0,#0x0
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    bl         SpritePtr_SetPaletteIndex
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
    ldr        r7,ptrListAttackElement
    ldrb       r1,[r5,#Attack_family_family]
    lsl        r1,r1,#0x1d
    lsr        r1,r1,#0x1d
    ldrb       r0,[r7,r1]
    strb       r0,[r5,#Attack_element]
    mov        r0,#0x10
    strb       r0,[r5,#Attack_family_b3]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    ldr        r7,ptrListAttackAttr
    ldrb       r0,[r7,r1]
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_SnakeEgg_1_Main
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

ptrListAttackElement:
    .word listAttackElement

ptrListAttackAttr:
    .word listAttackAttr

listAttackElement:
    .byte EL_Wood
    .byte EL_Elec
    .byte EL_Fire

listAttackAttr:
    .byte PFI_Self_Extension
    .byte PFI_Self_Numbing
    .byte PFI_Self_Extension


_ts A_SnakeEgg_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807977a
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    b          LAB_0807978c
LAB_0807977a:
    bl         A_SnakeEgg_CheckDamage
    tst        r0,r0
    bne        LAB_0807978c
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_SnakeEgg_1_0_08079798
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0807978c:
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_SnakeEgg_1_0_08079798:
    .word PTR_A_SnakeEgg_1_0_0807979c

PTR_A_SnakeEgg_1_0_0807979c:
    .word A_SnakeEgg_1_0
    .word A_SnakeEgg_1_1


_ts A_SnakeEgg_1_0
    push       {lr}
    ldr        r0,[r5,#Attack_pos_curr_z]
    ldr        r1,[r5,#Attack_diff_z]
    sub        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_z]
    bgt        LAB_08079826
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0xaf
    bl         Sound_PlaySE
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Enable
    mov        r0,#0x1
    mov        r1,#0xbe
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x1
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    push       {r0}
    bl         SpritePtr_SetPaletteIndex
    pop        {r0}
    cmp        r0,#0x2
    bne        LAB_0807981e
    ldrb       r0,[r5,#Attack_element]
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
    mov        r6,#0x64
    bl         Effect_Tower_Create
    tst        r7,r7
    beq        LAB_0807981e
    push       {r5}
    add        r5,r7,#0x0
    bl         Effect_Tower
    pop        {r5}
LAB_0807981e:
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08079826:
    pop        {pc}


_ts A_SnakeEgg_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_SnakeEgg_1_1_0_08079838
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_SnakeEgg_1_1_0_08079838:
    .word PTR_A_SnakeEgg_1_1_0_0807983c

PTR_A_SnakeEgg_1_1_0_0807983c:
    .word A_SnakeEgg_1_1_0
    .word A_SnakeEgg_1_1_1


_ts A_SnakeEgg_1_1_0
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0807989c
    mov        r0,#0x0
    push       {r7}
    bl         FieldObject_UpdateField
    pop        {r7}
    bl         FUN_0807993a
    tst        r0,r0
    beq        LAB_0807989c
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r3,DAT_080798a4
    ldrb       r2,[r5,#Attack_cPos_x]
    sub        r2,r0,r2
    mul        r2,r3
    str        r2,[r5,#Attack_diff_x]
    ldr        r3,DAT_080798a8
    ldrb       r4,[r5,#Attack_cPos_y]
    sub        r4,r1,r4
    mul        r4,r3
    str        r4,[r5,#Attack_diff_y]
    tst        r2,r2
    beq        LAB_0807988e
    neg        r2,r2
    lsr        r0,r2,#0x1f
    LoadMain battle, r1, r1
    ldrb       r1,[r1,#Battle_sioOwnerId]
    eor        r0,r1
    bl         SpritePtr_SetFlipType
LAB_0807988e:
    mov        r0,#0x19
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Attack_state_s2]
    bl         A_SnakeEgg_1_1_1
    pop        {pc}
LAB_0807989c:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}

    .align 2, 0


DAT_080798a4:
    .word 0x19999

DAT_080798a8:
    .word 0xF5C2


_ts A_SnakeEgg_1_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080798dc
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    ldrb       r0,[r5,#Attack_family_b3]
    sub        r0,#0x1
    strb       r0,[r5,#Attack_family_b3]
    beq        LAB_080798f6
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    pop        {pc}
LAB_080798dc:
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
    pop        {pc}
LAB_080798f6:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}


_ts A_SnakeEgg_2_Free
    push       {lr}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x2b
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0807991e
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_0807991e:
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_0807992e
    ldr        r7,[r5,#Attack_param_68]
    tst        r7,r7
    beq        LAB_0807992e
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_0807992e:
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt FUN_0807993a
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x8
    mov        r7,sp
    ldr        r6,PTR_DAT_08079998
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    mov        r2,#0x0
    mov        r3,#0x6
LAB_08079950:
    push       {r0,r1,r2,r3,r6,r7}
    add        r7,r7,r2
    ldrsb      r4,[r6,r3]
    add        r0,r0,r4
    add        r3,#0x1
    ldrsb      r4,[r6,r3]
    add        r1,r1,r4
    strb       r0,[r7,#0x0]
    strb       r1,[r7,#0x1]
    bl         FUN_080799a4
    tst        r0,r0
    pop        {r0,r1,r2,r3,r6,r7}
    beq        LAB_0807996e
    add        r2,#0x2
LAB_0807996e:
    sub        r3,#0x2
    bpl        LAB_08079950
    lsr        r2,r2,#0x1
    beq        LAB_08079990
    push       {r2,r7}
    bl         Rng_RandomInt
    pop        {r2,r7}
    add        r1,r2,#0x0
    bl         SWI_DivMod
    lsl        r2,r0,#0x1
    ldrb       r0,[r7,r2]
    add        r2,#0x1
    ldrb       r1,[r7,r2]
    add        sp,#0x8
    pop        {pc}
LAB_08079990:
    add        sp,#0x8
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_DAT_08079998:
    .word DAT_0807999c

DAT_0807999c:
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte -1

DAT_080799a0:
    .byte 0x01

DAT_080799a1:
    .byte 0x00

DAT_080799a2:
    .byte 0xFF

DAT_080799a3:
    .byte 0x00


_ts FUN_080799a4
    push       {lr}
    bl         FieldObject_GetPanelFlags
    ldrb       r2,[r5,#Attack_owner]
    lsl        r2,r2,#0x2
    ldr        r7,PTR_PanelFlag_080799cc
    ldr        r1,[r7,r2]
    tst        r0,r1
    bne        LAB_080799c4
    ldr        r7,PTR_PanelFlag_080799c8
    ldr        r1,[r7,r2]
    and        r0,r1
    cmp        r0,r1
    bne        LAB_080799c4
    mov        r0,#0x1
    pop        {pc}
LAB_080799c4:
    mov        r0,#0x0
    pop        {pc}

PTR_PanelFlag_080799c8:
    .word PanelFlag_080799d0

PTR_PanelFlag_080799cc:
    .word PanelFlag_080799d8

PanelFlag_080799d0:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_Walkable

PanelFlag_080799d8:
    .word PF_Solid
    .word PF_EnemyTerritory | PF_Solid


_ts A_SnakeEgg_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    bne        LAB_08079a26
    ldr        r7,[r5,#Attack_param_64]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_08079a3a
    FieldObject_GetDamage PFI_Target_Object, Attack_param_64
    tst        r0,r0
    beq        LAB_08079a3a
    push       {r1,r7}
    ldr        r7,PTR_PanelFlag_ARRAY_08079a40
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r1,r7}
    bne        LAB_08079a26
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08079a3a
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08079a34
LAB_08079a26:
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_08079a34:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08079a3a:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_08079a40:
    .word PanelFlag_ARRAY_08079a44

PanelFlag_ARRAY_08079a44:
    .word PF_EnemyOccupied | PF_Solid | PF_Break
    .word PF_PlayerOccupied | PF_Solid | PF_Break


_ts Attack_SnakeEgg_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x4e
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    beq        LAB_08079a6c
    str        r0,[r4,#0x68]
    tst        r0,r0
    beq        LAB_08079a64
    str        r4,[r0,#0x0]
LAB_08079a64:
    strb       r7,[r4,#0x16]
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
    strh       r6,[r4,#0x24]
LAB_08079a6c:
    pop        {pc}

    .align 2, 0

