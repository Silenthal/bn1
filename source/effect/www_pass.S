#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_WWWPass
    push       {lr}
    ldr        r0,PTR_PTR_E_WWWPass_0_Init_08080914
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_WWWPass_0_Init_08080894:
    .word E_WWWPass_0_Init
    .word E_WWWPass_1_Main
    .word E_WWWPass_2_Free


_ts E_WWWPass_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    ldr        r1,DAT_08080918
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    mov        r0,#0x1
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Effect_state_s1]
    strb       r0,[r5,#Effect_state_s2]
    pop        {pc}


_nt E_WWWPass_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_WWWPass_1_0_0808091c
    ldrb       r1,[r5,#Effect_state_s1]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

    .align 2, 0


PTR_E_WWWPass_1_0_080808e0:
    .word E_WWWPass_1_0


_ts E_WWWPass_1_0
    mov        r0,#0xf
    bl         KeyItem_IsPresent
    bne        E_WWWPass_2_Free
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_WWWPass_2_Free
    bl         Effect_Free
    pop        {pc}


_ts Effect_WWWPass_Create
    push       {lr}
    mov        r1,#0x1c
    mov        r2,#0x18
    mov        r3,#0x18
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x38
    bl         Effect_Alloc
    mov        r0,#0x0
    strh       r0,[r5,#Effect_frameIndexCurr]
    pop        {pc}

PTR_PTR_E_WWWPass_0_Init_08080914:
    .word PTR_E_WWWPass_0_Init_08080894

DAT_08080918:
    .word 0x123

PTR_PTR_E_WWWPass_1_0_0808091c:
    .word PTR_E_WWWPass_1_0_080808e0
