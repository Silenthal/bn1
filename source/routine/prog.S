#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_ProgThunder_Create, 0x8075DF6+1
    .set Effect_VirusDeleteExplosion_Create, 0x807CE16+1


_ts Routine_Prog
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Prog_0_Init_08066188
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Prog_0_Init_08066188:
    .word PTR_R_Prog_0_Init_0806618c

PTR_R_Prog_0_Init_0806618c:
    .word R_Prog_0_Init
    .word R_Prog_1_Main
    .word R_Prog_2_Free


_ts R_Prog_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x4a
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldr        r7,PTR_DAT_08066228
    ldrb       r0,[r5,#0x4]
    add        r0,r0,r0
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    strb       r0,[r5,#0xc]
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#0xe]
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1e]
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    pop        {pc}

DAT_08066220:
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02

    .align 2, 0


PTR_DAT_08066228:
    .word DAT_08066220


_ts R_Prog_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08066290
    bl         Battle_IsInputLocked
    bne        LAB_08066290
    bl         Routine_CheckPoisonDrain
    ldrb       r0,[r5,#0x16]
    bl         Battle_GetBattleFlagBuffer
    beq        LAB_0806625c
    mov        r0,#0x0
    str        r0,[r5,#0xc]
LAB_0806625c:
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_080662f4
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08066290
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08066290:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_080662c4
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_080662d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_080662b6
    mov        r0,#0x9
    b          LAB_080662b8
LAB_080662b6:
    mov        r0,#0xf
LAB_080662b8:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_080662d6
LAB_080662c4:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
LAB_080662d6:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_080662d8:
    .word PTR_R_Actor_1_0_Spawn_080662dc

PTR_R_Actor_1_0_Spawn_080662dc:
    .word R_Actor_1_0_Spawn
    .word R_Prog_1_1_Wait
    .word R_Prog_1_2_Decide
    .word R_Prog_1_3_Move
    .word R_Prog_1_4_Steal
    .word R_Prog_1_5_RingZap

PanelFlag_080662f4:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Prog_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806631a
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806631a:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08066330
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x6e
    strh       r0,[r5,#0x1c]
LAB_08066330:
    pop        {pc}


_nt R_Prog_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Prog_1_2_0_0806635c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08066350
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08066350:
    pop        {pc}

    .align 2, 0


PTR_R_Prog_1_2_0_08066354:
    .word R_Prog_1_2_0
    .word R_Prog_1_2_1

PTR_PTR_R_Prog_1_2_0_0806635c:
    .word PTR_R_Prog_1_2_0_08066354


_ts R_Prog_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_BYTE_ARRAY_08066378
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    pop        {pc}

BYTE_ARRAY_08066374:
    .byte 0x50
    .byte 0x32
    .byte 0x28

    .align 2, 0


PTR_BYTE_ARRAY_08066378:
    .word BYTE_ARRAY_08066374


_ts R_Prog_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08066390
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806641a
LAB_08066390:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806641a
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         R_Prog_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_080663bc
    mov        r2,#0x0
    strb       r2,[r5,#0xd]
LAB_080663ae:
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806641a
LAB_080663bc:
    add        r0,#0x1
    push       {r0,r1}
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_080663e6
    bmi        LAB_080663d0
    add        r1,#0x1
    b          LAB_080663d2
LAB_080663d0:
    sub        r1,#0x1
LAB_080663d2:
    push       {r0,r1}
    bl         R_Prog_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_080663e6
    ldrb       r2,[r5,#0xd]
    add        r2,#0x1
    strb       r2,[r5,#0xd]
    b          LAB_080663ae
LAB_080663e6:
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r2,[r7,#0x18]
    sub        r0,#0x1
    cmp        r0,r2
    beq        LAB_08066416
    ldrb       r2,[r5,#0xd]
    add        r2,#0x1
    strb       r2,[r5,#0xd]
    ldrb       r3,[r5,#0xe]
    cmp        r2,r3
    blt        LAB_08066416
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_08066416
    sub        r0,#0x1
    strb       r0,[r5,#0xc]
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08066416:
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_0806641a:
    pop        {pc}


_ts R_Prog_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Prog_1_3_0_0806642c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Prog_1_3_0_0806642c:
    .word PTR_R_Prog_1_3_0_08066430

PTR_R_Prog_1_3_0_08066430:
    .word R_Prog_1_3_0
    .word R_Prog_1_3_1
    .word R_Prog_1_3_2


_ts R_Prog_1_3_0
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         R_Prog_IsPanelWalkable
    tst        r0,r0
    beq        LAB_0806646c
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    b          LAB_08066474
LAB_0806646c:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08066474:
    pop        {pc}


_nt R_Prog_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806649c
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0806649c:
    pop        {pc}


_nt R_Prog_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080664b6
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_080664b6:
    pop        {pc}


_ts R_Prog_1_4_Steal
    push       {lr}
    mov        r0,#0x2
    mov        r1,#0x2
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Prog_1_5_RingZap
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Prog_1_5_0_080664dc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Prog_1_5_0_080664dc:
    .word PTR_R_Prog_1_5_0_080664e0

PTR_R_Prog_1_5_0_080664e0:
    .word R_Prog_1_5_0
    .word R_Prog_1_5_1
    .word R_Prog_1_5_2
    .word R_Prog_1_5_3


_ts R_Prog_1_5_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Prog_1_5_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08066526
    mov        r0,#0x5
    bl         Field_SubtractHP
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x1
    mov        r3,#0x5c
    add        r3,r3,r5
    mov        r6,#0x64
    bl         Attack_ProgThunder_Create
LAB_08066526:
    pop        {pc}


_ts R_Prog_1_5_2
    push       {lr}
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    bne        LAB_08066538
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
LAB_08066538:
    pop        {pc}


_nt R_Prog_1_5_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08066556
    mov        r0,#0x3c
    strh       r0,[r5,#0x1e]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08066556:
    pop        {pc}


_ts R_Prog_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Prog_2_0_Delete_08066570
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Prog_2_0_Delete_08066568:
    .word R_Prog_2_0_Delete
    .word R_Prog_2_1_Free

PTR_PTR_R_Prog_2_0_Delete_08066570:
    .word PTR_R_Prog_2_0_Delete_08066568


_ts R_Prog_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDeleteExplosion_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Prog_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080665ae
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_080665ae:
    pop        {pc}


_ts R_Prog_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_080665de
    bl         Field_GetPanelFlags
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_080665de
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_080665de
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080665de
    mov        r2,#0x1
    add        r0,r2,#0x0
LAB_080665de:
    add        r0,r2,#0x0
    pop        {pc}

    .align 2, 0

