#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_SharkMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_SharkManC_0_Init_0806a334
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkManC_0_Init_0806a334:
    .word PTR_R_SharkManC_0_Init_0806a338

PTR_R_SharkManC_0_Init_0806a338:
    .word R_SharkManC_0_Init
    .word R_SharkManC_1_Main
    .word R_SharkManC_2_Free


_ts R_SharkManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    bl         R_SharkMan_CheckHit
    tst        r0,r0
    bne        LAB_0806a3ba
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_0806a370
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    bl         R_SharkManC_SplashEffect
LAB_0806a370:
    mov        r0,#0x1
    mov        r1,#0x59
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x4
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
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r7,PTR_DAT_0806a3c0
    ldr        r1,[r5,#0x4]
    lsl        r1,r1,#0x19
    lsr        r1,r1,#0x19
    ldrb       r1,[r7,r1]
    mul        r0,r1
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x44]
    mov        r0,#0x3
    strb       r0,[r5,#0x1a]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_SharkManC_1_Main
    pop        {pc}
LAB_0806a3ba:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}

PTR_DAT_0806a3c0:
    .word DAT_0806a3c4

DAT_0806a3c4:
    .byte 0x05
    .byte 0x07
    .byte 0x09

    .align 2, 0



_ts R_SharkManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_SharkManC_1_0_0806a3dc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkManC_1_0_0806a3dc:
    .word PTR_R_SharkManC_1_0_0806a3e0

PTR_R_SharkManC_1_0_0806a3e0:
    .word R_SharkManC_1_0
    .word R_SharkManC_1_1
    .word R_SharkManC_1_2


_ts R_SharkManC_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkManC_1_0_0_0806a3fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkManC_1_0_0_0806a3fc:
    .word PTR_R_SharkManC_1_0_0_0806a400

PTR_R_SharkManC_1_0_0_0806a400:
    .word R_SharkManC_1_0_0
    .word R_SharkManC_1_0_1
    .word R_SharkManC_1_0_2
    .word R_SharkManC_1_0_3
    .word R_SharkManC_1_0_4


_ts R_SharkManC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a42e
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_0806a430
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806a42e:
    pop        {pc}
LAB_0806a430:
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_SharkManC_1_0_1
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    mov        r0,#0x1
    ldrb       r0,[r7,#0x2]
    tst        r0,r0
    beq        LAB_0806a458
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0806a458:
    pop        {pc}


_nt R_SharkManC_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806a470
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    bl         R_SharkManC_SplashEffect
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806a470:
    pop        {pc}


_nt R_SharkManC_1_0_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a48e
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    mov        r0,#0x1
    strb       r0,[r7,#0x2]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0806a48e:
    pop        {pc}


_ts R_SharkManC_1_0_4
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a4a4
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806a4a4:
    pop        {pc}


_nt R_SharkManC_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkManC_1_1_0_0806a4b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SharkManC_1_1_0_0806a4b4:
    .word PTR_R_SharkManC_1_1_0_0806a4b8

PTR_R_SharkManC_1_1_0_0806a4b8:
    .word R_SharkManC_1_1_0
    .word R_SharkManC_1_1_1
    .word R_SharkManC_1_1_2


_ts R_SharkManC_1_1_0
    push       {lr}
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_SharkManC_1_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a4ea
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x94
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806a4ea:
    pop        {pc}


_ts R_SharkManC_1_1_2
    push       {lr}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    ldrb       r1,[r5,#0x18]
    cmp        r0,r1
    beq        LAB_0806a508
    strb       r0,[r5,#0x18]
    bl         R_SharkMan_CheckHit
LAB_0806a508:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x19
    .byte 0x00
    .byte 0x01
    .byte 0x02


_ts R_SharkManC_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkManC_1_2_0_0806a520
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkManC_1_2_0_0806a520:
    .word PTR_R_SharkManC_1_2_0_0806a524

PTR_R_SharkManC_1_2_0_0806a524:
    .word R_SharkManC_1_2_0
    .word R_SharkManC_1_2_1


_ts R_SharkManC_1_2_0
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    bl         R_SharkManC_SplashEffect
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_SharkManC_1_2_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806a554
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0806a554:
    pop        {pc}


_nt R_SharkManC_2_Free
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    ldrb       r0,[r7,#0x3]
    sub        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
    pop        {pc}


_ts R_SharkMan_CheckHit
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806a5b0
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    tst        r0,r1
    bne        LAB_0806a5b0
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0806a5c0
    ldr        r1,[r7,r1]
    tst        r0,r1
    beq        LAB_0806a5ac
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldrb       r0,[r5,#0x1a]
    ldr        r4,FamilyDetail_0806a5bc
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
LAB_0806a5ac:
    mov        r0,#0x0
    pop        {pc}
LAB_0806a5b0:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    pop        {pc}

FamilyDetail_0806a5bc:
    .byte 0x19, 0x00, 0x01, 0x02

PTR_PanelFlag_ARRAY_0806a5c0:
    .word PanelFlag_ARRAY_0806a5c4

PanelFlag_ARRAY_0806a5c4:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


_ts R_SharkManC_SplashEffect
    push       {r5,lr}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x26
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0806a5ea
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806a5ea:
    pop        {r5,pc}


_ts Routine_SharkMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x3d
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0806a606
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_0806a606:
    pop        {pc}
