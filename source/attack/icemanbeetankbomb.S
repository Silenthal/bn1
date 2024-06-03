#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_IceManBeetankBomb
    push       {lr}
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_IceManBeetankBomb_0_Init_0806f5ec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_A_IceManBeetankBomb_0_Init_0806f5e0:
    .word A_IceManBeetankBomb_0_Init
    .word A_IceManBeetankBomb_1_Main
    .word A_IceManBeetankBomb_2_Free

PTR_PTR_A_IceManBeetankBomb_0_Init_0806f5ec:
    .word PTR_A_IceManBeetankBomb_0_Init_0806f5e0


_ts A_IceManBeetankBomb_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldrb       r3,[r5,#0x4]
    lsl        r3,r3,#0x1
    ldr        r7,PTR_SpriteIndex_ARRAY_0806f694
    ldrh       r1,[r7,r3]
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    push       {r0,r1}
    add        r7,r5,#0x0
    add        r7,#0x28
    push       {r7}
    ldmia      r7!,{r2,r3}
    sub        r2,r0,r2
    sub        r0,r1,r3
    add        r1,r2,#0x0
    push       {r5}
    bl         VectorToAngle
    pop        {r5}
    strb       r0,[r5,#0x10]
    ldr        r1,DAT_0806f68c
    push       {r1}
    bl         AngleToOffset
    str        r0,[r5,#0x44]
    str        r1,[r5,#0x48]
    pop        {r4}
    pop        {r0}
    pop        {r1,r2}
    mov        r3,#0x0
    ldr        r6,DAT_0806f690
    bl         Field_CalculateGravityZ
    str        r0,[r5,#0x4c]
    strh       r1,[r5,#0x1c]
    tst        r1,r1
    beq        LAB_0806f670
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_SongId_ARRAY_0806f698
    ldrb       r0,[r7,r0]
    tst        r0,r0
    beq        LAB_0806f666
    bl         Sound_PlaySongImmediate
LAB_0806f666:
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_IceManBeetankBomb_1_Main
    pop        {pc}
LAB_0806f670:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    bl         A_IceManBeetankBomb_2_Free
    pop        {pc}

    .align 2, 0


DAT_0806f68c:
    .word 0x2E666

DAT_0806f690:
    .word 0xFFFFD800

PTR_SpriteIndex_ARRAY_0806f694:
    .word SpriteIndex_ARRAY_0806f6a4

PTR_SongId_ARRAY_0806f698:
    .word SongId_ARRAY_0806f69c

SongId_ARRAY_0806f69c:
    .byte 0x81
    .byte 0x81
    .byte 0x81
    .byte 0x00
    .byte 0x74
    .byte 0x74
    .byte 0x74

    .align 2, 0


SpriteIndex_ARRAY_0806f6a4:
    .short SP_BattleObject_BurnerBomb
    .short SP_BattleObject_BurnerBomb
    .short SP_BattleObject_BurnerBomb
    .short SP_BattleObject_FreezeBomb
    .short SP_BattleObject_BurnerBomb
    .short SP_BattleObject_BurnerBomb
    .short SP_BattleObject_BurnerBomb


_nt A_IceManBeetankBomb_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_ResetPalette
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_0806f6ea
    add        r7,r5,#0x0
    add        r7,#0x44
    ldmia      r7!,{r3,r4,r6}
    ldr        r0,DAT_0806f704
    add        r6,r6,r0
    str        r6,[r5,#0x4c]
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    tst        r2,r2
    bmi        LAB_0806f6ea
    pop        {pc}
LAB_0806f6ea:
    ldrb       r0,[r5,#0x6]
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x7]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    pop        {pc}

DAT_0806f704:
    .word 0xFFFFD800


_ts A_IceManBeetankBomb_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_0806f778
    mov        r6,#0x0
LAB_0806f720:
    push       {r0,r1,r5,r6}
    ldrb       r2,[r5,#0x4]
    lsl        r2,r2,#0x2
    ldr        r7,PTR_listBFBombPattern_0806f780
    ldr        r7,[r7,r2]
    lsl        r2,r6,#0x1
    ldrsb      r3,[r7,r2]
    cmp        r3,#0x7f
    beq        LAB_0806f768
    add        r0,r0,r3
    add        r2,#0x1
    ldrsb      r4,[r7,r2]
    add        r1,r1,r4
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_0806f762
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldr        r7,PTR_DAT_0806f784
    ldrb       r4,[r5,#0x4]
    ldrb       r4,[r7,r4]
    ldrh       r6,[r5,#0x24]
    ldrb       r0,[r5,#0x1a]
    bl         Effect_BombExplosion_Create
LAB_0806f762:
    pop        {r0,r1,r5,r6}
    add        r6,#0x1
    b          LAB_0806f720
LAB_0806f768:
    pop        {r0,r1,r5,r6}
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_listExplosionSound_0806f788
    ldrb       r0,[r7,r0]
    tst        r0,r0
    beq        LAB_0806f778
    bl         Sound_PlaySongImmediate
LAB_0806f778:
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


PTR_listBFBombPattern_0806f780:
    .word listBFBombPattern

PTR_DAT_0806f784:
    .word DAT_0806f7cd

PTR_listExplosionSound_0806f788:
    .word listExplosionSound

listBFBombPattern:
    .word listBFBombLinePattern
    .word listBFBombCrossPattern
    .word listBFBombSquarePattern
    .word listBFBombCrossPattern
    .word listBFBombLinePattern
    .word listBFBombCrossPattern
    .word listBFBombSquarePattern

listBFBombLinePattern:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 0, 1
    .byte 0x7F

listBFBombCrossPattern:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0
    .byte 0x7F

listBFBombSquarePattern:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0
    cell_pos -1, -1
    cell_pos -1, 1
    cell_pos 1, -1
    cell_pos 1, 1
    .byte 0x7F

DAT_0806f7cd:
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x02

    .align 2, 0


listExplosionSound:
    .byte 0x76
    .byte 0x76
    .byte 0x76
    .byte 0x9C
    .byte 0x76
    .byte 0x76
    .byte 0x76

    .align 2, 0



_ts Attack_IceManBeetankBomb_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x1
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_0806f7f6
    strb       r0,[r7,#0x1a]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0806f7f6:
    pop        {pc}
