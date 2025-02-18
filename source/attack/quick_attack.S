#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_QuickAttack
    push       {lr}
    ldr        r7,PTR_PTR_A_QuickAttack_0_Init_08071864
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_QuickAttack_0_Init_08071858:
    .word A_QuickAttack_0_Init
    .word A_QuickAttack_1_Main
    .word A_QuickAttack_2_Free

PTR_PTR_A_QuickAttack_0_Init_08071864:
    .word PTR_A_QuickAttack_0_Init_08071858


_ts A_QuickAttack_0_Init
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Attack_canBeDamaged]
    bl         FieldObject_Alloc
    ldr        r1,[r5,#Attack_param_60]
    strh       r1,[r0,#FieldObject_damage]
    ldr        r1,[r5,#Attack_param_64]
    str        r1,[r0,#FieldObject_panelFlags]
    ldrb       r1,[r5,#Attack_cPos_x]
    strb       r1,[r0,#FieldObject_cPosCurr_x]
    strb       r1,[r0,#FieldObject_cPosLast_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    strb       r1,[r0,#FieldObject_cPosCurr_y]
    strb       r1,[r0,#FieldObject_cPosLast_y]
    ldrb       r1,[r5,#Attack_element]
    strb       r1,[r0,#FieldObject_element]
    str        r0,[r5,#Attack_param_68]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         A_QuickAttack_1_Main
    pop        {pc}


_nt A_QuickAttack_1_Main
    push       {lr}
    ldr        r0,[r5,#Attack_param_68]
    bl         FieldObject_DisableIfDeleted
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    beq        LAB_080718c0
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldr        r7,PTR_targetPanelFlag_080718cc
    ldrb       r2,[r5,#Attack_owner]
    lsl        r2,r2,#0x2
    ldr        r2,[r7,r2]
    tst        r0,r2
    beq        LAB_080718ca
LAB_080718c0:
    ldr        r0,[r5,#Attack_param_68]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
LAB_080718ca:
    pop        {pc}

PTR_targetPanelFlag_080718cc:
    .word targetPanelFlag

targetPanelFlag:
    .word PF_EnemyOccupied
    .word PF_PlayerOccupied


_ts A_QuickAttack_2_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_68]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt Attack_QuickAttack_Create
    push       {lr}
    push       {r0,r1,r2,r3,r4,r6,r7}
    mov        r0,#0x18
    bl         Attack_Alloc
    pop        {r0,r1,r2,r3,r4,r6,r7}
    tst        r5,r5
    beq        LAB_08071908
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    strb       r2,[r5,#Attack_owner]
    str        r3,[r5,#Attack_param_60]
    str        r4,[r5,#Attack_param_64]
    strb       r6,[r5,#Attack_element]
    strh       r7,[r5,#Attack_counterA]
    mov        r0,#0x9
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_08071908:
    pop        {pc}

    .align 2, 0

