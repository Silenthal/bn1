#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_FloshellMiniBomb
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_FloshellMiniBomb_0_Init_08074070
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellMiniBomb_0_Init_08074070:
    .word PTR_A_FloshellMiniBomb_0_Init_08074074

PTR_A_FloshellMiniBomb_0_Init_08074074:
    .word A_FloshellMiniBomb_0_Init
    .word A_FloshellMiniBomb_1_Main
    .word A_FloshellMiniBomb_2_Free


_ts A_FloshellMiniBomb_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x75
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0xff
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         A_FloshellMiniBomb_1_Main
    pop        {pc}


_nt A_FloshellMiniBomb_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_FloshellMiniBomb_1_0_080740c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellMiniBomb_1_0_080740c4:
    .word PTR_A_FloshellMiniBomb_1_0_080740c8

PTR_A_FloshellMiniBomb_1_0_080740c8:
    .word A_FloshellMiniBomb_1_0


_ts A_FloshellMiniBomb_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740dc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740dc:
    .word PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740e0

PTR_A_FloshellMiniBomb_1_0_0_SetGravity_080740e0:
    .word A_FloshellMiniBomb_1_0_0_SetGravity
    .word A_FloshellMiniBomb_1_0_1_Explode
    .word A_FloshellMiniBomb_1_0_2_Next


_ts A_FloshellMiniBomb_1_0_0_SetGravity
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
    ldr        r1,DAT_0807413c
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
    ldr        r4,DAT_0807413c
    ldr        r6,DAT_08074138
    bl         Field_CalculateTrajectoryZ
    str        r0,[r5,#Attack_diff_z]
    strh       r1,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}

    .align 2, 0


DAT_08074138:
    .word 0xFFFFE000

DAT_0807413c:
    .word 0x1E000


_ts A_FloshellMiniBomb_1_0_1_Explode
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08074188
    ldrb       r0,[r5,#Attack_family_b2]
    ldrb       r1,[r5,#Attack_family_b3]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807415e
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741a8
LAB_0807415e:
    ldrb       r0,[r5,#Attack_family_b2]
    strb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_family_b3]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    push       {r5}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
    mov        r6,#0x28
    bl         Effect_BombExplosion_Create
    pop        {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741a8
LAB_08074188:
    ldr        r0,[r5,#Attack_diff_z]
    ldr        r1,DAT_080741ac
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
LAB_080741a8:
    pop        {pc}

    .align 2, 0


DAT_080741ac:
    .word 0xFFFFE000


_ts A_FloshellMiniBomb_1_0_2_Next
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080741c6
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741de
LAB_080741c6:
    mov        r1,#0x30
    tst        r0,r1
    beq        LAB_080741d2
    bl         A_FloshellMiniBomb_2_Free
    b          LAB_080741de
LAB_080741d2:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080741de
    bl         A_FloshellMiniBomb_2_Free
LAB_080741de:
    pop        {pc}


_ts A_FloshellMiniBomb_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_FloshellMiniBomb_Create
    push       {r5,lr}
    push       {r5}
    mov        r0,#0x2a
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    tst        r7,r7
    beq        LAB_080741fe
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_080741fe:
    pop        {r5,pc}
