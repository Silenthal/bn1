#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_PoweredCannon
    push       {lr}
    ldr        r7,PTR_PTR_A_PoweredCannon_0_Init_080716b0
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_A_PoweredCannon_0_Init_08071598:
    .word A_PoweredCannon_0_Init
    .word A_PoweredCannon_1
    .word A_PoweredCannon_2_Free
    .word A_PoweredCannon_3


_ts A_PoweredCannon_0_Init
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_PoweredCannon_1
    pop        {pc}

    .align 2, 0



_ts A_PoweredCannon_1
    push       {lr}
    mov        r0,#0x2
    bl         Field_GetPanelFlagGroup
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r2,[r5,#Attack_cPos_y]
    lsl        r2,r2,#0x8
    orr        r0,r2
    ldrb       r2,[r5,#Attack_element]
    mov        r3,#0x0
    mov        r4,#0x0
    bl         FieldObject_CalcDamage
    tst        r0,r0
    beq        LAB_080715e0
    mov        r0,#0xc
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_080715e0:
    ldrb       r0,[r5,#Attack_cPos_x]
    ldr        r1,[r5,#Attack_diff_x]
    add        r0,r0,r1
    strb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    beq        LAB_080715f4
    pop        {pc}
LAB_080715f4:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}


_nt A_PoweredCannon_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_nt A_PoweredCannon_3
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,DAT_08071674
    ldr        r6,[r5,#Attack_damage]
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    tst        r1,r1
    beq        LAB_08071626
    mov        r0,#0x1
    strb       r0,[r1,#0xb]
LAB_08071626:
    mov        r6,#0x10
LAB_08071628:
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldr        r7,PTR_CellPosition_ARRAY_08071670
    add        r3,r6,#0x0
    ldrsb      r2,[r7,r3]
    add        r3,#0x1
    ldrsb      r3,[r7,r3]
    add        r0,r0,r2
    add        r1,r1,r3
    push       {r0,r1,r6}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r6}
    beq        LAB_08071666
    push       {r5,r6}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#Attack_pos_curr_z]
    mov        r4,#0x1
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08071664
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_08071664:
    pop        {r5,r6}
LAB_08071666:
    sub        r6,#0x2
    bpl        LAB_08071628
    bl         Attack_Free
    pop        {pc}

PTR_CellPosition_ARRAY_08071670:
    .word CellPosition_ARRAY_08071678

DAT_08071674:
    .word 0x10019

CellPosition_ARRAY_08071678:
    cell_pos -1, -1
    cell_pos 0, -1
    cell_pos 1, -1
    cell_pos -1, 0
    cell_pos 0, 0
    cell_pos 1, 0
    cell_pos -1, 1
    cell_pos 0, 1
    cell_pos 1, 1


_nt Attack_PoweredCannon_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x16
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_080716ac
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strb       r0,[r7,#0x1a]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
    mov        r0,#0x9
    strb       r0,[r7,#0x0]
LAB_080716ac:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PoweredCannon_0_Init_080716b0:
    .word PTR_A_PoweredCannon_0_Init_08071598
