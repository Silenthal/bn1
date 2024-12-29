#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_SkullMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_SkullManC_0_Init_08067980
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullManC_0_Init_08067980:
    .word PTR_R_SkullManC_0_Init_08067984

PTR_R_SkullManC_0_Init_08067984:
    .word R_SkullManC_0_Init
    .word R_SkullManC_1_Main
    .word R_SkullManC_2_Free


_ts R_SkullManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x46
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x3
    strb       r0,[r5,#0x1a]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_SkullManC_1_Main
    pop        {pc}


_ts R_SkullManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_SkullManC_1_0_WarpIn_080679f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullManC_1_0_WarpIn_080679f4:
    .word PTR_R_SkullManC_1_0_WarpIn_080679f8

PTR_R_SkullManC_1_0_WarpIn_080679f8:
    .word R_SkullManC_1_0_WarpIn
    .word R_SkullManC_1_1_Skull
    .word R_SkullManC_1_2_WarpOut


_ts R_SkullManC_1_0_WarpIn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullManC_1_0_0_08067a14
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullManC_1_0_0_08067a14:
    .word PTR_R_SkullManC_1_0_0_08067a18

PTR_R_SkullManC_1_0_0_08067a18:
    .word R_SkullManC_1_0_0
    .word R_SkullManC_1_0_1


_ts R_SkullManC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067a38
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x2d
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08067a38:
    pop        {pc}


_nt R_SkullManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067a4c
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08067a4c:
    pop        {pc}


_nt R_SkullManC_1_1_Skull
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullManC_1_1_0_08067a5c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SkullManC_1_1_0_08067a5c:
    .word PTR_R_SkullManC_1_1_0_08067a60

PTR_R_SkullManC_1_1_0_08067a60:
    .word R_SkullManC_1_1_0
    .word R_SkullManC_1_1_1
    .word R_SkullManC_1_1_2
    .word R_SkullManC_1_1_3
    .word R_SkullManC_1_1_4


_ts R_SkullManC_1_1_0
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_SkullManC_1_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067a98
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    bl         R_SkullManC_CreateSkullAndTargetHighestHP
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08067a98:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PF_Teleporting | PF_DieBombExplosion | PF_ActorPlayer | PF_Numb


_ts R_SkullManC_1_1_2
    push       {lr}
    ldr        r0,[r5,#0x60]
    tst        r0,r0
    bne        LAB_08067ab0
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08067ab0:
    pop        {pc}


_nt R_SkullManC_1_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067ac6
    mov        r0,#0x64
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08067ac6:
    pop        {pc}


_ts R_SkullManC_1_1_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067ade
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08067ade:
    pop        {pc}


_ts R_SkullManC_1_2_WarpOut
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067afc
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08067afc:
    pop        {pc}


_nt R_SkullManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067b14
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_08067b14:
    pop        {pc}


_nt R_SkullManC_CreateSkullAndTargetHighestHP
    push       {lr}
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    beq        LAB_08067b44
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    tst        r7,r7
    bne        LAB_08067b68
LAB_08067b28:
    bl         Rng_RandomUint
    lsl        r0,r0,#0x1e
    lsr        r0,r0,#0x1e
    add        r0,#0x2
    lsl        r0,r0,#0x10
    ldrb       r4,[r5,#0x19]
    add        r4,#0x1
    cmp        r4,#0x3
    ble        LAB_08067b3e
    mov        r4,#0x1
LAB_08067b3e:
    lsl        r4,r4,#0x18
    orr        r4,r0
    b          LAB_08067b6c
LAB_08067b44:
    LoadMain battle, r6, r6
    add        r6,#0x54
    mov        r7,#0x0
    mov        r0,#0x0
    mov        r1,#0xc
LAB_08067b50:
    ldr        r2,[r6,r1]
    tst        r2,r2
    beq        LAB_08067b60
    ldrh       r3,[r2,#0x20]
    cmp        r0,r3
    bgt        LAB_08067b60
    add        r7,r2,#0x0
    add        r0,r3,#0x0
LAB_08067b60:
    sub        r1,#0x4
    bpl        LAB_08067b50
    tst        r7,r7
    beq        LAB_08067b28
LAB_08067b68:
    ldrh       r4,[r7,#0x18]
    lsl        r4,r4,#0x10
LAB_08067b6c:
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    ldrb       r0,[r5,#0x4]
    add        r0,#0x80
    orr        r4,r0
    ldrh       r6,[r5,#0x24]
    mov        r0,#0x60
    add        r0,r0,r5
    bl         Attack_Skull_Create
    tst        r7,r7
    beq        LAB_08067b8c
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08067b8c:
    pop        {pc}


_nt Routine_SkullMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x2f
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_08067ba8
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_08067ba8:
    pop        {pc}

    .align 2, 0

