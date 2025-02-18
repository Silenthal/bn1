#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_FireArm
    push       {lr}
    ldr        r7,PTR_PTR_A_FireArm_0_Init_08070fcc
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FireArm_0_Init_08070fcc:
    .word PTR_A_FireArm_0_Init_08070fd0

PTR_A_FireArm_0_Init_08070fd0:
    .word A_FireArm_0_Init
    .word A_FireArm_1_Main
    .word A_FireArm_2_Free


_ts A_FireArm_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x77
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    str        r0,[r5,#Attack_param_64]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         Field_GetAttackDirectionOffset_MP
    strb       r0,[r5,#Attack_family_b1]
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Attack_cPos_x]
    mov        r3,#0x5
    ldrsb      r1,[r5,r3]
    add        r0,r0,r1
    strb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r2,#0x1e
    lsl        r2,r2,#0x10
    str        r2,[r5,#Attack_pos_curr_z]
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_0807109c
    ldr        r7,PTR_DAT_080710a8
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    str        r7,[r5,#Attack_param_60]
    tst        r0,r0
    beq        LAB_0807105e
    FieldObject_Create PFI_Self_Grounded, Attack_param_68
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_FireArm_1_Main
    ldr        r0,[r5,#Attack_param_68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_0807105e:
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x18
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_08071092
    ldrb       r0,[r5,#Attack_element]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x1
    mov        r6,#0x0
    lsl        r6,r6,#0x18
    orr        r4,r6
    mov        r6,#0x1
    lsl        r6,r6,#0x10
    orr        r4,r6
    ldrh       r6,[r5,#Attack_damage]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
LAB_08071092:
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_FireArm_1_Main
    pop        {pc}
LAB_0807109c:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


PTR_DAT_080710a8:
    .word DAT_080710ac

DAT_080710ac:
    .byte 0x19
    .byte 0x00
    .byte -1
    .byte 0x00
    .byte 0x19
    .byte 0x00
    .byte -1

    .align 2, 0



_ts A_FireArm_1_Main
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_FireArm_1_0_080710d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    beq        LAB_080710d0
    ldr        r0,[r5,#Attack_param_68]
    bl         FieldObject_UpdateCellPosition
LAB_080710d0:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FireArm_1_0_080710d4:
    .word PTR_A_FireArm_1_0_080710d8

PTR_A_FireArm_1_0_080710d8:
    .word A_FireArm_1_0
    .word A_FireArm_1_1
    .word A_FireArm_1_2


_ts A_FireArm_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08071124
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldr        r4,[r5,#Attack_family_family]
    ldrb       r2,[r5,#Attack_element]
    ldrh       r6,[r5,#Attack_damage]
    bl         Attack_FireArm_Create
    str        r7,[r5,#Attack_param_64]
    tst        r7,r7
    beq        LAB_08071110
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08071110:
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r3,#0x60
    ldr        r7,[r5,r3]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08071124:
    pop        {pc}


_nt A_FireArm_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b2]
    tst        r0,r0
    bne        LAB_08071136
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08071124
LAB_08071136:
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    pop        {pc}


_ts A_FireArm_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08071166
    ldr        r7,[r5,#Attack_param_64]
    tst        r7,r7
    beq        LAB_08071156
    mov        r0,#0x1
    strb       r0,[r7,#0x6]
LAB_08071156:
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    beq        LAB_08071162
    ldr        r0,[r5,#Attack_param_68]
    bl         FieldObject_Free
LAB_08071162:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08071166:
    pop        {pc}


_ts A_FireArm_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_FireArm_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x11
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0807118e
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
    strb       r2,[r7,#0x1a]
    strh       r6,[r7,#0x24]
LAB_0807118e:
    pop        {pc}
