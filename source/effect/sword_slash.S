#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listSlashParam:
    .byte 0x02, 0x00, 0x79, 0x00
    .byte 0x00, 0x00, 0x79, 0x00
    .byte 0x01, 0x00, 0x79, 0x00
    .byte 0x00, 0x00, 0x79, 0x00
    .byte 0x00, 0x00, 0x79, 0x00
    .byte 0x00, 0x00, 0x79, 0x00
    .byte 0x03, 0x00, 0x79, 0x00
    .byte 0x03, 0x01, 0x79, 0x00
    .byte 0x03, 0x02, 0x79, 0x00
    .byte 0x02, 0x03, 0x79, 0x00


_ts Effect_SwordSlash
    push       {lr}
    ldr        r7,PTR_PTR_E_SwordSlash_0_Init_0807bfb8
    ldrb       r0,[r5,#0x8]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_SwordSlash_0_Init_0807bf10:
    .word E_SwordSlash_0_Init
    .word E_SwordSlash_1_Main
    .word E_SwordSlash_2_Free


_ts E_SwordSlash_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listSlashParam_0807bf74
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    mov        r0,#0x1
    mov        r3,#0x2
    ldrsh      r1,[r7,r3]
    tst        r1,r1
    bmi        LAB_0807bf5c
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x1]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
LAB_0807bf5c:
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0xe
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_SwordSlash_1_Main
    pop        {pc}

    .align 2, 0


PTR_listSlashParam_0807bf74:
    .word listSlashParam


_ts E_SwordSlash_1_Main
    push       {lr}
    ldr        r7,[r5,#0x60]
    mov        r3,#0x2
    ldrsh      r0,[r7,r3]
    tst        r0,r0
    bmi        LAB_0807bf88
    bl         SpritePtr_ProcessFrameDelay
LAB_0807bf88:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_0807bf92
    pop        {pc}
LAB_0807bf92:
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_SwordSlash_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_SwordSlash_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x7
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0807bfb4
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0807bfb4:
    pop        {pc}

    .align 2, 0


PTR_PTR_E_SwordSlash_0_Init_0807bfb8:
    .word PTR_E_SwordSlash_0_Init_0807bf10
    .word PF_EnemyOccupied | PF_Enemy
