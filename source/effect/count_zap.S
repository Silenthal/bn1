#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_CountZap
    push       {lr}
    ldr        r0,PTR_PTR_E_CountZap_0_Init_0807fd10
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_CountZap_0_Init_0807fbd8:
    .word E_CountZap_0_Init
    .word E_CountZap_1_Main
    .word E_CountZap_2_Free


_ts E_CountZap_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x50
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x8
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x44]
    mov        r0,#0x0
    str        r0,[r5,#0x48]
    str        r0,[r5,#0x4c]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts E_CountZap_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_CountZap_1_0_0807fd14
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_CountZap_1_0_0807fc38:
    .word E_CountZap_1_0
    .word E_CountZap_1_1
    .word E_CountZap_1_2
    .word E_CountZap_1_3


_ts E_CountZap_1_0
    mov        r0,#0xad
    bl         Flag_GetBase
    beq        LAB_0807fc60
    mov        r0,#0xb
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_0807fc60:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_CountZap_1_1
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807fc80
    mov        r0,#0xc
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_0807fc80:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_CountZap_1_2
    mov        r0,#0xae
    bl         Flag_GetBase
    beq        LAB_0807fca2
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0xc8
    strb       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_0807fca2:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_CountZap_1_3
    mov        r0,#0xac
    bl         Flag_GetBase
    beq        LAB_0807fce6
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0807fcc6
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
LAB_0807fcc6:
    ldrb       r0,[r5,#0x1c]
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    tst        r0,r0
    beq        E_CountZap_2_Free
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
LAB_0807fce6:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_CountZap_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_CountZap_Create
    push       {lr}
    ldr        r1,DAT_0807fd18
    mov        r2,#0x16
    mov        r3,#0x60
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x2e
    bl         Effect_Alloc
    mov        r0,#0x4
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_CountZap_0_Init_0807fd10:
    .word PTR_E_CountZap_0_Init_0807fbd8

PTR_PTR_E_CountZap_1_0_0807fd14:
    .word PTR_E_CountZap_1_0_0807fc38

DAT_0807fd18:
    .word 0xFFFFFFEA
