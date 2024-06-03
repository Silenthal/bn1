#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_MegaMan
    push       {lr}
    ldr        r0,PTR_PTR_E_MegaMan_0_Init_08081518
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_MegaMan_0_Init_080813b0:
    .word E_MegaMan_0_Init
    .word E_MegaMan_1_Main
    .word E_MegaMan_2_Free


_ts E_MegaMan_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x8
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


_ts E_MegaMan_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_MegaMan_1_0_0808151c
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_MegaMan_1_0_0808140c:
    .word E_MegaMan_1_0
    .word E_MegaMan_1_1
    .word E_MegaMan_1_2
    .word E_MegaMan_1_3


_ts E_MegaMan_1_0
    mov        r0,#0x93
    bl         Flag_GetBase
    beq        LAB_0808143a
    mov        r0,#0x93
    bl         Flag_ClearBase
    mov        r0,#0x2
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x3c
    strb       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x9]
    add        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_0808143a:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_MegaMan_1_1
    ldrb       r0,[r5,#0x1c]
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    tst        r0,r0
    bne        LAB_08081454
    mov        r0,#0x8
    strb       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x9]
    add        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08081454:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_MegaMan_1_2
    ldrb       r0,[r5,#0x1c]
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    cmp        r0,#0x4
    bne        LAB_0808146a
    mov        r0,#0x1
    bl         SpritePtr_SetPaletteIndex
LAB_0808146a:
    tst        r0,r0
    bne        LAB_08081478
    mov        r0,#0x2
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x8
    strb       r0,[r5,#0x1c]
LAB_08081478:
    mov        r0,#0x93
    bl         Flag_GetBase
    beq        LAB_08081498
    mov        r0,#0x93
    bl         Flag_ClearBase
    mov        r0,#0x4a
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x9]
    add        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08081498:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_MegaMan_1_3
    mov        r2,#0x4
    mov        r0,#0x93
    bl         Flag_GetBase
    beq        LAB_080814b6
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r2,#0x8
LAB_080814b6:
    ldrb       r0,[r5,#0x1c]
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    cmp        r0,r2
    bne        LAB_080814c6
    mov        r0,#0x1
    bl         SpritePtr_SetPaletteIndex
LAB_080814c6:
    tst        r0,r0
    bne        LAB_080814de
    mov        r0,#0x2
    bl         SpritePtr_SetPaletteIndex
    mov        r2,#0x8
    mov        r0,#0x93
    bl         Flag_GetBase
    beq        LAB_080814dc
    mov        r2,#0x10
LAB_080814dc:
    strb       r2,[r5,#0x1c]
LAB_080814de:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080814ee
    mov        r0,#0xe3
    bl         Flag_SetBase
LAB_080814ee:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_MegaMan_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_MegaMan_Create
    push       {lr}
    ldr        r1,DAT_08081520
    ldr        r2,DAT_08081524
    mov        r3,#0x0
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x43
    bl         Effect_Alloc
    mov        r0,#0x49
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_MegaMan_0_Init_08081518:
    .word PTR_E_MegaMan_0_Init_080813b0

PTR_PTR_E_MegaMan_1_0_0808151c:
    .word PTR_E_MegaMan_1_0_0808140c

DAT_08081520:
    .word 0x230

DAT_08081524:
    .word 0xFFFFFF62
