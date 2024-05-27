#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_QuickEffect_Create, 0x807B5E8+1


_ts Routine_ColorMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_ColorManC_0_Init_08069bd8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ColorManC_0_Init_08069bd8:
    .word PTR_R_ColorManC_0_Init_08069bdc

PTR_R_ColorManC_0_Init_08069bdc:
    .word R_ColorManC_0_Init
    .word R_ColorManC_1_Main
    .word R_ColorManC_2_Free


_ts R_ColorManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x47
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_ColorManC_1_Main
    pop        {pc}


_ts R_ColorManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_ColorManC_1_0_08069c44
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ColorManC_1_0_08069c44:
    .word PTR_R_ColorManC_1_0_08069c48

PTR_R_ColorManC_1_0_08069c48:
    .word R_ColorManC_1_0
    .word R_ColorManC_1_1
    .word R_ColorManC_1_2


_ts R_ColorManC_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorManC_1_0_0_08069c64
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ColorManC_1_0_0_08069c64:
    .word PTR_R_ColorManC_1_0_0_08069c68

PTR_R_ColorManC_1_0_0_08069c68:
    .word R_ColorManC_1_0_0
    .word R_ColorManC_1_0_1


_ts R_ColorManC_1_0_0
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08069c92
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08069c92:
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ColorManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069cb4
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08069cb4:
    pop        {pc}


_nt R_ColorManC_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorManC_1_1_0_08069cc4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ColorManC_1_1_0_08069cc4:
    .word PTR_R_ColorManC_1_1_0_08069cc8

PTR_R_ColorManC_1_1_0_08069cc8:
    .word R_ColorManC_1_1_0
    .word R_ColorManC_1_1_1


_ts R_ColorManC_1_1_0
    push       {lr}
    ldr        r0,DAT_08069cdc
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

DAT_08069cdc:
    .word 0xF2


_ts R_ColorManC_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069cf6
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08069cf6:
    pop        {pc}


_ts R_ColorManC_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069d34
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08069d22
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08069d22:
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08069d34:
    pop        {pc}


_nt R_ColorManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069d4c
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_08069d4c:
    pop        {pc}


_nt Routine_ColorMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x3a
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_08069d68
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_08069d68:
    pop        {pc}

    .align 2, 0

