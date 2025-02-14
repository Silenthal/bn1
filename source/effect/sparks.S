#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Sparks
    push       {lr}
    ldr        r0,PTR_PTR_E_Sparks_0_Init_0808170c
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_Sparks_0_Init_08081660:
    .word E_Sparks_0_Init
    .word E_Sparks_1_Main
    .word E_Sparks_2_Free


_ts E_Sparks_0_Init
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r1,DAT_08081710
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
    mov        r0,#0xe
    strb       r0,[r5,#0x1c]
    pop        {pc}


_ts E_Sparks_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_Sparks_1_0_08081714
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_Sparks_1_0_080816c0:
    .word E_Sparks_1_0


_ts E_Sparks_1_0
    ldrb       r0,[r5,#0x1c]
    tst        r0,r0
    bne        LAB_080816d4
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_080816da
LAB_080816d4:
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    pop        {pc}
LAB_080816da:
    Flag_GetBase 0xE3
    beq        E_Sparks_2_Free
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_Sparks_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_Sparks_Create
    push       {lr}
    ldr        r1,DAT_08081718
    ldr        r2,DAT_0808171c
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x45
    bl         Effect_Alloc
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Sparks_0_Init_0808170c:
    .word PTR_E_Sparks_0_Init_08081660

DAT_08081710:
    .word 0x118

PTR_PTR_E_Sparks_1_0_08081714:
    .word PTR_E_Sparks_1_0_080816c0

DAT_08081718:
    .word 0x232

DAT_0808171c:
    .word 0xFFFFFF86
