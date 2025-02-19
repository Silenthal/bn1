#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listBombParam:
    .byte PFI_Self_Grounded
    .byte 0x00
    .short 0xD7

    .byte PFI_Self_Grounded
    .byte 0x00
    .short 0xD9

    .byte PFI_Self_Freezing
    .byte 0x01
    .short 0x9D


_ts Effect_BombExplosion
    push       {lr}
    ldr        r7,PTR_PTR_E_BombExplosion_0_Init_0807bcd8
    ldrb       r0,[r5,#Effect_state_s0]
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
    ldrb       r0,[r5,#Effect_family_b1]
    sub        r0,#0x1
    bmi        LAB_0807bc28
    strb       r0,[r5,#Effect_family_b1]
    pop        {pc}
LAB_0807bc28:
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    ldrb       r0,[r5,#Effect_family_family]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listBombParam_0807bc80
    add        r7,r7,r0
    str        r7,[r5,#Effect_obj_60]
    mov        r0,#0x1
    ldrh       r1,[r7,#0x2]
    push       {r7}
    bl         Sprite_InitSpritePtr
    pop        {r7}
    ldrb       r0,[r7,#0x1]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    mov        r0,#0x2
    strh       r0,[r5,#Effect_counterA]
    ldr        r0,[r5,#Effect_pos_curr_x]
    ldr        r1,[r5,#Effect_pos_curr_y]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Effect_cPos_x]
    strb       r1,[r5,#Effect_cPos_y]
    ldr        r7,[r5,#Effect_obj_60]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    bl         E_BombExplosion_1_Main
    ldr        r0,[r5,#Effect_obj_64]
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
    ldrh       r0,[r5,#Effect_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Effect_counterA]
    bne        LAB_0807bca0
    ldr        r0,[r5,#Effect_obj_64]
    bl         FieldObject_Disable
LAB_0807bca0:
    pop        {pc}
LAB_0807bca2:
    mov        r0,#0x1
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x8
    str        r0,[r5,#Effect_state_s0]
    pop        {pc}


_ts E_BombExplosion_2_Free
    push       {lr}
    ldr        r0,[r5,#Effect_obj_64]
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
    ldrb       r0,[r5,#Effect_owner]
    strb       r0,[r7,#0x16]
LAB_0807bcd4:
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BombExplosion_0_Init_0807bcd8:
    .word PTR_E_BombExplosion_0_Init_0807bc10
