#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Scuttlest
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_Scuttlest_0_Init_08080934
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Scuttlest_0_Init_08080934:
    .word PTR_E_Scuttlest_0_Init_08080938

PTR_E_Scuttlest_0_Init_08080938:
    .word E_Scuttlest_0_Init
    .word E_Scuttlest_1_Init
    .word E_Scuttlest_2_Free


_ts E_Scuttlest_0_Init
    push       {lr}
    mov        r1,#0xc5
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    FieldObject_Create PFI_Moving, 0x60
    bl         E_Scuttlest_1_Init
    pop        {pc}


_ts E_Scuttlest_1_Init
    push       {lr}
    pop        {pc}


_ts E_Scuttlest_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_Scuttlest_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x39
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    beq        LAB_080809b6
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    sub        r2,#0x1
    add        r1,r1,r2
    str        r1,[r7,#0x2c]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_080809b6:
    pop        {pc}
