#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BombManBomb
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_BombManBomb_0_0807786c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BombManBomb_0_0807786c:
    .word PTR_A_BombManBomb_0_08077870

PTR_A_BombManBomb_0_08077870:
    .word A_BombManBomb_0
    .word A_BombManBomb_1
    .word A_BombManBomb_2


_ts A_BombManBomb_0
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xab
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0xc]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0xd
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x28
    strh       r0,[r5,#0x20]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_BombManBomb_1
    pop        {pc}


_nt A_BombManBomb_1
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08077916
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,DAT_08077968
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    tst        r4,r4
    beq        LAB_080778fa
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08077916
LAB_080778fa:
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08077916
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08077916:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_BombManBomb_1_0_08077954
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08077950
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    bne        LAB_08077950
    ldr        r7,[r5,#0x68]
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_08077950:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BombManBomb_1_0_08077954:
    .word PTR_A_BombManBomb_1_0_08077958

PTR_A_BombManBomb_1_0_08077958:
    .word A_BombManBomb_1_0
    .word A_BombManBomb_1_1
    .word A_BombManBomb_1_2
    .word A_BombManBomb_1_3

DAT_08077968:
    .word 0xC0


_ts A_BombManBomb_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0807797e
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_08077990
LAB_0807797e:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08077990
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08077990:
    pop        {pc}


_nt A_BombManBomb_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080779a4
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_080779b2
LAB_080779a4:
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_080779b2
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080779b2:
    pop        {pc}


_ts A_BombManBomb_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_BombManBomb_1_2_0_080779d0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_BombManBomb_1_2_0_080779c4:
    .word A_BombManBomb_1_2_0
    .word A_BombManBomb_1_2_1
    .word A_BombManBomb_1_2_2

PTR_PTR_A_BombManBomb_1_2_0_080779d0:
    .word PTR_A_BombManBomb_1_2_0_080779c4


_ts A_BombManBomb_1_2_0
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    ldr        r3,DAT_08077a18
    str        r3,[r5,#0x4c]
    ldr        r4,DAT_08077a14
    bl         Field_CalculateTrajectoryXY
    strh       r0,[r5,#0x1c]
    str        r1,[r5,#0x44]
    str        r2,[r5,#0x48]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r5,#0x6]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r7,#0x3]
    strb       r0,[r7,#0x5]
    ldr        r1,PTR_DAT_08077a1c
    str        r1,[r7,#0xc]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_08077a14:
    .word 0xFFFFE800

DAT_08077a18:
    .word 0x28000

PTR_DAT_08077a1c:
    .word 0x2000000


_ts A_BombManBomb_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08077a76
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r2,#0x0
    str        r2,[r5,#0x30]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08077a5c
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x1
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    b          LAB_08077a9a
LAB_08077a5c:
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0xd
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x3
    strh       r0,[r5,#0x14]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    b          LAB_08077a9a
LAB_08077a76:
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_08077a9c
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    ldr        r0,[r5,#0x44]
    ldr        r1,[r5,#0x28]
    add        r1,r1,r0
    str        r1,[r5,#0x28]
    ldr        r0,[r5,#0x48]
    ldr        r1,[r5,#0x2c]
    add        r1,r1,r0
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    str        r1,[r5,#0x30]
    bl         R_Actor_UpdateCellPos
LAB_08077a9a:
    pop        {pc}

DAT_08077a9c:
    .word 0xFFFFE800


_ts A_BombManBomb_1_2_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08077adc
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08077ace
    mov        r3,#0x2
    and        r3,r0
    lsr        r3,r3,#0x1
    mov        r0,#0x1
    eor        r3,r0
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x8c
    mov        r4,#0x0
    bl         Effect_BombManBombExplosion_Create
LAB_08077ace:
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08077adc:
    pop        {pc}


_nt A_BombManBomb_1_3
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08077b04
    mov        r3,#0x2
    and        r3,r0
    lsr        r3,r3,#0x1
    mov        r0,#0x1
    eor        r3,r0
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x8c
    mov        r4,#0x0
    bl         Effect_BombManBombExplosion_Create
LAB_08077b04:
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    bne        LAB_08077b1e
    ldr        r7,[r5,#0x68]
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_08077b1e:
    pop        {pc}


_ts A_BombManBomb_2
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_BombManBomb_2_0_08077b3c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_BombManBomb_2_0_08077b30:
    .word A_BombManBomb_2_0
    .word A_BombManBomb_2_1
    .word A_BombManBomb_2_2

PTR_PTR_A_BombManBomb_2_0_08077b3c:
    .word PTR_A_BombManBomb_2_0_08077b30


_ts A_BombManBomb_2_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_ClearDeletedFlag
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts A_BombManBomb_2_1
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_BombManBomb_2_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08077b98
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_ClearDeletedFlag
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_08077ba4
LAB_08077b98:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08077ba4
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08077ba4:
    pop        {pc}


_nt Attack_BombManBomb_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x44
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08077be2
    ldrb       r3,[r5,#0x16]
    strb       r3,[r7,#0x16]
    mov        r3,#0x0
    str        r3,[r2,#0x0]
    str        r2,[r7,#0x68]
    mov        r6,#0x0
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    ldrb       r2,[r7,#0x4]
    cmp        r2,#0x1
    bne        LAB_08077bda
    mov        r2,#0x12
    lsl        r2,r2,#0x10
    sub        r0,r0,r2
LAB_08077bda:
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_08077be2:
    add        r0,r7,#0x0
    pop        {pc}


_nt A_BombManBomb_Kick
    strb       r0,[r7,#0x6]
    strb       r1,[r7,#0x7]
    mov        r0,#0x1
    strb       r0,[r7,#0xc]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    mov        r0,#0x0
    ldr        r6,[r7,#0x68]
    str        r0,[r6,#0x0]
    mov        pc,lr


_nt A_BombManBomb_ChooseRandomPanel
    push       {lr}
    sub        sp,#0x28
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,PanelFlag_08077c28
    bl         Field_Search
    tst        r1,r1
    bne        LAB_08077c10
    mov        r0,#0xff
    b          LAB_08077c24
LAB_08077c10:
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r7,sp
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
LAB_08077c24:
    add        sp,#0x28
    pop        {pc}

PanelFlag_08077c28:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Trap
