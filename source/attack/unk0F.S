#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Unk0F
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Unk0F_0_Init_08070a54
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_A_Unk0F_0_Init_08070a48:
    .word A_Unk0F_0_Init
    .word A_Unk0F_1_Main
    .word A_Unk0F_2_Free

PTR_PTR_A_Unk0F_0_Init_08070a54:
    .word PTR_A_Unk0F_0_Init_08070a48


_ts A_Unk0F_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_08070a9c
    mov        r0,#0x30
    strb       r0,[r5,#Attack_family_b2]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterB]
    add        r6,r5,#0x0
    mov        r0,#0xf
    mov        r4,#0x1
    bl         Attack_Alloc
    str        r5,[r6,#0x60]
    mov        r0,#0xf
    mov        r4,#0x2
    bl         Attack_Alloc
    str        r5,[r6,#0x64]
    mov        r0,#0xf
    mov        r4,#0x3
    bl         Attack_Alloc
    str        r5,[r6,#0x68]
    add        r5,r6,#0x0
    FieldObject_Create PFI_Self_Default, Attack_param_6C
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_Disable
    b          LAB_08070ac0
LAB_08070a9c:
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xdc
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    ldrb       r0,[r5,#Attack_family_family]
    sub        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0xff
    strb       r0,[r5,#Attack_frameIndexLast]
LAB_08070ac0:
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    pop        {pc}


_nt A_Unk0F_1_Main
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Unk0F_1_0_08070afc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         FUN_08070c88
    ldrb       r0,[r5,#Attack_family_b2]
    bl         FUN_08070c4c
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    beq        LAB_08070aec
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_state_s1]
LAB_08070aec:
    pop        {pc}

    .align 2, 0


PTR_A_Unk0F_1_0_08070af0:
    .word A_Unk0F_1_0
    .word A_Unk0F_1_1
    .word A_Unk0F_1_2

PTR_PTR_A_Unk0F_1_0_08070afc:
    .word PTR_A_Unk0F_1_0_08070af0


_ts A_Unk0F_1_0
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_08070b2e
    ldrb       r0,[r5,#Attack_family_b2]
    sub        r0,#0x1
    strb       r0,[r5,#Attack_family_b2]
    cmp        r0,#0x4
    bpl        LAB_08070b22
    mov        r0,#0x4
    strb       r0,[r5,#Attack_family_b2]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x5
    strh       r0,[r5,#Attack_counterB]
LAB_08070b22:
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    beq        LAB_08070b2e
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
LAB_08070b2e:
    pop        {pc}


_ts A_Unk0F_1_1
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_08070b88
    ldrh       r0,[r5,#Attack_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    bne        LAB_08070b4a
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    pop        {pc}
LAB_08070b4a:
    ldrh       r0,[r5,#Attack_counterA]
    add        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    mov        r6,#0x60
    add        r6,r6,r5
    mov        r3,#0x0
LAB_08070b56:
    ldr        r7,[r6,#0x0]
    tst        r7,r7
    beq        LAB_08070b74
    push       {r5}
    ldrh       r0,[r5,#Attack_counterA]
    mov        r1,#0x2
    add        r5,r7,#0x0
    and        r0,r1
    bne        LAB_08070b6e
    bl         SpritePtr_DisableFlash
    b          LAB_08070b72
LAB_08070b6e:
    bl         SpritePtr_EnableFlash
LAB_08070b72:
    pop        {r5}
LAB_08070b74:
    add        r6,#0x4
    add        r3,#0x1
    cmp        r3,#0x3
    bne        LAB_08070b56
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    beq        LAB_08070b88
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
LAB_08070b88:
    pop        {pc}


_ts A_Unk0F_1_2
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_08070be2
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_08070bc2
    mov        r0,#0x5
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x18]
    strb       r1,[r5,#Attack_cPos_x]
    ldrb       r2,[r7,#0x19]
    strb       r2,[r5,#Attack_cPos_y]
    ldr        r0,[r5,#Attack_param_6C]
    strb       r1,[r0,#0x2]
    strb       r1,[r0,#0x4]
    strb       r2,[r0,#0x3]
    strb       r2,[r0,#0x5]
    mov        r1,#0xd
    strh       r1,[r0,#0x8]
    bl         FieldObject_Enable
LAB_08070bc2:
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    beq        LAB_08070bd0
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_08070bd0:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08070bde
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_08070bde:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
LAB_08070be2:
    pop        {pc}


_ts A_Unk0F_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_08070c14
    mov        r6,#0x60
    add        r6,r6,r5
    mov        r3,#0x0
LAB_08070bf2:
    ldr        r7,[r6,#0x0]
    tst        r7,r7
    beq        LAB_08070c02
    push       {r5}
    add        r5,r7,#0x0
    bl         Attack_Free
    pop        {r5}
LAB_08070c02:
    add        r6,#0x4
    add        r3,#0x1
    cmp        r3,#0x3
    bne        LAB_08070bf2
    ldr        r0,[r5,#Attack_param_6C]
    bl         FieldObject_Free
    bl         Attack_Free
LAB_08070c14:
    pop        {pc}


_nt FUN_08070c16
    push       {lr}
    tst        r1,r1
    beq        LAB_08070c22
    cmp        r1,#0x1
    beq        LAB_08070c2c
    b          LAB_08070c3a
LAB_08070c22:
    add        r1,r0,#0x0
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r0,#0x0
    pop        {pc}
LAB_08070c2c:
    add        r1,r0,#0x0
    asr        r1,r1,#0x1
    lsl        r1,r1,#0x10
    ldr        r2,DAT_08070c48
    mul        r0,r2
    neg        r0,r0
    pop        {pc}
LAB_08070c3a:
    add        r1,r0,#0x0
    asr        r1,r1,#0x1
    lsl        r1,r1,#0x10
    ldr        r2,DAT_08070c48
    mul        r0,r2
    pop        {pc}

    .align 2, 0


DAT_08070c48:
    .word 0xDDB3


_ts FUN_08070c4c
    push       {lr}
    ldrb       r1,[r5,#Attack_family_family]
    tst        r1,r1
    bne        LAB_08070c86
    mov        r6,#0x60
    add        r6,r6,r5
    mov        r3,#0x0
LAB_08070c5a:
    ldr        r7,[r6,#0x0]
    tst        r7,r7
    beq        LAB_08070c7c
    push       {r0}
    ldrb       r1,[r7,#0x4]
    sub        r1,#0x1
    bl         FUN_08070c16
    ldr        r2,[r5,#Attack_pos_curr_x]
    add        r2,r2,r0
    str        r2,[r7,#0x28]
    ldr        r2,[r5,#Attack_pos_curr_y]
    str        r2,[r7,#0x2c]
    ldr        r2,[r5,#Attack_pos_curr_z]
    sub        r2,r2,r1
    str        r2,[r7,#0x30]
    pop        {r0}
LAB_08070c7c:
    str        r7,[r6,#0x0]
    add        r6,#0x4
    add        r3,#0x1
    cmp        r3,#0x3
    bne        LAB_08070c5a
LAB_08070c86:
    pop        {pc}


_ts FUN_08070c88
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_08070cce
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    bne        LAB_08070cc0
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x3
    ldr        r7,[r5,#Attack_param_60]
    strb       r0,[r7,#0x0]
    ldr        r7,[r5,#Attack_param_64]
    strb       r0,[r7,#0x0]
    ldr        r7,[r5,#Attack_param_68]
    strb       r0,[r7,#0x0]
    pop        {pc}
LAB_08070cc0:
    mov        r0,#0x1
    ldr        r7,[r5,#Attack_param_60]
    strb       r0,[r7,#0x0]
    ldr        r7,[r5,#Attack_param_64]
    strb       r0,[r7,#0x0]
    ldr        r7,[r5,#Attack_param_68]
    strb       r0,[r7,#0x0]
LAB_08070cce:
    pop        {pc}


_ts Attack_Unk0F_Create
    push       {lr}
    push       {r0,r1,r2,r3}
    mov        r0,#0xf
    bl         Attack_Alloc
    pop        {r0,r1,r2,r3}
    tst        r5,r5
    beq        LAB_08070cf0
    strb       r1,[r5,#Attack_cPos_x]
    strb       r2,[r5,#Attack_cPos_y]
    strb       r0,[r5,#Attack_family_b1]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_family_family]
    strb       r3,[r5,#Attack_owner]
    mov        r0,#0x9
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_08070cf0:
    pop        {pc}
