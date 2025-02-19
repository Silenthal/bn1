#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_JellyCharging
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_JellyCharging_0_Init_0807e51c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_JellyCharging_0_Init_0807e51c:
    .word PTR_E_JellyCharging_0_Init_0807e520

PTR_E_JellyCharging_0_Init_0807e520:
    .word E_JellyCharging_0_Init
    .word E_JellyCharging_1_Main
    .word E_JellyCharging_2_Free


_ts E_JellyCharging_0_Init
    push       {lr}
    mov        r0,#0x1
    ldr        r1,DAT_0807e5a4
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
    bl         E_JellyCharging_1_Main
    pop        {pc}


_nt E_JellyCharging_1_Main
    push       {lr}
    ldr        r7,[r5,#Effect_obj_60]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0807e56a
    bl         E_JellyCharging_2_Free
    b          LAB_0807e586
LAB_0807e56a:
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#Effect_pos_curr_x]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#Effect_pos_curr_y]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#Effect_pos_curr_z]
    ldrb       r0,[r7,#0x5]
    cmp        r0,#0xff
    bne        LAB_0807e582
    bl         E_JellyCharging_2_Free
    b          LAB_0807e586
LAB_0807e582:
    bl         SpritePtr_SetPaletteIndex
LAB_0807e586:
    pop        {pc}


_ts E_JellyCharging_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_JellyCharging_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x18
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0807e5a2
    str        r5,[r7,#0x60]
LAB_0807e5a2:
    pop        {pc}

DAT_0807e5a4:
    .word 0x100
