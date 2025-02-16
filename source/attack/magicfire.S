#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_08074858:
    .byte 0xA0
    .byte 0x00
    .byte 0x0F
    .byte 0x00
    .byte 0xA0
    .byte 0x01
    .byte 0x0F

    .align 2, 0



_ts Attack_MagicFire
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_MagicFire_0_Init_08074880
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_MagicFire_0_Init_08074870:
    .word A_MagicFire_0_Init
    .word A_MagicFire_1_Main
    .word A_MagicFire_2_AfterHit
    .word A_MagicFire_3_Free

PTR_PTR_A_MagicFire_0_Init_08074880:
    .word PTR_A_MagicFire_0_Init_08074870


_ts A_MagicFire_0_Init
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08074916
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_08074916
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,PTR_DAT_0807491c
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    str        r7,[r5,#Attack_param_60]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_pos_curr_z]
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r1,[r7,#0x0]
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r0,[r7,#0x1]
    bl         SpritePtr_SetPaletteIndex
    ldr        r7,[r5,#Attack_param_60]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#Attack_counterA]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x2
    strb       r0,[r5,#Attack_element]
    mov        r0,#0x3
    mov        r3,#0x64
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_MagicFire_1_Main
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_08074916:
    bl         Attack_Free
    pop        {pc}

PTR_DAT_0807491c:
    .word DAT_08074858


_ts A_MagicFire_1_Main
    push       {lr}
    bl         A_MagicFire_IsHit
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_MagicFire_1_0_StartAnim_08074938
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_MagicFire_1_0_StartAnim_08074938:
    .word PTR_A_MagicFire_1_0_StartAnim_0807493c

PTR_A_MagicFire_1_0_StartAnim_0807493c:
    .word A_MagicFire_1_0_StartAnim
    .word A_MagicFire_1_1_CheckPanel
    .word A_MagicFire_1_2_CreateNext
    .word A_MagicFire_1_3_Next


_ts A_MagicFire_2_AfterHit
    push       {lr}
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_MagicFire_1_0_StartAnim_08074964
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_MagicFire_1_0_StartAnim_08074964:
    .word PTR_A_MagicFire_1_0_StartAnim_0807493c


_ts A_MagicFire_1_0_StartAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807497c
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
LAB_0807497c:
    pop        {pc}


_nt A_MagicFire_1_1_CheckPanel
    push       {lr}
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_08074996
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08074994
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
LAB_08074994:
    pop        {pc}
LAB_08074996:
    mov        r0,#0xc
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}


_ts A_MagicFire_1_2_CreateNext
    push       {lr}
    ldrb       r1,[r5,#Attack_cPos_x]
    ldrb       r2,[r5,#Attack_cPos_y]
    mov        r3,#0x0
    ldr        r0,[r5,#Attack_diff_x]
    add        r1,r1,r0
    ldrb       r4,[r5,#Attack_family_family]
    ldrh       r6,[r5,#Attack_damage]
    bl         Attack_MagicFire_Create
    tst        r7,r7
    beq        LAB_080749c4
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
    b          LAB_080749c4
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
    pop        {pc}
LAB_080749c4:
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
    pop        {pc}


_nt A_MagicFire_1_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080749da
    mov        r0,#0xc
    str        r0,[r5,#Attack_state_s0]
LAB_080749da:
    pop        {pc}


_ts A_MagicFire_3_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_MagicFire_IsHit
    push       {lr}
    mov        r0,#0x2
    ldr        r1,[r5,#Attack_param_64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08074a14
    mov        r0,#0x19
    ldr        r3,[r5,#Attack_pos_curr_z]
    bl         Field_CreateStrikeEffect
    ldr        r7,[r5,#Attack_param_64]
    mov        r0,#0x2
    lsl        r0,r0,#0x8
    ldr        r1,[r7,#0xc]
    orr        r0,r1
    str        r0,[r7,#0xc]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_08074a14:
    mov        r0,#0x0
    pop        {pc}


_ts Attack_MagicFire_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x2e
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08074a34
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_08074a34:
    pop        {pc}

    .align 2, 0

