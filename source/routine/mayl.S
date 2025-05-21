#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


MaylParam_ARRAY_0805b02c:
    .byte 0x01, 0x02, 0x00, 0x00
    .byte 0x08, 0x08, 0x00, 0x3C
    .byte 0x08, 0x08, 0xF8, 0x1E
    .byte 0x08, 0x08, 0x00, 0x50
    .byte 0x08, 0x04, 0x04, 0x3C
    .byte 0x08, 0x08, 0x00, 0x14
    .byte 0x01, 0x00, 0x00, 0x1E
    .byte 0x08, 0x08, 0x00, 0xE6
    .byte 0x08, 0x08, 0x00, 0xF0
    .byte 0x08, 0x08, 0x00, 0xC8
    .byte 0x09, 0x00, 0x08, 0x3C
    .byte 0xFF, 0x00, 0x00, 0x00


_ts Routine_Mayl
    push       {lr}
    ldr        r0,PTR_PTR_R_Mayl_0_Init_0805b148
    ldrb       r1,[r5,#Actor_state_s0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_R_Mayl_0_Init_0805b06c:
    .word R_Mayl_0_Init
    .word R_Mayl_1_Main
    .word R_Mayl_2_Free


_ts R_Mayl_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xf
    bl         Sprite_InitSpritePtr
    mov        r0,#0x5
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    pop        {r5}
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    pop        {pc}


_ts R_Mayl_1_Main
    ldr        r0,PTR_PTR_R_Mayl_1_0_SetUpMove_0805b14c
    ldrb       r1,[r5,#Actor_state_s1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

PTR_R_Mayl_1_0_SetUpMove_0805b0b8:
    .word R_Mayl_1_0_SetUpMove
    .word R_Mayl_1_1_Move
    .word dummy_5b144


_ts R_Mayl_2_Free
    push       {lr}
    bl         Actor_Free
    pop        {pc}


_ts R_Mayl_1_0_SetUpMove
    push       {lr}
    Flag_GetBase 0xD1
    beq        LAB_0805b0e6
    ldr        r7,PTR_MaylParam_ARRAY_0805b150
    str        r7,[r5,#Actor_param_68]
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_60]
    mov        r0,#0xff
    str        r0,[r5,#Actor_param_64]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
LAB_0805b0e6:
    pop        {pc}


_ts R_Mayl_1_1_Move
    push       {lr}
    ldr        r7,[r5,#Actor_param_68]
    ldr        r0,[r5,#Actor_param_60]
    cmp        r0,#0x0
    bgt        LAB_0805b124
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_0805b10c
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    push       {r5}
    mov        r0,#0x3
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    pop        {r5}
    b          LAB_0805b140
LAB_0805b10c:
    add        r7,#0x4
    str        r7,[r5,#Actor_param_68]
    ldr        r1,[r5,#Actor_param_64]
    cmp        r0,r1
    beq        LAB_0805b122
    push       {r5,r7}
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    pop        {r5,r7}
LAB_0805b122:
    ldrb       r0,[r7,#0x3]
LAB_0805b124:
    sub        r0,#0x1
    str        r0,[r5,#Actor_param_60]
    mov        r2,#0x1
    ldrsb      r0,[r7,r2]
    lsl        r0,r0,#0xc
    ldr        r1,[r5,#Actor_pos_curr_x]
    add        r1,r1,r0
    str        r1,[r5,#Actor_pos_curr_x]
    mov        r2,#0x2
    ldrsb      r0,[r7,r2]
    lsl        r0,r0,#0xc
    ldr        r1,[r5,#Actor_pos_curr_y]
    add        r1,r1,r0
    str        r1,[r5,#Actor_pos_curr_y]
LAB_0805b140:
    pop        {pc}


_ts dummy_5b144
    push       {lr}
    pop        {pc}

PTR_PTR_R_Mayl_0_Init_0805b148:
    .word PTR_R_Mayl_0_Init_0805b06c

PTR_PTR_R_Mayl_1_0_SetUpMove_0805b14c:
    .word PTR_R_Mayl_1_0_SetUpMove_0805b0b8

PTR_MaylParam_ARRAY_0805b150:
    .word MaylParam_ARRAY_0805b02c
