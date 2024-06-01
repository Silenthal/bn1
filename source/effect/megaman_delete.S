#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_MegaManDelete
    push       {lr}
    ldr        r7,PTR_PTR_E_MegaManDelete_0_Init_0807cd5c
    ldrb       r0,[r5,#0x8]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_MegaManDelete_0_Init_0807cc9c:
    .word E_MegaManDelete_0_Init
    .word E_MegaManDelete_1_Main
    .word E_MegaManDelete_2_Free


_ts E_MegaManDelete_0_Init
    push       {lr}
    mov        r0,#0x3
    ldrb       r1,[r5,#0x5]
    lsr        r1,r1,#0x6
    bcc        LAB_0807ccb4
    mov        r0,#0x1
LAB_0807ccb4:
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xdb
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x0
    str        r0,[r5,#0x64]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    mov        r3,#0x50
    add        r7,r5,r3
    stmia      r7!,{r0,r1,r2}
    ldr        r0,DAT_0807ccf8
    str        r0,[r5,#0x60]
    mov        r3,#0x28
    add        r0,r5,r3
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_MegaManDelete_1_Main
    pop        {pc}

    .align 2, 0


DAT_0807ccf8:
    .word 0x240


_ts E_MegaManDelete_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    eor        r0,r1
    strb       r0,[r5,#0x0]
    bl         UpdateSpriteFrameIndex
    mov        r0,#0x40
    bl         Battle_IsOnscreenX
    tst        r0,r0
    beq        LAB_0807cd3c
    ldrb       r0,[r5,#0x5]
    ldr        r1,[r5,#0x64]
    bl         AngleToOffset
    lsl        r0,r0,#0x8
    lsl        r1,r1,#0x8
    ldr        r2,[r5,#0x50]
    add        r0,r0,r2
    str        r0,[r5,#0x28]
    ldr        r2,[r5,#0x58]
    add        r1,r1,r2
    str        r1,[r5,#0x30]
    ldr        r0,[r5,#0x60]
    ldr        r1,[r5,#0x64]
    add        r0,r0,r1
    str        r0,[r5,#0x64]
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    pop        {pc}
LAB_0807cd3c:
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0xF0
    .byte -1
    .byte -1
    .byte -1


_ts E_MegaManDelete_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_MegaManDelete_Create
    push       {lr}
    mov        r0,#0xd
    bl         Effect_Alloc
    pop        {pc}

    .align 2, 0


PTR_PTR_E_MegaManDelete_0_Init_0807cd5c:
    .word PTR_E_MegaManDelete_0_Init_0807cc9c
