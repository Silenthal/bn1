#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_SwordySlash
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_SwordySlash_0_Init_080726b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_SwordySlash_0_Init_080726b8:
    .word PTR_A_SwordySlash_0_Init_080726bc

PTR_A_SwordySlash_0_Init_080726bc:
    .word A_SwordySlash_0_Init
    .word A_SwordySlash_1_Main
    .word A_SwordySlash_2_Free


_ts A_SwordySlash_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x88
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_SwordySlash_1_Main
    pop        {pc}


_ts A_SwordySlash_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_dummy_72720_08072718
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r7,[r5,#0x60]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x28]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x2c]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#0x30]
    pop        {pc}

PTR_PTR_dummy_72720_08072718:
    .word PTR_dummy_72720_0807271c

PTR_dummy_72720_0807271c:
    .word dummy_72720


_ts dummy_72720
    push       {lr}
    pop        {pc}


_ts A_SwordySlash_2_Free
    push       {lr}
    pop        {pc}


_ts Attack_SwordySlash_Create
    push       {r5,lr}
    push       {r5}
    mov        r0,#0x1f
    bl         Attack_Alloc
    pop        {r0}
    tst        r5,r5
    beq        LAB_0807273a
    str        r0,[r5,#0x60]
LAB_0807273a:
    add        r0,r5,#0x0
    pop        {r5,pc}


_nt Attack_SwordySlash_Hide
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    mvn        r2,r2
    and        r1,r2
    strb       r1,[r0,#0x0]
    mov        pc,lr


_nt Attack_SwordySlash_Show
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    orr        r1,r2
    strb       r1,[r0,#0x0]
    mov        pc,lr
