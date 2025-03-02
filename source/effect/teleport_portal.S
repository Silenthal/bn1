#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TeleportPortal
    push       {lr}
    ldr        r0,PTR_PTR_E_TeleportPortal_0_Init_0807e404
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TeleportPortal_0_Init_0807e32c:
    .word E_TeleportPortal_0_Init
    .word E_TeleportPortal_1_Main
    .word E_TeleportPortal_2_Free


_ts E_TeleportPortal_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r1,#0xf7
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    ldrb       r2,[r5,#Effect_family_b2]
    cmp        r2,#0x1
    beq        LAB_0807e3ac
    mov        r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x0
    LoadMain world, r7, r7
    ldr        r2,[r7,#World_lastMapPosOffline_fullArea]
    ldr        r3,DAT_0807e408
    and        r2,r3
    ldrh       r1,[r5,#Effect_family_family]
    cmp        r2,r1
    beq        LAB_0807e36c
    Flag_SetGate F_GATE_0E
    mov        r0,#0x1
LAB_0807e36c:
    strb       r0,[r5,#Effect_frameIndexCurr]
    ldrb       r0,[r5,#Effect_family_b3]
    cmp        r0,#0x1
    bne        LAB_0807e38e
    ldrb       r1,[r5,#Effect_frameIndexCurr]
    tst        r1,r1
    bne        LAB_0807e3ca
    Flag_GetEvent 0x31
    beq        LAB_0807e3ca
    Flag_SetGate F_GATE_0E
    mov        r0,#0x1
    strb       r0,[r5,#Effect_frameIndexCurr]
    b          LAB_0807e3ca
LAB_0807e38e:
    cmp        r0,#0x2
    bne        LAB_0807e3ca
    ldrb       r1,[r5,#Effect_frameIndexCurr]
    tst        r1,r1
    bne        LAB_0807e3ca
    Flag_GetEvent 0x31
    bne        LAB_0807e3ca
    Flag_SetGate F_GATE_0E
    mov        r0,#0x1
    strb       r0,[r5,#Effect_frameIndexCurr]
    b          LAB_0807e3ca
LAB_0807e3ac:
    mov        r0,#0x0
    bl         SpritePtr_SetPaletteIndex
    mov        r2,#0x0
    ldrb       r0,[r5,#Effect_family_b3]
    cmp        r0,#0x0
    beq        LAB_0807e3c6
    bl         Flag_GetBase
    bne        LAB_0807e3c6
    mov        r0,#0x1
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r2,#0x1
LAB_0807e3c6:
    add        r0,r2,#0x0
    strb       r0,[r5,#Effect_frameIndexCurr]
LAB_0807e3ca:
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
    pop        {pc}


_nt E_TeleportPortal_1_Main
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_TeleportPortal_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}

    .align 2, 0


PTR_PTR_E_TeleportPortal_0_Init_0807e404:
    .word PTR_E_TeleportPortal_0_Init_0807e32c

DAT_0807e408:
    .word 0xFFFF
