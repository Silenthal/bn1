#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BodyBurn
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_BodyBurn_0_Init_08077250
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_BodyBurn_0_Init_08077244:
    .word A_BodyBurn_0_Init
    .word A_BodyBurn_1_Main
    .word A_BodyBurn_2_Free

PTR_PTR_A_BodyBurn_0_Init_08077250:
    .word PTR_A_BodyBurn_0_Init_08077244


_ts A_BodyBurn_0_Init
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080772c6
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x76
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
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x2
    strb       r0,[r5,#Attack_element]
    FieldObject_Create 0x3, Attack_param_6C
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_BodyBurn_1_Main
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_080772c6:
    bl         Attack_Free
    pop        {pc}


_ts A_BodyBurn_1_Main
    push       {lr}
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         A_BodyBurn_CheckDamage
    tst        r0,r0
    bne        LAB_080772ec
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_BodyBurn_1_0_080772f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_080772ec:
    bl         UpdateSpriteFrameIndex
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_UpdateCellPosition
    pop        {pc}

PTR_PTR_A_BodyBurn_1_0_080772f8:
    .word PTR_A_BodyBurn_1_0_080772fc

PTR_A_BodyBurn_1_0_080772fc:
    .word A_BodyBurn_1_0
    .word A_BodyBurn_1_1
    .word A_BodyBurn_1_2


_ts A_BodyBurn_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08077338
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807733a
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08077338:
    pop        {pc}
LAB_0807733a:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}


_ts A_BodyBurn_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08077356
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08077356:
    pop        {pc}


_ts A_BodyBurn_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08077368
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08077368:
    pop        {pc}


_nt A_BodyBurn_2_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_BodyBurn_CheckDamage
    push       {lr}
    ldr        r7,[r5,#Attack_param_6C]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_080773a4
    mov        r0,#0x2
    ldr        r1,[r5,#Attack_param_6C]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_080773a4
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x19
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    bl         Field_CreateStrikeEffect
    mov        r0,#0x1
    pop        {pc}
LAB_080773a4:
    mov        r0,#0x0
    pop        {pc}


_ts Attack_BodyBurn_Create
    push       {lr}
    push       {r0,r1,r5,r6}
    mov        r0,#0x3f
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5,r6}
    beq        LAB_080773c2
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
LAB_080773c2:
    pop        {pc}
