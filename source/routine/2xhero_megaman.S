#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_Charging_Create, 0x8070392+1
    .set Effect_QuickEffect_Create, 0x807B5E8+1
    .set SWI_DivMod, 0x809DF58+1


_ts Routine_2xHeroMegaMan
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_2xHeroMegaMan_0_Init_0806e608
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_2xHeroMegaMan_0_Init_0806e608:
    .word PTR_R_2xHeroMegaMan_0_Init_0806e60c

PTR_R_2xHeroMegaMan_0_Init_0806e60c:
    .word R_2xHeroMegaMan_0_Init
    .word R_2xHeroMegaMan_1_Main
    .word R_2xHeroMegaMan_2_Free


_ts R_2xHeroMegaMan_0_Init
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
    beq        LAB_0806e638
    mov        r0,#0x4
LAB_0806e638:
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    push       {r0}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    pop        {r2}
    mov        r3,#0xa
    lsl        r3,r3,#0x10
    mul        r3,r2
    add        r0,r0,r3
    str        r0,[r5,#0x28]
    mov        r3,#0x6
    lsl        r3,r3,#0x10
    mul        r3,r2
    add        r1,r1,r3
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    ldr        r0,PanelFlag_0806e688
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_2xHeroMegaMan_1_Main
    pop        {pc}

    .align 2, 0


PanelFlag_0806e688:
    .word PF_Cracked | PF_Ground | PF_PlayerOccupied | PF_EnemyOccupied


_ts R_2xHeroMegaMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_2xHeroMegaMan_1_0_0806e6a0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_2xHeroMegaMan_1_0_0806e6a0:
    .word PTR_R_2xHeroMegaMan_1_0_0806e6a4

PTR_R_2xHeroMegaMan_1_0_0806e6a4:
    .word R_2xHeroMegaMan_1_0
    .word R_2xHeroMegaMan_1_1
    .word R_2xHeroMegaMan_1_2


_ts R_2xHeroMegaMan_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e6c2
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806e6c2:
    pop        {pc}


_ts R_2xHeroMegaMan_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_2xHeroMegaMan_1_1_0_0806e6d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_2xHeroMegaMan_1_1_0_0806e6d4:
    .word PTR_R_2xHeroMegaMan_1_1_0_0806e6d8

PTR_R_2xHeroMegaMan_1_1_0_0806e6d8:
    .word R_2xHeroMegaMan_1_1_0
    .word R_2xHeroMegaMan_1_1_1
    .word R_2xHeroMegaMan_1_1_2
    .word R_2xHeroMegaMan_1_1_3


_ts R_2xHeroMegaMan_1_1_0
    push       {lr}
    mov        r4,#0x0
    bl         Attack_Charging_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806e6fe
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806e6fe:
    mov        r0,#0x60
    strh       r0,[r5,#0x1c]
    mov        r0,#0xd3
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_2xHeroMegaMan_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x38
    bhi        LAB_0806e72c
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0806e72c
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    mov        r0,#0xd4
    bl         Sound_PlaySongImmediate
LAB_0806e72c:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e756
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0806e754
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    mov        r0,#0x23
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806e754:
    pop        {pc}
LAB_0806e756:
    lsr        r0,r0,#0x5
    mov        r1,#0x2
    sub        r1,r1,r0
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806e764
    strb       r1,[r7,#0x14]
LAB_0806e764:
    pop        {pc}


_nt R_2xHeroMegaMan_1_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806e776
    bl         R_2xHeroMegaMan_CreateHitEffects
LAB_0806e776:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e794
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e796
    mov        r0,#0x1e
    str        r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806e794:
    pop        {pc}
LAB_0806e796:
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    pop        {pc}


_nt R_2xHeroMegaMan_1_1_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806e7b4
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806e7b4:
    pop        {pc}


_nt R_2xHeroMegaMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_2xHeroMegaMan_1_2_0_0806e7c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_2xHeroMegaMan_1_2_0_0806e7c4:
    .word PTR_R_2xHeroMegaMan_1_2_0_0806e7c8

PTR_R_2xHeroMegaMan_1_2_0_0806e7c8:
    .word R_2xHeroMegaMan_1_2_0
    .word R_2xHeroMegaMan_1_2_1


_ts R_2xHeroMegaMan_1_2_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_2xHeroMegaMan_1_2_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806e7ec
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
LAB_0806e7ec:
    pop        {pc}


_nt R_2xHeroMegaMan_2_Free
    push       {lr}
    bl         R_2xHeroMegaMan_Attack
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    ldrb       r0,[r7,#0x3]
    add        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
    pop        {pc}


_ts R_2xHeroMegaMan_CreateHitEffects
    push       {r5,lr}
    bl         Rng_RandomUint
    ldrb       r2,[r5,#0x18]
    add        r3,r2,#0x1
    ldrb       r1,[r5,#0x16]
    mov        r4,r10
    ldr        r4,[r4,#0xc]
    ldrb       r4,[r4,#0x1a]
    eor        r1,r4
    tst        r1,r1
    beq        LAB_0806e822
    mov        r1,#0x7
    sub        r2,r1,r2
    mov        r3,#0x1
LAB_0806e822:
    mov        r1,#0x6
    sub        r1,r1,r2
    bls        LAB_0806e860
    push       {r0,r3}
    lsr        r0,r0,#0x10
    bl         SWI_DivMod
    add        r7,r0,#0x0
    pop        {r0,r3}
    add        r7,r7,r3
    lsl        r0,r0,#0x10
    lsr        r0,r0,#0x10
    mov        r1,#0x3
    bl         SWI_DivMod
    add        r1,r0,#0x1
    add        r0,r7,#0x0
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x1
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0806e860
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0806e860:
    pop        {r5,pc}


_nt R_2xHeroMegaMan_Attack
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x14
    mov        r0,sp
    push       {r0}
    bl         Battle_FindOpponentPanelsForward
    pop        {r7}
    ldr        r4,FamilyDetail_0806e8a0
    ldrh       r6,[r5,#0x24]
LAB_0806e87a:
    sub        r0,#0x4
    bmi        LAB_0806e89c
    push       {r0,r4,r6,r7}
    ldrb       r0,[r7,r0]
    bl         Field_IndexToCellXY
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    pop        {r0,r4,r6,r7}
    b          LAB_0806e87a
LAB_0806e89c:
    add        sp,#0x14
    pop        {pc}

FamilyDetail_0806e8a0:
    .byte 0x19, 0x00, 0x01, 0x02


_ts Routine_2xHeroMegaMan_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x4e
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_0806e8c4
    strb       r0,[r7,#0x16]
    str        r6,[r7,#0x24]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806e8c4:
    pop        {pc}

    .align 2, 0

