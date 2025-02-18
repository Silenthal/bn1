#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_MagicMan
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_MagicMan_0_Init_08080a84
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_MagicMan_0_Init_08080a84:
    .word PTR_E_MagicMan_0_Init_08080a88

PTR_E_MagicMan_0_Init_08080a88:
    .word E_MagicMan_0_Init
    .word E_MagicMan_1_Main
    .word E_MagicMan_2_Free


_ts E_MagicMan_0_Init
    push       {lr}
    mov        r1,#0xa6
    mov        r2,#0x1
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x1
    bne        LAB_08080aa4
    mov        r1,#0xa7
    mov        r2,#0x0
LAB_08080aa4:
    mov        r0,#0x1
    push       {r2}
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    pop        {r0}
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08080ade
    FieldObject_Create PFI_Sealed, 0x60
LAB_08080ade:
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_08080ae8
    mov        r0,#0x0
LAB_08080ae8:
    bl         SpritePtr_SetFlipType
    bl         E_MagicMan_1_Main
    pop        {pc}


_nt E_MagicMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08080b06
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_E_MagicMan_1_0_08080b14
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    b          LAB_08080b12
LAB_08080b06:
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    bne        LAB_08080b12
    bl         Effect_Free
LAB_08080b12:
    pop        {pc}

PTR_PTR_E_MagicMan_1_0_08080b14:
    .word PTR_E_MagicMan_1_0_08080b18

PTR_E_MagicMan_1_0_08080b18:
    .word E_MagicMan_1_0
    .word E_MagicMan_1_1


_ts E_MagicMan_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08080b32
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_08080b48
LAB_08080b32:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08080b48
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
LAB_08080b48:
    pop        {pc}


_nt E_MagicMan_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08080b5c
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_08080b6a
LAB_08080b5c:
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_08080b6a
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08080b6a:
    pop        {pc}


_ts E_MagicMan_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_MagicMan_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x3b
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    beq        LAB_08080bb0
    str        r5,[r7,#0x64]
    ldrb       r2,[r5,#0x16]
    strb       r2,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    mov        r2,#0x0
    ldrb       r3,[r7,#0x4]
    cmp        r3,#0x1
    beq        LAB_08080bac
    str        r2,[r7,#0x30]
    sub        r2,#0x1
    add        r1,r1,r2
    str        r1,[r7,#0x2c]
    b          LAB_08080bb0
LAB_08080bac:
    str        r1,[r7,#0x2c]
    str        r2,[r7,#0x30]
LAB_08080bb0:
    pop        {pc}

    .align 2, 0

