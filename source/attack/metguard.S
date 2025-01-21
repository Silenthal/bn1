#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


SpriteIndex_0806fe3c:
    .byte 0x6F
    .byte 0xB2

_nt Attack_MetGuard
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_MetGuard_0_Init_0806fe4c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_MetGuard_0_Init_0806fe4c:
    .word PTR_A_MetGuard_0_Init_0806fe50

PTR_A_MetGuard_0_Init_0806fe50:
    .word A_MetGuard_0_Init
    .word A_MetGuard_1_Main
    .word A_MetGuard_2_Free


_ts A_MetGuard_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r7,PTR_SpriteIndex_0806fe8c
    ldrb       r1,[r5,#0x4]
    ldrb       r1,[r7,r1]
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0


PTR_SpriteIndex_0806fe8c:
    .word SpriteIndex_0806fe3c


_ts A_MetGuard_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_MetGuard_1_0_Wait_0806fea8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_MetGuard_1_0_Wait_0806fea8:
    .word PTR_A_MetGuard_1_0_Wait_0806feac

PTR_A_MetGuard_1_0_Wait_0806feac:
    .word A_MetGuard_1_0_Wait
    .word A_MetGuard_1_1_Guard
    .word A_MetGuard_1_2_Wait


_ts A_MetGuard_1_0_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0806fed0
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806fed0:
    pop        {pc}


_nt A_MetGuard_1_1_Guard
    push       {lr}
    ldrb       r0,[r5,#0x5]
    lsr        r0,r0,#0x2
    bcc        LAB_0806fee8
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806fee8:
    ldrb       r0,[r5,#0x5]
    lsr        r0,r0,#0x1
    bcc        LAB_0806fef6
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    bl         SpritePtr_EnableFlash
LAB_0806fef6:
    pop        {pc}


_ts A_MetGuard_1_2_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ff08
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0806ff08:
    pop        {pc}


_nt A_MetGuard_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x5]
    lsr        r0,r0,#0x2
    bcs        LAB_0806ff18
    ldr        r7,[r5,#0x64]
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_0806ff18:
    bl         Attack_Free
    pop        {pc}


_nt Attack_MetGuard_Create
    push       {lr}
    push       {r0,r5}
    mov        r0,#0x7
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5}
    beq        LAB_0806ff38
    str        r7,[r0,#0x0]
    str        r0,[r7,#0x64]
    str        r5,[r7,#0x60]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0806ff38:
    pop        {pc}

    .align 2, 0

