#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_0807a080:
    .byte 0x0F
    .byte 0x0F
    .byte 0x0C
    .byte 0x0C
    .byte 0x09
    .byte 0x0A


_nt Attack_LockonTarget
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_0807a092
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807a092:
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_LockonTarget_0_Init_0807a0ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_LockonTarget_0_Init_0807a0a0:
    .word A_LockonTarget_0_Init
    .word A_LockonTarget_1_Main
    .word A_LockonTarget_2_Free

PTR_PTR_A_LockonTarget_0_Init_0807a0ac:
    .word PTR_A_LockonTarget_0_Init_0807a0a0


_ts A_LockonTarget_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x8f
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoZClip
    mov        r0,#0x1
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x4
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x96
    lsl        r0,r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strh       r0,[r5,#0x1e]
    ldr        r7,PTR_DAT_0807a11c
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    str        r7,[r5,#0x68]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x60]
    mov        r1,#0x1
    str        r1,[r5,#0x64]
    mov        r1,#0x2
    lsl        r1,r1,#0x10
    mul        r0,r1
    str        r0,[r5,#0x44]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_LockonTarget_1_Main
    pop        {pc}

    .word PF_DieBombExplosion | PF_Apple | PF_Armor | PF_Freeze
PTR_DAT_0807a11c:
    .word DAT_0807a080


_ts A_LockonTarget_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_LockonTarget_1_0_0807a134
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_LockonTarget_1_0_0807a134:
    .word PTR_A_LockonTarget_1_0_0807a138

PTR_A_LockonTarget_1_0_0807a138:
    .word A_LockonTarget_1_0
    .word A_LockonTarget_1_1
    .word A_LockonTarget_1_2
    .word A_LockonTarget_1_3


_ts A_LockonTarget_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    beq        LAB_0807a166
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}
LAB_0807a166:
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    pop        {r0,r1}
    push       {r0}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0}
    beq        LAB_0807a1b6
    mov        r1,#0x3
LAB_0807a18a:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    lsl        r0,r0,#0x1e
    lsr        r0,r0,#0x1f
    ldrb       r1,[r5,#0x16]
    cmp        r0,r1
    pop        {r0,r1}
    bne        LAB_0807a1a6
    sub        r1,#0x1
    bne        LAB_0807a18a
    mov        r0,#0x14
    strh       r0,[r5,#0x1e]
    pop        {pc}
LAB_0807a1a6:
    ldr        r7,[r5,#0x68]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0807a1b6:
    mov        r0,#0x2
    strh       r0,[r5,#0x14]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts A_LockonTarget_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_0807a20a
    bl         FUN_0807a28c
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldr        r7,PTR_DAT_0807a214
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    beq        LAB_0807a208
    bl         A_LockonTarget_FindTargetEnemy
    ldr        r7,[r5,#0x70]
    tst        r7,r7
    beq        LAB_0807a208
    mov        r0,#0x2
    strh       r0,[r5,#0x14]
    mov        r0,#0x1
    strb       r0,[r5,#0x6]
    mov        r0,#0x98
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807a208:
    pop        {pc}
LAB_0807a20a:
    mov        r0,#0x2
    strh       r0,[r5,#0x14]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}

PTR_DAT_0807a214:
    .word DAT_0807a218

DAT_0807a218:
    .byte 0x00
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x08

    .align 2, 0



_ts A_LockonTarget_1_2
    push       {lr}
    ldr        r7,[r5,#0x70]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807a24a
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807a24a:
    pop        {pc}


_ts A_LockonTarget_1_3
    push       {lr}
    ldr        r7,[r5,#0x70]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    pop        {pc}


_nt A_LockonTarget_2_Free
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807a284
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0807a27e
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_0807a27e
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_0807a27e:
    bl         Attack_Free
    pop        {pc}
LAB_0807a284:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0



_ts FUN_0807a28c
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0807a2ca
    mov        r0,#0xe2
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,[r5,#0x68]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         A_LockonTarget_FindTarget
    tst        r0,r0
    bne        LAB_0807a2ca
    bl         FUN_0807a316
    tst        r0,r0
    bne        LAB_0807a2ca
    bl         FUN_0807a316
    tst        r0,r0
    bne        LAB_0807a2ca
    bl         A_LockonTarget_FindTarget
LAB_0807a2ca:
    pop        {pc}


_ts A_LockonTarget_FindTarget
    push       {lr}
    ldrb       r0,[r5,#0x18]
LAB_0807a2d0:
    ldr        r2,[r5,#0x60]
    add        r0,r0,r2
    sub        r2,r0,#0x1
    cmp        r2,#0x6
    bcs        LAB_0807a30c
    mov        r1,#0x4
    ldrb       r2,[r5,#0x16]
    neg        r2,r2
    add        r2,#0x1
LAB_0807a2e2:
    sub        r1,#0x1
    beq        LAB_0807a2d0
    push       {r0,r1}
    bl         Field_GetPanelFlags
    lsl        r0,r0,#0x1e
    lsr        r0,r0,#0x1f
    cmp        r0,r2
    pop        {r0,r1}
    bne        LAB_0807a2e2
    ldr        r2,[r5,#0x60]
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x1
    pop        {pc}
LAB_0807a30c:
    ldr        r0,[r5,#0x60]
    neg        r0,r0
    str        r0,[r5,#0x60]
    mov        r0,#0x0
    pop        {pc}


_nt FUN_0807a316
    push       {lr}
    ldrb       r1,[r5,#0x19]
LAB_0807a31a:
    ldr        r2,[r5,#0x64]
    add        r1,r1,r2
    sub        r2,r1,#0x1
    cmp        r2,#0x3
    bcs        LAB_0807a356
    mov        r0,#0x8
    ldrb       r2,[r5,#0x16]
    neg        r2,r2
    add        r2,#0x1
LAB_0807a32c:
    sub        r0,#0x1
    beq        LAB_0807a31a
    push       {r0,r1}
    bl         Field_GetPanelFlags
    lsl        r0,r0,#0x1e
    lsr        r0,r0,#0x1f
    cmp        r0,r2
    pop        {r0,r1}
    bne        LAB_0807a32c
    ldr        r2,[r5,#0x64]
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r2
    strb       r1,[r5,#0x19]
    ldrb       r0,[r5,#0x18]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x1
    pop        {pc}
LAB_0807a356:
    ldr        r0,[r5,#0x64]
    neg        r0,r0
    str        r0,[r5,#0x64]
    mov        r0,#0x0
    pop        {pc}


_ts A_LockonTarget_FindTargetEnemy
    push       {lr}
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_0807a38a
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    add        r6,#0x54
    mov        r7,#0x0
    mov        r2,#0xc
    ldrh       r0,[r5,#0x18]
LAB_0807a374:
    ldr        r3,[r6,r2]
    tst        r3,r3
    beq        LAB_0807a382
    ldrh       r1,[r3,#0x18]
    cmp        r0,r1
    bne        LAB_0807a382
    add        r7,r3,#0x0
LAB_0807a382:
    sub        r2,#0x4
    bpl        LAB_0807a374
    str        r7,[r5,#0x70]
    pop        {pc}
LAB_0807a38a:
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    str        r7,[r5,#0x70]
    pop        {pc}


_ts Attack_LockonTarget_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x53
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    beq        LAB_0807a3b4
    str        r0,[r4,#0x6c]
    tst        r0,r0
    beq        LAB_0807a3ac
    str        r4,[r0,#0x0]
LAB_0807a3ac:
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
    strh       r6,[r4,#0x24]
    strb       r7,[r4,#0x16]
LAB_0807a3b4:
    pop        {pc}

    .align 2, 0

