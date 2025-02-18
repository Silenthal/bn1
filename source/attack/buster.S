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
    ldrb       r0,[r5,#Attack_state_s0]
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
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    str        r7,[r5,#Attack_param_60]
    ldrb       r0,[r7,#0x0]
    add        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    FieldObject_Create PFI_Self_Default, Attack_param_64
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_Buster_1_Main
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_DAT_080711fc:
    .word DAT_08071190


_ts A_Buster_1_Main
    push       {lr}
    ldr        r0,[r5,#Attack_param_64]
    ldr        r0,[r0,#0x10]
    bl         FieldObject_UpdateField
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_08071248
    bl         A_Buster_IsContact
    tst        r0,r0
    bne        LAB_0807123a
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807123a
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#Attack_counterA]
    ldr        r1,[r5,#Attack_diff_x]
    ldrb       r0,[r5,#Attack_cPos_x]
    add        r0,r0,r1
    strb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
LAB_0807123a:
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_UpdateCellPosition
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    bne        LAB_0807124c
LAB_08071248:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
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
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_Buster_IsContact
    push       {lr}
    FieldObject_GetDamage PFI_Target_Solid, Attack_param_64
    tst        r0,r0
    beq        LAB_0807128a
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r0,[r7,#0x1]
    ldr        r3,[r5,#Attack_pos_curr_z]
    bl         Field_CreateBusterEffect
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
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
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
    mov        r0,#0x9
    strb       r0,[r7,#0x0]
LAB_080712ae:
    pop        {pc}
