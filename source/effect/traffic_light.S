#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TrafficLight
    push       {lr}
    ldr        r0,PTR_PTR_E_TrafficLight_0_Init_0807e6e4
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TrafficLight_0_Init_0807e664:
    .word E_TrafficLight_0_Init
    .word E_TrafficLight_1_Main
    .word E_TrafficLight_2_Free


_ts E_TrafficLight_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_0807e6e8
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x0
    ldrb       r1,[r5,#0x6]
    cmp        r1,#0xff
    bne        LAB_0807e6a6
    ldr        r0,PTR_main_0807e6ec
LAB_0807e6a6:
    bl         SpritePtr_SetObjectExcludeFlags
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    bl         E_TrafficLight_1_Main
    pop        {pc}


_ts E_TrafficLight_1_Main
    push       {lr}
    mov        r0,#0x1
    ldr        r7,PTR_DAT_0807e6f0
    ldrb       r6,[r7,#0x6]
    tst        r6,r6
    bne        LAB_0807e6d0
    mov        r0,#0x2
    ldrb       r6,[r7,#0x5]
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x1
    and        r1,r2
    cmp        r6,r1
    beq        LAB_0807e6d0
    mov        r0,#0x0
LAB_0807e6d0:
    bl         SpritePtr_SetPaletteIndex
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0



_ts E_TrafficLight_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}

PTR_PTR_E_TrafficLight_0_Init_0807e6e4:
    .word PTR_E_TrafficLight_0_Init_0807e664

DAT_0807e6e8:
    .word 0x10D

PTR_main_0807e6ec:
    .word 0x8000000

PTR_DAT_0807e6f0:
    .word gTraffic
