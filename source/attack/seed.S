#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Seed
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Seed_0_Init_08071da0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Seed_0_Init_08071da0:
    .word PTR_A_Seed_0_Init_08071da4

PTR_A_Seed_0_Init_08071da4:
    .word A_Seed_0_Init
    .word A_Seed_1_Main
    .word A_Seed_2_Free


_ts A_Seed_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x87
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0xff
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         FieldObject_Alloc
    str        r0,[r5,#Attack_param_60]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#Attack_family_family]
    cmp        r0,#0x2
    bne        LAB_08071dec
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
LAB_08071dec:
    bl         A_Seed_1_Main
    pop        {pc}


_nt A_Seed_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Seed_1_0_08071e08
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Seed_1_0_08071e08:
    .word PTR_A_Seed_1_0_08071e0c

PTR_A_Seed_1_0_08071e0c:
    .word A_Seed_1_0
    .word A_Seed_1_1
    .word A_Seed_1_2
    .word A_Seed_1_3


_ts A_Seed_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Seed_1_0_0_08071e2c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Seed_1_0_0_08071e2c:
    .word PTR_A_Seed_1_0_0_08071e30

PTR_A_Seed_1_0_0_08071e30:
    .word A_Seed_1_0_0
    .word A_Seed_1_0_1
    .word A_Seed_1_0_2


_ts A_Seed_1_0_0
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b2]
    ldrb       r1,[r5,#Attack_family_b3]
    bl         Battle_CellCoordsToSprite
    push       {r0,r1,r5}
    ldr        r2,[r5,#Attack_pos_curr_x]
    ldr        r3,[r5,#Attack_pos_curr_y]
    sub        r0,r0,r2
    sub        r1,r1,r3
    add        r3,r0,#0x0
    add        r0,r1,#0x0
    add        r1,r3,#0x0
    bl         VectorToAngle
    ldr        r1,DAT_08071e8c
    bl         AngleToVector
    add        r2,r0,#0x0
    add        r3,r1,#0x0
    pop        {r0,r1,r5}
    str        r2,[r5,#Attack_diff_x]
    str        r3,[r5,#Attack_diff_y]
    mov        r3,#0x0
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    ldr        r4,DAT_08071e8c
    ldr        r6,DAT_08071e88
    bl         Field_CalculateTrajectoryZ
    str        r0,[r5,#Attack_diff_z]
    strh       r1,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}

    .align 2, 0


DAT_08071e88:
    .word 0xFFFFD800

DAT_08071e8c:
    .word 0x1C000


_ts A_Seed_1_0_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08071ecc
    ldrb       r0,[r5,#Attack_family_b2]
    ldrb       r1,[r5,#Attack_family_b3]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08071eae
    bl         A_Seed_2_Free
    b          LAB_08071eec
LAB_08071eae:
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s2]
    ldrb       r0,[r5,#Attack_family_b2]
    strb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_family_b3]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r2,#0x0
    str        r2,[r5,#Attack_pos_curr_z]
    mov        r0,#0x14
    strh       r0,[r5,#Attack_counterA]
    b          LAB_08071eec
LAB_08071ecc:
    ldr        r0,[r5,#Attack_diff_z]
    ldr        r1,DAT_08071ef0
    add        r0,r0,r1
    str        r0,[r5,#Attack_diff_z]
    ldr        r0,[r5,#Attack_diff_x]
    ldr        r1,[r5,#Attack_pos_curr_x]
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_x]
    ldr        r0,[r5,#Attack_diff_y]
    ldr        r1,[r5,#Attack_pos_curr_y]
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_y]
    ldr        r0,[r5,#Attack_diff_z]
    ldr        r1,[r5,#Attack_pos_curr_z]
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_z]
LAB_08071eec:
    pop        {pc}

    .align 2, 0


DAT_08071ef0:
    .word 0xFFFFD800


_ts A_Seed_1_0_2
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08071f0a
    bl         A_Seed_2_Free
    b          LAB_08071f2e
LAB_08071f0a:
    mov        r1,#0x30
    tst        r0,r1
    beq        LAB_08071f16
    bl         A_Seed_2_Free
    b          LAB_08071f2e
LAB_08071f16:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08071f2e
    mov        r0,#0x8
    ldrb       r1,[r5,#Attack_family_family]
    tst        r1,r1
    beq        LAB_08071f28
    mov        r0,#0x4
LAB_08071f28:
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08071f2e:
    pop        {pc}


_ts A_Seed_1_1
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldr        r6,[r5,#Attack_param_60]
    ldrh       r0,[r5,#Attack_cPos_x]
    ldr        r1,DAT_08071fac
    mov        r2,#0x4
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#Attack_param_60]
    str        r1,[r7,#0x14]
    pop        {r7}
    mov        r0,#0x4
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08071f66
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08071f66:
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Seed_1_1_0_08071f90
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    ldr        r7,[r5,#Attack_param_60]
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08071f8c
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    add        r0,r7,#0x0
    bl         FieldObject_SetDeletedFlag
LAB_08071f8c:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Seed_1_1_0_08071f90:
    .word PTR_A_Seed_1_1_0_08071f94

PTR_A_Seed_1_1_0_08071f94:
    .word A_Seed_1_1_0
    .word A_Seed_1_1_1
    .word A_Seed_1_1_2
    .word A_Seed_1_1_3
    .word A_Seed_1_1_4
    .word A_Seed_1_1_5

DAT_08071fac:
    .word 0x40


_ts A_Seed_1_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08071fc6
    bl         A_Seed_2_Free
    b          LAB_0807200c
LAB_08071fc6:
    mov        r1,#0x30
    tst        r0,r1
    beq        LAB_08071fd2
    bl         A_Seed_2_Free
    b          LAB_08071f2e
LAB_08071fd2:
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r0,[r5,#Attack_cPos_x]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    ldrb       r0,[r5,#Attack_cPos_y]
    strb       r0,[r7,#0x3]
    strb       r0,[r7,#0x5]
    mov        r0,#0x4
    strb       r0,[r7,#0x6]
    mov        r0,#0x8
    lsl        r0,r0,#0x8
    str        r0,[r7,#0xc]
    mov        r0,#0x0
    strh       r0,[r7,#0x8]
    str        r0,[r7,#0x14]
    add        r0,r7,#0x0
    bl         FieldObject_GetIdFlag
    str        r0,[r7,#0x10]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x28
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
LAB_0807200c:
    pop        {pc}


_nt A_Seed_1_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08072022
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x96
    strh       r0,[r5,#Attack_counterA]
LAB_08072022:
    pop        {pc}


_ts A_Seed_1_1_2
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807203a
    mov        r0,#0x4
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Attack_counterA]
LAB_0807203a:
    pop        {pc}


_ts A_Seed_1_1_3
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072062
    ldrb       r4,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    lsl        r4,r4,#0x10
    lsl        r1,r1,#0x18
    orr        r4,r1
    add        r4,#0x2
    bl         Attack_Seed_Create
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x10
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Attack_counterA]
LAB_08072062:
    pop        {pc}


_ts A_Seed_1_1_4
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072076
    mov        r0,#0x3
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x14
    strb       r0,[r5,#Attack_state_s2]
LAB_08072076:
    pop        {pc}


_ts A_Seed_1_1_5
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807208c
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807208c:
    pop        {pc}


_nt A_Seed_1_2
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    LoadMain battle, r2, r2
    ldr        r2,[r2,#Battle_actorListPlayer]
    add        r2,#0x2c
    mov        r4,#0x3
    mov        r3,#0x4
    mov        r6,#0x32
    bl         Attack_Tower_Create
    pop        {r5}
    tst        r7,r7
    beq        LAB_080720b2
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_080720b2:
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    pop        {pc}


_ts A_Seed_1_3
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Seed_1_3_0_080720cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Seed_1_3_0_080720cc:
    .word PTR_A_Seed_1_3_0_080720d0

PTR_A_Seed_1_3_0_080720d0:
    .word A_Seed_1_3_0
    .word A_Seed_1_3_1
    .word A_Seed_1_3_2
    .word A_Seed_1_3_3


_ts A_Seed_1_3_0
    push       {lr}
    ldr        r6,[r5,#Attack_param_60]
    ldrb       r0,[r5,#Attack_family_b2]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r0,[r6,#0x2]
    strb       r0,[r6,#0x4]
    ldrb       r1,[r5,#Attack_family_b3]
    strb       r1,[r5,#Attack_cPos_y]
    strb       r1,[r6,#0x3]
    strb       r1,[r6,#0x5]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    mov        r2,#0x1
    lsl        r2,r2,#0x10
    add        r1,r1,r2
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r2,#0x2d
    lsl        r2,r2,#0x10
    str        r2,[r5,#Attack_pos_curr_z]
    mov        r0,#0x5
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x0
    str        r0,[r5,#Attack_diff_z]
    mov        r0,#0x4
    strb       r0,[r6,#0x6]
    mov        r0,#0x2
    lsl        r0,r0,#0x10
    str        r0,[r6,#0xc]
    mov        r0,#0x0
    strh       r0,[r6,#0x8]
    str        r0,[r6,#0x14]
    add        r0,r6,#0x0
    bl         FieldObject_GetIdFlag
    str        r0,[r6,#0x10]
    pop        {pc}


_nt A_Seed_1_3_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08072146
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0xab
    bl         Sound_PlaySE
LAB_08072146:
    pop        {pc}


_ts A_Seed_1_3_2
    push       {lr}
    ldr        r1,[r5,#Attack_diff_z]
    ldr        r0,DAT_0807216c
    add        r1,r1,r0
    str        r1,[r5,#Attack_diff_z]
    ldr        r0,[r5,#Attack_pos_curr_z]
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_z]
    bgt        LAB_08072168
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s2]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
LAB_08072168:
    pop        {pc}

    .align 2, 0


DAT_0807216c:
    .word 0xFFFFDC00


_ts A_Seed_1_3_3
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08072186
    mov        r1,#0x30
    tst        r0,r1
    beq        LAB_08072194
LAB_08072186:
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08072194:
    pop        {pc}


_nt A_Seed_2_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_Seed_Create
    push       {r5,lr}
    mov        r0,#0x1c
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5,pc}


_ts A_Seed_GetPanelFlags
    push       {lr}
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    pop        {pc}
