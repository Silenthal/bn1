#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BassExplosion_Chip
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_BassExplosionC_0_Init_0807ac88
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BassExplosionC_0_Init_0807ac88:
    .word PTR_A_BassExplosionC_0_Init_0807ac8c

PTR_A_BassExplosionC_0_Init_0807ac8c:
    .word A_BassExplosionC_0_Init
    .word A_BassExplosionC_1_Main
    .word A_BassExplosionC_2_Free


_ts A_BassExplosionC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xcb
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_family_b1]
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#Attack_family_b2]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x7
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterA]
    strb       r0,[r5,#Attack_bc]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    mov        r0,#0xe0
    bl         Sound_PlaySE
    bl         A_BassExplosionC_1_Main
    pop        {pc}


_ts A_BassExplosionC_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_bc]
    tst        r0,r0
    bne        LAB_0807ad0c
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldr        r7,PTR_PanelFlag_ARRAY_0807ad4c
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r1,r0
    beq        LAB_0807ad0c
    mov        r0,#0x1
    strb       r0,[r5,#Attack_bc]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldr        r7,[r5,#Attack_param_68]
    bl         FUN_0806e30a
LAB_0807ad0c:
    ldrh       r0,[r5,#Attack_counterA]
    add        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    ldrb       r1,[r5,#Attack_bd]
    cmp        r0,r1
    bne        LAB_0807ad38
    ldrb       r0,[r5,#Attack_family_family]
    sub        r0,#0x1
    bl         A_BassExplosionC_CheckNextPanel
    cmp        r0,#0xff
    beq        LAB_0807ad38
    ldrh       r2,[r5,#Attack_damage]
    ldrb       r3,[r5,#Attack_owner]
    ldrb       r4,[r5,#Attack_family_family]
    ldrb       r6,[r5,#Attack_bd]
    bl         Attack_BassExplosion_Chip_Create
    tst        r7,r7
    beq        LAB_0807ad38
    ldr        r0,[r5,#Attack_param_68]
    str        r0,[r7,#0x68]
LAB_0807ad38:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807ad4a
    mov        r0,#0x8
    strh       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807ad4a:
    pop        {pc}

PTR_PanelFlag_ARRAY_0807ad4c:
    .word PanelFlag_ARRAY_0807ad50

PanelFlag_ARRAY_0807ad50:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


_ts A_BassExplosionC_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts A_BassExplosionC_CheckNextPanel
    push       {lr}
    sub        sp,#0x8
    ldr        r7,PTR_CellPosition_ARRAY_0807ad9c
    add        r0,r0,r0
    add        r7,r7,r0
    mov        r2,#0x0
    ldrsb      r2,[r7,r2]
    mov        r3,#0x1
    ldrsb      r3,[r7,r3]
    ldrb       r0,[r5,#Attack_cPos_x]
    add        r0,r0,r2
    str        r0,[sp,#0x0]
    ldrb       r1,[r5,#Attack_cPos_y]
    add        r1,r1,r3
    str        r1,[sp,#0x4]
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    beq        LAB_0807ad8a
    mov        r0,#0xff
    str        r0,[sp,#0x0]
LAB_0807ad8a:
    ldr        r0,[sp,#0x0]
    ldr        r1,[sp,#0x4]
    add        sp,#0x8
    pop        {pc}

CellPosition_ARRAY_0807ad92:
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0

    .align 2, 0


PTR_CellPosition_ARRAY_0807ad9c:
    .word CellPosition_ARRAY_0807ad92


_ts Attack_BassExplosion_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x58
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_0807adca
    strh       r2,[r7,#0x24]
    strb       r3,[r7,#0x16]
    strb       r6,[r7,#0xd]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0807adca:
    pop        {pc}
