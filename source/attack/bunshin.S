#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Bunshin
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Bunshin_0_Init_08079348
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Bunshin_0_Init_08079348:
    .word PTR_A_Bunshin_0_Init_0807934c

PTR_A_Bunshin_0_Init_0807934c:
    .word A_Bunshin_0_Init
    .word A_Bunshin_1_Main
    .word A_Bunshin_2_Free


_ts A_Bunshin_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x62
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Attack_canBeDamaged]
    mov        r0,#0x1
    strh       r0,[r5,#Attack_hpCurrent]
    strh       r0,[r5,#Attack_hpMax]
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    bl         A_Bunshin_1_Main
    pop        {pc}


_nt A_Bunshin_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Attack_canBeDamaged]
    tst        r0,r0
    beq        LAB_080793c2
    bl         A_Bunshin_CheckDamage
    tst        r0,r0
    beq        LAB_080793c2
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_080793c2:
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Bunshin_1_0_08079408
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_UpdateCellPosition
    mov        r0,#0x9
    ldr        r1,[r5,#Attack_param_60]
    ldrb       r2,[r5,#Attack_canBeDamaged]
    tst        r2,r2
    bne        LAB_080793e4
    mov        r0,#PFI_Moving
LAB_080793e4:
    bl         Field_SetPanelFlagsOnEntity
    bl         A_Bunshin_CheckParent
    tst        r0,r0
    beq        LAB_080793f4
    mov        r0,#0x0
    strh       r0,[r5,#Attack_hpCurrent]
LAB_080793f4:
    ldrh       r0,[r5,#Attack_hpCurrent]
    tst        r0,r0
    bne        LAB_08079404
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
LAB_08079404:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Bunshin_1_0_08079408:
    .word PTR_A_Bunshin_1_0_0807940c

PTR_A_Bunshin_1_0_0807940c:
    .word A_Bunshin_1_0
    .word A_Bunshin_1_1


_ts A_Bunshin_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Bunshin_1_0_0_08079424
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Bunshin_1_0_0_08079424:
    .word PTR_A_Bunshin_1_0_0_08079428

PTR_A_Bunshin_1_0_0_08079428:
    .word A_Bunshin_1_0_0
    .word A_Bunshin_1_0_1
    .word A_Bunshin_1_0_2
    .word A_Bunshin_1_0_3


_ts A_Bunshin_1_0_0
    push       {lr}
    bl         A_Bunshin_GetNextMovePanel
    strb       r0,[r5,#Attack_family_b2]
    strb       r1,[r5,#Attack_family_b3]
    ldr        r7,[r5,#Attack_param_64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}


_ts A_Bunshin_1_0_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08079482
    ldrb       r0,[r5,#Attack_family_b2]
    ldrb       r1,[r5,#Attack_family_b3]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    bl         R_Actor_UpdateSpritePos
LAB_08079482:
    pop        {pc}


_ts A_Bunshin_1_0_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807949c
    mov        r0,#0x18
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
LAB_0807949c:
    pop        {pc}


_nt A_Bunshin_1_0_3
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080794ba
    mov        r0,#0x0
    ldr        r7,[r5,#Attack_param_70]
    ldrb       r1,[r7,#0xd]
    tst        r1,r1
    beq        LAB_080794b4
    mov        r0,#0x4
LAB_080794b4:
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_080794ba:
    pop        {pc}


_ts A_Bunshin_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Bunshin_1_1_0_080794cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Bunshin_1_1_0_080794cc:
    .word PTR_A_Bunshin_1_1_0_080794d0

PTR_A_Bunshin_1_1_0_080794d0:
    .word A_Bunshin_1_1_0
    .word A_Bunshin_1_1_1
    .word A_Bunshin_1_1_2
    .word A_Bunshin_1_1_3


_ts A_Bunshin_1_1_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Attack_counterA]
    pop        {pc}


_ts A_Bunshin_1_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807951a
    ldrb       r0,[r5,#Attack_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Attack_cPos_y]
    mov        r2,#0xc8
    ldrb       r3,[r5,#Attack_owner]
    mov        r4,#0x3
    ldrb       r6,[r5,#Attack_family_family]
    add        r6,r6,r6
    mov        r7,#0xc
    sub        r6,r7,r6
    bl         Attack_Bakufu_Create
    mov        r0,#0x5a
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
LAB_0807951a:
    pop        {pc}


_ts A_Bunshin_1_1_2
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08079532
    mov        r0,#0x5
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x5
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s2]
LAB_08079532:
    pop        {pc}


_ts A_Bunshin_1_1_3
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08079546
    mov        r0,#0x0
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08079546:
    pop        {pc}


_ts A_Bunshin_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Bunshin_2_0_08079560
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Bunshin_2_0_08079558:
    .word A_Bunshin_2_0
    .word A_Bunshin_2_1

PTR_PTR_A_Bunshin_2_0_08079560:
    .word PTR_A_Bunshin_2_0_08079558


_ts A_Bunshin_2_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_0807957a
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    b          LAB_080795a6
LAB_0807957a:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807959a
    mov        r0,#0x0
    ldr        r7,[r5,#Attack_param_68]
    str        r0,[r7,#0x0]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    bl         Attack_Free
    b          LAB_080795a6
LAB_0807959a:
    mov        r2,#0x1
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_080795a4
    mov        r2,#0x3
LAB_080795a4:
    strb       r2,[r5,#Attack_header_entityFlags]
LAB_080795a6:
    pop        {pc}


_ts A_Bunshin_2_1
    push       {lr}
    mov        r0,#0x0
    ldr        r7,[r5,#Attack_param_68]
    str        r0,[r7,#0x0]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_Bunshin_CheckDamage
    push       {lr}
    ldr        r6,[r5,#Attack_param_60]
    ldrh       r0,[r6,#0x2]
    ldr        r1,DAT_080795e4
    ldrb       r2,[r5,#Attack_element]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#Attack_param_60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#Attack_element]
    bl         FieldObject_GetDamageToEntity
    pop        {pc}

DAT_080795e4:
    .word 0x28840


_ts A_Bunshin_CellPosToOffset
    lsl        r1,r1,#0x3
    orr        r0,r1
    mov        pc,lr


_nt Attack_Bunshin_Create
    push       {r5,lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x4d
    bl         Attack_Alloc
    pop        {r0,r1,r2,r6}
    tst        r5,r6
    beq        LAB_0807963a
    str        r2,[r5,#Attack_param_68]
    str        r6,[r5,#Attack_param_70]
    str        r5,[r2,#0x0]
    ldrb       r2,[r6,#0xd]
    strb       r2,[r5,#Attack_bc]
    ldrb       r2,[r6,#0x16]
    strb       r2,[r5,#Attack_owner]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r2,#0x0
    str        r2,[r5,#Attack_pos_curr_z]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    FieldObject_Create PFI_Self_Actor, Attack_param_60
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Disable
    FieldObject_Create PFI_Moving, Attack_param_64
LAB_0807963a:
    add        r7,r5,#0x0
    pop        {r5,pc}


_nt A_Bunshin_GetNextMovePanel
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,PanelFlag_08079678
    ldrb       r3,[r5,#Attack_owner]
    bl         Field_SearchWithOwner
    push       {r1}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         A_Bunshin_CellPosToOffset
    pop        {r1}
    mov        r7,sp
    strb       r0,[r7,r1]
    add        r1,#0x1
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r7,sp
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
    add        sp,#0x14
    pop        {pc}

PanelFlag_08079678:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts A_Bunshin_CheckParent
    push       {lr}
    mov        r0,#0x0
    ldr        r7,[r5,#Attack_param_68]
    ldr        r1,[r7,#0x0]
    tst        r1,r1
    bne        LAB_0807968a
    mov        r0,#0x1
LAB_0807968a:
    pop        {pc}
