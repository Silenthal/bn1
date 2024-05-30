#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_StonePiece_Create, 0x807DFEE+1


_ts Attack_Stone
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Stone_0_Init_08073908
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Stone_0_Init_08073908:
    .word PTR_A_Stone_0_Init_0807390c

PTR_A_Stone_0_Init_0807390c:
    .word A_Stone_0_Init
    .word A_Stone_1_Main
    .word A_Stone_2_Free


_ts A_Stone_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x8a
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    str        r0,[r5,#0x4c]
    bl         A_Stone_1_Main
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PF_Enemy


_ts A_Stone_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Stone_1_0_0807395c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Stone_1_0_0807395c:
    .word PTR_A_Stone_1_0_08073960

PTR_A_Stone_1_0_08073960:
    .word A_Stone_1_0


_ts A_Stone_1_0
    push       {lr}
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_080739b0
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    ldr        r0,DAT_080739b4
    cmp        r1,r0
    bgt        LAB_080739aa
    mov        r0,#0x95
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_080739a8
    push       {r1,r5}
    ldr        r7,PTR_PanelFlag_ARRAY_080739b8
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r4,[r7,r0]
    mov        r3,#0x1e
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r1,r5}
LAB_080739a8:
    ldr        r1,DAT_080739b4
LAB_080739aa:
    str        r1,[r5,#0x30]
    pop        {pc}

    .align 2, 0


DAT_080739b0:
    .word 0xFFFFDC00

DAT_080739b4:
    .word 0x120000

PTR_PanelFlag_ARRAY_080739b8:
    .word PanelFlag_ARRAY_080739bc

PanelFlag_ARRAY_080739bc:
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy


_ts A_Stone_2_Free
    push       {lr}
    mov        r3,#0x0
    ldr        r6,PTR_Position4_ARRAY_080739f8
LAB_080739ca:
    push       {r3,r6}
    bl         Rng_RandomUint
    mov        r4,#0x3
    and        r4,r0
    add        r4,#0x1
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    mov        r3,#0x0
    ldr        r7,[r6,#0x4]
    ldr        r6,[r6,#0x0]
    mov        r0,#0x2
    bl         Effect_StonePiece_Create
    pop        {r3,r6}
    add        r6,#0x8
    add        r3,#0x1
    cmp        r3,#0x4
    bmi        LAB_080739ca
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


PTR_Position4_ARRAY_080739f8:
    .word Position4_ARRAY_080739fc

Position4_ARRAY_080739fc:
    .word f(0.5, 2.5)
    .word f(-0.5, 3)
    .word f(1, 2.5)
    .word f(-0.5, 1.5)


_ts Attack_Stone_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x26
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    beq        LAB_08073a52
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    push       {r7}
    bl         Battle_CellCoordsToSprite
    pop        {r7}
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x50
    lsl        r2,r2,#0x10
    str        r2,[r7,#0x30]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    mov        r1,#0xb
    ldrb       r0,[r7,#0x4]
    tst        r0,r0
    beq        LAB_08073a50
    mov        r1,#0xf
LAB_08073a50:
    strb       r1,[r7,#0x0]
LAB_08073a52:
    add        r0,r7,#0x0
    pop        {pc}

    .align 2, 0

