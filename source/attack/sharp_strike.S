#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_SharpStrike
    push       {lr}
    ldr        r7,PTR_PTR_A_SharpStrike_0_Init_0807191c
    ldrb       r0,[r5,#0x8]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_PTR_A_SharpStrike_0_Init_0807191c:
    .word PTR_A_SharpStrike_0_Init_08071920

PTR_A_SharpStrike_0_Init_08071920:
    .word A_SharpStrike_0_Init
    .word A_SwordStrike_1_Main
    .word A_SharpStrike_2_Free


_ts A_SharpStrike_0_Init
    push       {lr}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    bne        LAB_08071944
    bl         Attack_Free
    pop        {pc}
LAB_08071944:
    ldrb       r0,[r5,#0x6]
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    beq        LAB_0807195a
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsSpread
LAB_0807195a:
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_SwordStrike_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_nt A_SwordStrike_1_Main
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x7]
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    bne        LAB_08071986
    ldrh       r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_08071992
    pop        {pc}
LAB_08071986:
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0xff
    beq        LAB_08071992
    ldr        r3,[r5,#0x30]
    bl         Field_CreateStrikeEffect
LAB_08071992:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    pop        {pc}


_nt A_SharpStrike_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_SharpStrike_Create
    push       {lr}
    push       {r0,r5,r6,r7}
    mov        r0,#0x19
    bl         Attack_Alloc
    add        r1,r5,#0x0
    pop        {r0,r5,r6,r7}
    tst        r1,r1
    beq        LAB_080719cc
    strb       r0,[r1,#0x1a]
    strh       r6,[r1,#0x24]
    strh       r7,[r1,#0x1c]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r1,#0x16]
    mov        r0,#0x9
    strb       r0,[r1,#0x0]
LAB_080719cc:
    pop        {pc}

    .align 2, 0

