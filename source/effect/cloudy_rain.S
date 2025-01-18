#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_CloudyRain
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_CloudyRain_0_Init_0807de90
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_CloudyRain_0_Init_0807de90:
    .word PTR_E_CloudyRain_0_Init_0807de94

PTR_E_CloudyRain_0_Init_0807de94:
    .word E_CloudyRain_0_Init
    .word E_CloudyRain_1_Main
    .word E_CloudyRain_2_Free


_ts E_CloudyRain_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x91
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    bl         E_CloudyRain_1_Main
    pop        {pc}


_nt E_CloudyRain_1_Main
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807dee2
    mov        r0,#0x9b
    bl         Sound_PlaySE
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
LAB_0807dee2:
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0807def0
    bl         E_CloudyRain_2_Free
    b          LAB_0807df06
LAB_0807def0:
    ldrh       r0,[r7,#0x18]
    strh       r0,[r5,#0x18]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x28]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x2c]
    ldr        r0,[r7,#0x30]
    mov        r1,#0x1e
    lsl        r1,r1,#0x10
    sub        r0,r0,r1
    str        r0,[r5,#0x30]
LAB_0807df06:
    pop        {pc}


_ts E_CloudyRain_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_CloudyRain_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x12
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0807df22
    str        r5,[r7,#0x60]
LAB_0807df22:
    pop        {pc}
