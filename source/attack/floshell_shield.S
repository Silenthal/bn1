#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_FloshellShield
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_FloshellShield_0_Init_08073eac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellShield_0_Init_08073eac:
    .word PTR_A_FloshellShield_0_Init_08073eb0

PTR_A_FloshellShield_0_Init_08073eb0:
    .word A_FloshellShield_0_Init
    .word A_FloshellShield_1_Main
    .word A_FloshellShield_2_Free


_ts A_FloshellShield_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x9b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_FloshellShield_1_Main
    pop        {pc}


_ts A_FloshellShield_1_Main
    push       {lr}
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_08073efe
    bl         A_FloshellShield_2_Free
LAB_08073efe:
    pop        {pc}
    .word PTR_A_FloshellShield_1_0_08073f04

PTR_A_FloshellShield_1_0_08073f04:
    .word A_FloshellShield_1_0
    .word A_FloshellShield_1_1
    .word A_FloshellShield_1_2
    .word A_FloshellShield_1_3
    .word PF_Solid
    .word PF_Player
    .word PF_Teleporting


_ts A_FloshellShield_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08073f30
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x14]
LAB_08073f30:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bgt        LAB_08073f40
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08073f4e
LAB_08073f40:
    ldrb       r0,[r5,#0x1b]
    tst        r0,r0
    beq        LAB_08073f4e
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08073f4e:
    pop        {pc}


_ts A_FloshellShield_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08073f66
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_08073f7c
LAB_08073f66:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08073f7c
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
LAB_08073f7c:
    pop        {pc}


_nt A_FloshellShield_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_FloshellShield_1_2_0_08073f8c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_FloshellShield_1_2_0_08073f8c:
    .word PTR_A_FloshellShield_1_2_0_08073f90

PTR_A_FloshellShield_1_2_0_08073f90:
    .word A_FloshellShield_1_2_0
    .word A_FloshellShield_1_2_1
    .word A_FloshellShield_1_2_2


_ts A_FloshellShield_1_2_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts A_FloshellShield_1_2_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08073fc0
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
LAB_08073fc0:
    pop        {pc}


_nt A_FloshellShield_1_2_2
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08073fd2
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08073fd2:
    mov        pc,lr


_ts A_FloshellShield_1_3
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_FloshellShield_1_3_0_08073fe4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_FloshellShield_1_3_0_08073fe4:
    .word PTR_A_FloshellShield_1_3_0_08073fe8

PTR_A_FloshellShield_1_3_0_08073fe8:
    .word A_FloshellShield_1_3_0
    .word A_FloshellShield_1_3_1


_ts A_FloshellShield_1_3_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts A_FloshellShield_1_3_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08074018
    mov        r0,#0x28
    strh       r0,[r5,#0x20]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08074018:
    pop        {pc}


_nt A_FloshellShield_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_nt Attack_FloshellShield_Create
    push       {r5,lr}
    ldr        r4,[r5,#0x4]
    push       {r5}
    mov        r0,#0x29
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_08074056
    str        r5,[r7,#0x60]
    ldrb       r0,[r5,#0x18]
    strb       r0,[r7,#0x18]
    ldrb       r1,[r5,#0x19]
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
    mov        r0,#0x0
    strb       r0,[r7,#0x1b]
LAB_08074056:
    add        r0,r7,#0x0
    pop        {r5,pc}

    .align 2, 0

