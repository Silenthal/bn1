#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_FireMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_FireManC_0_Init_0805f9a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_FireManC_0_Init_0805f9a8:
    .word PTR_R_FireManC_0_Init_0805f9ac

PTR_R_FireManC_0_Init_0805f9ac:
    .word R_FireManC_0_Init
    .word R_FireManC_1_Main
    .word R_FireManC_2_Free


_ts R_FireManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x11
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
    mov        r0,#0x2
    strb       r0,[r5,#Actor_element]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_FireManC_1_Main
    pop        {pc}


_ts R_FireManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_FireManC_1_0_Wait_0805fa18
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_FireManC_1_0_Wait_0805fa18:
    .word PTR_R_FireManC_1_0_Wait_0805fa1c

PTR_R_FireManC_1_0_Wait_0805fa1c:
    .word R_FireManC_1_0_Wait
    .word R_FireManC_1_1_FireArm
    .word R_FireManC_1_2_Next


_ts R_FireManC_1_0_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_FireManC_1_0_0_Land_0805fa38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_FireManC_1_0_0_Land_0805fa38:
    .word PTR_R_FireManC_1_0_0_Land_0805fa3c

PTR_R_FireManC_1_0_0_Land_0805fa3c:
    .word R_FireManC_1_0_0_Land
    .word R_FireManC_1_0_1_Wait


_ts R_FireManC_1_0_0_Land
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805fa5c
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x2d
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fa5c:
    pop        {pc}


_nt R_FireManC_1_0_1_Wait
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805fa70
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fa70:
    pop        {pc}


_nt R_FireManC_1_1_FireArm
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_FireManC_1_1_0_Charge_0805fa80
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_FireManC_1_1_0_Charge_0805fa80:
    .word PTR_R_FireManC_1_1_0_Charge_0805fa84

PTR_R_FireManC_1_1_0_Charge_0805fa84:
    .word R_FireManC_1_1_0_Charge
    .word R_FireManC_1_1_1_ReachUp
    .word R_FireManC_1_1_2_FireArm
    .word R_FireManC_1_1_3_Wait
    .word R_FireManC_1_1_4_WarpOut


_ts R_FireManC_1_1_0_Charge
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_FireManC_1_1_1_ReachUp
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805faba
    mov        r0,#0x8
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805faba:
    pop        {pc}


_ts R_FireManC_1_1_2_FireArm
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805fafa
    mov        r0,#0x9
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x78
    strh       r0,[r5,#Actor_counterA]
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r4,#0x0
    mov        r2,#0x2
    ldrh       r6,[r5,#Actor_damage]
    bl         Attack_FireArm_Create
    tst        r7,r7
    beq        LAB_0805faea
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0805faea:
    str        r7,[r5,#Actor_param_5C]
    mov        r0,#0x82
    bl         Sound_PlaySE
    mov        r0,#0xf
    strh       r0,[r5,#Actor_counterB]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fafa:
    pop        {pc}


_ts R_FireManC_1_1_3_Wait
    push       {lr}
    ldrh       r0,[r5,#Actor_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterB]
    bne        LAB_0805fb10
    mov        r0,#0x82
    bl         Sound_PlaySE
    mov        r0,#0xf
    strh       r0,[r5,#Actor_counterB]
LAB_0805fb10:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805fb2a
    mov        r0,#0xa
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldr        r7,[r5,#Actor_param_5C]
    tst        r7,r7
    beq        LAB_0805fb26
    mov        r0,#0x1
    strb       r0,[r7,#0x6]
LAB_0805fb26:
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fb2a:
    pop        {pc}


_ts R_FireManC_1_1_4_WarpOut
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805fb44
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fb44:
    pop        {pc}


_nt R_FireManC_1_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805fb62
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_0805fb62:
    pop        {pc}


_ts R_FireManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805fb7a
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_0805fb7a:
    pop        {pc}


_ts Routine_FireMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x16
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_0805fb96
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_0805fb96:
    pop        {pc}
