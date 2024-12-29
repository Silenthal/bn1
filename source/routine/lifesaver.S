#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_LifeSaver
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_LifeSaver_0_Init_0806e384
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_LifeSaver_0_Init_0806e384:
    .word PTR_R_LifeSaver_0_Init_0806e388

PTR_R_LifeSaver_0_Init_0806e388:
    .word R_LifeSaver_0_Init
    .word R_LifeSaver_1_Main
    .word R_LifeSaver_2_Free


_ts R_LifeSaver_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x63
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrh       r0,[r7,#0x18]
    strh       r0,[r5,#0x18]
    mov        r3,#0x28
    add        r7,r7,r3
    ldmia      r7!,{r0,r1,r2}
    add        r3,r3,r5
    stmia      r3!,{r0,r1,r2}
    bl         Field_GetAttackDirectionOffset_MP
    neg        r0,r0
    mov        r1,#0x14
    lsl        r1,r1,#0x10
    mul        r1,r0
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    ldr        r1,[r5,#0x2c]
    sub        r1,r1,r0
    str        r1,[r5,#0x2c]
    ldr        r1,[r5,#0x30]
    sub        r1,r1,r0
    str        r1,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
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
    beq        LAB_0806e422
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0806e422:
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_LifeSaver_1_Main
    pop        {pc}


_nt R_LifeSaver_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_LifeSaver_1_0_0806e440
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_LifeSaver_1_0_0806e440:
    .word PTR_R_LifeSaver_1_0_0806e444

PTR_R_LifeSaver_1_0_0806e444:
    .word R_LifeSaver_1_0
    .word R_LifeSaver_1_1
    .word R_LifeSaver_1_2


_ts R_LifeSaver_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeSaver_1_0_0_0806e460
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_LifeSaver_1_0_0_0806e460:
    .word PTR_R_LifeSaver_1_0_0_0806e464

PTR_R_LifeSaver_1_0_0_0806e464:
    .word R_LifeSaver_1_0_0
    .word R_LifeSaver_1_0_1


_ts R_LifeSaver_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e484
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806e484:
    pop        {pc}


_nt R_LifeSaver_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e498
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806e498:
    pop        {pc}


_nt R_LifeSaver_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeSaver_1_1_0_0806e4a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_LifeSaver_1_1_0_0806e4a8:
    .word PTR_R_LifeSaver_1_1_0_0806e4ac

PTR_R_LifeSaver_1_1_0_0806e4ac:
    .word R_LifeSaver_1_1_0
    .word R_LifeSaver_1_1_1
    .word R_LifeSaver_1_1_2
    .word R_LifeSaver_1_1_3
    .word R_LifeSaver_1_1_4


_ts R_LifeSaver_1_1_0
    push       {lr}
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_LifeSaver_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e4fe
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x2e
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806e4f4
    ldr        r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    str        r0,[r5,#0x0]
LAB_0806e4f4:
    pop        {r5}
    mov        r0,#0xe
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806e4fe:
    pop        {pc}


_ts R_LifeSaver_1_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e566
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0806e568
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x7
    orr        r4,r0
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806e52a
    ldr        r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    str        r0,[r5,#0x0]
LAB_0806e52a:
    pop        {r5}
    ldrb       r0,[r5,#0x16]
    bl         Battle_GetPlayer
    push       {r5,r7}
    add        r5,r7,#0x0
    ldrh       r0,[r5,#0x22]
    bl         Field_AddHp
    pop        {r5,r7}
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0xe
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806e556
    ldr        r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    str        r0,[r5,#0x0]
LAB_0806e556:
    pop        {r5}
    mov        r0,#0x72
    bl         Sound_PlaySongImmediate
    mov        r0,#0x64
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806e566:
    pop        {pc}

DAT_0806e568:
    .word 0x64002F


_ts R_LifeSaver_1_1_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e582
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0806e582:
    pop        {pc}


_ts R_LifeSaver_1_1_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e59a
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806e59a:
    pop        {pc}


_ts R_LifeSaver_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e5b8
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0806e5b8:
    pop        {pc}


_nt R_LifeSaver_2_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e5d2
    LoadMain screenDim, r7, r7
    ldrb       r0,[r7,#0x3]
    add        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_0806e5d2:
    pop        {pc}


_ts Routine_LifeSaver_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x4d
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_0806e5f4
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806e5f4:
    pop        {pc}

    .align 2, 0

