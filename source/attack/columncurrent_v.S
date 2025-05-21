#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_ColumnCurrentV
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_ColumnCurrentV_0_08075614
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_ColumnCurrentV_0_08075608:
    .word A_ColumnCurrentV_0
    .word A_ColumnCurrentV_1
    .word A_ColumnCurrentV_2

PTR_PTR_A_ColumnCurrentV_0_08075614:
    .word PTR_A_ColumnCurrentV_0_08075608


_ts A_ColumnCurrentV_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xa9
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x1
    strb       r0,[r5,#Attack_element]
    mov        r0,#0x32
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    FieldObject_Create PFI_Self_Extension_Moving, Attack_param_60
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_ColumnCurrentV_1
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts A_ColumnCurrentV_1
    push       {lr}
    bl         SpritePtr_DisableFlash
    bl         A_ColumnCurrentV_CheckDamage
    tst        r0,r0
    bne        LAB_08075688
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_ColumnCurrentV_1_0_08075690
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08075688:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_ColumnCurrentV_1_0_08075690:
    .word PTR_A_ColumnCurrentV_1_0_08075694

PTR_A_ColumnCurrentV_1_0_08075694:
    .word A_ColumnCurrentV_1_0
    .word A_ColumnCurrentV_1_1
    .word A_ColumnCurrentV_1_2


_ts A_ColumnCurrentV_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080756be
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_080756be:
    pop        {pc}


_ts A_ColumnCurrentV_1_1
    push       {lr}
    bl         A_ColumnCurrentV_CheckBattleFlag
    beq        LAB_080756d4
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_080756d4:
    pop        {pc}


_nt A_ColumnCurrentV_1_2
    push       {lr}
    bl         A_ColumnCurrentV_CheckBattleFlag
    bne        LAB_080756ea
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_080756ea:
    pop        {pc}


_ts A_ColumnCurrentV_2
    push       {lr}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_ColumnCurrentV_CheckDamage
    push       {lr}
    mov        r0,#0x3
    bl         Battle_GetBattleFlagCurrent
    bne        LAB_0807573e
    FieldObject_GetDamage PFI_Target_Object, Attack_param_60
    tst        r0,r0
    beq        LAB_0807575e
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0807575e
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08075758
LAB_0807573e:
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r0,#0x3
    bl         Battle_SetBattleFlag
    mov        r0,#0x1
    pop        {pc}
LAB_08075758:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0807575e:
    mov        r0,#0x0
    pop        {pc}


_nt A_ColumnCurrentV_CheckBattleFlag
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    ldr        r7,PTR_DAT_08075770
    ldrb       r0,[r7,r0]
    bl         Battle_GetBattleFlagMulti
    pop        {pc}

PTR_DAT_08075770:
    .word DAT_08075774

DAT_08075774:
    .byte 0x02
    .byte 0x06
    .byte 0x04


_ts Attack_ColumnCurrentV_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x34
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08075794
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_08075794:
    pop        {pc}

    .align 2, 0

