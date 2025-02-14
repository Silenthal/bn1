#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_StoneManLaser
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_StoneManLaser_0_Init_08073a6c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_StoneManLaser_0_Init_08073a6c:
    .word PTR_A_StoneManLaser_0_Init_08073a70

PTR_A_StoneManLaser_0_Init_08073a70:
    .word A_StoneManLaser_0_Init
    .word A_StoneManLaser_1_Main
    .word A_StoneManLaser_2_Free


_ts A_StoneManLaser_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x8c
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelProperty
    mov        r3,#0x1
    orr        r2,r3
    pop        {r0,r1}
    bl         Field_SetPanelProperty
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x60]
    mov        r1,#0x1e
    strh       r1,[r0,#0x8]
    mov        r1,#0x0
    str        r1,[r0,#0x14]
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    ldr        r1,DAT_08073ae0
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x18]
    strb       r1,[r0,#0x2]
    strb       r1,[r0,#0x4]
    ldrb       r1,[r5,#0x19]
    strb       r1,[r0,#0x3]
    strb       r1,[r0,#0x5]
    bl         A_StoneManLaser_1_Main
    pop        {pc}

DAT_08073ae0:
    .word 0x44028


_ts A_StoneManLaser_1_Main
    push       {lr}
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    bne        LAB_08073af4
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    b          LAB_08073afe
LAB_08073af4:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_StoneManLaser_1_0_08073b00
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08073afe:
    pop        {pc}

PTR_PTR_A_StoneManLaser_1_0_08073b00:
    .word PTR_A_StoneManLaser_1_0_08073b04

PTR_A_StoneManLaser_1_0_08073b04:
    .word A_StoneManLaser_1_0
    .word A_StoneManLaser_1_1
    .word A_StoneManLaser_1_2


_ts A_StoneManLaser_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08073b2a
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x96
    bl         Sound_PlaySE
LAB_08073b2a:
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r1,#0x3
    and        r1,r0
    cmp        r1,#0x3
    bne        LAB_08073b3c
    bl         A_StoneManLaser_CreateEffectOnTarget
LAB_08073b3c:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08073b4e
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08073b4e:
    pop        {pc}


_ts A_StoneManLaser_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_StoneManLaser_1_1_0_08073b60
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_StoneManLaser_1_1_0_08073b60:
    .word PTR_A_StoneManLaser_1_1_0_08073b64

PTR_A_StoneManLaser_1_1_0_08073b64:
    .word A_StoneManLaser_1_1_0
    .word A_StoneManLaser_1_1_1
    .word A_StoneManLaser_1_1_2
    .word A_StoneManLaser_1_1_3


_ts A_StoneManLaser_1_1_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts A_StoneManLaser_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08073ba2
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x46
    mov        r4,#0x0
    bl         Effect_Laser_Create
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08073ba2:
    pop        {pc}


_ts A_StoneManLaser_1_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x4b
    bne        LAB_08073bb2
    mov        r0,#0x97
    bl         Sound_PlaySE
LAB_08073bb2:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08073bc6
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_08073bc6:
    pop        {pc}


_ts A_StoneManLaser_1_1_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08073bda
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08073bda:
    pop        {pc}


_ts A_StoneManLaser_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_StoneManLaser_1_2_0_08073bec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_StoneManLaser_1_2_0_08073bec:
    .word PTR_A_StoneManLaser_1_2_0_08073bf0

PTR_A_StoneManLaser_1_2_0_08073bf0:
    .word A_StoneManLaser_1_2_0
    .word A_StoneManLaser_1_2_1


_ts A_StoneManLaser_1_2_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x96
    bl         Sound_PlaySE
    pop        {pc}


_nt A_StoneManLaser_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r1,#0x3
    and        r1,r0
    cmp        r1,#0x3
    bne        LAB_08073c22
    bl         A_StoneManLaser_CreateEffectOnTarget
LAB_08073c22:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08073bda
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt A_StoneManLaser_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_StoneManLaser_2_0_08073c54
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_StoneManLaser_2_0_08073c48:
    .word A_StoneManLaser_2_0
    .word A_StoneManLaser_2_1
    .word A_StoneManLaser_2_2

PTR_PTR_A_StoneManLaser_2_0_08073c54:
    .word PTR_A_StoneManLaser_2_0_08073c48


_ts A_StoneManLaser_2_0
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt A_StoneManLaser_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08073c84
    bl         Attack_Free
LAB_08073c84:
    pop        {pc}


_nt A_StoneManLaser_2_2
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_StoneManLaser_Create
    push       {r5,lr}
    push       {r0,r1,r5}
    mov        r0,#0x27
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    beq        LAB_08073cbe
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    push       {r7}
    bl         Battle_CellCoordsToSprite
    pop        {r7}
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    str        r5,[r7,#0x64]
LAB_08073cbe:
    add        r0,r7,#0x0
    pop        {r5,pc}


_nt A_StoneManLaser_CreateEffectOnTarget
    push       {r5,lr}
    mov        r0,#0xf
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x1e
    bl         Effect_QuickEffect_Create
    pop        {r5,pc}
