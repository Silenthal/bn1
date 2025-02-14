#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_GeneratorLightning
    push       {lr}
    ldr        r0,PTR_PTR_E_GeneratorLightning_0_Init_08081a00
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_GeneratorLightning_0_Init_080818d8:
    .word E_GeneratorLightning_0_Init
    .word E_GeneratorLightning_1_Main
    .word E_GeneratorLightning_2_Free


_ts E_GeneratorLightning_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r7,PTR_INT_08081a04
    ldrb       r2,[r5,#0x4]
    ldr        r1,[r7,r2]
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    ldrb       r2,[r5,#0x4]
    tst        r2,r2
    bne        LAB_08081924
    mov        r0,#0x20
    strb       r0,[r5,#0x1c]
    pop        {pc}
LAB_08081924:
    push       {r5}
    bl         Rng_RandomUint
    pop        {r5}
    mov        r1,#0x1f
    and        r0,r1
    add        r0,#0xb
    strb       r0,[r5,#0x1c]
    pop        {pc}

    .align 2, 0


INT_08081938:
    .word 0x119
    .word 0x11A
    .word 0x11B


_ts E_GeneratorLightning_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_GeneratorLightning_1_0_08081a08
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_GeneratorLightning_1_0_08081950:
    .word E_GeneratorLightning_1_0


_ts E_GeneratorLightning_1_0
    Flag_GetBase 0xDE
    bne        E_GeneratorLightning_2_Free
    ldrb       r2,[r5,#0x4]
    tst        r2,r2
    bne        LAB_08081988
    ldrb       r0,[r5,#0x1c]
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    tst        r0,r0
    bne        LAB_08081992
    mov        r0,#0x10
    strb       r0,[r5,#0x1c]
    push       {r5}
    bl         Rng_RandomUint
    mov        r1,#0x1
    and        r0,r1
    add        r0,#0x1
    mov        r2,#0x4
    mul        r0,r2
    add        r4,r0,#0x0
    bl         E_GeneratorLightning_CreateMore
    pop        {r5}
LAB_08081988:
    ldrb       r0,[r5,#0x1c]
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    tst        r0,r0
    beq        E_GeneratorLightning_2_Free
LAB_08081992:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_GeneratorLightning_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_GeneratorLightning_Create
    push       {lr}
    mov        r1,#0x6
    ldr        r2,DAT_08081a0c
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x48
    bl         Effect_Alloc
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    pop        {pc}


_nt E_GeneratorLightning_CreateMore
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
    mov        r7,#0xf
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0x7
    mov        r3,#0xa
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    mov        r0,#0x48
    pop        {r4}
    bl         Effect_Alloc
    tst        r5,r5
    beq        LAB_080819fc
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
LAB_080819fc:
    pop        {r5}
    pop        {pc}

PTR_PTR_E_GeneratorLightning_0_Init_08081a00:
    .word PTR_E_GeneratorLightning_0_Init_080818d8

PTR_INT_08081a04:
    .word INT_08081938

PTR_PTR_E_GeneratorLightning_1_0_08081a08:
    .word PTR_E_GeneratorLightning_1_0_08081950

DAT_08081a0c:
    .word 0xFFFFFF76
