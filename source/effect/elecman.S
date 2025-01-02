#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_ElecMan
    push       {lr}
    ldr        r0,PTR_PTR_E_ElecMan_0_Init_0807ff1c
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_ElecMan_0_Init_0807fd2c:
    .word E_ElecMan_0_Init
    .word E_ElecMan_1_Main
    .word E_ElecMan_2_Free


_ts E_ElecMan_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x57
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
    Flag_ClearBase 0xBE
    ldrb       r0,[r5,#0x14]
    cmp        r0,#0xc
    bne        LAB_0807fd8c
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    pop        {pc}
LAB_0807fd8c:
    Flag_GetBase 0xC2
    beq        LAB_0807fda2
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    pop        {pc}
LAB_0807fda2:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts E_ElecMan_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_ElecMan_1_0_0807ff20
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_ElecMan_1_0_0807fdb8:
    .word E_ElecMan_1_0
    .word E_ElecMan_1_1
    .word E_ElecMan_1_2
    .word E_ElecMan_1_3
    .word E_ElecMan_1_4
    .word E_ElecMan_1_5
    .word E_ElecMan_1_6
    .word E_ElecMan_1_7


_ts E_ElecMan_1_0
    Flag_GetBase 0xBE
    beq        LAB_0807fdf0
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_0807fdf0:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_ElecMan_1_1
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_ElecMan_1_2
    Flag_GetBase 0xBE
    beq        LAB_0807fe14
    mov        r0,#0xe
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_0807fe14:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_ElecMan_1_3
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807fe34
    mov        r0,#0xf
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
LAB_0807fe34:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_ElecMan_1_4
    Flag_GetBase 0xBE
    bne        LAB_0807fe52
    mov        r0,#0x10
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
LAB_0807fe52:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_ElecMan_1_5
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807fe6e
    mov        r0,#0x11
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_0807fe6e:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_ElecMan_1_6
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x1
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    tst        r0,r0
    bne        LAB_0807feba
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
    bl         Effect_TrafficExplosion_1_Create
    pop        {r5}
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_0807feba:
    Flag_GetBase 0xBE
    beq        LAB_0807fed2
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0xf0
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
LAB_0807fed2:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_ElecMan_1_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    bne        E_ElecMan_2_Free
    push       {r5}
    bl         Camera_DisableScreenShake
    pop        {r5}
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_ElecMan_2_Free
    Flag_ClearBase 0xBE
    bl         Effect_Free
    pop        {pc}


_nt Effect_ElecMan_Create
    push       {lr}
    push       {r0}
    mov        r1,#0x10
    ldr        r2,DAT_0807ff24
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x2f
    bl         Effect_Alloc
    pop        {r0}
    strh       r0,[r5,#0x14]
    pop        {pc}

PTR_PTR_E_ElecMan_0_Init_0807ff1c:
    .word PTR_E_ElecMan_0_Init_0807fd2c

PTR_PTR_E_ElecMan_1_0_0807ff20:
    .word PTR_E_ElecMan_1_0_0807fdb8

DAT_0807ff24:
    .word 0xFFFFFE4E
