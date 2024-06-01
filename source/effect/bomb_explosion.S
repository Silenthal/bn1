#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listBombParam:
    .byte 0x03, 0x00, 0xD7, 0x00
    .byte 0x03, 0x00, 0xD9, 0x00
    .byte 0x16, 0x01, 0x9D, 0x00


_ts Effect_BombExplosion
    push       {lr}
    ldr        r7,PTR_PTR_E_BombExplosion_0_Init_0807bcd8
    ldrb       r0,[r5,#0x8]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_BombExplosion_0_Init_0807bc10:
    .word E_BombExplosion_0_Init
    .word E_BombExplosion_1_Main
    .word E_BombExplosion_2_Free


_ts E_BombExplosion_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x5]
    sub        r0,#0x1
    bmi        LAB_0807bc28
    strb       r0,[r5,#0x5]
    pop        {pc}
LAB_0807bc28:
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listBombParam_0807bc80
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    mov        r0,#0x1
    ldrh       r1,[r7,#0x2]
    push       {r7}
    bl         Sprite_InitSpritePtr
    pop        {r7}
    ldrb       r0,[r7,#0x1]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoZClip
    mov        r0,#0x2
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_BombExplosion_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_listBombParam_0807bc80:
    .word listBombParam


_ts E_BombExplosion_1_Main
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    bne        LAB_0807bca2
    bl         SpritePtr_ProcessFrameDelay
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807bca0
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
LAB_0807bca0:
    pop        {pc}
LAB_0807bca2:
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts E_BombExplosion_2_Free
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_BombExplosion_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x4
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_0807bcd4
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x1a]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0807bcd4:
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BombExplosion_0_Init_0807bcd8:
    .word PTR_E_BombExplosion_0_Init_0807bc10
