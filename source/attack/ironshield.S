#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_IronShield
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_IronShield_0_Init_08076de8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_IronShield_0_Init_08076de8:
    .word PTR_A_IronShield_0_Init_08076dec

PTR_A_IronShield_0_Init_08076dec:
    .word A_IronShield_0_Init
    .word A_IronShield_1_Main
    .word A_IronShield_2_Free


_ts A_IronShield_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x9a
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#Attack_owner]
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x8
    lsl        r1,r1,#0x10
    mul        r0,r1
    str        r0,[r5,#Attack_diff_x]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    FieldObject_Create PFI_Self_Extension_Armored, Attack_param_60
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts A_IronShield_1_Main
    push       {lr}
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_DisableIfDeleted
    bl         SpritePtr_DisableFlash
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_08076eac
    FieldObject_GetDamage PFI_Target_Object, Attack_param_60
    ldr        r1,PanelFlag_08076ed8
    tst        r0,r1
    bne        LAB_08076e9a
    mov        r1,#0xc0
    tst        r0,r1
    beq        LAB_08076eac
    ldrb       r0,[r5,#Attack_family_b1]
    lsr        r0,r0,#0x2
    bcs        LAB_08076e90
    ldr        r7,[r5,#Attack_param_68]
    tst        r7,r7
    beq        LAB_08076e90
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    str        r0,[r5,#Attack_param_68]
LAB_08076e90:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    b          LAB_08076eac
LAB_08076e9a:
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076eac:
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_IronShield_1_0_08076ec4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_IronShield_1_0_08076ec4:
    .word PTR_A_IronShield_1_0_08076ec8

PTR_A_IronShield_1_0_08076ec8:
    .word A_IronShield_1_0
    .word A_IronShield_1_1
    .word A_IronShield_1_2
    .word A_IronShield_1_3

PanelFlag_08076ed8:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid


_ts A_IronShield_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08076efa
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076efa:
    pop        {pc}


_ts A_IronShield_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    lsr        r0,r0,#0x2
    bcc        LAB_08076f18
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    pop        {pc}
LAB_08076f18:
    ldrb       r0,[r5,#Attack_family_b1]
    lsr        r0,r0,#0x1
    bcc        LAB_08076f26
    mov        r0,#0x0
    strb       r0,[r5,#Attack_family_b1]
    bl         SpritePtr_EnableFlash
LAB_08076f26:
    pop        {pc}


_ts A_IronShield_1_2
    push       {lr}
    ldr        r0,[r5,#Attack_pos_curr_x]
    ldr        r1,[r5,#Attack_diff_x]
    add        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_x]
    ldr        r1,[r5,#Attack_pos_curr_y]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    bne        LAB_08076f56
    mov        r0,#0x2
    strb       r0,[r5,#Attack_frameIndexCurr]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08076f56:
    pop        {pc}


_ts A_IronShield_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08076f68
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08076f68:
    pop        {pc}


_nt A_IronShield_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_family_b1]
    lsr        r0,r0,#0x2
    bcs        LAB_08076f7c
    ldr        r7,[r5,#Attack_param_68]
    tst        r7,r7
    beq        LAB_08076f7c
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_08076f7c:
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_IronShield_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x3d
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_08076fa8
    str        r7,[r0,#0x0]
    str        r0,[r7,#0x68]
    str        r5,[r7,#0x64]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_08076fa8:
    pop        {pc}

    .align 2, 0

