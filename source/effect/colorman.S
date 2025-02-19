#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_ColorMan
    push       {lr}
    ldr        r0,PTR_PTR_E_ColorMan_0_Init_0807f858
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_ColorMan_0_Init_0807f718:
    .word E_ColorMan_0_Init
    .word E_ColorMan_1_Main
    .word E_ColorMan_2_Free


_ts E_ColorMan_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x36
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Effect_frameIndexCurr]
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
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Effect_state_s1]
    pop        {pc}


_nt E_ColorMan_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_ColorMan_1_0_0807f85c
    ldrb       r1,[r5,#Effect_state_s1]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

    .align 2, 0


PTR_E_ColorMan_1_0_0807f76c:
    .word E_ColorMan_1_0
    .word E_ColorMan_1_1
    .word E_ColorMan_1_2
    .word E_ColorMan_1_3


_ts E_ColorMan_1_0
    Flag_GetBase 0xBC
    beq        LAB_0807f7aa
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807f7aa
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s1]
    mov        r0,#0xa
    strb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r1,#0x0
    str        r1,[r5,#Effect_diff_x]
    ldr        r1,DAT_0807f860
    str        r1,[r5,#Effect_diff_y]
    ldr        r1,DAT_0807f864
    str        r1,[r5,#Effect_diff_z]
LAB_0807f7aa:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_ColorMan_1_1
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807f7ca
    mov        r0,#0xb
    strb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x8
    strb       r0,[r5,#Effect_state_s1]
LAB_0807f7ca:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_ColorMan_1_2
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    bpl        LAB_0807f7e6
    mov        r2,#0x0
LAB_0807f7e6:
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    ldr        r0,DAT_0807f80c
    add        r6,r6,r0
    str        r6,[r5,#Effect_diff_z]
    ldr        r0,[r5,#Effect_pos_curr_z]
    tst        r0,r0
    bne        LAB_0807f806
    mov        r0,#0xc
    strb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0xc
    strb       r0,[r5,#Effect_state_s1]
LAB_0807f806:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

DAT_0807f80c:
    .word 0xFFFFC000


_ts E_ColorMan_1_3
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807f830
    Flag_ClearBase 0xBC
    mov        r0,#0x8
    strb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Effect_state_s1]
LAB_0807f830:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_ColorMan_2_Free
    bl         Effect_Free
    pop        {pc}


_ts Effect_ColorMan_Create
    push       {lr}
    mov        r1,#0x72
    ldr        r2,DAT_0807f868
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x29
    bl         Effect_Alloc
    mov        r0,#0x8
    strh       r0,[r5,#Effect_frameIndexCurr]
    pop        {pc}

PTR_PTR_E_ColorMan_0_Init_0807f858:
    .word PTR_E_ColorMan_0_Init_0807f718

PTR_PTR_E_ColorMan_1_0_0807f85c:
    .word PTR_E_ColorMan_1_0_0807f76c

DAT_0807f860:
    .word 0x10000

DAT_0807f864:
    .word 0x60000

DAT_0807f868:
    .word 0xFFFFFFE0
