#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_ProtoMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_ProtoManC_0_Init_08069f84
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoManC_0_Init_08069f84:
    .word PTR_R_ProtoManC_0_Init_08069f88

PTR_R_ProtoManC_0_Init_08069f88:
    .word R_ProtoManC_0_Init
    .word R_ProtoManC_1_Main
    .word R_ProtoManC_2_Free


_ts R_ProtoManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x48
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x3
    strb       r0,[r5,#0x1a]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_ProtoManC_1_Main
    pop        {pc}


_nt R_ProtoManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_ProtoManC_1_0_08069ffc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_ProtoManC_1_0_08069ffc:
    .word PTR_R_ProtoManC_1_0_0806a000

PTR_R_ProtoManC_1_0_0806a000:
    .word R_ProtoManC_1_0
    .word R_ProtoManC_1_1
    .word R_ProtoManC_1_2
    .word R_ProtoManC_1_3


_ts R_ProtoManC_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoManC_1_0_0_0806a020
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoManC_1_0_0_0806a020:
    .word PTR_R_ProtoManC_1_0_0_0806a024

PTR_R_ProtoManC_1_0_0_0806a024:
    .word R_ProtoManC_1_0_0
    .word R_ProtoManC_1_0_1


_ts R_ProtoManC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a044
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806a044:
    pop        {pc}


_nt R_ProtoManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806a05c
    bl         R_ProtoManC_GetDistanceToEnemy
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806a05c:
    pop        {pc}


_nt R_ProtoManC_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoManC_1_1_0_0806a06c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ProtoManC_1_1_0_0806a06c:
    .word PTR_R_ProtoManC_1_1_0_0806a070

PTR_R_ProtoManC_1_1_0_0806a070:
    .word R_ProtoManC_1_1_0
    .word R_ProtoManC_1_1_1
    .word R_ProtoManC_1_1_2


_ts R_ProtoManC_1_1_0
    push       {lr}
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    bne        LAB_0806a090
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806a090:
    mov        r3,#0x62
    ldrh       r0,[r5,r3]
    ldrh       r1,[r5,#0x18]
    cmp        r0,r1
    beq        LAB_0806a0ca
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    ldrb       r1,[r5,#0x18]
    sub        r0,r0,r1
    bpl        LAB_0806a0a6
    neg        r0,r0
LAB_0806a0a6:
    cmp        r0,#0x1
    bhi        LAB_0806a0b6
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    mov        r3,#0x63
    ldrb       r1,[r5,r3]
    mov        r1,#0x2
    b          LAB_0806a0bc
LAB_0806a0b6:
    ldr        r0,[r5,#0x44]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
LAB_0806a0bc:
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806a0ca:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoManC_1_1_1
    push       {lr}
    bl         R_ProtoManC_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_0806a0f0
    mov        r0,#0x2
    strh       r0,[r5,#0x1c]
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_0806a0f2
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806a0f0:
    pop        {pc}
LAB_0806a0f2:
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoManC_1_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806a10e
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806a10e:
    pop        {pc}


_ts R_ProtoManC_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoManC_1_2_0_0806a120
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoManC_1_2_0_0806a120:
    .word PTR_R_ProtoManC_1_2_0_0806a124

PTR_R_ProtoManC_1_2_0_0806a124:
    .word R_ProtoManC_1_2_0
    .word R_ProtoManC_1_2_1
    .word R_ProtoManC_1_2_2
    .word R_ProtoManC_1_2_3
    .word R_ProtoManC_1_2_4


_ts R_ProtoManC_1_2_0
    push       {lr}
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoManC_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806a15c
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806a15c:
    pop        {pc}


_nt R_ProtoManC_1_2_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0806a1c6
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r0,[r5,#0x44]
    mov        r4,#0x28
    mul        r4,r0
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    mov        r4,#0x10
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x1
    bl         Effect_SwordSlash_Create
    tst        r7,r7
    beq        LAB_0806a196
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806a196:
    ldr        r0,[r5,#0x44]
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    add        r1,#0x1
    mov        r2,#0x3
LAB_0806a1a2:
    push       {r0,r1,r2}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,FamilyDetail_0806a1c8
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    pop        {r0,r1,r2}
    sub        r1,#0x1
    sub        r2,#0x1
    bne        LAB_0806a1a2
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806a1c6:
    pop        {pc}

FamilyDetail_0806a1c8:
    .byte 0x19, 0x00, 0x01, 0x02


_ts R_ProtoManC_1_2_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806a1e2
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0806a1e2:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x01

    .align 2, 0



_ts R_ProtoManC_1_2_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806a1fe
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806a1fe:
    pop        {pc}


_ts R_ProtoManC_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a21c
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0806a21c:
    pop        {pc}


_nt R_ProtoManC_Move
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_ProtoManC_Move_0_0806a22c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ProtoManC_Move_0_0806a22c:
    .word PTR_R_ProtoManC_Move_0_0806a230

PTR_R_ProtoManC_Move_0_0806a230:
    .word R_ProtoManC_Move_0
    .word R_ProtoManC_Move_1
    .word R_ProtoManC_Move_2


_ts R_ProtoManC_Move_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806a262
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0806a262:
    pop        {r5}
    mov        r0,#0xa8
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}


_ts R_ProtoManC_Move_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a2ba
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806a2b4
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0806a2b4:
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0806a2ba:
    pop        {pc}


_ts R_ProtoManC_Move_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a2cc
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_0806a2cc:
    pop        {pc}


_nt R_ProtoManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806a2e4
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_0806a2e4:
    pop        {pc}


_nt R_ProtoManC_GetDistanceToEnemy
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_FindFirstEnemyPanel
    tst        r0,r0
    beq        LAB_0806a2fc
    ldr        r2,[r5,#0x44]
    neg        r2,r2
    add        r0,r0,r2
LAB_0806a2fc:
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r3,#0x63
    mov        r1,#0x2
    strb       r1,[r5,r3]
    pop        {pc}


_ts Routine_ProtoMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x3c
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_0806a322
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_0806a322:
    pop        {pc}
