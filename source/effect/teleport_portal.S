#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TeleportPortal
    push       {lr}
    ldr        r0,PTR_PTR_E_TeleportPortal_0_Init_0807e404
    ldrb       r1,[r5,#0x8]
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
    strb       r0,[r5,#0x0]
    mov        r1,#0xf7
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    ldrb       r2,[r5,#0x6]
    cmp        r2,#0x1
    beq        LAB_0807e3ac
    mov        r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r2,[r7,#0x58]
    ldr        r3,DAT_0807e408
    and        r2,r3
    ldrh       r1,[r5,#0x4]
    cmp        r2,r1
    beq        LAB_0807e36c
    mov        r0,#0xe
    bl         Flag_SetGate
    mov        r0,#0x1
LAB_0807e36c:
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x7]
    cmp        r0,#0x1
    bne        LAB_0807e38e
    ldrb       r1,[r5,#0x14]
    tst        r1,r1
    bne        LAB_0807e3ca
    mov        r0,#0x31
    bl         Flag_GetEvent
    beq        LAB_0807e3ca
    mov        r0,#0xe
    bl         Flag_SetGate
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    b          LAB_0807e3ca
LAB_0807e38e:
    cmp        r0,#0x2
    bne        LAB_0807e3ca
    ldrb       r1,[r5,#0x14]
    tst        r1,r1
    bne        LAB_0807e3ca
    mov        r0,#0x31
    bl         Flag_GetEvent
    bne        LAB_0807e3ca
    mov        r0,#0xe
    bl         Flag_SetGate
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    b          LAB_0807e3ca
LAB_0807e3ac:
    mov        r0,#0x0
    bl         SpritePtr_SetPaletteIndex
    mov        r2,#0x0
    ldrb       r0,[r5,#0x7]
    cmp        r0,#0x0
    beq        LAB_0807e3c6
    bl         Flag_GetBase
    bne        LAB_0807e3c6
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r2,#0x1
LAB_0807e3c6:
    add        r0,r2,#0x0
    strb       r0,[r5,#0x14]
LAB_0807e3ca:
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
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
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
