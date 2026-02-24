#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Sarcophagus
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Sarcophagus_0_Init_080784b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Sarcophagus_0_Init_080784b8:
    .word PTR_A_Sarcophagus_0_Init_080784bc

PTR_A_Sarcophagus_0_Init_080784bc:
    .word A_Sarcophagus_0_Init
    .word A_Sarcophagus_1_Main
    .word A_Sarcophagus_2_Free


_ts A_Sarcophagus_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xb0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_canBeDamaged]
    ldr        r0,DAT_08078508
    strh       r0,[r5,#Attack_damage]
    FieldObject_Create PFI_Moving, Attack_param_60
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         A_Sarcophagus_1_Main
    pop        {pc}

DAT_08078508:
    .byte 0x0F
    .byte 0x27


_ts A_Sarcophagus_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Sarcophagus_1_0_0807853c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0xf
    ldrb       r2,[r5,#Attack_canBeDamaged]
    tst        r2,r2
    beq        LAB_08078528
    mov        r0,#PFI_Self_Extension_Armored
LAB_08078528:
    ldr        r1,[r5,#Attack_param_60]
    bl         Field_SetPanelFlagsOnEntity
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_UpdateCellPosition
    bl         A_Sarcophagus_CheckLiveParent
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Sarcophagus_1_0_0807853c:
    .word PTR_A_Sarcophagus_1_0_08078540

PTR_A_Sarcophagus_1_0_08078540:
    .word A_Sarcophagus_1_0
    .word A_Sarcophagus_1_1


_ts A_Sarcophagus_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_08078566
    mov        r0,#0x3c
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x1
    strb       r0,[r5,#Attack_header_entityFlags]
    b          LAB_0807857e
LAB_08078566:
    bl         A_Sarcophagus_SetNextMovePanel
    bl         R_Actor_UpdateSpritePos
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807857e
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807857e:
    pop        {pc}


_ts A_Sarcophagus_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_Sarcophagus_1_1_0_08078590
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Sarcophagus_1_1_0_08078590:
    .word PTR_A_Sarcophagus_1_1_0_08078594

PTR_A_Sarcophagus_1_1_0_08078594:
    .word A_Sarcophagus_1_1_0
    .word A_Sarcophagus_1_1_1
    .word A_Sarcophagus_1_1_2
    .word A_Sarcophagus_1_1_3
    .word A_Sarcophagus_1_1_4
    .word A_Sarcophagus_1_1_5
    .word A_Sarcophagus_1_1_6
    .word A_Sarcophagus_1_1_7


_ts A_Sarcophagus_1_1_0
    push       {lr}
    mov        r0,#0xa0
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_pos_curr_z]
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         Div
    strb       r1,[r5,#Attack_bc]
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}


_nt A_Sarcophagus_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x32]
    cmp        r0,#0x28
    bge        LAB_080785de
    mov        r1,#0x1
    strb       r1,[r5,#Attack_canBeDamaged]
LAB_080785de:
    sub        r0,#0x8
    strh       r0,[r5,#0x32]
    bgt        LAB_080785fe
    mov        r0,#0x1
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x3c
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x7e
    bl         Sound_PlaySE
LAB_080785fe:
    pop        {pc}


_ts A_Sarcophagus_1_1_2
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08078616
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s2]
LAB_08078616:
    pop        {pc}


_ts A_Sarcophagus_1_1_3
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08078626
    mov        r0,#0x10
    strb       r0,[r5,#Attack_state_s2]
LAB_08078626:
    pop        {pc}


_ts A_Sarcophagus_1_1_4
    push       {lr}
    ldrb       r0,[r5,#Attack_bc]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_A_Sarcophagus_CoffinLaser_08078638
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_Sarcophagus_CoffinLaser_08078638:
    .word PTR_A_Sarcophagus_CoffinLaser_0807863c

PTR_A_Sarcophagus_CoffinLaser_0807863c:
    .word A_Sarcophagus_CoffinLaser
    .word A_Sarcophagus_Ratton
    .word A_Sarcophagus_PharaohCube


_ts A_Sarcophagus_CoffinLaser
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s3]
    ldr        r7,PTR_PTR_A_Sarcophagus_CoffinLaser_0_08078658
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Sarcophagus_CoffinLaser_0_08078658:
    .word PTR_A_Sarcophagus_CoffinLaser_0_0807865c

PTR_A_Sarcophagus_CoffinLaser_0_0807865c:
    .word A_Sarcophagus_CoffinLaser_0
    .word A_Sarcophagus_CoffinLaser_1


_ts A_Sarcophagus_CoffinLaser_0
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    mov        r2,#0xc8
    mov        r4,#0x1
    lsl        r4,r4,#0x8
    add        r4,#0x1
    bl         Effect_Laser_Create
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s3]
    mov        r0,#0x5a
    strh       r0,[r5,#Attack_counterA]
    pop        {pc}


_ts A_Sarcophagus_CoffinLaser_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    cmp        r0,#0x4b
    bne        LAB_0807868e
    mov        r0,#0x97
    bl         Sound_PlaySE
LAB_0807868e:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807869a
    mov        r0,#0x14
    strh       r0,[r5,#Attack_state_s2]
LAB_0807869a:
    pop        {pc}


_ts A_Sarcophagus_Ratton
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s3]
    ldr        r7,PTR_PTR_A_Sarcophagus_Ratton_0_080786ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Sarcophagus_Ratton_0_080786ac:
    .word PTR_A_Sarcophagus_Ratton_0_080786b0

PTR_A_Sarcophagus_Ratton_0_080786b0:
    .word A_Sarcophagus_Ratton_0
    .word A_Sarcophagus_Ratton_1


_ts A_Sarcophagus_Ratton_0
    push       {lr}
    mov        r0,#0x3
    strh       r0,[r5,#Attack_counterB]
    mov        r0,#0x14
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s3]
    pop        {pc}


_ts A_Sarcophagus_Ratton_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080786f6
    ldrh       r0,[r5,#Attack_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    bge        LAB_080786e0
    mov        r0,#0x14
    strh       r0,[r5,#Attack_state_s2]
    b          LAB_080786f6
LAB_080786e0:
    mov        r0,#0x14
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Attack_cPos_y]
    mov        r4,#0x6
    bl         Attack_Ratton_Create
    mov        r0,#0xaf
    bl         Sound_PlaySE
LAB_080786f6:
    pop        {pc}


_ts A_Sarcophagus_PharaohCube
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s3]
    ldr        r7,PTR_PTR_A_Sarcophagus_PharaohCube_0_08078708
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Sarcophagus_PharaohCube_0_08078708:
    .word PTR_A_Sarcophagus_PharaohCube_0_0807870c

PTR_A_Sarcophagus_PharaohCube_0_0807870c:
    .word A_Sarcophagus_PharaohCube_0
    .word A_Sarcophagus_PharaohCube_1


_ts A_Sarcophagus_PharaohCube_0
    push       {lr}
    sub        sp,#0x14
    mov        r4,sp
    mov        r0,#0x0
    ldrb       r1,[r5,#Attack_cPos_x]
    sub        r1,#0x1
    ldrb       r2,[r5,#Attack_cPos_y]
    mov        r3,#0x64
    mov        r4,#0x2
    lsl        r4,r4,#0x18
    mov        r7,#0x3
    orr        r4,r7
    mov        r6,#0xc8
    mov        r7,#0x0
    bl         Attack_Cube_Create
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s3]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    add        sp,#0x14
    pop        {pc}
    .byte 0x12
    .byte 0x08


_ts A_Sarcophagus_PharaohCube_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08078752
    mov        r0,#0x14
    strh       r0,[r5,#Attack_state_s2]
LAB_08078752:
    pop        {pc}


_ts A_Sarcophagus_1_1_5
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x18
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}


_ts A_Sarcophagus_1_1_6
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08078778
    mov        r0,#0x0
    strb       r0,[r5,#Attack_canBeDamaged]
    mov        r0,#0x3c
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x1c
    strb       r0,[r5,#Attack_state_s2]
LAB_08078778:
    pop        {pc}


_nt A_Sarcophagus_1_1_7
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08078792
    mov        r2,#0x1
    strb       r2,[r5,#Attack_header_entityFlags]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    b          LAB_0807879e
LAB_08078792:
    mov        r2,#0x3
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807879c
    mov        r2,#0x1
LAB_0807879c:
    strb       r2,[r5,#Attack_header_entityFlags]
LAB_0807879e:
    pop        {pc}


_ts A_Sarcophagus_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Sarcophagus_2_0_Free_080787b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Sarcophagus_2_0_Free_080787b0:
    .word A_Sarcophagus_2_0_Free

PTR_PTR_A_Sarcophagus_2_0_Free_080787b4:
    .word PTR_A_Sarcophagus_2_0_Free_080787b0


_ts A_Sarcophagus_2_0_Free
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_pos_curr_y]
    ldr        r3,[r5,#Attack_pos_curr_z]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt Attack_Sarcophagus_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x48
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08078802
    str        r2,[r7,#0x64]
    str        r7,[r2,#0x0]
    ldrb       r3,[r5,#Attack_owner]
    strb       r3,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    ldrh       r1,[r7,#0x2e]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_08078802:
    add        r0,r7,#0x0
    pop        {pc}


_nt A_Sarcophagus_SetNextMovePanel
    push       {lr}
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         Div
    add        r1,#0x1
    mov        r0,#0x4
    push       {r0,r1}
    bl         A_Sarcophagus_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08078826
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
LAB_08078826:
    pop        {pc}


_ts A_Sarcophagus_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_0807884c
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807884c
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807884c
    mov        r2,#0x1
LAB_0807884c:
    add        r0,r2,#0x0
    pop        {pc}


_ts A_Sarcophagus_CheckLiveParent
    push       {lr}
    ldr        r0,[r5,#Attack_param_64]
    ldr        r0,[r0,#0x0]
    tst        r0,r0
    bne        LAB_0807885e
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_0807885e:
    pop        {pc}
