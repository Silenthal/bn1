#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Handy_Main
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Handy_0_Init_080605e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Handy_0_Init_080605e0:
    .word PTR_R_Handy_0_Init_080605e4

PTR_R_Handy_0_Init_080605e4:
    .word R_Handy_0_Init
    .word R_Handy_1_Main
    .word R_Handy_2_Free


_ts R_Handy_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x29
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    add        r0,r0,r0
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
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_nt R_Handy_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_080606b6
    bl         Battle_IsInputLocked
    bne        LAB_080606b6
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_0806071c
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
    beq        LAB_080606b6
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_080606b6:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_080606ea
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08060700
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_080606dc
    mov        r0,#0x9
    b          LAB_080606de
LAB_080606dc:
    mov        r0,#0xf
LAB_080606de:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_080606fc
LAB_080606ea:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_080606fc:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08060700:
    .word PTR_R_Actor_1_0_Spawn_08060704

PTR_R_Actor_1_0_Spawn_08060704:
    .word R_Actor_1_0_Spawn
    .word R_Handy_1_1_WaitForBattleStart
    .word R_Handy_1_2_Wait
    .word R_Handy_1_3_GoUnder
    .word R_Handy_1_4_TimeBomb
    .word R_Handy_1_5_Move

PanelFlag_0806071c:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Handy_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Handy_1_0_0_08060748
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Handy_1_0_0_08060738:
    .word R_Handy_1_0_0
    .word R_Handy_1_0_1
    .word R_Handy_1_0_2
    .word R_Handy_1_0_3

PTR_PTR_R_Handy_1_0_0_08060748:
    .word PTR_R_Handy_1_0_0_08060738


_ts R_Handy_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0806075e
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0806075e:
    pop        {pc}


_ts R_Handy_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_08060772
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_08060772:
    pop        {pc}


_ts R_Handy_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08060786
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_08060786:
    pop        {pc}


_ts R_Handy_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0806079c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806079c:
    pop        {pc}


_nt R_Handy_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080607b8
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_080607b8:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080607ca
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080607ca:
    pop        {pc}


_ts R_Handy_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Handy_1_2_0_Wait_080607f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080607ea
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_080607ea:
    pop        {pc}

PTR_R_Handy_1_2_0_Wait_080607ec:
    .word R_Handy_1_2_0_Wait
    .word R_Handy_1_2_1_Next

PTR_PTR_R_Handy_1_2_0_Wait_080607f4:
    .word PTR_R_Handy_1_2_0_Wait_080607ec


_ts R_Handy_1_2_0_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r7,PTR_BYTE_ARRAY_08060814
    ldrb       r0,[r5,#0x4]
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    bl         R_Handy_1_2_1_Next
    pop        {pc}

BYTE_ARRAY_08060810:
    .byte 0xB4
    .byte 0x78
    .byte 0x78

    .align 2, 0


PTR_BYTE_ARRAY_08060814:
    .word BYTE_ARRAY_08060810


_ts R_Handy_1_2_1_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806082a
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806082a:
    pop        {pc}


_ts R_Handy_1_3_GoUnder
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Handy_1_3_0_GoUnderground_08060848
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Handy_1_3_0_GoUnderground_0806083c:
    .word R_Handy_1_3_0_GoUnderground
    .word R_Handy_1_3_1_Wait
    .word R_Handy_1_3_2_FindBombPanelPlacement

PTR_PTR_R_Handy_1_3_0_GoUnderground_08060848:
    .word PTR_R_Handy_1_3_0_GoUnderground_0806083c


_ts R_Handy_1_3_0_GoUnderground
    push       {lr}
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Handy_1_3_1_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806087c
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_BYTE_ARRAY_08060884
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0806087c:
    pop        {pc}

BYTE_ARRAY_0806087e:
    .byte 0x32
    .byte 0x28
    .byte 0x0F

    .align 2, 0


PTR_BYTE_ARRAY_08060884:
    .word BYTE_ARRAY_0806087e


_ts R_Handy_1_3_2_FindBombPanelPlacement
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080608f8
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    bl         Rng_RandomUint
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r2,[r7,#0x19]
    ldr        r7,PTR_listHandyBombRow_08060904
    add        r3,r2,r2
    add        r7,r7,r3
    mov        r3,#0x1
    and        r0,r3
    ldrb       r1,[r7,r0]
    push       {r2}
    bl         R_Handy_FindBombPlacementPanel
    pop        {r2}
    cmp        r0,#0xff
    beq        LAB_080608e0
LAB_080608be:
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_080608f8
LAB_080608e0:
    add        r1,r2,#0x0
    bl         R_Handy_FindBombPlacementPanel
    cmp        r0,#0xff
    beq        LAB_080608ec
    b          LAB_080608be
LAB_080608ec:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
LAB_080608f8:
    pop        {pc}

listHandyBombRow:
    .byte 0x01
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x02

    .align 2, 0


PTR_listHandyBombRow_08060904:
    .word listHandyBombRow


_ts R_Handy_1_4_TimeBomb
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Handy_1_4_0_Emerge_0806092c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Handy_1_4_0_Emerge_08060918:
    .word R_Handy_1_4_0_Emerge
    .word R_Handy_1_4_1_Wait
    .word R_Handy_1_4_2_SpawnTimeBomb
    .word R_Handy_1_4_3_TimeBomb
    .word R_Handy_1_4_4_Next

PTR_PTR_R_Handy_1_4_0_Emerge_0806092c:
    .word PTR_R_Handy_1_4_0_Emerge_08060918


_ts R_Handy_1_4_0_Emerge
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x19
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Handy_1_4_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806095e
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_0806095e:
    pop        {pc}


_ts R_Handy_1_4_2_SpawnTimeBomb
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08060986
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x22
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x12
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_08060986:
    pop        {pc}


_ts R_Handy_1_4_3_TimeBomb
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080609aa
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    mov        r4,#0x80
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_listHandyTimeBombDamage_080609b0
    ldrb       r6,[r7,r0]
    bl         Attack_TimeBomb_Create
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_080609aa:
    pop        {pc}

listHandyTimeBombDamage:
    .byte 0x1E
    .byte 0x64
    .byte 0xC8

    .align 2, 0


PTR_listHandyTimeBombDamage_080609b0:
    .word listHandyTimeBombDamage


_ts R_Handy_1_4_4_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080609c8
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080609c8:
    pop        {pc}


_nt R_Handy_1_5_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Handy_1_5_0_StartAnim_080609e4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Handy_1_5_0_StartAnim_080609d8:
    .word R_Handy_1_5_0_StartAnim
    .word R_Handy_1_5_1_FindWalkablePanel
    .word R_Handy_1_5_2_Teleport

PTR_PTR_R_Handy_1_5_0_StartAnim_080609e4:
    .word PTR_R_Handy_1_5_0_StartAnim_080609d8


_ts R_Handy_1_5_0_StartAnim
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strh       r0,[r5,#0x1e]
    pop        {pc}


_ts R_Handy_1_5_1_FindWalkablePanel
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08060a82
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bmi        LAB_08060a4a
    bl         Rng_RandomUint
    mov        r1,#0x1
    mov        r2,#0x1
    and        r2,r0
    beq        LAB_08060a1e
    mov        r1,#0x0
    sub        r1,#0x1
LAB_08060a1e:
    ldrb       r0,[r5,#0x19]
    add        r1,r1,r0
    ldrb       r0,[r5,#0x18]
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    push       {r0,r1}
    bl         R_Handy_FindWalkablePanel
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08060a4a
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    b          LAB_08060a82
LAB_08060a4a:
    mov        r0,#0x1
    strh       r0,[r5,#0x1e]
    ldrb       r0,[r5,#0x18]
    add        r0,#0x1
    ldrb       r1,[r5,#0x19]
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    push       {r0,r1}
    bl         R_Handy_FindWalkablePanel
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08060a7a
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    b          LAB_08060a82
LAB_08060a7a:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08060a82:
    pop        {pc}


_ts R_Handy_1_5_2_Teleport
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Handy_1_5_2_0_Teleport_08060a94
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Handy_1_5_2_0_Teleport_08060a94:
    .word PTR_R_Handy_1_5_2_0_Teleport_08060a98

PTR_R_Handy_1_5_2_0_Teleport_08060a98:
    .word R_Handy_1_5_2_0_Teleport
    .word R_Handy_1_5_2_1_TeleportEnd
    .word R_Handy_1_5_2_2_Next


_ts R_Handy_1_5_2_0_Teleport
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    b          FUN_08060ace
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]


_nt FUN_08060ace
    pop        {pc}


_ts R_Handy_1_5_2_1_TeleportEnd
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08060b0e
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    push       {r5}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#0x30]
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x14
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_08060b0e:
    pop        {pc}


_ts R_Handy_1_5_2_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08060b22
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_08060b22:
    pop        {pc}


_ts R_Handy_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Handy_2_0_Delete_08060b3c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Handy_2_0_Delete_08060b34:
    .word R_Handy_2_0_Delete
    .word R_Handy_2_1_Free

PTR_PTR_R_Handy_2_0_Delete_08060b3c:
    .word PTR_R_Handy_2_0_Delete_08060b34


_ts R_Handy_2_0_Delete
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
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Handy_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08060b7a
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08060b7a:
    pop        {pc}


_ts R_Handy_FindBombPlacementPanel
    push       {lr}
    mov        r0,#0x1
LAB_08060b80:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_08060bbe
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08060bc4
    mov        r3,#0x42
    lsl        r3,r3,#0x4
    tst        r2,r3
    bne        LAB_08060bc4
    push       {r0,r1}
    bl         Field_GetAttackDirectionOffset_MP
    add        r2,r0,#0x0
    pop        {r0,r1}
    push       {r0,r1}
    add        r0,r0,r2
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x80
    lsl        r2,r2,#0x4
    tst        r3,r2
    bne        LAB_08060bc4
    b          LAB_08060bc6
LAB_08060bbe:
    add        r0,#0x1
    cmp        r0,#0x7
    bmi        LAB_08060b80
LAB_08060bc4:
    mov        r0,#0xff
LAB_08060bc6:
    pop        {pc}


_ts FUN_08060bc8
    push       {lr}
    pop        {pc}


_ts R_Handy_FindWalkablePanel
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_08060bf4
    bl         Field_GetPanelFlags
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_08060bf4
    mov        r1,#0x3
    and        r1,r0
    cmp        r1,#0x3
    bne        LAB_08060bf4
    mov        r2,#0x1
LAB_08060bf4:
    add        r0,r2,#0x0
    pop        {pc}
