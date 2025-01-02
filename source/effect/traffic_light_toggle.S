#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TrafficLightToggle
    push       {lr}
    ldr        r0,PTR_PTR_E_TrafficLightToggle_0_Init_0807f0b4
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TrafficLightToggle_0_Init_0807efe4:
    .word E_TrafficLightToggle_0_Init
    .word E_TrafficLightToggle_1_Main
    .word E_TrafficLightToggle_2_Free


_ts E_TrafficLightToggle_0_Init
    push       {lr}
    LoadMain mapEventState, r7, r7
    ldrb       r0,[r7,#0x8]
    ldrb       r1,[r5,#0x5]
    cmp        r1,#0x0
    beq        LAB_0807f010
    ldrb       r0,[r7,#0x9]
    ldrb       r1,[r5,#0x5]
    cmp        r1,#0x1
    beq        LAB_0807f010
    ldrb       r0,[r7,#0xa]
    ldrb       r1,[r5,#0x5]
    cmp        r1,#0x2
    beq        LAB_0807f010
    ldrb       r0,[r7,#0xb]
LAB_0807f010:
    tst        r0,r0
    bne        LAB_0807f01a
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    b          LAB_0807f01e
LAB_0807f01a:
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_0807f01e:
    mov        r0,#0x1
    ldr        r1,DAT_0807f0b8
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    push       {r0}
    Flag_GetEvent 0x34
    pop        {r0}
    beq        LAB_0807f04e
    mov        r0,#0x2
LAB_0807f04e:
    bl         SpritePtr_SetPriority
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    beq        LAB_0807f05e
    ldr        r0,DAT_0807f0bc
    bl         SpritePtr_SetObjectExcludeFlags
LAB_0807f05e:
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_TrafficLightToggle_1_Main
    push       {lr}
    ldrb       r1,[r5,#0x7]
    tst        r1,r1
    beq        LAB_0807f072
    cmp        r1,#0x1
    beq        LAB_0807f094
    b          LAB_0807f09e
LAB_0807f072:
    LoadMain mapEventState, r7, r7
    ldrb       r0,[r7,#0x8]
    ldrb       r1,[r5,#0x5]
    cmp        r1,#0x0
    beq        LAB_0807f090
    ldrb       r0,[r7,#0x9]
    ldrb       r1,[r5,#0x5]
    cmp        r1,#0x1
    beq        LAB_0807f090
    ldrb       r0,[r7,#0xa]
    ldrb       r1,[r5,#0x5]
    cmp        r1,#0x2
    beq        LAB_0807f090
    ldrb       r0,[r7,#0xb]
LAB_0807f090:
    tst        r0,r0
    bne        LAB_0807f09e
LAB_0807f094:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0xfd
    and        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_0807f0a6
LAB_0807f09e:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0807f0a6:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_TrafficLightToggle_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}

PTR_PTR_E_TrafficLightToggle_0_Init_0807f0b4:
    .word PTR_E_TrafficLightToggle_0_Init_0807efe4

DAT_0807f0b8:
    .word 0x109

DAT_0807f0bc:
    .word 0x3FFFFFFF
