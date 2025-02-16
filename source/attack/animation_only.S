#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_AnimationOnly
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_AnimationOnly_0_Init_0806f4c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_AnimationOnly_0_Init_0806f4c8:
    .word PTR_A_AnimationOnly_0_Init_0806f4cc

PTR_A_AnimationOnly_0_Init_0806f4cc:
    .word A_AnimationOnly_0_Init
    .word A_AnimationOnly_1_Main
    .word A_AnimationOnly_2_Free


_ts A_AnimationOnly_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    ldrh       r1,[r5,#Attack_family_b2]
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Attack_family_b1]
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x1c
    bl         SpritePtr_SetPaletteIndex
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         A_AnimationOnly_1_Main
    pop        {pc}


_ts A_AnimationOnly_1_Main
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    beq        LAB_0806f528
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_0806f528:
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_AnimationOnly_WaitForFrameEnd_0806f554
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r7,[r5,#Attack_param_64]
    add        r7,#0x28
    ldmia      r7!,{r0,r1,r2}
    ldrb       r3,[r5,#Attack_family_family]
    lsl        r3,r3,#0x1b
    bcc        LAB_0806f546
    mov        r3,#0x1
    lsl        r3,r3,#0x10
    sub        r1,r1,r3
    sub        r2,r2,r3
LAB_0806f546:
    mov        r7,#0x28
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_AnimationOnly_WaitForFrameEnd_0806f554:
    .word PTR_A_AnimationOnly_WaitForFrameEnd_0806f558

PTR_A_AnimationOnly_WaitForFrameEnd_0806f558:
    .word A_AnimationOnly_WaitForFrameEnd


_ts A_AnimationOnly_WaitForFrameEnd
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x1a
    bcs        LAB_0806f576
    ldr        r7,[r5,#Attack_param_64]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    and        r0,r1
    mvn        r1,r1
    ldrb       r2,[r5,#Attack_header_entityFlags]
    and        r2,r1
    orr        r0,r2
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_0806f576:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806f59a
    mov        r1,#0x40
    tst        r0,r1
    bne        LAB_0806f59a
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x19
    bcs        LAB_0806f59a
    mov        r0,#0x1
    strb       r0,[r5,#Attack_header_entityFlags]
    ldr        r7,[r5,#Attack_param_64]
    mov        r0,#0x0
    str        r0,[r7,#0x5c]
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_0806f59a:
    pop        {pc}


_ts A_AnimationOnly_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_AnimationOnly_Create
    push       {lr}
    push       {r0,r5}
    mov        r0,#0x0
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5}
    tst        r5,r5
    beq        LAB_0806f5c0
    str        r5,[r7,#0x64]
    mov        r3,#0x60
    strb       r0,[r7,r3]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_0806f5c0:
    pop        {pc}

    .align 2, 0

