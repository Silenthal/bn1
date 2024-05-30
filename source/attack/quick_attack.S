#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_QuickAttack
    push       {lr}
    ldr        r7,PTR_PTR_A_QuickAttack_0_Init_08071864
    ldrb       r0,[r5,#0x8]
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
    strb       r0,[r5,#0x17]
    bl         FieldObject_Alloc
    ldr        r1,[r5,#0x60]
    strh       r1,[r0,#0x8]
    ldr        r1,[r5,#0x64]
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x18]
    strb       r1,[r0,#0x2]
    strb       r1,[r0,#0x4]
    ldrb       r1,[r5,#0x19]
    strb       r1,[r0,#0x3]
    strb       r1,[r0,#0x5]
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r0,#0x6]
    str        r0,[r5,#0x68]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_QuickAttack_1_Main
    pop        {pc}


_nt A_QuickAttack_1_Main
    push       {lr}
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfHitFlagSet
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_080718c0
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldr        r7,PTR_targetPanelFlag_080718cc
    ldrb       r2,[r5,#0x16]
    lsl        r2,r2,#0x2
    ldr        r2,[r7,r2]
    tst        r0,r2
    beq        LAB_080718ca
LAB_080718c0:
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
LAB_080718ca:
    pop        {pc}

PTR_targetPanelFlag_080718cc:
    .word targetPanelFlag

targetPanelFlag:
    .word PF_EnemyOccupied
    .word PF_PlayerOccupied


_ts A_QuickAttack_2_Free
    push       {lr}
    ldr        r0,[r5,#0x68]
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
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    strb       r2,[r5,#0x16]
    str        r3,[r5,#0x60]
    str        r4,[r5,#0x64]
    strb       r6,[r5,#0x1a]
    strh       r7,[r5,#0x1c]
    mov        r0,#0x9
    strb       r0,[r5,#0x0]
LAB_08071908:
    pop        {pc}

    .align 2, 0

