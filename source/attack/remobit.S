#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Remobit
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Remobit_0_Init_08076104
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Remobit_0_Init_08076104:
    .word PTR_A_Remobit_0_Init_08076108

PTR_A_Remobit_0_Init_08076108:
    .word A_Remobit_0_Init
    .word A_Remobit_1_Main
    .word A_Remobit_2_Free


_ts A_Remobit_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x4b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#Attack_family_family]
    add        r0,r0,r0
    bl         SpritePtr_SetPaletteIndex
    mov        r1,#0x3
    strb       r1,[r5,#Attack_header_entityFlags]
    ldrb       r0,[r5,#Attack_owner]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    strb       r0,[r5,#Attack_bc]
    strb       r0,[r5,#Attack_bf]
    strb       r0,[r5,#Attack_be]
    strb       r0,[r5,#Attack_bd]
    strb       r0,[r5,#Attack_b1b]
    bl         A_Remobit_1_Main
    pop        {pc}


_nt A_Remobit_1_Main
    push       {lr}
    ldr        r7,[r5,#Attack_param_60]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    bne        LAB_08076176
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    b          LAB_08076180
LAB_08076176:
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Remobit_1_0_08076184
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08076180:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Remobit_1_0_08076184:
    .word PTR_A_Remobit_1_0_08076188

PTR_A_Remobit_1_0_08076188:
    .word A_Remobit_1_0
    .word A_Remobit_1_1
    .word A_Remobit_1_2


_ts A_Remobit_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Remobit_1_0_0_080761a4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Remobit_1_0_0_080761a4:
    .word PTR_A_Remobit_1_0_0_080761a8

PTR_A_Remobit_1_0_0_080761a8:
    .word A_Remobit_1_0_0
    .word A_Remobit_1_0_1


_ts A_Remobit_1_0_0
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_sioOwnerId]
    ldrb       r1,[r5,#Attack_owner]
    eor        r0,r1
    ldr        r7,PTR_PTR_CellPosition_ARRAY_080761f4
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r5,#Attack_family_family]
    add        r0,r0,r0
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    strb       r0,[r5,#Attack_cPos_x]
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#Attack_cPos_y]
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x28
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}

PTR_CellPosition_ARRAY_080761e0:
    .word CellPosition_ARRAY_080761e8
    .word CellPosition_ARRAY_080761ee

CellPosition_ARRAY_080761e8:
    cell_pos 6, 1
    cell_pos 6, 1
    cell_pos 6, 1

CellPosition_ARRAY_080761ee:
    cell_pos 1, 1
    cell_pos 1, 1
    cell_pos 1, 1

PTR_PTR_CellPosition_ARRAY_080761f4:
    .word PTR_CellPosition_ARRAY_080761e0


_ts A_Remobit_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x32]
    sub        r0,#0x1
    strh       r0,[r5,#0x32]
    bne        LAB_0807620a
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807620a:
    pop        {pc}


_ts A_Remobit_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Remobit_1_1_0_0807621c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Remobit_1_1_0_0807621c:
    .word PTR_A_Remobit_1_1_0_08076220

PTR_A_Remobit_1_1_0_08076220:
    .word A_Remobit_1_1_0
    .word A_Remobit_1_1_1
    .word A_Remobit_1_1_2


_ts A_Remobit_1_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_A_Remobit_1_1_0_0_0807623c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_Remobit_1_1_0_0_0807623c:
    .word PTR_A_Remobit_1_1_0_0_08076240

PTR_A_Remobit_1_1_0_0_08076240:
    .word A_Remobit_1_1_0_0
    .word A_Remobit_1_1_0_1
    .word A_Remobit_1_1_0_2


_ts A_Remobit_1_1_0_0
    push       {lr}
LAB_0807624e:
    ldrb       r0,[r5,#Attack_bc]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_FUN_080763aa_08076268
    ldr        r7,[r7,r0]
    tst        r7,r7
    bne        LAB_08076260
    mov        r0,#0x0
    strb       r0,[r5,#Attack_bc]
    b          LAB_0807624e
LAB_08076260:
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_FUN_080763aa_08076268:
    .word PTR_FUN_080763aa_0807626c

PTR_FUN_080763aa_0807626c:
    .word FUN_080763aa
    .word FUN_080762b0
    .word FUN_080763ee
    .word FUN_080762b0
    .word FUN_080763aa
    .word FUN_08076290
    .word FUN_080763ee
    .word FUN_08076290
    .byte 0x00


_ts FUN_08076290
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    sub        r1,#0x1
    bl         Battle_CellCoordsToSprite
    str        r1,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    neg        r0,r0
    str        r0,[r5,#Attack_diff_y]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]
    pop        {pc}


_ts FUN_080762b0
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    add        r1,#0x1
    bl         Battle_CellCoordsToSprite
    str        r1,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    str        r0,[r5,#Attack_diff_y]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]
    pop        {pc}


_nt FUN_080762ce
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_sioOwnerId]
    ldrb       r1,[r5,#Attack_owner]
    eor        r0,r1
    tst        r0,r0
    bne        LAB_080762e6
    bl         FUN_08076326
    b          FUN_0807630e


_ts FUN_080762e4
    push       {lr}
LAB_080762e6:
    ldrb       r0,[r5,#Attack_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Attack_cPos_y]
    push       {r0,r1}
    bl         A_Remobit_IsNoEnemyPanelsInColumn
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_08076308
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    neg        r0,r0
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
LAB_08076308:
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]


_nt FUN_0807630e
    pop        {pc}


_ts FUN_08076310
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_sioOwnerId]
    ldrb       r1,[r5,#Attack_owner]
    eor        r0,r1
    tst        r0,r0
    bne        LAB_08076328
    bl         FUN_080762e4
    b          dummy_7634e


_nt FUN_08076326
    push       {lr}
LAB_08076328:
    ldrb       r0,[r5,#Attack_cPos_x]
    add        r0,#0x1
    ldrb       r1,[r5,#Attack_cPos_y]
    push       {r0,r1}
    bl         A_Remobit_IsNoEnemyPanelsInColumn
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_08076348
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
LAB_08076348:
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]


_nt dummy_7634e
    pop        {pc}


_ts FUN_08076350
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    sub        r1,#0x1
    push       {r0,r1}
    bl         A_Remobit_IsNoEnemyPanelsInColumn
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_08076376
    bl         Battle_CellCoordsToSprite
    str        r1,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    neg        r0,r0
    str        r0,[r5,#Attack_diff_y]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    b          LAB_0807637c
LAB_08076376:
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]
LAB_0807637c:
    pop        {pc}


_nt FUN_0807637e
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    add        r1,#0x1
    push       {r0,r1}
    bl         A_Remobit_IsNoEnemyPanelsInColumn
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_080763a2
    bl         Battle_CellCoordsToSprite
    str        r1,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    str        r0,[r5,#Attack_diff_y]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    b          LAB_080763a8
LAB_080763a2:
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]
LAB_080763a8:
    pop        {pc}


_nt FUN_080763aa
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_sioOwnerId]
    ldrb       r1,[r5,#Attack_owner]
    eor        r0,r1
    tst        r0,r0
    bne        LAB_080763c2
    bl         FUN_08076404
    b          dummy_763ec


_ts FUN_080763c0
    push       {lr}
LAB_080763c2:
    ldrb       r0,[r5,#Attack_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Attack_cPos_y]
    push       {r0,r1}
    bl         A_Remobit_IsNoEnemyPanelsInColumn
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_080763e6
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    neg        r0,r0
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    b          dummy_763ec
LAB_080763e6:
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]


_ts dummy_763ec
    pop        {pc}


_nt FUN_080763ee
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_sioOwnerId]
    ldrb       r1,[r5,#Attack_owner]
    eor        r0,r1
    tst        r0,r0
    bne        LAB_08076406
    bl         FUN_080763c0
    b          dummy_7642e


_ts FUN_08076404
    push       {lr}
LAB_08076406:
    ldrb       r0,[r5,#Attack_cPos_x]
    add        r0,#0x1
    ldrb       r1,[r5,#Attack_cPos_y]
    push       {r0,r1}
    bl         A_Remobit_IsNoEnemyPanelsInColumn
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_08076428
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_param_6C]
    ldr        r0,[r5,#Attack_param_70]
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    b          dummy_7642e
LAB_08076428:
    ldrb       r0,[r5,#Attack_bc]
    add        r0,#0x1
    strb       r0,[r5,#Attack_bc]


_nt dummy_7642e
    pop        {pc}


_ts A_Remobit_1_1_0_1
    push       {lr}
    sub        sp,#0x4
LAB_08076434:
    ldrb       r0,[r5,#Attack_b1b]
    tst        r0,r0
    bne        LAB_08076462
    ldrb       r0,[r5,#Attack_bd]
    tst        r0,r0
    bne        LAB_08076446
    bl         FUN_0807637e
    b          LAB_0807644a
LAB_08076446:
    bl         FUN_08076350
LAB_0807644a:
    ldrb       r0,[r5,#Attack_bf]
    tst        r0,r0
    beq        LAB_08076498
    ldrb       r0,[r5,#Attack_bd]
    mov        r1,#0x1
    eor        r0,r1
    strb       r0,[r5,#Attack_bd]
    ldrb       r0,[r5,#Attack_b1b]
    mov        r1,#0x1
    eor        r0,r1
    strb       r0,[r5,#Attack_b1b]
    b          LAB_08076434
LAB_08076462:
    mov        r0,#0x0
    str        r0,[sp,#0x0]
LAB_08076466:
    ldrb       r0,[r5,#Attack_be]
    tst        r0,r0
    bne        LAB_08076472
    bl         FUN_08076310
    b          LAB_08076476
LAB_08076472:
    bl         FUN_080762ce
LAB_08076476:
    ldrb       r0,[r5,#Attack_bf]
    tst        r0,r0
    beq        LAB_08076490
    ldrb       r0,[r5,#Attack_be]
    mov        r1,#0x1
    eor        r0,r1
    strb       r0,[r5,#Attack_be]
    ldr        r0,[sp,#0x0]
    tst        r0,r0
    bne        LAB_08076490
    mov        r0,#0x1
    str        r0,[sp,#0x0]
    b          LAB_08076466
LAB_08076490:
    ldrb       r0,[r5,#Attack_b1b]
    mov        r1,#0x1
    eor        r0,r1
    strb       r0,[r5,#Attack_b1b]
LAB_08076498:
    add        sp,#0x4
    pop        {pc}
    .word FUN_0807637e
    .word FUN_08076350
    .word FUN_08076310
    .word FUN_080762ce


_ts A_Remobit_1_1_0_2
    push       {lr}
LAB_080764ae:
    ldrb       r0,[r5,#Attack_bc]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_FUN_0807637e_080764c8
    ldr        r7,[r7,r0]
    tst        r7,r7
    bne        LAB_080764c0
    mov        r0,#0x0
    strb       r0,[r5,#Attack_bc]
    b          LAB_080764ae
LAB_080764c0:
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_FUN_0807637e_080764c8:
    .word PTR_FUN_0807637e_080764cc

PTR_FUN_0807637e_080764cc:
    .word FUN_0807637e
    .word FUN_080763ee
    .word FUN_08076350
    .word FUN_080763aa
    .byte 0x00


_ts A_Remobit_1_1_1
    push       {lr}
    ldr        r1,[r5,#Attack_pos_curr_x]
    ldr        r0,[r5,#Attack_diff_x]
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_param_6C]
    bl         R_Fishy_IsSpritePosAtCellPos
    tst        r0,r0
    beq        LAB_08076500
    ldr        r0,[r5,#Attack_param_6C]
    str        r0,[r5,#Attack_pos_curr_x]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076500:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_nt A_Remobit_1_1_2
    push       {lr}
    ldr        r2,[r5,#Attack_param_6C]
    ldr        r1,[r5,#Attack_pos_curr_y]
    ldr        r0,[r5,#Attack_diff_y]
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_y]
    bl         R_Fishy_IsSpritePosAtCellPos
    tst        r0,r0
    beq        LAB_08076526
    ldr        r1,[r5,#Attack_param_6C]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076526:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_ts A_Remobit_1_2
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_FUN_0807654c_0807653c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_FUN_0807654c_0807653c:
    .word PTR_FUN_0807654c_08076540

PTR_FUN_0807654c_08076540:
    .word FUN_0807654c
    .word FUN_08076558
    .word FUN_08076586


_ts FUN_0807654c
    push       {lr}
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}


_ts FUN_08076558
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08076584
    bl         A_Remobit_IsEnemyPanelAvailable
    tst        r0,r0
    beq        LAB_0807657c
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    mov        r4,#0x0
    ldrh       r6,[r5,#Attack_damage]
    bl         Effect_RemobitThunder_Create
    mov        r0,#0xbb
    bl         Sound_PlaySE
LAB_0807657c:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
LAB_08076584:
    pop        {pc}


_nt FUN_08076586
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08076598
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076598:
    pop        {pc}


_nt A_Remobit_2_Free
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_pos_curr_y]
    ldr        r3,[r5,#Attack_pos_curr_z]
    mov        r4,#0x50
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_080765bc
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_080765bc:
    pop        {r5}
    bl         Attack_Free
    pop        {pc}


_ts Attack_Remobit_Create
    push       {lr}
    push       {r3,r5,r6}
    mov        r0,#0x39
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r3,r5,r6}
    tst        r7,r7
    beq        LAB_080765e0
    str        r3,[r7,#0x70]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
    str        r5,[r7,#0x60]
LAB_080765e0:
    add        r0,r7,#0x0
    pop        {pc}


_ts A_Remobit_IsNoEnemyPanelsInColumn
    push       {lr}
    sub        sp,#0x4
    mov        r2,#0x1
    str        r2,[sp,#0x0]
    push       {r0}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0}
    bne        LAB_0807662a
    mov        r1,#0x1
    mov        r2,#0x0
LAB_080765fc:
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    ldrb       r1,[r5,#Attack_owner]
    tst        r1,r1
    bne        LAB_08076612
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0807661a
    add        r2,#0x1
    b          LAB_0807661a
LAB_08076612:
    mov        r1,#0x2
    tst        r1,r0
    bne        LAB_0807661a
    add        r2,#0x1
LAB_0807661a:
    pop        {r0,r1}
    add        r1,#0x1
    cmp        r1,#0x4
    blt        LAB_080765fc
    tst        r2,r2
    beq        LAB_0807662a
    mov        r0,#0x0
    str        r0,[sp,#0x0]
LAB_0807662a:
    ldr        r0,[sp,#0x0]
    strb       r0,[r5,#Attack_bf]
    add        sp,#0x4
    pop        {pc}


_nt A_Remobit_IsEnemyPanelAvailable
    push       {lr}
    sub        sp,#0x4
    mov        r0,#0x0
    str        r0,[sp,#0x0]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807666c
    ldrb       r1,[r5,#Attack_owner]
    tst        r1,r1
    bne        LAB_0807665c
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807666c
    ldr        r1,PanelFlag_08076674
    tst        r0,r1
    bne        LAB_0807666c
    b          LAB_08076668
LAB_0807665c:
    mov        r1,#0x2
    tst        r0,r1
    bne        LAB_0807666c
    ldr        r1,PanelFlag_08076678
    tst        r0,r1
    bne        LAB_0807666c
LAB_08076668:
    mov        r0,#0x1
    str        r0,[sp,#0x0]
LAB_0807666c:
    ldr        r0,[sp,#0x0]
    add        sp,#0x4
    pop        {pc}

    .align 2, 0


PanelFlag_08076674:
    .word PF_PlayerOccupied | PF_Solid

PanelFlag_08076678:
    .word PF_EnemyOccupied | PF_Solid
