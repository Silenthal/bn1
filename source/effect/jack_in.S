#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_JackIn
    push       {lr}
    ldr        r0,PTR_PTR_E_JackIn_0_Init_08081638
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_JackIn_0_Init_08081538:
    .word E_JackIn_0_Init
    .word E_JackIn_1_Main
    .word E_JackIn_2_Free


_ts E_JackIn_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x4]
    tst        r1,r1
    beq        LAB_08081556
    mov        r1,#0xe2
    b          LAB_0808155e
LAB_08081556:
    mov        r0,#0xde
    bl         Sound_PlaySE
    ldr        r1,DAT_0808163c
LAB_0808155e:
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
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
    mov        r1,#0x0
    str        r1,[r5,#0x44]
    str        r1,[r5,#0x48]
    str        r1,[r5,#0x4c]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts E_JackIn_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_JackIn_1_0_08081640
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_JackIn_1_0_080815a4:
    .word E_JackIn_1_0


_ts E_JackIn_1_0
    ldrb       r1,[r5,#0x4]
    tst        r1,r1
    beq        LAB_080815c2
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080815dc
    ldrb       r0,[r5,#0xa]
    add        r0,#0x1
    strb       r0,[r5,#0xa]
    cmp        r0,#0x2
    beq        E_JackIn_2_Free
LAB_080815c2:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080815dc
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080815dc
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    mov        r0,#0xdf
    bl         Sound_PlaySE
LAB_080815dc:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_JackIn_2_Free
    bl         Effect_Free
    pop        {pc}


_ts Effect_JackIn_Create
    push       {lr}
    ldr        r7,PTR_INT_08081644
    mov        r6,#0x8
    mul        r6,r4
    ldrh       r1,[r7,r6]
    add        r6,#0x4
    ldrh       r2,[r7,r6]
    mov        r3,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x44
    bl         Effect_Alloc
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


INT_0808160c:
    .word 0x226
    .word 0xFFFFFF6A
    .word 0x22E
    .word 0xFFFFFF6A


_ts FUN_0808161c
    push       {lr}
    ldr        r1,DAT_08081648
    ldr        r2,DAT_0808164c
    mov        r3,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x44
    bl         Effect_Alloc
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_JackIn_0_Init_08081638:
    .word PTR_E_JackIn_0_Init_08081538

DAT_0808163c:
    .word 0x11D

PTR_PTR_E_JackIn_1_0_08081640:
    .word PTR_E_JackIn_1_0_080815a4

PTR_INT_08081644:
    .word INT_0808160c

DAT_08081648:
    .word 0x226

DAT_0808164c:
    .word 0xFFFFFF6A
