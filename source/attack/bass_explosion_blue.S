#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BassExplosionBlue
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_BassExplosionBlue_0_Init_08079eec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BassExplosionBlue_0_Init_08079eec:
    .word PTR_A_BassExplosionBlue_0_Init_08079ef0

PTR_A_BassExplosionBlue_0_Init_08079ef0:
    .word A_BassExplosionBlue_0_Init
    .word A_BassExplosionBlue_1_Main
    .word A_BassExplosionBlue_2_Free


_ts A_BassExplosionBlue_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xcb
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x2
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    FieldObject_Create 0x3, Attack_param_64
    mov        r0,#0xe0
    bl         Sound_PlaySE
    pop        {pc}


_ts A_BassExplosionBlue_1_Main
    push       {lr}
    ldr        r7,[r5,#Attack_param_68]
    ldrb       r0,[r7,#0x10]
    tst        r0,r0
    beq        LAB_08079f78
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08079f7c
    ldrb       r0,[r5,#Attack_bc]
    sub        r0,#0x1
    strb       r0,[r5,#Attack_bc]
    beq        LAB_08079f78
    bl         A_BassExplosionBlue_GetNextPanel
    ldrh       r2,[r5,#Attack_damage]
    ldrb       r3,[r5,#Attack_bc]
    ldr        r4,[r5,#Attack_family_family]
    ldrb       r6,[r5,#Attack_bd]
    bl         Attack_BassExplosionBlue_Create
    tst        r7,r7
    beq        LAB_08079f78
    ldr        r0,[r5,#Attack_param_68]
    str        r0,[r7,#0x68]
LAB_08079f78:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08079f7c:
    pop        {pc}


_nt A_BassExplosionBlue_2_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_BassExplosionBlue_GetNextPanel
    push       {lr}
    ldrb       r2,[r5,#Attack_family_b3]
    add        r2,r2,r2
    ldr        r7,PTR_CellPosition_0807a008
    add        r7,r7,r2
    mov        r3,#0x0
    ldrsb      r0,[r7,r3]
    mov        r3,#0x1
    ldrsb      r1,[r7,r3]
    ldrb       r3,[r5,#Attack_cPos_x]
    add        r0,r0,r3
    ldrb       r3,[r5,#Attack_cPos_y]
    add        r1,r1,r3
    push       {r0,r1}
    bl         R_BassExplosionBlue_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08079ffe
    ldrb       r2,[r5,#Attack_family_b3]
    mov        r3,#0x1
    eor        r2,r3
    strb       r2,[r5,#Attack_family_b3]
    ldrb       r2,[r5,#Attack_family_b2]
    add        r2,r2,r2
    ldr        r7,PTR_CellPosition_0807a00c
    add        r7,r7,r2
    mov        r3,#0x0
    ldrsb      r0,[r7,r3]
    mov        r3,#0x1
    ldrsb      r1,[r7,r3]
    ldrb       r3,[r5,#Attack_cPos_x]
    add        r0,r0,r3
    ldrb       r3,[r5,#Attack_cPos_y]
    add        r1,r1,r3
    push       {r0,r1}
    bl         A_BassExplosionBlue_IsColumnOwned
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08079ffe
    ldrb       r2,[r5,#Attack_family_b2]
    mov        r3,#0x1
    eor        r2,r3
    strb       r2,[r5,#Attack_family_b2]
    ldrb       r2,[r5,#Attack_family_b2]
    add        r2,r2,r2
    ldr        r7,PTR_CellPosition_0807a00c
    add        r7,r7,r2
    mov        r3,#0x0
    ldrsb      r0,[r7,r3]
    mov        r3,#0x1
    ldrsb      r1,[r7,r3]
    ldrb       r3,[r5,#Attack_cPos_x]
    add        r0,r0,r3
    ldrb       r3,[r5,#Attack_cPos_y]
    add        r1,r1,r3
LAB_08079ffe:
    pop        {pc}

CellPosition_0807a000:
    cell_pos 0, -1
    cell_pos 0, 1

CellPosition_0807a004:
    cell_pos -1, 0
    cell_pos 1, 0

PTR_CellPosition_0807a008:
    .word CellPosition_0807a000

PTR_CellPosition_0807a00c:
    .word CellPosition_0807a004


_ts Attack_BassExplosionBlue_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x52
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_0807a03a
    strh       r2,[r7,#0x24]
    strb       r3,[r7,#0xc]
    strb       r6,[r7,#0xd]
    ldrb       r2,[r5,#Attack_owner]
    strb       r2,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_0807a03a:
    pop        {pc}


_ts R_BassExplosionBlue_IsOutOfBounds
    push       {lr}
    bl         Battle_IsOutOfBounds
    pop        {pc}


_ts A_BassExplosionBlue_IsColumnOwned
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0807a07a
    add        r3,r0,#0x0
    mov        r2,#0x2
    mov        r1,#0x1
    bl         FieldObject_GetPanelFlags
    and        r2,r0
    add        r0,r3,#0x0
    mov        r1,#0x2
    bl         FieldObject_GetPanelFlags
    and        r2,r0
    add        r0,r3,#0x0
    mov        r1,#0x3
    bl         FieldObject_GetPanelFlags
    and        r2,r0
    tst        r2,r2
    bne        LAB_0807a07a
    mov        r0,#0x0
    b          LAB_0807a07c
LAB_0807a07a:
    mov        r0,#0x1
LAB_0807a07c:
    pop        {pc}

    .align 2, 0

