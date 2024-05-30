#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_08071190:
    .byte 0x01
    .byte 0x09
    .byte 0x01
    .byte 0x19
    .byte 0x01
    .byte 0x07
    .byte 0x01
    .byte 0x08


_ts Attack_Buster
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Buster_0_Init_080711a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Buster_0_Init_080711a8:
    .word PTR_A_Buster_0_Init_080711ac

PTR_A_Buster_0_Init_080711ac:
    .word A_Buster_0_Init
    .word A_Buster_1_Main
    .word A_Buster_2_Free


_ts A_Buster_0_Init
    push       {lr}
    ldr        r7,PTR_DAT_080711fc
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x1
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_Buster_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_DAT_080711fc:
    .word DAT_08071190


_ts A_Buster_1_Main
    push       {lr}
    ldr        r0,[r5,#0x64]
    ldr        r0,[r0,#0x10]
    bl         FieldObject_UpdateField
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_08071248
    bl         A_Buster_IsContact
    tst        r0,r0
    bne        LAB_0807123a
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807123a
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#0x1c]
    ldr        r1,[r5,#0x44]
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r1
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
LAB_0807123a:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_UpdateCellPosition
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    bne        LAB_0807124c
LAB_08071248:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807124c:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word DAT_08071254

DAT_08071254:
    .byte 0x01
    .byte -1


_nt A_Buster_2_Free
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_Buster_IsContact
    push       {lr}
    mov        r0,#0x2
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0807128a
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x1]
    ldr        r3,[r5,#0x30]
    bl         Field_CreateBusterEffect
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0807128a:
    mov        r0,#0x0
    pop        {pc}


_nt Attack_Buster_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x12
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_080712ae
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    mov        r0,#0x9
    strb       r0,[r7,#0x0]
LAB_080712ae:
    pop        {pc}
