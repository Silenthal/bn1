#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_ElecMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_ElecManC_0_Init_0806a618
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecManC_0_Init_0806a618:
    .word PTR_R_ElecManC_0_Init_0806a61c

PTR_R_ElecManC_0_Init_0806a61c:
    .word R_ElecManC_0_Init
    .word R_ElecManC_1_Main
    .word R_ElecManC_2_Free


_ts R_ElecManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x5a
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
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_element]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_ElecManC_1_Main
    pop        {pc}


_ts R_ElecManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_ElecManC_1_0_0806a68c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecManC_1_0_0806a68c:
    .word PTR_R_ElecManC_1_0_0806a690

PTR_R_ElecManC_1_0_0806a690:
    .word R_ElecManC_1_0
    .word R_ElecManC_1_1
    .word R_ElecManC_1_2


_ts R_ElecManC_1_0
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_ElecManC_1_0_0_0806a6ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecManC_1_0_0_0806a6ac:
    .word PTR_R_ElecManC_1_0_0_0806a6b0

PTR_R_ElecManC_1_0_0_0806a6b0:
    .word R_ElecManC_1_0_0
    .word R_ElecManC_1_0_1


_ts R_ElecManC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a6d0
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0806a6d0:
    pop        {pc}


_nt R_ElecManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806a6e4
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806a6e4:
    pop        {pc}


_nt R_ElecManC_1_1
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_ElecManC_1_1_0_0806a6f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ElecManC_1_1_0_0806a6f4:
    .word PTR_R_ElecManC_1_1_0_0806a6f8

PTR_R_ElecManC_1_1_0_0806a6f8:
    .word R_ElecManC_1_1_0
    .word R_ElecManC_1_1_1
    .word R_ElecManC_1_1_2
    .word R_ElecManC_1_1_3
    .word R_ElecManC_1_1_4


_ts R_ElecManC_1_1_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_ElecManC_1_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a734
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    bl         R_ElecManC_HitTargets
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0806a734:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x04
    .byte 0x89

    .align 2, 0



_ts R_ElecManC_1_1_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806a74e
    mov        r0,#0x6
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0806a74e:
    pop        {pc}


_ts R_ElecManC_1_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a764
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_0806a764:
    pop        {pc}


_nt R_ElecManC_1_1_4
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806a77c
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806a77c:
    pop        {pc}


_nt R_ElecManC_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a79a
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_0806a79a:
    pop        {pc}


_ts R_ElecManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806a7b2
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_0806a7b2:
    pop        {pc}


_ts R_ElecManC_HitTargets
    push       {lr}
    ldrb       r0,[r5,#Actor_owner]
    tst        r0,r0
    bne        LAB_0806a7ec
    LoadMain battle, r7, r7
    add        r7,#0x54
    mov        r2,#0xc
    mov        r4,#0x80
    ldrh       r6,[r5,#Actor_damage]
LAB_0806a7c8:
    ldr        r3,[r7,r2]
    tst        r3,r3
    beq        LAB_0806a7e6
    push       {r2,r4,r6,r7}
    ldrb       r1,[r3,#0x18]
    ldrb       r2,[r3,#0x19]
    bl         Attack_SparkStrike_Create
    add        r3,r7,#0x0
    pop        {r2,r4,r6,r7}
    beq        LAB_0806a7e6
    ldrb       r0,[r3,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r3,#0x0]
LAB_0806a7e6:
    sub        r2,#0x4
    bpl        LAB_0806a7c8
    pop        {pc}
LAB_0806a7ec:
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    tst        r7,r7
    beq        LAB_0806a80e
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    mov        r4,#0x80
    ldrh       r6,[r5,#Actor_damage]
    bl         Attack_SparkStrike_Create
    tst        r7,r7
    beq        LAB_0806a80e
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806a80e:
    pop        {pc}


_ts Routine_ElecMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x3e
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_0806a82a
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_0806a82a:
    pop        {pc}
