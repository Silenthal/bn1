#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_BarSwitch
    push       {lr}
    ldr        r0,PTR_PTR_E_BarSwitch_0_Init_0807ffd8
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_BarSwitch_0_Init_0807ff38:
    .word E_BarSwitch_0_Init
    .word E_BarSwitch_1_Main
    .word E_BarSwitch_2_Free


_ts E_BarSwitch_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    ldr        r1,DAT_0807ffdc
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Effect_state_s1]
    strb       r0,[r5,#Effect_state_s2]
    pop        {pc}
    .byte 0x00
    .byte 0xBD


_ts E_BarSwitch_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_BarSwitch_1_0_0807ffe0
    ldrb       r1,[r5,#Effect_state_s1]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_BarSwitch_1_0_0807ff84:
    .word E_BarSwitch_1_0


_ts E_BarSwitch_1_0
    Flag_GetBase 0xC1
    beq        LAB_0807ffae
    Flag_ClearBase 0xC1
    Flag_GetBase 0xC4
    beq        LAB_0807ffa2
    mov        r0,#0x3
    b          LAB_0807ffa4
LAB_0807ffa2:
    mov        r0,#0x1
LAB_0807ffa4:
    strb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_0807ffae:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_BarSwitch_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_BarSwitch_Create
    push       {lr}
    push       {r0}
    mov        r1,#0x8
    ldr        r2,DAT_0807ffe4
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x30
    bl         Effect_Alloc
    pop        {r0}
    strh       r0,[r5,#Effect_frameIndexCurr]
    pop        {pc}

PTR_PTR_E_BarSwitch_0_Init_0807ffd8:
    .word PTR_E_BarSwitch_0_Init_0807ff38

DAT_0807ffdc:
    .word 0x111

PTR_PTR_E_BarSwitch_1_0_0807ffe0:
    .word PTR_E_BarSwitch_1_0_0807ff84

DAT_0807ffe4:
    .word 0xFFFFFF80
