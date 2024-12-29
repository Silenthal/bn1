#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Poitton
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Poitton_0_Init_0806b208
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Poitton_0_Init_0806b208:
    .word PTR_R_Poitton_0_Init_0806b20c

PTR_R_Poitton_0_Init_0806b20c:
    .word R_Poitton_0_Init
    .word R_Poitton_1_Main
    .word R_Poitton_2_Free


_ts R_Poitton_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x67
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0xc8
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r1,#0x68
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r1,#0x6c
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_Poitton_1_Main
    ldr        r0,[r5,#0x68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts R_Poitton_1_Main
    push       {lr}
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfDeleted
    bl         R_Poitton_CheckDamage
    tst        r0,r0
    bne        LAB_0806b2a6
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806b2b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806b2a6:
    ldr        r0,[r5,#0x68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0806b2b4:
    .word PTR_R_Actor_1_0_Spawn_0806b2b8

PTR_R_Actor_1_0_Spawn_0806b2b8:
    .word R_Actor_1_0_Spawn
    .word R_Poitton_1_1_Wait
    .word R_Poitton_1_2_Decide
    .word R_Poitton_1_3_Move
    .word R_Poitton_1_4_Dynamyte
    .word R_Poitton_1_5_Move


_ts R_Poitton_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806b2ea
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806b2ea:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806b2fc
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806b2fc:
    pop        {pc}


_nt R_Poitton_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Poitton_1_2_0_0806b320
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806b31c
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806b31c:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Poitton_1_2_0_0806b320:
    .word PTR_R_Poitton_1_2_0_0806b324

PTR_R_Poitton_1_2_0_0806b324:
    .word R_Poitton_1_2_0
    .word R_Poitton_1_2_1


_ts R_Poitton_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_DAT_0806b348
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


PTR_DAT_0806b348:
    .word DAT_0806b34c

DAT_0806b34c:
    .byte 0x5A
    .byte 0x46
    .byte 0x2D

    .align 2, 0



_ts R_Poitton_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806b35e
    bl         R_Poitton_Decide
LAB_0806b35e:
    pop        {pc}


_ts R_Poitton_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Poitton_1_3_0_0806b370
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Poitton_1_3_0_0806b370:
    .word PTR_R_Poitton_1_3_0_0806b374

PTR_R_Poitton_1_3_0_0806b374:
    .word R_Poitton_1_3_0
    .word R_Poitton_1_3_1


_ts R_Poitton_1_3_0
    push       {lr}
    mov        r0,#0x0
    push       {r7}
    bl         FieldObject_UpdateField
    pop        {r7}
    bl         R_Poitton_GetNextMovePanel
    tst        r0,r0
    beq        LAB_0806b3aa
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806b3aa:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Poitton_1_3_1
    push       {lr}
    bl         R_Poitton_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_0806b3ce
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806b3ce:
    pop        {pc}


_ts R_Poitton_Move
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Poitton_Move_0_0806b3e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Poitton_Move_0_0806b3e0:
    .word PTR_R_Poitton_Move_0_0806b3e4

PTR_R_Poitton_Move_0_0806b3e4:
    .word R_Poitton_Move_0
    .word R_Poitton_Move_1
    .word R_Poitton_Move_2


_ts R_Poitton_Move_0
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x4
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}


_nt R_Poitton_Move_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806b44e
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x4
    strh       r0,[r5,#0x1c]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0806b44e:
    pop        {pc}


_ts R_Poitton_Move_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806b45e
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_0806b45e:
    pop        {pc}


_ts R_Poitton_1_4_Dynamyte
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Poitton_1_4_0_0806b470
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Poitton_1_4_0_0806b470:
    .word PTR_R_Poitton_1_4_0_0806b474

PTR_R_Poitton_1_4_0_0806b474:
    .word R_Poitton_1_4_0
    .word R_Poitton_1_4_1
    .word R_Poitton_1_4_2
    .word R_Poitton_1_4_3


_ts R_Poitton_1_4_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Poitton_1_4_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806b4d4
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         SWI_DivMod
    add        r4,r0,#0x0
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x4
    lsl        r0,r0,#0x4
    orr        r4,r0
    mov        r0,#0x0
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    ldrb       r2,[r5,#0x19]
    ldrh       r6,[r5,#0x24]
    ldrb       r7,[r5,#0x16]
    bl         Attack_Dynamyte_Create
    ldrb       r0,[r5,#0x19]
    add        r0,#0xf
    bl         Battle_SetBattleFlag
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0806b4d4:
    pop        {pc}


_nt R_Poitton_1_4_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806b4e8
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0806b4e8:
    pop        {pc}


_nt R_Poitton_1_4_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806b4fe
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806b4fe:
    pop        {pc}


_ts R_Poitton_1_5_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Poitton_1_5_0_0806b510
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Poitton_1_5_0_0806b510:
    .word PTR_R_Poitton_1_5_0_0806b514

PTR_R_Poitton_1_5_0_0806b514:
    .word R_Poitton_1_5_0
    .word R_Poitton_1_5_1


_ts R_Poitton_1_5_0
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    add        r0,#0x1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         R_Poitton_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_0806b550
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806b550:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Poitton_1_5_1
    push       {lr}
    bl         R_Poitton_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_0806b574
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806b574:
    pop        {pc}


_nt R_Poitton_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Poitton_2_0_Delete_0806b584
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Poitton_2_0_Delete_0806b584:
    .word PTR_R_Poitton_2_0_Delete_0806b588

PTR_R_Poitton_2_0_Delete_0806b588:
    .word R_Poitton_2_0_Delete
    .word R_Poitton_2_1_Free


_ts R_Poitton_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_Poitton_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806b5d2
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806b5d2:
    pop        {pc}


_ts R_Poitton_Decide
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x19]
    add        r0,#0xf
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_0806b60e
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    ldr        r3,PanelFlag_0806b618
    tst        r2,r3
    bne        LAB_0806b60e
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_0806b60e
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806b60e:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

PanelFlag_0806b618:
    .word PF_EnemyTerritory


_ts R_Poitton_GetNextMovePanel
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x19]
    add        r0,#0xf
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_0806b660
    bl         Rng_RandomUint
    asr        r0,r0,#0x1f
    lsl        r0,r0,#0x1
    add        r2,r0,#0x1
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r2
    ldrb       r0,[r5,#0x18]
    push       {r0,r1,r2}
    bl         R_Poitton_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1,r2}
    bne        LAB_0806b6be
    neg        r2,r2
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r2
    push       {r0,r1}
    bl         R_Poitton_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_0806b672
    pop        {pc}
LAB_0806b660:
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         R_Poitton_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0806b6be
LAB_0806b672:
    sub        sp,#0x8
    mov        r7,sp
    ldr        r6,PTR_CellPosition_ARRAY_0806b6cc
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x0
    mov        r3,#0x6
LAB_0806b680:
    push       {r0,r1,r2,r3,r6,r7}
    add        r7,r7,r2
    ldrsb      r4,[r6,r3]
    add        r0,r0,r4
    add        r3,#0x1
    ldrsb      r4,[r6,r3]
    add        r1,r1,r4
    strb       r0,[r7,#0x0]
    strb       r1,[r7,#0x1]
    bl         R_Poitton_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1,r2,r3,r6,r7}
    beq        LAB_0806b69e
    add        r2,#0x2
LAB_0806b69e:
    sub        r3,#0x2
    bpl        LAB_0806b680
    lsr        r2,r2,#0x1
    beq        LAB_0806b6c0
    push       {r2,r7}
    bl         Rng_RandomInt
    pop        {r2,r7}
    add        r1,r2,#0x0
    bl         SWI_DivMod
    lsl        r2,r0,#0x1
    ldrb       r0,[r7,r2]
    add        r2,#0x1
    ldrb       r1,[r7,r2]
    add        sp,#0x8
LAB_0806b6be:
    pop        {pc}
LAB_0806b6c0:
    add        sp,#0x8
    mov        r0,#0x0
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed

PTR_CellPosition_ARRAY_0806b6cc:
    .word CellPosition_ARRAY_0806b6d0

CellPosition_ARRAY_0806b6d0:
    cell_pos 0, 1
    cell_pos 0, -1
    cell_pos 1, 0
    cell_pos -1, 0


_ts R_Poitton_IsPanelWalkable
    push       {lr}
    bl         Field_GetPanelFlags
    ldr        r1,PanelFlag_0806b6f8
    tst        r0,r1
    bne        LAB_0806b6f0
    ldr        r1,PanelFlag_0806b6f4
    and        r0,r1
    cmp        r0,r1
    bne        LAB_0806b6f0
    mov        r0,#0x1
    pop        {pc}
LAB_0806b6f0:
    mov        r0,#0x0
    pop        {pc}

PanelFlag_0806b6f4:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_0806b6f8:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_Poitton_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0806b752
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806b734
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806b734
    mov        r0,#0xa
    ldr        r1,[r5,#0x68]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0806b752
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0806b752
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0806b74c
    bl         SpritePtr_SetFlashPalette
LAB_0806b734:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0806b74c:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0806b752:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

