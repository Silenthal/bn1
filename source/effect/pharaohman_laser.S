#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_PharaohManLaser
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_PharaohManLaser_0_Init_08081a24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_PharaohManLaser_0_Init_08081a24:
    .word PTR_E_PharaohManLaser_0_Init_08081a28

PTR_E_PharaohManLaser_0_Init_08081a28:
    .word E_PharaohManLaser_0_Init
    .word E_PharaohManLaser_1_Main
    .word E_PharaohManLaser_2_Free


_ts E_PharaohManLaser_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x8c
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0xa
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_08081a70
    mov        r0,#0x0
LAB_08081a70:
    bl         SpritePtr_SetFlipType
    bl         E_PharaohManLaser_1_Main
    pop        {pc}


_nt E_PharaohManLaser_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_E_PharaohManLaser_1_0_08081a88
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_PharaohManLaser_1_0_08081a88:
    .word PTR_E_PharaohManLaser_1_0_08081a8c

PTR_E_PharaohManLaser_1_0_08081a8c:
    .word E_PharaohManLaser_1_0
    .word E_PharaohManLaser_1_1


_ts E_PharaohManLaser_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08081aa6
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08081aa6:
    pop        {pc}


_ts E_PharaohManLaser_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08081aba
    mov        r0,#0xc
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_08081ac8
LAB_08081aba:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08081ac8
    bl         E_PharaohManLaser_2_Free
LAB_08081ac8:
    pop        {pc}


_nt E_PharaohManLaser_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_nt Effect_PharaohManLaser_Create
    push       {r5,lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x49
    bl         Effect_Alloc
    add        r6,r5,#0x0
    pop        {r0,r1,r2,r5}
    beq        LAB_08081b0e
    ldrb       r3,[r5,#0x16]
    strb       r3,[r6,#0x16]
    strh       r2,[r6,#0x24]
    strb       r0,[r6,#0x18]
    strb       r1,[r6,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r1,[r6,#0x2c]
    push       {r0}
    ldrb       r0,[r6,#0x16]
    bl         Field_GetAttackDirectionOffset
    mov        r2,#0x60
    lsl        r2,r2,#0x10
    mul        r2,r0
    pop        {r0}
    add        r0,r0,r2
    str        r0,[r6,#0x28]
    mov        r2,#0x0
    str        r2,[r6,#0x30]
    mov        r0,#0xd
    strb       r0,[r6,#0x0]
LAB_08081b0e:
    add        r0,r6,#0x0
    pop        {r5,pc}

    .align 2, 0

