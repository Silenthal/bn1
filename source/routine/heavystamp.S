#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_HeavyStamp
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_HeavyStamp_0_Init_0806eb3c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_HeavyStamp_0_Init_0806eb3c:
    .word PTR_R_HeavyStamp_0_Init_0806eb40

PTR_R_HeavyStamp_0_Init_0806eb40:
    .word R_HeavyStamp_0_Init
    .word R_HeavyStamp_1_Main
    .word R_HeavyStamp_2_Free


_ts R_HeavyStamp_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0806eb6c
    mov        r0,#0x4
LAB_0806eb6c:
    bl         SpritePtr_SetPaletteIndex
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    ldr        r0,DAT_0806ebbc
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_HeavyStamp_1_Main
    pop        {pc}

    .align 2, 0


DAT_0806ebbc:
    .word 0x1E


_ts R_HeavyStamp_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_HeavyStamp_1_0_0806ebd4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_HeavyStamp_1_0_0806ebd4:
    .word PTR_R_HeavyStamp_1_0_0806ebd8

PTR_R_HeavyStamp_1_0_0806ebd8:
    .word R_HeavyStamp_1_0
    .word R_HeavyStamp_1_1
    .word R_HeavyStamp_1_2


_ts R_HeavyStamp_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806ebf6
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806ebf6:
    pop        {pc}


_ts R_HeavyStamp_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_HeavyStamp_1_1_0_0806ec08
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_HeavyStamp_1_1_0_0806ec08:
    .word PTR_R_HeavyStamp_1_1_0_0806ec0c

PTR_R_HeavyStamp_1_1_0_0806ec0c:
    .word R_HeavyStamp_1_1_0
    .word R_HeavyStamp_1_1_1
    .word R_HeavyStamp_1_1_2
    .word R_HeavyStamp_1_1_3
    .word R_HeavyStamp_1_1_4
    .word R_HeavyStamp_1_1_5
    .word R_HeavyStamp_1_1_6


_ts R_HeavyStamp_1_1_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_HeavyStamp_1_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ec68
    bl         R_HeavyStamp_ChooseTarget
    mov        r0,#0x1b
    strb       r0,[r5,#0x14]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0806ec6c
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806ec64
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806ec64:
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806ec68:
    pop        {pc}

    .align 2, 0


DAT_0806ec6c:
    .word 0xB50080


_ts R_HeavyStamp_1_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806eca8
    mov        r0,#0x1c
    strb       r0,[r5,#0x14]
    bl         Field_AttackFree
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0806ecac
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806eca0
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806eca0:
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806eca8:
    pop        {pc}

    .align 2, 0


DAT_0806ecac:
    .word 0xB50180


_ts R_HeavyStamp_1_1_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806ecc4
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x4c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0806ecc4:
    pop        {pc}


_nt R_HeavyStamp_1_1_4
    push       {lr}
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x4c]
    sub        r0,r0,r1
    str        r0,[r5,#0x30]
    bgt        LAB_0806ed2a
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x2
    mov        r1,#0x2d
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x1d
    strb       r0,[r5,#0x14]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x31
    push       {r1,r2,r3,r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806ed06
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0806ed06:
    pop        {r1,r2,r3,r5}
    push       {r1,r2,r3}
    bl         Field_AttackFree
    pop        {r1,r2,r3}
    ldr        r4,DAT_0806ed2c
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806ed26
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806ed26:
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_0806ed2a:
    pop        {pc}

DAT_0806ed2c:
    .word 0xB50280


_ts R_HeavyStamp_1_1_5
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ed44
    mov        r0,#0x50
    strh       r0,[r5,#0x1c]
    mov        r0,#0x18
    strh       r0,[r5,#0xa]
LAB_0806ed44:
    pop        {pc}


_nt R_HeavyStamp_1_1_6
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806ed58
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806ed58:
    pop        {pc}


_nt R_HeavyStamp_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_HeavyStamp_1_2_0_0806ed68
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_HeavyStamp_1_2_0_0806ed68:
    .word PTR_R_HeavyStamp_1_2_0_0806ed6c

PTR_R_HeavyStamp_1_2_0_0806ed6c:
    .word R_HeavyStamp_1_2_0
    .word R_HeavyStamp_1_2_1


_ts R_HeavyStamp_1_2_0
    push       {lr}
    mov        r0,#0x1e
    strb       r0,[r5,#0x14]
    bl         Field_AttackFree
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0806eda0
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806ed9a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806ed9a:
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_0806eda0:
    .word 0xB50380


_ts R_HeavyStamp_1_2_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806edc6
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x0
    ldr        r4,DAT_0806edc8
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
LAB_0806edc6:
    pop        {pc}

DAT_0806edc8:
    .word 0x2010019


_ts R_HeavyStamp_2_Free
    push       {lr}
    bl         Field_AttackFree
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
    pop        {pc}


_ts R_HeavyStamp_ChooseTarget
    push       {lr}
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    beq        LAB_0806ee0e
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    tst        r7,r7
    bne        LAB_0806ee32
LAB_0806edf2:
    bl         Rng_RandomUint
    lsl        r0,r0,#0x1e
    lsr        r0,r0,#0x1e
    add        r0,#0x2
    lsl        r0,r0,#0x10
    ldrb       r4,[r5,#0x19]
    add        r4,#0x1
    cmp        r4,#0x3
    ble        LAB_0806ee08
    mov        r4,#0x1
LAB_0806ee08:
    lsl        r4,r4,#0x18
    orr        r4,r0
    b          LAB_0806ee34
LAB_0806ee0e:
    LoadMain battle, r6, r6
    add        r6,#0x54
    mov        r7,#0x0
    mov        r0,#0x0
    mov        r1,#0xc
LAB_0806ee1a:
    ldr        r2,[r6,r1]
    tst        r2,r2
    beq        LAB_0806ee2a
    ldrh       r3,[r2,#0x20]
    cmp        r0,r3
    bgt        LAB_0806ee2a
    add        r7,r2,#0x0
    add        r0,r3,#0x0
LAB_0806ee2a:
    sub        r1,#0x4
    bpl        LAB_0806ee1a
    tst        r7,r7
    beq        LAB_0806edf2
LAB_0806ee32:
    ldrh       r4,[r7,#0x18]
LAB_0806ee34:
    strh       r4,[r5,#0x18]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x40
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    pop        {pc}


_nt Routine_HeavyStamp_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x50
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_0806ee6a
    strb       r0,[r7,#0x16]
    str        r6,[r7,#0x24]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806ee6a:
    pop        {pc}
