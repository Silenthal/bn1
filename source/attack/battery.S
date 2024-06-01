#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Battery
    push       {lr}
    ldr        r0,PTR_PTR_A_Battery_0_Init_08077470
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_A_Battery_0_Init_080773d4:
    .word A_Battery_0_Init
    .word A_Battery_1_Main
    .word A_Battery_2_Free


_ts A_Battery_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_08077474
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    push       {r0,r5}
    ldr        r7,PTR_DAT_08077478
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    ldrb       r0,[r7,r0]
    bl         Flag_GetBase
    pop        {r0,r5}
    beq        LAB_08077406
    mov        r0,#0x1
LAB_08077406:
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         FUN_08077448
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}

DAT_0807742c:
    .byte 0xD4
    .byte 0xD5
    .byte 0xD5
    .byte 0xD6
    .byte 0xD6
    .byte 0xD6
    .byte 0xD6
    .byte 0xD7


_ts A_Battery_1_Main
    push       {lr}
    bl         FUN_08077448
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts A_Battery_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts FUN_08077448
    push       {lr}
    push       {r0,r5}
    ldrb       r0,[r5,#0x4]
    bl         FUN_0804c7e8
    pop        {r1,r5}
    bne        LAB_0807745c
    mov        r1,#0x1
    strb       r1,[r5,#0x0]
    pop        {pc}
LAB_0807745c:
    push       {r5}
    add        r0,#0x47
    bl         KeyItem_IsPresent
    pop        {r5}
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_A_Battery_0_Init_08077470:
    .word PTR_A_Battery_0_Init_080773d4

DAT_08077474:
    .word 0x11C

PTR_DAT_08077478:
    .word DAT_0807742c
