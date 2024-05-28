#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_BombShoot_Create, 0x807AC1A+1
    .set A_BombShoot_SetTarget, 0x807AC66+1


_ts Routine_BombMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_BombmanC_0_Init_0806de40
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BombmanC_0_Init_0806de40:
    .word PTR_R_BombmanC_0_Init_0806de44

PTR_R_BombmanC_0_Init_0806de44:
    .word R_BombmanC_0_Init
    .word R_BombManC_1_Main
    .word R_BombmanC_2_Free


_ts R_BombmanC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x5b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
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
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0806dea6
    mov        r0,#0x0
LAB_0806dea6:
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x5c
    add        r2,r2,r5
    mov        r4,#0x1
    push       {r0,r1}
    ldrb       r6,[r5,#0x4]
    mov        r0,#0xbe
    add        r0,r0,r6
    bl         BattleChip_GetChipData
    ldrh       r6,[r0,#0xc]
    pop        {r0,r1}
    bl         Attack_BombShoot_Create
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    pop        {pc}


_ts R_BombManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_BombManC_1_0_0806dee0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BombManC_1_0_0806dee0:
    .word PTR_R_BombManC_1_0_0806dee4

PTR_R_BombManC_1_0_0806dee4:
    .word R_BombManC_1_0
    .word R_BombManC_1_1


_ts R_BombManC_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BombManC_1_0_0_0806df00
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_BombManC_1_0_0_0806defc:
    .word R_BombManC_1_0_0

PTR_PTR_R_BombManC_1_0_0_0806df00:
    .word PTR_R_BombManC_1_0_0_0806defc


_ts R_BombManC_1_0_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806df16
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806df16:
    pop        {pc}


_ts R_BombManC_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BombManC_1_1_0_0806df38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_BombManC_1_1_0_0806df28:
    .word R_BombManC_1_1_0
    .word R_BombManC_1_1_1
    .word R_BombManC_1_1_2
    .word R_BombManC_1_1_3

PTR_PTR_R_BombManC_1_1_0_0806df38:
    .word PTR_R_BombManC_1_1_0_0806df28


_ts R_BombManC_1_1_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_BombManC_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0xf
    bne        LAB_0806df76
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x3
    mul        r1,r0
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x5c]
    bl         A_BombShoot_SetTarget
    mov        r0,#0x8e
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0806df76:
    pop        {pc}


_ts R_BombManC_1_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806df90
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x19
    strh       r0,[r5,#0x1c]
LAB_0806df90:
    pop        {pc}


_nt R_BombManC_1_1_3
    push       {lr}
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    bne        LAB_0806df9e
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0806df9e:
    pop        {pc}


_ts R_BombmanC_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    tst        r0,r0
    bne        LAB_0806dfb0
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
LAB_0806dfb0:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806dfc2
    bl         Actor_Free
    ldr        r7,PTR_gScreenDim_0806dfc4
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_0806dfc2:
    pop        {pc}

PTR_gScreenDim_0806dfc4:
    .word gScreenDim


_ts Routine_BombManChip_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x4b
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_0806dfde
    strb       r2,[r7,#0x16]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0806dfde:
    pop        {pc}
