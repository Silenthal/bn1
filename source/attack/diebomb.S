#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_DieBombExplosion_Create, 0x807DE5E+1


listDieBombFaceValue:
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x04
    .byte 0x04
    .byte 0x05


_ts Attack_DieBomb
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_DieBomb_0_Init_08072778
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_DieBomb_0_Init_08072778:
    .word PTR_A_DieBomb_0_Init_0807277c

PTR_A_DieBomb_0_Init_0807277c:
    .word A_DieBomb_0_Init
    .word A_DieBomb_1_Main
    .word A_DieBomb_2_Free
    .word A_DieBomb_3_Explode


_ts A_DieBomb_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x85
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x40
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r0,#0xa
    strh       r0,[r5,#0x22]
    strh       r0,[r5,#0x20]
    mov        r0,#0x0
    strh       r0,[r5,#0x24]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0xf
    mov        r3,#0x60
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0x93
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_DieBomb_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_nt A_DieBomb_1_Main
    push       {lr}
    bl         Battle_IsInputLocked
    beq        LAB_080727f8
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_080727f8:
    bl         A_DieBomb_CheckDamage
    tst        r0,r0
    bne        LAB_0807280a
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_DieBomb_1_0_08072818
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0807280a:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_DieBomb_1_0_08072818:
    .word PTR_A_DieBomb_1_0_0807281c

PTR_A_DieBomb_1_0_0807281c:
    .word A_DieBomb_1_0
    .word A_DieBomb_1_1_Bounce
    .word A_DieBomb_1_2
    .word A_DieBomb_1_3


_ts A_DieBomb_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08072862
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    str        r0,[r5,#0x4c]
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r1,r0
    ldr        r7,PTR_listDieBombFaceValue_08072864
    ldrb       r0,[r7,r1]
    strb       r0,[r5,#0x5]
    mov        r1,#0xa
    mul        r1,r0
    add        r1,#0xa
    strh       r1,[r5,#0x24]
    ldr        r7,[r5,#0x60]
    strh       r1,[r7,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08072862:
    pop        {pc}

PTR_listDieBombFaceValue_08072864:
    .word listDieBombFaceValue


_ts A_DieBomb_1_1_Bounce
    push       {lr}
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_080728ac
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    str        r1,[r5,#0x30]
    bgt        LAB_080728a8
    mov        r1,#0x0
    str        r1,[r5,#0x30]
    neg        r0,r0
    asr        r0,r0,#0x1
    str        r0,[r5,#0x4c]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bpl        LAB_080728a8
    mov        r0,#0x1
    strb       r0,[r5,#0x6]
    mov        r0,#0x10
    bl         Field_GetPanelFlagGroup
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0xc]
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x60
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_080728a8:
    pop        {pc}

    .align 2, 0


DAT_080728ac:
    .word 0xFFFFD800


_ts A_DieBomb_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080728c6
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_080728c6:
    pop        {pc}


_ts A_DieBomb_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080728e0
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080728e0
    mov        r0,#0xc
    str        r0,[r5,#0x8]
LAB_080728e0:
    pop        {pc}


_nt A_DieBomb_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#0x30]
    mov        r0,#0xf
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0xb
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_DieBomb_3_Explode
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0}
    bl         Field_GetPanelFlags
    mov        r1,#0x2
    and        r0,r1
    eor        r0,r1
    lsr        r0,r0,#0x1
    pop        {r1}
    mov        r4,#0x1
    ldrh       r6,[r5,#0x24]
    mov        r2,#0x1
LAB_08072930:
    bl         Effect_DieBombExplosion_Create
    add        r2,#0x1
    cmp        r2,#0x4
    bne        LAB_08072930
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_DieBomb_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    beq        LAB_08072998
    mov        r0,#0x11
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08072998
    push       {r1}
    ldr        r1,PanelFlag_0807299c
    tst        r0,r1
    pop        {r1}
    bne        LAB_08072976
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08072998
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0807298e
LAB_08072976:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    pop        {pc}
LAB_0807298e:
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08072998:
    mov        r0,#0x0
    pop        {pc}

PanelFlag_0807299c:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid


_ts Attack_DieBomb_Create
    push       {lr}
    push       {r1,r2,r5}
    mov        r0,#0x20
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5}
    tst        r7,r7
    beq        LAB_080729ba
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_080729ba:
    pop        {pc}
