#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_LightBulb
    push       {lr}
    ldr        r0,PTR_PTR_E_LightBulb_0_Init_0808008c
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_LightBulb_0_Init_0807fff8:
    .word E_LightBulb_0_Init
    .word E_LightBulb_1_Main
    .word E_LightBulb_2_Free


_ts E_LightBulb_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_08080090
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
    bl         FUN_08080054
    ldrb       r0,[r5,#0x6]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_LightBulb_1_Main
    push       {lr}
    bl         FUN_08080054
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_LightBulb_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts FUN_08080054
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    cmp        r7,#0x50
    bge        LAB_0808007c
    mov        r1,#0x0
    push       {r1,r5}
    ldrb       r0,[r5,#0x4]
    bl         FUN_0804c828
    pop        {r1,r5}
    beq        LAB_0808007e
    push       {r1,r5}
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    bl         FUN_0804c774
    pop        {r1,r5}
    bne        LAB_0808007e
LAB_0808007c:
    mov        r1,#0x1
LAB_0808007e:
    add        r0,r1,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    pop        {pc}

    .align 2, 0


PTR_PTR_E_LightBulb_0_Init_0808008c:
    .word PTR_E_LightBulb_0_Init_0807fff8

DAT_08080090:
    .word 0x116
