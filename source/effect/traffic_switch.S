#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TrafficSwitch
    push       {lr}
    ldr        r0,PTR_PTR_E_TrafficSwitch_0_Init_0807fbc0
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TrafficSwitch_0_Init_0807fb50:
    .word E_TrafficSwitch_0_Init
    .word E_TrafficSwitch_1_Main
    .word E_TrafficSwitch_2_Free


_ts E_TrafficSwitch_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_0807fbc4
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         E_TrafficSwitch_SetPalette
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0



_ts E_TrafficSwitch_1_Main
    push       {lr}
    bl         E_TrafficSwitch_SetPalette
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_TrafficSwitch_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts E_TrafficSwitch_SetPalette
    push       {lr}
    mov        r0,#0x30
    bl         Flag_GetBase
    beq        LAB_0807fbb6
    mov        r0,#0x1
    b          LAB_0807fbb8
LAB_0807fbb6:
    mov        r0,#0x0
LAB_0807fbb8:
    bl         SpritePtr_SetPaletteIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_TrafficSwitch_0_Init_0807fbc0:
    .word PTR_E_TrafficSwitch_0_Init_0807fb50

DAT_0807fbc4:
    .word 0x10F
