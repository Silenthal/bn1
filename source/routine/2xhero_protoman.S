#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_2xHeroProtoMan
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_2xHeroProtoMan_0_Init_0806e8d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_2xHeroProtoMan_0_Init_0806e8d8:
    .word PTR_R_2xHeroProtoMan_0_Init_0806e8dc

PTR_R_2xHeroProtoMan_0_Init_0806e8dc:
    .word R_2xHeroProtoMan_0_Init
    .word R_2xHeroProtoMan_1_Main
    .word R_2xHeroProtoMan_2_Free


_ts R_2xHeroProtoMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x48
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    push       {r0}
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    pop        {r2}
    neg        r2,r2
    mov        r3,#0xa
    lsl        r3,r3,#0x10
    mul        r3,r2
    add        r0,r0,r3
    str        r0,[r5,#Actor_pos_curr_x]
    mov        r3,#0x6
    lsl        r3,r3,#0x10
    mul        r3,r2
    add        r1,r1,r3
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    ldr        r0,PanelFlag_0806e950
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_2xHeroProtoMan_1_Main
    pop        {pc}

    .align 2, 0


PanelFlag_0806e950:
    .word PF_Cracked | PF_Ground | PF_PlayerOccupied | PF_EnemyOccupied


_ts R_2xHeroProtoMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_2xHeroProtoMan_1_0_0806e968
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_2xHeroProtoMan_1_0_0806e968:
    .word PTR_R_2xHeroProtoMan_1_0_0806e96c

PTR_R_2xHeroProtoMan_1_0_0806e96c:
    .word R_2xHeroProtoMan_1_0
    .word R_2xHeroProtoMan_1_1
    .word R_2xHeroProtoMan_1_2


_ts R_2xHeroProtoMan_1_0
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806e98a
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806e98a:
    pop        {pc}


_ts R_2xHeroProtoMan_1_1
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_2xHeroProtoMan_1_1_0_0806e99c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_2xHeroProtoMan_1_1_0_0806e99c:
    .word PTR_R_2xHeroProtoMan_1_1_0_0806e9a0

PTR_R_2xHeroProtoMan_1_1_0_0806e9a0:
    .word R_2xHeroProtoMan_1_1_0
    .word R_2xHeroProtoMan_1_1_1
    .word R_2xHeroProtoMan_1_1_2
    .word R_2xHeroProtoMan_1_1_3


_ts R_2xHeroProtoMan_1_1_0
    push       {lr}
    mov        r4,#0x0
    bl         Attack_Charging_Create
    str        r7,[r5,#Actor_param_5C]
    tst        r7,r7
    beq        LAB_0806e9c6
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806e9c6:
    mov        r0,#0x60
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_2xHeroProtoMan_1_1_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806e9fc
    ldr        r0,[r5,#Actor_param_5C]
    tst        r0,r0
    beq        LAB_0806e9fa
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0806e9fa:
    pop        {pc}
LAB_0806e9fc:
    lsr        r0,r0,#0x5
    mov        r1,#0x2
    sub        r1,r1,r0
    ldr        r7,[r5,#Actor_param_5C]
    tst        r7,r7
    beq        LAB_0806ea0a
    strb       r1,[r7,#0x14]
LAB_0806ea0a:
    pop        {pc}


_ts R_2xHeroProtoMan_1_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806ea1c
    bl         R_2xHeroProtoMan_CreateHitEffects
LAB_0806ea1c:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ea3a
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806ea3c
    mov        r0,#0x1e
    str        r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0806ea3a:
    pop        {pc}
LAB_0806ea3c:
    mov        r0,#0xff
    strb       r0,[r5,#Actor_frameIndexLast]
    mov        r0,#0x75
    bl         Sound_PlaySE
    pop        {pc}


_ts R_2xHeroProtoMan_1_1_3
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806ea5a
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806ea5a:
    pop        {pc}


_ts R_2xHeroProtoMan_1_2
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_2xHeroProtoMan_1_2_0_0806ea6c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_2xHeroProtoMan_1_2_0_0806ea6c:
    .word PTR_R_2xHeroProtoMan_1_2_0_0806ea70

PTR_R_2xHeroProtoMan_1_2_0_0806ea70:
    .word R_2xHeroProtoMan_1_2_0
    .word R_2xHeroProtoMan_1_2_1


_ts R_2xHeroProtoMan_1_2_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_2xHeroProtoMan_1_2_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ea94
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s0]
LAB_0806ea94:
    pop        {pc}


_nt R_2xHeroProtoMan_2_Free
    push       {lr}
    LoadMain screenDim, r7, r7
    ldrb       r0,[r7,#0x3]
    add        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
    pop        {pc}


_ts R_2xHeroProtoMan_CreateHitEffects
    push       {r5,lr}
    bl         Rng_RandomUint
    ldrb       r2,[r5,#Actor_cPos_x]
    add        r3,r2,#0x1
    ldrb       r1,[r5,#Actor_owner]
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r1,r4
    tst        r1,r1
    beq        LAB_0806eac6
    mov        r1,#0x7
    sub        r2,r1,r2
    mov        r3,#0x1
LAB_0806eac6:
    mov        r1,#0x6
    sub        r1,r1,r2
    bls        LAB_0806eb08
    push       {r0,r3}
    lsr        r0,r0,#0x10
    bl         SWI_DivMod
    add        r7,r0,#0x0
    pop        {r0,r3}
    add        r7,r7,r3
    lsl        r0,r0,#0x10
    lsr        r0,r0,#0x10
    mov        r1,#0x3
    bl         SWI_DivMod
    add        r1,r0,#0x1
    add        r0,r7,#0x0
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldrb       r4,[r5,#Actor_owner]
    lsl        r4,r4,#0x7
    add        r4,#0x30
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806eb08
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
LAB_0806eb08:
    pop        {r5,pc}


_nt Routine_2xHeroProtoMan_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x4f
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_0806eb28
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806eb28:
    pop        {pc}

    .align 2, 0

