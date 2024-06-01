#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_IceMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_IceManC_0_Init_08061a74
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_IceManC_0_Init_08061a74:
    .word PTR_R_IceManC_0_Init_08061a78

PTR_R_IceManC_0_Init_08061a78:
    .word R_IceManC_0_Init
    .word R_IceManC_1_Main
    .word R_IceManC_2_Free


_ts R_IceManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x2a
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
    bl         R_IceManC_1_Main
    pop        {pc}


_ts R_IceManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_IceManC_1_0_Emerge_08061ae8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_IceManC_1_0_Emerge_08061ae8:
    .word PTR_R_IceManC_1_0_Emerge_08061aec

PTR_R_IceManC_1_0_Emerge_08061aec:
    .word R_IceManC_1_0_Emerge
    .word R_IceManC_1_1_Attack
    .word R_IceManC_1_2_Finish


_ts R_IceManC_1_0_Emerge
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_IceManC_1_0_0_Emerge_08061b08
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_IceManC_1_0_0_Emerge_08061b08:
    .word PTR_R_IceManC_1_0_0_Emerge_08061b0c

PTR_R_IceManC_1_0_0_Emerge_08061b0c:
    .word R_IceManC_1_0_0_Emerge
    .word R_IceManC_1_0_1_Next


_ts R_IceManC_1_0_0_Emerge
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061b2c
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x2d
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08061b2c:
    pop        {pc}


_nt R_IceManC_1_0_1_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061b40
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08061b40:
    pop        {pc}


_nt R_IceManC_1_1_Attack
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_IceManC_1_1_0_StartAnim_08061b50
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_IceManC_1_1_0_StartAnim_08061b50:
    .word PTR_R_IceManC_1_1_0_StartAnim_08061b54

PTR_R_IceManC_1_1_0_StartAnim_08061b54:
    .word R_IceManC_1_1_0_StartAnim
    .word R_IceManC_1_1_1_Spikes
    .word R_IceManC_1_1_2_Reset
    .word R_IceManC_1_1_3_Wait
    .word R_IceManC_1_1_4_WarpOut


_ts R_IceManC_1_1_0_StartAnim
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_IceManC_1_1_1_Spikes
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061bd0
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,FamilyDetail_08061bd4
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08061ba8
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08061ba8:
    ldrb       r1,[r5,#0x18]
    mov        r2,#0x1
    mov        r0,#0x3
    mov        r4,#0x0
    ldrh       r6,[r5,#0x24]
LAB_08061bb2:
    push       {r0,r1,r2,r4,r6}
    bl         Attack_IceManSpikes_Create
    tst        r7,r7
    beq        LAB_08061bc4
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08061bc4:
    pop        {r0,r1,r2,r4,r6}
    add        r2,#0x1
    cmp        r2,#0x4
    bne        LAB_08061bb2
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08061bd0:
    pop        {pc}

    .align 2, 0


FamilyDetail_08061bd4:
    .byte 0x00, 0x04, 0x89, 0x00


_ts R_IceManC_1_1_2_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061bee
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    bl         R_Actor_ClearCurrentAttack
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08061bee:
    pop        {pc}


_ts R_IceManC_1_1_3_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061c04
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08061c04:
    pop        {pc}


_nt R_IceManC_1_1_4_WarpOut
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061c1c
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08061c1c:
    pop        {pc}


_nt R_IceManC_1_2_Finish
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08061c3a
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08061c3a:
    pop        {pc}


_ts R_IceManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061c52
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_08061c52:
    pop        {pc}


_ts Routine_IceMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x1d
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_08061c6e
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_08061c6e:
    pop        {pc}
