#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_PharaohMan_Curse
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_PharaohMan_Curse_0_Init_080811ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_PharaohMan_Curse_0_Init_080811ac:
    .word PTR_E_PharaohMan_Curse_0_Init_080811b0

PTR_E_PharaohMan_Curse_0_Init_080811b0:
    .word E_PharaohMan_Curse_0_Init
    .word E_PharaohMan_Curse_1_Main
    .word E_PharaohMan_Curse_2_Free


_ts E_PharaohMan_Curse_0_Init
    push       {lr}
    mov        r1,#0xae
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Effect_frameIndexCurr]
    strb       r0,[r5,#Effect_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}


_nt E_PharaohMan_Curse_1_Main
    push       {lr}
    ldr        r7,[r5,#Effect_obj_64]
    ldr        r7,[r7,#0x0]
    tst        r7,r7
    beq        LAB_080811fa
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080811fe
LAB_080811fa:
    mov        r0,#0x8
    str        r0,[r5,#Effect_state_s0]
LAB_080811fe:
    ldr        r7,[r5,#Effect_obj_60]
    ldr        r0,[r7,#0x28]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    sub        r0,r0,r1
    str        r0,[r5,#Effect_pos_curr_x]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#Effect_pos_curr_y]
    ldr        r0,[r7,#0x30]
    mov        r1,#0x3c
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#Effect_pos_curr_z]
    pop        {pc}


_nt E_PharaohMan_Curse_2_Free
    push       {lr}
    mov        r0,#0x0
    ldr        r7,[r5,#Effect_obj_64]
    str        r0,[r7,#0x0]
    bl         Effect_Free
    pop        {pc}


_ts Effect_PharaohManCurse_Create
    push       {lr}
    push       {r2,r5}
    mov        r0,#0x41
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r2,r5}
    beq        LAB_0808123e
    str        r5,[r7,#0x60]
    str        r2,[r7,#0x64]
    str        r7,[r2,#0x0]
LAB_0808123e:
    pop        {pc}
