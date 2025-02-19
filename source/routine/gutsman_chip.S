#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_GutsMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_GutsManC_0_Init_080603c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsManC_0_Init_080603c4:
    .word PTR_R_GutsManC_0_Init_080603c8

PTR_R_GutsManC_0_Init_080603c8:
    .word R_GutsManC_0_Init
    .word R_GutsManC_1_Main
    .word R_GutsManC_2_Free


_ts R_GutsManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x22
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
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_element]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_GutsManC_1_Main
    pop        {pc}


_ts R_GutsManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_GutsManC_1_0_Land_08060434
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsManC_1_0_Land_08060434:
    .word PTR_R_GutsManC_1_0_Land_08060438

PTR_R_GutsManC_1_0_Land_08060438:
    .word R_GutsManC_1_0_Land
    .word R_GutsManC_1_1_Attack
    .word R_GutsManC_1_2_Vanish


_ts R_GutsManC_1_0_Land
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsManC_1_0_0_Land_08060454
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsManC_1_0_0_Land_08060454:
    .word PTR_R_GutsManC_1_0_0_Land_08060458

PTR_R_GutsManC_1_0_0_Land_08060458:
    .word R_GutsManC_1_0_0_Land
    .word R_GutsManC_1_0_1_Next


_ts R_GutsManC_1_0_0_Land
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08060478
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x2d
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_08060478:
    pop        {pc}


_nt R_GutsManC_1_0_1_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806048c
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806048c:
    pop        {pc}


_nt R_GutsManC_1_1_Attack
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_GutsManC_1_1_0_RaiseHammer_0806049c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_GutsManC_1_1_0_RaiseHammer_0806049c:
    .word PTR_R_GutsManC_1_1_0_RaiseHammer_080604a0

PTR_R_GutsManC_1_1_0_RaiseHammer_080604a0:
    .word R_GutsManC_1_1_0_RaiseHammer
    .word R_GutsManC_1_1_1_Attack
    .word R_GutsManC_1_1_2_Reset
    .word R_GutsManC_1_1_3_Wait
    .word R_GutsManC_1_1_4_Next


_ts R_GutsManC_1_1_0_RaiseHammer
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_GutsManC_1_1_1_Attack
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0806052e
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r0,r0,r1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08060530
    mov        r0,#0x2
    mov        r1,#0x64
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrb       r0,[r5,#Actor_owner]
    bl         Field_CrackAllEnemyPanels
    mov        r0,#0x7e
    bl         Sound_PlaySE
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r1,r1,r0
    mov        r2,#0x3
    mov        r3,#0x0
    mov        r4,#0x0
    ldrh       r6,[r5,#Actor_damage]
LAB_0806050e:
    push       {r1,r2,r3,r4,r6}
    bl         Attack_Shockwave_Create
    tst        r7,r7
    beq        LAB_08060520
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08060520:
    pop        {r1,r2,r3,r4,r6}
    sub        r2,#0x1
    bne        LAB_0806050e
    mov        r0,#0x78
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0806052e:
    pop        {pc}
LAB_08060530:
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_GutsManC_1_1_2_Reset
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806054e
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0806054e:
    pop        {pc}


_ts R_GutsManC_1_1_3_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08060560
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_08060560:
    pop        {pc}


_nt R_GutsManC_1_1_4_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08060578
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08060578:
    pop        {pc}


_nt R_GutsManC_1_2_Vanish
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08060596
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_08060596:
    pop        {pc}


_ts R_GutsManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_080605ae
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_080605ae:
    pop        {pc}


_ts Routine_GutsMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x19
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_080605ca
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_080605ca:
    pop        {pc}
