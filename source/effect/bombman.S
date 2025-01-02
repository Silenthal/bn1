#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_BombMan
    push       {lr}
    ldr        r0,PTR_PTR_E_BombMan_0_Init_08080790
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_BombMan_0_Init_08080648:
    .word E_BombMan_0_Init
    .word E_BombMan_1_Main
    .word E_BombMan_2_Free


_ts E_BombMan_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x58
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
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x1e]
    pop        {pc}


_ts E_BombMan_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_BombMan_1_0_08080794
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_BombMan_1_0_080806a4:
    .word E_BombMan_1_0
    .word E_BombMan_1_1


_ts E_BombMan_1_0
    ldrb       r0,[r5,#0x1e]
    sub        r0,#0x1
    strb       r0,[r5,#0x1e]
    tst        r0,r0
    bne        LAB_080806c0
    mov        r0,#0xd8
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1e
    strb       r0,[r5,#0x1e]
LAB_080806c0:
    push       {r5}
    mov        r0,#0x2
    ldrb       r1,[r5,#0xa]
    tst        r1,r1
    bne        LAB_080806cc
    mov        r0,#0x1
LAB_080806cc:
    mov        r1,#0x1
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    tst        r0,r0
    bne        LAB_08080716
    bl         Rng_RandomUint
    mov        r7,#0x1f
    and        r7,r0
    sub        r7,#0xf
    ldrh       r1,[r5,#0x2a]
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2e]
    lsl        r2,r2,#0x10
    mov        r7,#0x1f
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0xf
    ldrh       r3,[r5,#0x32]
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    push       {r5}
    bl         Effect_TrafficExplosion_2_Create
    pop        {r5}
    mov        r1,#0x5
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08080714
    mov        r1,#0xa
LAB_08080714:
    strh       r1,[r5,#0x1c]
LAB_08080716:
    Flag_GetBase 0x9C
    beq        LAB_08080746
    ldrb       r0,[r5,#0xa]
    add        r0,#0x1
    strb       r0,[r5,#0xa]
    mov        r0,#0xe
    strb       r0,[r5,#0x14]
    Flag_ClearBase 0x9C
    ldrb       r0,[r5,#0xa]
    cmp        r0,#0x2
    bne        LAB_08080746
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x9]
    add        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08080746:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_BombMan_1_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    bne        E_BombMan_2_Free
    push       {r5}
    bl         Camera_DisableScreenShake
    pop        {r5}
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_BombMan_2_Free
    Flag_SetBase 0x9C
    bl         Effect_Free
    pop        {pc}


_nt Effect_BombMan_Create
    push       {lr}
    ldr        r1,DAT_08080798
    ldr        r2,DAT_0808079c
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x36
    bl         Effect_Alloc
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BombMan_0_Init_08080790:
    .word PTR_E_BombMan_0_Init_08080648

PTR_PTR_E_BombMan_1_0_08080794:
    .word PTR_E_BombMan_1_0_080806a4

DAT_08080798:
    .word 0x18A

DAT_0808079c:
    .word 0xFFFFFF54
