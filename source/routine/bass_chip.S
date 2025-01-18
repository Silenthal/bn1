#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Bass_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_BassC_0_Init_0806dff4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BassC_0_Init_0806dff4:
    .word PTR_R_BassC_0_Init_0806dff8

PTR_R_BassC_0_Init_0806dff8:
    .word R_BassC_0_Init
    .word R_BassC_1_Main
    .word R_BassC_2_Free


_ts R_BassC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x6a
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    str        r0,[r5,#0x6c]
    str        r0,[r5,#0x70]
    LoadMain battle, r7, r7
    add        r7,#0x40
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    strb       r0,[r5,#0x18]
    ldrb       r1,[r7,#0x19]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0806e05c
    mov        r0,#0x0
LAB_0806e05c:
    bl         SpritePtr_SetFlipType
    mov        r0,#0xde
    bl         Sound_PlaySE
    pop        {pc}


_ts R_BassC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_BassC_1_0_0806e078
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BassC_1_0_0806e078:
    .word PTR_R_BassC_1_0_0806e07c

PTR_R_BassC_1_0_0806e07c:
    .word R_BassC_1_0
    .word R_BassC_1_1
    .word R_BassC_1_2


_ts R_BassC_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BassC_1_0_0_0806e098
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BassC_1_0_0_0806e098:
    .word PTR_R_BassC_1_0_0_0806e09c

PTR_R_BassC_1_0_0_0806e09c:
    .word R_BassC_1_0_0
    .word R_BassC_1_0_1


_ts R_BassC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e0bc
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_0806e0bc:
    pop        {pc}


_nt R_BassC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e0d0
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806e0d0:
    pop        {pc}


_nt R_BassC_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BassC_1_1_0_0806e0e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_BassC_1_1_0_0806e0e0:
    .word PTR_R_BassC_1_1_0_0806e0e4

PTR_R_BassC_1_1_0_0806e0e4:
    .word R_BassC_1_1_0
    .word R_BassC_1_1_1
    .word R_BassC_1_1_2
    .word R_BassC_1_1_3
    .word R_BassC_1_1_4
    .word R_BassC_1_1_5


_ts R_BassC_1_1_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_BassC_1_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e130
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    mov        r4,#0x1
    bl         Effect_Bass_Create
    str        r7,[r5,#0x68]
    mov        r0,#0x5
    strb       r0,[r7,#0x0]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1e]
LAB_0806e130:
    pop        {pc}


_nt R_BassC_1_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0806e146
    mov        r0,#0x22
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8f
    bl         Sound_PlaySE
LAB_0806e146:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e15c
    mov        r0,#0x0
    str        r0,[r5,#0x68]
    strb       r0,[r5,#0xd]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0806e15c:
    pop        {pc}


_nt R_BassC_1_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e16e
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0806e16e:
    pop        {pc}


_ts R_BassC_1_1_4
    push       {lr}
    bl         FUN_0806e178
    pop        {pc}


_ts FUN_0806e178
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_FUN_0806e194_0806e188
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_FUN_0806e194_0806e188:
    .word PTR_FUN_0806e194_0806e18c

PTR_FUN_0806e194_0806e18c:
    .word FUN_0806e194
    .word FUN_0806e1b8


_ts FUN_0806e194
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    bl         Rng_RandomInt
    mov        r1,#0x3
    and        r0,r1
    lsl        r0,r0,#0x4
    ldr        r7,PTR_BYTE_ARRAY_ARRAY_0806e22c
    add        r7,r7,r0
    str        r7,[r5,#0x74]
    pop        {pc}


_ts FUN_0806e1b8
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e214
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldr        r7,[r5,#0x74]
    ldrh       r1,[r5,#0x1e]
    ldrb       r1,[r7,r1]
    mov        r2,#0x96
    lsl        r2,r2,#0x1
    ldrb       r3,[r5,#0x16]
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r4,r3
    mov        r6,#0x4
    sub        r4,r6,r4
    mov        r6,#0x7
    bl         Attack_BassExplosion_Chip_Create
    tst        r7,r7
    beq        LAB_0806e1f6
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    strb       r0,[r7,#0x6]
    str        r5,[r7,#0x68]
LAB_0806e1f6:
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    cmp        r0,#0xf
    bge        LAB_0806e208
    ldr        r7,PTR_BYTE_ARRAY_0806e228
    ldrb       r1,[r7,r0]
    strh       r1,[r5,#0x1c]
    b          LAB_0806e214
LAB_0806e208:
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806e214:
    pop        {pc}

BYTE_ARRAY_0806e216:
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10

    .align 2, 0


PTR_BYTE_ARRAY_0806e228:
    .word BYTE_ARRAY_0806e216

PTR_BYTE_ARRAY_ARRAY_0806e22c:
    .word BYTE_ARRAY_ARRAY_0806e230

BYTE_ARRAY_ARRAY_0806e230:
    .byte 0x01
    .byte 0x03
    .byte 0x02
    .byte 0x03
    .byte 0x02
    .byte 0x01
    .byte 0x01
    .byte 0x03
    .byte 0x02
    .byte 0x03
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x02
    .byte 0x01
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x03
    .byte 0x02
    .byte 0x01
    .byte 0x02
    .byte 0x01
    .byte 0x03
    .byte 0x02
    .byte 0x03
    .byte 0x02
    .byte 0x01
    .byte 0x01
    .byte 0x02
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x02
    .byte 0x03
    .byte 0x01
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x02
    .byte 0x01
    .byte 0x01


_ts R_BassC_1_1_5
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e282
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806e282:
    pop        {pc}


_ts R_BassC_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BassC_1_2_0_0806e294
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BassC_1_2_0_0806e294:
    .word PTR_R_BassC_1_2_0_0806e298

PTR_R_BassC_1_2_0_0806e298:
    .word R_BassC_1_2_0
    .word R_BassC_1_2_1


_ts R_BassC_1_2_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_BassC_1_2_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e2c4
    mov        r0,#0x5
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    bl         R_BassC_CheckTargetHit
LAB_0806e2c4:
    pop        {pc}


_nt R_BassC_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    tst        r0,r0
    bne        LAB_0806e2d6
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
LAB_0806e2d6:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e2e8
    bl         Actor_Free
    ldr        r7,PTR_gScreenDim_0806e2ec
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_0806e2e8:
    pop        {pc}

    .align 2, 0


PTR_gScreenDim_0806e2ec:
    .word gScreenDim


_ts Routine_Bass_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x4c
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_0806e308
    strb       r2,[r7,#0x16]
    strh       r3,[r7,#0x24]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0806e308:
    pop        {pc}


_nt FUN_0806e30a
    push       {lr}
    push       {r0,r1,r7}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1,r7}
    bne        LAB_0806e324
    add        r1,#0x6c
    ldrb       r2,[r7,r1]
    mov        r3,#0x80
    lsr        r3,r0
    orr        r2,r3
    strb       r2,[r7,r1]
LAB_0806e324:
    pop        {pc}


_nt R_BassC_CheckTargetHit
    push       {lr}
    mov        r7,#0x6c
    add        r7,r7,r5
    mov        r1,#0x1
LAB_0806e32e:
    ldrb       r2,[r7,r1]
    tst        r2,r2
    beq        LAB_0806e35e
    mov        r3,#0x40
    mov        r0,#0x1
LAB_0806e338:
    tst        r3,r2
    beq        LAB_0806e356
    push       {r0,r1,r2,r3,r5,r7}
    ldr        r7,PTR_PanelFlag_ARRAY_0806e368
    ldrb       r2,[r5,#0x16]
    lsl        r2,r2,#0x2
    add        r7,r7,r2
    ldrb       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x24]
    ldr        r4,[r7,#0x0]
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r0,r1,r2,r3,r5,r7}
LAB_0806e356:
    lsr        r3,r3,#0x1
    add        r0,#0x1
    cmp        r0,#0x6
    ble        LAB_0806e338
LAB_0806e35e:
    add        r1,#0x1
    cmp        r1,#0x4
    blt        LAB_0806e32e
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_0806e368:
    .word PanelFlag_ARRAY_0806e36c

PanelFlag_ARRAY_0806e36c:
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy
