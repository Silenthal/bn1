#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_SmallElectrified
    push       {lr}
    ldr        r0,PTR_PTR_E_SmallElectrified_0_Init_080801a8
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_SmallElectrified_0_Init_08080124:
    .word E_SmallElectrified_0_Init
    .word E_SmallElectrified_1_Main
    .word E_SmallElectrified_2_Free


_ts E_SmallElectrified_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_080801ac
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoZClip
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    pop        {pc}
    .byte 0x00
    .byte 0xBD


_ts E_SmallElectrified_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_SmallElectrified_1_0_080801b0
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_SmallElectrified_1_0_08080170:
    .word E_SmallElectrified_1_0


_ts E_SmallElectrified_1_0
    Flag_GetBase 0xDE
    bne        E_SmallElectrified_2_Free
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_SmallElectrified_2_Free
    bl         Effect_Free
    pop        {pc}


_ts Effect_SmallElectrified_Create
    push       {lr}
    push       {r0}
    mov        r1,#0x6
    ldr        r2,DAT_080801b4
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x33
    bl         Effect_Alloc
    pop        {r0}
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_SmallElectrified_0_Init_080801a8:
    .word PTR_E_SmallElectrified_0_Init_08080124

DAT_080801ac:
    .word 0x115

PTR_PTR_E_SmallElectrified_1_0_080801b0:
    .word PTR_E_SmallElectrified_1_0_08080170

DAT_080801b4:
    .word 0xFFFFFF76
