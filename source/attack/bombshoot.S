#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BombShoot
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_BombShoot_0_Init_0807aa08
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BombShoot_0_Init_0807aa08:
    .word PTR_A_BombShoot_0_Init_0807aa0c

PTR_A_BombShoot_0_Init_0807aa0c:
    .word A_BombShoot_0_Init
    .word A_BombShoot_1_Main
    .word A_BombShoot_2_Free


_ts A_BombShoot_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xab
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x7
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_canBeDamaged]
    strb       r0,[r5,#Attack_bc]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         A_BombShoot_1_Main
    pop        {pc}


_ts A_BombShoot_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_BombShoot_1_0_0807aa60
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_BombShoot_1_0_0807aa60:
    .word PTR_A_BombShoot_1_0_0807aa64

PTR_A_BombShoot_1_0_0807aa64:
    .word A_BombShoot_1_0
    .word A_BombShoot_1_1
    .word A_BombShoot_1_2
    .word PF_Player | PF_Enemy


_ts A_BombShoot_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_0807aa86
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    b          LAB_0807aa98
LAB_0807aa86:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807aa98
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807aa98:
    pop        {pc}


_nt A_BombShoot_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_0807aaa8
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    b          LAB_0807aab6
LAB_0807aaa8:
    ldrb       r0,[r5,#Attack_bc]
    tst        r0,r0
    beq        LAB_0807aab6
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807aab6:
    pop        {pc}


_ts A_BombShoot_1_2
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_BombShoot_1_2_0_0807aad4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_BombShoot_1_2_0_0807aac8:
    .word A_BombShoot_1_2_0
    .word A_BombShoot_1_2_1
    .word A_BombShoot_1_2_2

PTR_PTR_A_BombShoot_1_2_0_0807aad4:
    .word PTR_A_BombShoot_1_2_0_0807aac8


_ts A_BombShoot_1_2_0
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b2]
    ldrb       r1,[r5,#Attack_family_b3]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    ldr        r3,DAT_0807ab04
    str        r3,[r5,#Attack_diff_z]
    ldr        r4,DAT_0807ab00
    bl         Field_CalculateTrajectoryXY
    strh       r0,[r5,#Attack_counterA]
    str        r1,[r5,#Attack_diff_x]
    str        r2,[r5,#Attack_diff_y]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    pop        {pc}

DAT_0807ab00:
    .word 0xFFFFE800

DAT_0807ab04:
    .word 0x28000
    .word PF_Sealed


_ts A_BombShoot_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807ab4c
    ldrb       r0,[r5,#Attack_family_b2]
    ldrb       r1,[r5,#Attack_family_b3]
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r2,#0x0
    str        r2,[r5,#Attack_pos_curr_z]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807ab3e
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    b          LAB_0807ab70
LAB_0807ab3e:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x3c
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x3
    strh       r0,[r5,#Attack_frameIndexCurr]
    b          LAB_0807ab70
LAB_0807ab4c:
    ldr        r0,[r5,#Attack_diff_z]
    ldr        r1,DAT_0807ab74
    add        r0,r0,r1
    str        r0,[r5,#Attack_diff_z]
    ldr        r0,[r5,#Attack_diff_x]
    ldr        r1,[r5,#Attack_pos_curr_x]
    add        r1,r1,r0
    str        r1,[r5,#Attack_pos_curr_x]
    ldr        r0,[r5,#Attack_diff_y]
    ldr        r1,[r5,#Attack_pos_curr_y]
    add        r1,r1,r0
    str        r1,[r5,#Attack_pos_curr_y]
    ldr        r0,[r5,#Attack_diff_z]
    ldr        r1,[r5,#Attack_pos_curr_z]
    add        r1,r1,r0
    str        r1,[r5,#Attack_pos_curr_z]
    bl         R_Actor_UpdateCellPos
LAB_0807ab70:
    pop        {pc}

    .align 2, 0


DAT_0807ab74:
    .word 0xFFFFE800


_ts A_BombShoot_1_2_2
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807abbc
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807abb8
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x1
    mov        r2,#0x2
    and        r2,r0
    eor        r1,r2
    beq        LAB_0807abb8
    mov        r3,#0x2
    and        r3,r0
    lsr        r3,r3,#0x1
    mov        r0,#0x1
    eor        r3,r0
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldrh       r2,[r5,#Attack_damage]
    mov        r4,#0x0
    bl         Effect_BombShootExplosion_Create
    b          LAB_0807abbc
LAB_0807abb8:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
LAB_0807abbc:
    pop        {pc}


_nt A_BombShoot_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_BombShoot_2_0_0807abd8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_BombShoot_2_0_0807abcc:
    .word A_BombShoot_2_0
    .word A_BombShoot_2_1
    .word A_BombShoot_2_2

PTR_PTR_A_BombShoot_2_0_0807abd8:
    .word PTR_A_BombShoot_2_0_0807abcc


_ts A_BombShoot_2_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x5
    strb       r0,[r5,#Attack_header_entityFlags]
    pop        {pc}


_ts A_BombShoot_2_1
    push       {lr}
    mov        r0,#0x0
    ldr        r6,[r5,#Attack_param_68]
    str        r0,[r6,#0x0]
    bl         Attack_Free
    pop        {pc}


_nt A_BombShoot_2_2
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_pos_curr_y]
    ldr        r3,[r5,#Attack_pos_curr_z]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0807ac0e
    mov        r0,#0xd
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_0807ac0e:
    pop        {r5}
    mov        r0,#0x5
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    pop        {pc}


_nt Attack_BombShoot_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x57
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0807ac62
    ldrb       r3,[r5,#Attack_owner]
    strb       r3,[r7,#0x16]
    str        r7,[r2,#0x0]
    str        r2,[r7,#0x68]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    ldrb       r2,[r7,#0x4]
    cmp        r2,#0x1
    bne        LAB_0807ac56
    push       {r0,r1}
    ldrb       r0,[r7,#0x16]
    bl         Field_GetAttackDirectionOffset
    mov        r2,#0x12
    lsl        r2,r2,#0x10
    mul        r2,r0
    pop        {r0,r1}
    add        r0,r0,r2
LAB_0807ac56:
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0807ac62:
    add        r0,r7,#0x0
    pop        {pc}


_nt A_BombShoot_SetTarget
    strb       r0,[r7,#0x6]
    strb       r1,[r7,#0x7]
    mov        r0,#0x1
    strb       r0,[r7,#0xc]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
    mov        pc,lr
