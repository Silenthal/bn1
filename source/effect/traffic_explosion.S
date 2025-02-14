#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TrafficExplosion
    push       {lr}
    ldr        r0,PTR_PTR_E_TrafficExplosion_0_Init_0807eec4
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TrafficExplosion_0_Init_0807ee28:
    .word E_TrafficExplosion_0_Init
    .word E_TrafficExplosion_1_Main
    .word E_TrafficExplosion_2_Free


_ts E_TrafficExplosion_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xd7
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    mov        r0,#0x2
    strb       r0,[r5,#0x1c]
    pop        {pc}


_nt E_TrafficExplosion_1_Main
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0807ee96
    ldrb       r0,[r5,#0x1c]
    tst        r0,r0
    bne        LAB_0807ee92
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_0807ee8c
    mov        r0,#0x76
    bl         Sound_PlaySE
LAB_0807ee8c:
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    b          LAB_0807ee96
LAB_0807ee92:
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
LAB_0807ee96:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    bne        E_TrafficExplosion_2_Free
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_TrafficExplosion_2_Free
    bl         Effect_Free
    pop        {pc}


_ts Effect_TrafficExplosion_1_Create
    push       {lr}
    mov        r0,#0x20
    mov        r4,#0x0
    bl         Effect_Alloc
    pop        {pc}


_ts Effect_TrafficExplosion_2_Create
    push       {lr}
    mov        r0,#0x20
    mov        r4,#0x1
    bl         Effect_Alloc
    pop        {pc}

PTR_PTR_E_TrafficExplosion_0_Init_0807eec4:
    .word PTR_E_TrafficExplosion_0_Init_0807ee28
