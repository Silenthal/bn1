#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Unk09
    push       {lr}
    ldr        r7,PTR_PTR_A_Unk09_0_Init_0807012c
    ldrb       r0,[r5,#0x8]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_A_Unk09_0_Init_08070094:
    .word A_Unk09_0_Init
    .word A_Unk09_1_Main
    .word A_Unk09_2_Free


_ts A_Unk09_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         SpritePtr_NoZClip
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0xa0
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]


_ts A_Unk09_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    bl         Battle_GetEntryState
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080700e6
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_080700e6:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts A_Unk09_2_Free
    push       {lr}
    bl         Rng_RandomUint
    add        r6,r0,#0x0
    mov        r4,#0x7
    and        r6,r4
    sub        r6,#0x4
    lsl        r6,r6,#0x10
    ldr        r1,[r5,#0x28]
    add        r1,r1,r6
    lsr        r0,r0,#0x3
    and        r0,r4
    sub        r0,#0x4
    lsl        r0,r0,#0x10
    ldr        r2,[r5,#0x2c]
    add        r2,r2,r6
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    bl         Attack_Free
    pop        {pc}

    .align 2, 0



_ts Attack_Unk09_Create
    push       {lr}
    mov        r0,#0x9
    bl         Attack_Alloc
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Unk09_0_Init_0807012c:
    .word PTR_A_Unk09_0_Init_08070094
