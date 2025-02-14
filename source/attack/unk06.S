#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Unk06
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    beq        LAB_0806fd78
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_0806fd78:
    ldr        r7,PTR_PTR_A_Unk06_0_Init_0806fe38
    ldrb       r0,[r5,#0x8]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_A_Unk06_0_Init_0806fd84:
    .word A_Unk06_0_Init
    .word A_Unk06_1_Main
    .word A_Unk06_2_Free


_ts A_Unk06_0_Init
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         SpritePtr_NoShadow
    pop        {pc}


_ts A_Unk06_1_Main
    push       {lr}
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_0806fde6
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         SpritePtr_ProcessFrameDelay
    pop        {r0,r1}
    pop        {pc}
LAB_0806fde6:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts A_Unk06_2_Free
    push       {lr}
    bl         Rng_RandomUint
    mov        r4,#0xf
    and        r4,r0
    lsl        r4,r4,#0x10
    ldr        r1,[r5,#0x28]
    add        r1,r1,r4
    lsr        r0,r0,#0x4
    mov        r4,#0x7
    and        r4,r0
    lsl        r4,r4,#0x10
    ldr        r3,[r5,#0x30]
    add        r3,r3,r4
    ldr        r2,[r5,#0x2c]
    mov        r4,#0x1
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    bl         Attack_Free
    pop        {pc}


_nt Attack_Unk06_Create
    push       {lr}
    push       {r6,r7}
    mov        r0,#0x6
    bl         Attack_Alloc
    tst        r5,r5
    beq        LAB_0806fe34
    pop        {r6,r7}
    str        r7,[r5,#0x44]
    str        r6,[r5,#0x60]
    mov        r0,#0x60
    add        r0,r5,r0
    str        r6,[r0,#0x60]
LAB_0806fe34:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Unk06_0_Init_0806fe38:
    .word PTR_A_Unk06_0_Init_0806fd84
