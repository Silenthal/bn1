#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_QuickEffect_Create, 0x807B5E8+1
    .set Effect_BombExplosion_Create, 0x807BCBA+1
    .set Effect_VirusDeleteExplosion_Create, 0x807CE16+1


FlappyParam_ARRAY_0805e350:
    .byte 0x07, 0x06, 0x04, 0x00, 0x00
    .byte 60, 20, 20
    .byte 0x08, 0x07, 0x06, 0x04, 0x00
    .byte 30, 60, 60
    .byte 0x08, 0x07, 0x06, 0x04, 0x00
    .byte 0, 100, 100


_ts Routine_Flappy
    push       {lr}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Flappy_0_Init_0805e384
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Flappy_0_Init_0805e384:
    .word PTR_R_Flappy_0_Init_0805e388

PTR_R_Flappy_0_Init_0805e388:
    .word R_Flappy_0_Init
    .word R_Flappy_1_Main
    .word R_Flappy_2_Free


_ts R_Flappy_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x21
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x5
    mov        r3,#0x68
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldr        r7,PTR_FlappyParam_ARRAY_0805e418
    ldr        r0,[r5,#0x4]
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    str        r7,[r5,#0x78]
    ldrb       r0,[r7,#0x6]
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r3,#0x70
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r3,#0x74
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_Flappy_1_Main
    ldr        r0,[r5,#0x70]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_FlappyParam_ARRAY_0805e418:
    .word FlappyParam_ARRAY_0805e350


_ts R_Flappy_1_Main
    push       {lr}
    ldr        r0,[r5,#0x70]
    bl         FieldObject_DisableIfHitFlagSet
    bl         R_Flappy_CheckLive
    tst        r0,r0
    bne        LAB_0805e436
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0805e444
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0805e436:
    ldr        r0,[r5,#0x70]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0805e444:
    .word PTR_R_Actor_1_0_Spawn_0805e448

PTR_R_Actor_1_0_Spawn_0805e448:
    .word R_Actor_1_0_Spawn
    .word R_Flappy_1_1_Decide
    .word R_Flappy_1_2_Jump
    .word R_Flappy_1_3_Quake


_ts R_Flappy_1_1_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Flappy_1_1_0_DelayDecide_0805e468
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Flappy_1_1_0_DelayDecide_0805e468:
    .word PTR_R_Flappy_1_1_0_DelayDecide_0805e46c

PTR_R_Flappy_1_1_0_DelayDecide_0805e46c:
    .word R_Flappy_1_1_0_DelayDecide
    .word R_Flappy_1_1_1_DelayDecide


_ts R_Flappy_1_1_0_DelayDecide
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r7,PTR_FlappyParam_ARRAY_0805e49c
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    ldrb       r0,[r7,#0x5]
    tst        r0,r0
    bne        LAB_0805e48e
    bl         R_Flappy_Decide
    pop        {pc}
LAB_0805e48e:
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid

PTR_FlappyParam_ARRAY_0805e49c:
    .word FlappyParam_ARRAY_0805e350


_ts R_Flappy_1_1_1_DelayDecide
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e4ae
    bl         R_Flappy_Decide
LAB_0805e4ae:
    pop        {pc}


_ts R_Flappy_1_2_Jump
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Flappy_1_2_0_DecideTarget_0805e4c0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Flappy_1_2_0_DecideTarget_0805e4c0:
    .word PTR_R_Flappy_1_2_0_DecideTarget_0805e4c4

PTR_R_Flappy_1_2_0_DecideTarget_0805e4c4:
    .word R_Flappy_1_2_0_DecideTarget
    .word R_Flappy_1_2_1_CalculateArc
    .word R_Flappy_1_2_2_Animate
    .word R_Flappy_1_2_3_Next


_ts R_Flappy_1_2_0_DecideTarget
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,DAT_0805e538
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    bne        LAB_0805e508
    ldrh       r0,[r5,#0x18]
    mov        r3,#0x60
    strh       r0,[r5,r3]
    ldr        r7,[r5,#0x74]
    strh       r0,[r7,#0x4]
    strh       r0,[r7,#0x2]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    b          LAB_0805e530
LAB_0805e508:
    add        r2,r1,#0x0
    push       {r0}
    bl         ArrayShuffle
    pop        {r0}
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#0x74]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
LAB_0805e530:
    add        sp,#0x14
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_0805e538:
    .word 0xC20


_ts R_Flappy_1_2_1_CalculateArc
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    ldr        r3,DAT_0805e574
    str        r3,[r5,#0x4c]
    ldr        r4,DAT_0805e578
    bl         Field_CalculateGravityXY
    strh       r0,[r5,#0x1c]
    str        r1,[r5,#0x44]
    str        r2,[r5,#0x48]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_0805e574:
    .word 0x60000

DAT_0805e578:
    .word 0xFFFFC000


_ts R_Flappy_1_2_2_Animate
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bhi        LAB_0805e5b4
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Enable
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805e5b4:
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    ldr        r3,DAT_0805e5dc
    add        r2,r2,r3
    str        r2,[r5,#0x4c]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    add        r3,r3,r0
    add        r4,r4,r1
    add        r6,r6,r2
    sub        r7,#0xc
    stmia      r7!,{r3,r4,r6}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}

    .align 2, 0


DAT_0805e5dc:
    .word 0xFFFFC000


_ts R_Flappy_1_2_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805e608
    ldr        r7,PTR_FlappyParam_ARRAY_0805e60c
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    ldrb       r0,[r7,#0x5]
    tst        r0,r0
    bne        LAB_0805e600
    bl         R_Flappy_Decide
    pop        {pc}
LAB_0805e600:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805e608:
    pop        {pc}

    .align 2, 0


PTR_FlappyParam_ARRAY_0805e60c:
    .word FlappyParam_ARRAY_0805e350


_ts R_Flappy_1_3_Quake
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Flappy_1_3_0_Teleport_0805e624
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Flappy_1_3_0_Teleport_0805e624:
    .word PTR_R_Flappy_1_3_0_Teleport_0805e628

PTR_R_Flappy_1_3_0_Teleport_0805e628:
    .word R_Flappy_1_3_0_Teleport
    .word R_Flappy_1_3_1_Transform
    .word R_Flappy_1_3_2_ReadyQuake
    .word R_Flappy_1_3_3_Quake
    .word R_Flappy_1_3_4_StartTeleportBack
    .word R_Flappy_1_3_5_CrackPanel
    .word R_Flappy_1_3_6_EndTeleportBack


_ts R_Flappy_1_3_0_Teleport
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldrh       r1,[r5,#0x18]
    ldr        r0,[r5,#0x74]
    strh       r1,[r0,#0x4]
    strh       r1,[r0,#0x2]
    bl         FieldObject_Enable
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x13
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xf
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    lsl        r2,r1,#0x8
    orr        r2,r0
    strh       r2,[r5,#0x18]
    mov        r3,#0x60
    str        r2,[r5,r3]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r3,#0x30
    lsl        r3,r3,#0x10
    str        r3,[r5,#0x30]
    mov        r0,#0x8
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Flappy_1_3_1_Transform
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e6c0
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0805e6c0:
    pop        {pc}


_nt R_Flappy_1_3_2_ReadyQuake
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805e6e2
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e7c2
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    ldr        r0,DAT_0805e6e4
    str        r0,[r5,#0x4c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0805e6e2:
    pop        {pc}

DAT_0805e6e4:
    .word f(-8)


_ts R_Flappy_1_3_3_Quake
    push       {lr}
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    bhi        LAB_0805e76c
    mov        r0,#0x7e
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x2
    mov        r1,#0x23
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x9
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0805e764
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r3,#0x8
LAB_0805e724:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldr        r7,PTR_listFlappyAttackOffsets_0805e770
    sub        r3,#0x1
    ldrsb      r2,[r7,r3]
    add        r1,r1,r2
    sub        r3,#0x1
    ldrsb      r2,[r7,r3]
    add        r0,r0,r2
    push       {r0,r1,r3}
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r3}
    mov        r2,#0x1
    tst        r7,r2
    beq        LAB_0805e760
    push       {r3}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    mov        r4,#0x0
    ldr        r7,[r5,#0x78]
    ldrb       r6,[r7,#0x7]
    bl         Effect_BombExplosion_Create
    pop        {r3}
LAB_0805e760:
    tst        r3,r3
    bne        LAB_0805e724
LAB_0805e764:
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0805e76c:
    pop        {pc}

    .align 2, 0


PTR_listFlappyAttackOffsets_0805e770:
    .word listFlappyAttackOffsets

listFlappyAttackOffsets:
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0


_ts R_Flappy_1_3_4_StartTeleportBack
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e7c2
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0xf
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0x2]
    ldrb       r1,[r7,#0x3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_0805e7c2:
    pop        {pc}


_ts R_Flappy_1_3_5_CrackPanel
    push       {lr}
    mov        r0,#0x8
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    bl         Field_CrackPanel
    mov        r0,#0x18
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Flappy_1_3_6_EndTeleportBack
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e818
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x14
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Enable
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805e818:
    pop        {pc}


_nt R_Flappy_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_FUN_0805e834_0805e828
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_FUN_0805e834_0805e828:
    .word PTR_FUN_0805e834_0805e82c

PTR_FUN_0805e834_0805e82c:
    .word FUN_0805e834
    .word FUN_0805e862


_ts FUN_0805e834
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDeleteExplosion_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_nt FUN_0805e862
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e880
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805e880:
    pop        {pc}


_nt R_Flappy_CheckLive
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0805e8e8
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0805e8ca
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0805e8ca
    ldr        r1,[r5,#0x70]
    ldrb       r0,[r1,#0x0]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_0805e8e8
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0805e8e8
    mov        r0,#0xa
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0805e8e8
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0805e8e8
    bl         Field_SubtractHP
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805e8e2
LAB_0805e8ca:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x70]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0805e8e2:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0805e8e8:
    mov        r0,#0x0
    pop        {pc}


_ts R_Flappy_Decide
    push       {lr}
    bl         Rng_RandomUint
    mov        r4,#0x7
    and        r4,r0
    mov        r3,#0x68
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    asr        r1,r0,#0x1f
    bic        r0,r1
    strb       r0,[r5,r3]
    ldr        r7,PTR_FlappyParam_ARRAY_0805e944
    ldrb       r1,[r5,#0x4]
    lsl        r1,r1,#0x3
    add        r7,r7,r1
    ldrb       r0,[r7,r0]
    cmp        r4,r0
    bmi        LAB_0805e91a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805e91a:
    mov        r0,#0x5
    mov        r3,#0x68
    strb       r0,[r5,r3]
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_0805e934
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805e934:
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

PTR_FlappyParam_ARRAY_0805e944:
    .word FlappyParam_ARRAY_0805e350
