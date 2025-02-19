#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_MagicMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_MagicManC_0_Init_0806dc4c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_MagicManC_0_Init_0806dc4c:
    .word PTR_R_MagicManC_0_Init_0806dc50

PTR_R_MagicManC_0_Init_0806dc50:
    .word R_MagicManC_0_Init
    .word R_MagicManC_1_Main
    .word R_MagicManC_2_Free


_ts R_MagicManC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x51
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x7
    strb       r0,[r5,#Actor_header_entityFlags]
    LoadMain battle, r7, r7
    add        r7,#0x40
    ldrb       r0,[r5,#Actor_owner]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    strb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r7,#0x19]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    ldrb       r1,[r5,#Actor_owner]
    tst        r1,r1
    beq        LAB_0806dcae
    mov        r0,#0x0
LAB_0806dcae:
    bl         SpritePtr_SetFlipType
    mov        r0,#0xde
    bl         Sound_PlaySE
    pop        {pc}


_nt R_MagicManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_MagicManC_1_0_Main_0806dcc8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_MagicManC_1_0_Main_0806dcc8:
    .word PTR_R_MagicManC_1_0_Main_0806dccc

PTR_R_MagicManC_1_0_Main_0806dccc:
    .word R_MagicManC_1_0_Main


_ts R_MagicManC_1_0_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_MagicManC_1_0_0_0806dd00
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_MagicManC_1_0_0_0806dce0:
    .word R_MagicManC_1_0_0
    .word R_MagicManC_1_0_1
    .word R_MagicManC_1_0_2
    .word R_MagicManC_1_0_3
    .word R_MagicManC_1_0_4
    .word R_MagicManC_1_0_5
    .word R_MagicManC_1_0_6
    .word R_MagicManC_1_0_7

PTR_PTR_R_MagicManC_1_0_0_0806dd00:
    .word PTR_R_MagicManC_1_0_0_0806dce0


_ts R_MagicManC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806dd1c
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
LAB_0806dd1c:
    pop        {pc}


_nt R_MagicManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806dd34
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x14
    strh       r0,[r5,#Actor_counterA]
LAB_0806dd34:
    pop        {pc}


_nt R_MagicManC_1_0_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806dd64
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r4,#0x1
    bl         Effect_MagicMan_Create
    str        r7,[r5,#Actor_param_5C]
    tst        r7,r7
    beq        LAB_0806dd56
    mov        r0,#0x5
    strb       r0,[r7,#0x0]
LAB_0806dd56:
    mov        r0,#0x8f
    bl         Sound_PlaySE
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_0806dd64:
    pop        {pc}


_nt R_MagicManC_1_0_3
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806dd98
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r0,r0,r1
    ldrb       r1,[r5,#Actor_cPos_y]
    add        r2,r5,#0x0
    ldrb       r4,[r5,#Actor_family_family]
    bl         Attack_MagicFire_Chip_Create
    mov        r0,#0x1
    strb       r0,[r5,#Actor_family_b1]
    mov        r0,#0xb6
    bl         Sound_PlaySE
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s2]
LAB_0806dd98:
    pop        {pc}


_nt R_MagicManC_1_0_4
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806ddac
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
LAB_0806ddac:
    pop        {pc}


_nt R_MagicManC_1_0_5
    push       {lr}
    ldrb       r0,[r5,#Actor_family_b1]
    tst        r0,r0
    bne        LAB_0806ddbe
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x18
    strb       r0,[r5,#Actor_state_s2]
LAB_0806ddbe:
    pop        {pc}


_ts R_MagicManC_1_0_6
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806ddd2
    mov        r0,#0x1c
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
LAB_0806ddd2:
    pop        {pc}


_ts R_MagicManC_1_0_7
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806dde8
    mov        r0,#0x5
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_0806dde8:
    pop        {pc}


_nt R_MagicManC_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    tst        r0,r0
    bne        LAB_0806ddfa
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
LAB_0806ddfa:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806de0c
    bl         Actor_Free
    ldr        r7,PTR_gScreenDim_0806de10
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_0806de0c:
    pop        {pc}

    .align 2, 0


PTR_gScreenDim_0806de10:
    .word gScreenDim


_ts Routine_MagicMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x4a
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_0806de2a
    strb       r2,[r7,#0x16]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0806de2a:
    pop        {pc}
