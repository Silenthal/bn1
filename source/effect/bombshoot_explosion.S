#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_BombShootExplosion
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_BombShootExplosion_0_Init_08081b28
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BombShootExplosion_0_Init_08081b28:
    .word PTR_E_BombShootExplosion_0_Init_08081b2c

PTR_E_BombShootExplosion_0_Init_08081b2c:
    .word E_BombShootExplosion_0_Init
    .word E_BombShootExplosion_1_Main
    .word E_BombShootExplosion_2_Free


_ts E_BombShootExplosion_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xcc
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strb       r0,[r5,#0xc]
    mov        r0,#0x2
    strb       r0,[r5,#0x1a]
    mov        r0,#0x76
    bl         Sound_PlaySE
    bl         E_BombShootExplosion_1_Main
    pop        {pc}


_nt E_BombShootExplosion_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldrb       r1,[r5,#0xc]
    tst        r1,r1
    beq        LAB_08081b8e
    b          LAB_08081ba2
LAB_08081b8e:
    ldr        r7,PTR_DAT_08081c04
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r1,r0
    beq        LAB_08081ba2
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    bl         E_BombShootExplosion_CreateHitEffect
LAB_08081ba2:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08081bb6
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08081c00
LAB_08081bb6:
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x8
    bne        LAB_08081c00
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08081bea
    mov        r0,#0x0
LAB_08081bc8:
    push       {r0}
    push       {r0}
    bl         E_BombShootExplosion_GetNextPos
    pop        {r4}
    cmp        r0,#0xff
    beq        LAB_08081be0
    ldrh       r2,[r5,#0x24]
    ldrb       r3,[r5,#0x16]
    add        r4,#0x1
    bl         Effect_BombShootExplosion_Create
LAB_08081be0:
    pop        {r0}
    add        r0,#0x1
    cmp        r0,#0x4
    blt        LAB_08081bc8
    b          LAB_08081c00
LAB_08081bea:
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x1
    bl         E_BombShootExplosion_GetNextPos
    cmp        r0,#0xff
    beq        LAB_08081c00
    ldrh       r2,[r5,#0x24]
    ldrb       r3,[r5,#0x16]
    ldrb       r4,[r5,#0x4]
    bl         Effect_BombShootExplosion_Create
LAB_08081c00:
    pop        {pc}

    .align 2, 0


PTR_DAT_08081c04:
    .word DAT_08081c08

DAT_08081c08:
    .byte 0x00
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x08

    .align 2, 0



_ts E_BombShootExplosion_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts E_BombShootExplosion_GetNextPos
    push       {lr}
    sub        sp,#0x8
    ldr        r7,PTR_CellPosition_ARRAY_08081c64
    add        r0,r0,r0
    add        r7,r7,r0
    mov        r2,#0x0
    ldrsb      r2,[r7,r2]
    mov        r3,#0x1
    ldrsb      r3,[r7,r3]
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
    str        r0,[sp,#0x0]
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r3
    str        r1,[sp,#0x4]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08081c4e
    mov        r1,#0x2
    and        r1,r0
    lsr        r1,r1,#0x1
    ldrb       r0,[r5,#0x16]
    eor        r0,r1
    beq        LAB_08081c4e
    b          LAB_08081c52
LAB_08081c4e:
    mov        r0,#0xff
    str        r0,[sp,#0x0]
LAB_08081c52:
    ldr        r0,[sp,#0x0]
    ldr        r1,[sp,#0x4]
    add        sp,#0x8
    pop        {pc}

CellPosition_ARRAY_08081c5a:
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0
    cell_pos 0, 0

PTR_CellPosition_ARRAY_08081c64:
    .word CellPosition_ARRAY_08081c5a


_ts Effect_BombShootExplosion_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5}
    mov        r0,#0x4a
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5}
    beq        LAB_08081c90
    strh       r2,[r7,#0x24]
    strb       r3,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_08081c90:
    pop        {pc}


_nt E_BombShootExplosion_CreateHitEffect
    push       {lr}
    ldr        r7,PTR_PanelFlag_ARRAY_08081cb4
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2


_nt FUN_08081c9a
    add        r7,r7,r1
    push       {r5}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x24]
    ldr        r4,[r7,#0x0]
    mov        r6,#0x2
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r5}
    pop        {pc}

PTR_PanelFlag_ARRAY_08081cb4:
    .word PanelFlag_ARRAY_08081cb8

PanelFlag_ARRAY_08081cb8:
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy
