#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_FireColumn
    push       {lr}
    ldr        r0,PTR_PTR_E_FireColumn_0_Init_0807c070
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_FireColumn_0_Init_0807bfd0:
    .word E_FireColumn_0_Init
    .word E_FireColumn_1_Main
    .word E_FireColumn_2_Free


_ts E_FireColumn_0_Init
    push       {lr}
    bl         E_FireColumn_CheckFlag
    bne        LAB_0807c016
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xe4
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x5]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
LAB_0807c016:
    pop        {pc}


_ts E_FireColumn_1_Main
    push       {lr}
    push       {r5}
    mov        r0,#0x1
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_0807c038
    LoadMain mapEventState, r0, r0
    ldrb       r0,[r0,#0x8]
    ldrb       r1,[r5,#0x4]
    cmp        r0,r1
    bne        LAB_0807c038
    mov        r0,#0x1
    b          LAB_0807c03a
LAB_0807c038:
    mov        r0,#0x0
LAB_0807c03a:
    bl         SpritePtr_SetPaletteIndex
    bl         E_FireColumn_CheckFlag
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_FireColumn_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts E_FireColumn_CheckFlag
    push       {lr}
    push       {r5}
    mov        r0,#0xa0
    ldrb       r1,[r5,#0x4]
    add        r0,r0,r1
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0807c06a
    bl         Effect_Free
    mov        r0,#0x1
    pop        {pc}
LAB_0807c06a:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PTR_E_FireColumn_0_Init_0807c070:
    .word PTR_E_FireColumn_0_Init_0807bfd0
