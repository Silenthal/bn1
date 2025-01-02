#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_WWWIceWall
    push       {lr}
    ldr        r0,PTR_PTR_E_WWWIceWall_0_Init_08080dfc
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_WWWIceWall_0_Init_08080d18:
    .word E_WWWIceWall_0_Init
    .word E_WWWIceWall_1_Main
    .word E_WWWIceWall_2_Free


_ts E_WWWIceWall_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r7,PTR_USHORT_08080e00
    ldrb       r2,[r5,#0x4]
    ldrh       r1,[r7,r2]
    add        r2,#0x2
    ldrb       r2,[r7,r2]
    strb       r2,[r5,#0x14]
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
    pop        {pc}


_ts E_WWWIceWall_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x4
    bne        LAB_08080d78
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08080da8
    b          E_WWWIceWall_2_Free
LAB_08080d78:
    Flag_GetBase 0xF9
    beq        LAB_08080d94
    Flag_ClearBase 0xF9
    ldrb       r0,[r5,#0x14]
    add        r0,#0x1
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_08080d94:
    Flag_GetBase 0xDF
    beq        LAB_08080da8
    Flag_ClearBase 0xDF
    mov        r4,#0x4
    bl         Effect_WWWIceWall_CreateEffect
LAB_08080da8:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_WWWIceWall_2_Free
    bl         Effect_Free
    pop        {pc}


_ts Effect_WWWIceWall_CreateEffect
    push       {lr}
    push       {r5}
    push       {r4}
    bl         Rng_RandomUint
    add        r6,r0,#0x0
    mov        r7,#0x7
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
    pop        {r4}
    mov        r0,#0x3d
    bl         Effect_Alloc
    pop        {r5}
    pop        {pc}

    .align 2, 0


USHORT_08080df4:
    .short 0x121

USHORT_08080df6:
    .short 0x0
    .short 0xD3
    .short 0x0

PTR_PTR_E_WWWIceWall_0_Init_08080dfc:
    .word PTR_E_WWWIceWall_0_Init_08080d18

PTR_USHORT_08080e00:
    .word USHORT_08080df4
