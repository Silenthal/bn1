#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BassExplosionYellow
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_BassExplosionYellow_0_Init_08079d28
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BassExplosionYellow_0_Init_08079d28:
    .word PTR_A_BassExplosionYellow_0_Init_08079d2c

PTR_A_BassExplosionYellow_0_Init_08079d2c:
    .word A_BassExplosionYellow_0_Init
    .word A_BassExplosionYellow_1_Main
    .word A_BassExplosionYellow_2_Free


_ts A_BassExplosionYellow_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xcb
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strb       r0,[r5,#0xc]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x3
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x64]
    mov        r0,#0x8
    str        r0,[r7,#0xc]
    bl         A_BassExplosionYellow_1_Main
    pop        {pc}


_nt A_BassExplosionYellow_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_BassExplosionYellow_1_0_08079d98
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BassExplosionYellow_1_0_08079d98:
    .word PTR_A_BassExplosionYellow_1_0_08079d9c

PTR_A_BassExplosionYellow_1_0_08079d9c:
    .word A_BassExplosionYellow_1_0
    .word A_BassExplosionYellow_1_1


_ts A_BassExplosionYellow_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08079db4
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08079db4:
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x14
    bge        LAB_08079dce
    mov        r2,#0x8
    mov        r1,#0x4
    tst        r0,r1
    bne        LAB_08079dc8
    mov        r2,#0x0
LAB_08079dc8:
    ldr        r7,[r5,#0x64]
    str        r2,[r7,#0xc]
    b          LAB_08079dd6
LAB_08079dce:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08079dd6:
    pop        {pc}


_ts A_BassExplosionYellow_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08079dfe
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0xc]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x3
    ldr        r1,[r5,#0x64]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0xe0
    bl         Sound_PlaySongImmediate
    b          LAB_08079e38
LAB_08079dfe:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    bne        LAB_08079e1e
    bl         R_BassExplosionYellow_IsTargetHit
    tst        r0,r0
    beq        LAB_08079e24
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    b          LAB_08079e24
LAB_08079e1e:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
LAB_08079e24:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08079e38
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
LAB_08079e38:
    pop        {pc}


_nt A_BassExplosionYellow_2_Free
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_BassExplosionYellow_GetNextPanel
    push       {lr}
    sub        sp,#0x8
    ldr        r7,PTR_CellPosition_ARRAY_08079e84
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
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    beq        LAB_08079e72
    mov        r0,#0xff
    str        r0,[sp,#0x0]
LAB_08079e72:
    ldr        r0,[sp,#0x0]
    ldr        r1,[sp,#0x4]
    add        sp,#0x8
    pop        {pc}

CellPosition_ARRAY_08079e7a:
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0

    .align 2, 0


PTR_CellPosition_ARRAY_08079e84:
    .word CellPosition_ARRAY_08079e7a


_ts Attack_BassExplosionYellow_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5}
    mov        r0,#0x51
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5}
    beq        LAB_08079eac
    strh       r2,[r7,#0x24]
    strb       r3,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_08079eac:
    pop        {pc}


_nt R_BassExplosionYellow_IsTargetHit
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldr        r7,PTR_PanelFlag_ARRAY_08079ecc
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r1,r0
    beq        LAB_08079ec8
    mov        r0,#0x1
    b          LAB_08079eca
LAB_08079ec8:
    mov        r0,#0x0
LAB_08079eca:
    pop        {pc}

PTR_PanelFlag_ARRAY_08079ecc:
    .word PanelFlag_ARRAY_08079ed0

PanelFlag_ARRAY_08079ed0:
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
