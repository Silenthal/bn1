#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Mettaur
    push       {lr}
    ldr        r7,PTR_PTR_R_Mettaur_0_Init_0805a584
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x15]
    cmp        r0,r1
    beq        LAB_0805a56c
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_0805a56c:
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    pop        {pc}

    .align 2, 0


PTR_R_Mettaur_0_Init_0805a578:
    .word R_Mettaur_0_Init
    .word R_Mettaur_1_Main
    .word R_Mettaur_2_Free

PTR_PTR_R_Mettaur_0_Init_0805a584:
    .word PTR_R_Mettaur_0_Init_0805a578


_ts R_Mettaur_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    str        r0,[r5,#0x40]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x1
    strb       r0,[r5,#0x16]
    mov        r0,#0x0
    mov        r3,#0x60
    strb       r0,[r5,r3]
    ldr        r0,[r5,#0x28]
    str        r0,[r5,#0x50]
    ldr        r0,[r5,#0x2c]
    str        r0,[r5,#0x54]
    ldr        r0,[r5,#0x30]
    str        r0,[r5,#0x58]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x64]
    mov        r0,#0x20
    strb       r0,[r7,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    bne        LAB_0805a5fe
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_0805a5fe:
    bl         R_Mettaur_1_Main
    pop        {pc}


_ts R_Mettaur_1_Main
    push       {lr}
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0x10]
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_DisableFlash
    bl         Battle_IsInputLocked
    bne        LAB_0805a664
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805a664
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x64]
    ldrh       r0,[r5,#0x18]
    ldr        r1,DAT_0805a6b8
    mov        r2,#0x0
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x64]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0805a664
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0805a680
LAB_0805a664:
    ldr        r7,PTR_PTR_R_Mettaur_1_0_Spawn_0805a6b4
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x64]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805a692
LAB_0805a680:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
LAB_0805a692:
    pop        {pc}

PTR_R_Mettaur_1_0_Spawn_0805a694:
    .word R_Mettaur_1_0_Spawn
    .word R_Mettaur_1_1_WaitForBattleStart
    .word R_Mettaur_1_2_DecideMoveOrAttack
    .word R_Mettaur_1_3_Attack
    .word R_Mettaur_1_4_MoveTowardsTarget
    .word R_Mettaur_1_2_DecideMoveOrAttack
    .word R_Mettaur_1_6_Guard
    .word R_Mettaur_1_2_DecideMoveOrAttack

PTR_PTR_R_Mettaur_1_0_Spawn_0805a6b4:
    .word PTR_R_Mettaur_1_0_Spawn_0805a694

DAT_0805a6b8:
    .word 0x28850


_ts R_Mettaur_1_0_Spawn
    push       {lr}
    ldr        r7,PTR_PTR_R_Mettaur_1_0_0_ResetAnimState_0805a6d8
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Mettaur_1_0_0_ResetAnimState_0805a6cc:
    .word R_Mettaur_1_0_0_ResetAnimState
    .word R_Mettaur_1_0_1_WaitForAnimEnd
    .word R_Mettaur_1_0_2_WaitForBattleStart

PTR_PTR_R_Mettaur_1_0_0_ResetAnimState_0805a6d8:
    .word PTR_R_Mettaur_1_0_0_ResetAnimState_0805a6cc


_ts R_Mettaur_1_0_0_ResetAnimState
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805a6ee
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0805a6ee:
    pop        {pc}


_ts R_Mettaur_1_0_1_WaitForAnimEnd
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805a702
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_0805a702:
    pop        {pc}


_ts R_Mettaur_1_0_2_WaitForBattleStart
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805a71c
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805a71c:
    pop        {pc}


_nt R_Mettaur_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805a738
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805a738:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805a74a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805a74a:
    pop        {pc}


_ts R_Mettaur_1_2_DecideMoveOrAttack
    push       {lr}
    ldr        r7,PTR_PTR_R_Mettaur_1_2_0_SetupDelay_0805a774
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805a76a
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805a76a:
    pop        {pc}

PTR_R_Mettaur_1_2_0_SetupDelay_0805a76c:
    .word R_Mettaur_1_2_0_SetupDelay
    .word R_Mettaur_1_2_1_Decide

PTR_PTR_R_Mettaur_1_2_0_SetupDelay_0805a774:
    .word PTR_R_Mettaur_1_2_0_SetupDelay_0805a76c


_ts R_Mettaur_1_2_0_SetupDelay
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r2,PTR_BYTE_ARRAY_ARRAY_0805a7a0
    ldrb       r1,[r5,#0x4]
    add        r1,r1,r1
    add        r2,r2,r1
    ldrb       r0,[r2,#0x0]
    ldrb       r1,[r2,#0x1]
    strh       r0,[r5,#0x1c]
    strh       r1,[r5,#0x1e]
    pop        {pc}

BYTE_ARRAY_ARRAY_0805a798:
    .byte 0x28
    .byte 0x1E
    .byte 0x0F
    .byte 0x08
    .byte 0x0A
    .byte 0x05

    .align 2, 0


PTR_BYTE_ARRAY_ARRAY_0805a7a0:
    .word BYTE_ARRAY_ARRAY_0805a798


_ts R_Mettaur_1_2_1_Decide
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805a7da
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    bne        LAB_0805a7c8
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0805a7c8
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805a7c8:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a7e8
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805a7da:
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0805a7e8
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805a7e8:
    pop        {pc}


_nt R_Mettaur_1_3_Attack
    push       {lr}
    ldr        r7,PTR_PTR_R_Mettaur_1_3_0_StartAnimPickaxeRaise_0805a810
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Mettaur_1_3_0_StartAnimPickaxeRaise_0805a7f8:
    .word R_Mettaur_1_3_0_StartAnimPickaxeRaise
    .word R_Mettaur_1_3_1_StartAnimPickaxeSwing
    .word R_Mettaur_1_3_2_CreateShockwave
    .word R_Mettaur_1_3_3_StartAnimPickaxeReset
    .word R_Mettaur_1_3_4_DropPriority
    .word R_Mettaur_1_3_5_DropPriority

PTR_PTR_R_Mettaur_1_3_0_StartAnimPickaxeRaise_0805a810:
    .word PTR_R_Mettaur_1_3_0_StartAnimPickaxeRaise_0805a7f8


_ts R_Mettaur_1_3_0_StartAnimPickaxeRaise
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Mettaur_1_3_1_StartAnimPickaxeSwing
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a83a
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_0805a83a:
    pop        {pc}


_ts R_Mettaur_1_3_2_CreateShockwave
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a878
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    ldr        r0,DAT_0805ab1c
    sub        r1,r1,r0
    ldr        r0,DAT_0805ab20
    add        r3,r3,r0
    mov        r4,#0x2
    ldrb       r4,[r5,#0x4]
    add        r4,#0x1
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    ldr        r7,PTR_shockwaveDamage_0805a880
    ldrb       r6,[r5,#0x4]
    ldrb       r6,[r7,r6]
    bl         Attack_Shockwave_Create
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
LAB_0805a878:
    pop        {pc}

shockwaveDamage:
    .byte 0x0A
    .byte 0x28
    .byte 0x64

    .align 2, 0


PTR_shockwaveDamage_0805a880:
    .word shockwaveDamage
    .byte 0x00
    .byte 0xF4
    .byte -1
    .byte -1
    .byte 0x00
    .byte 0xF0
    .byte -1
    .byte -1


_ts R_Mettaur_1_3_3_StartAnimPickaxeReset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a8a2
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0805a8a2:
    pop        {pc}


_ts R_Mettaur_1_3_4_DropPriority
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a8e2
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_Mettaur_MoveForward
    sub        r0,#0x1
    bl         R_Mettaur_CanMoveToPanel
    tst        r0,r0
    beq        LAB_0805a8da
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
LAB_0805a8da:
    mov        r0,#0x14
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_0805a8e2:
    pop        {pc}


_ts R_Mettaur_1_3_5_DropPriority
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a8fe
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
    bl         Battle_PriorityQueueEnqueue
LAB_0805a8fe:
    pop        {pc}


_ts R_Mettaur_1_4_MoveTowardsTarget
    push       {lr}
    ldr        r7,PTR_PTR_R_Mettaur_1_4_0_MoveStart_0805a91c
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Mettaur_1_4_0_MoveStart_0805a910:
    .word R_Mettaur_1_4_0_MoveStart
    .word R_Mettaur_1_4_1_MoveEnd
    .word R_Mettaur_1_4_2_PrepareNextAction

PTR_PTR_R_Mettaur_1_4_0_MoveStart_0805a91c:
    .word PTR_R_Mettaur_1_4_0_MoveStart_0805a910


_ts R_Mettaur_1_4_0_MoveStart
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    mvn        r1,r1
    and        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt R_Mettaur_1_4_1_MoveEnd
    push       {lr}
    bl         R_Actor_WaitCounter
    bne        LAB_0805a9a0
    bl         Entity_CompareToPlayerRow
    mov        r1,#0x0
    tst        r0,r0
    beq        LAB_0805a984
    bmi        LAB_0805a95e
    add        r1,#0x1
    b          LAB_0805a960
LAB_0805a95e:
    sub        r1,#0x1
LAB_0805a960:
    ldrb       r0,[r5,#0x19]
    add        r1,r1,r0
    ldrb       r0,[r5,#0x18]
    push       {r0,r1}
    bl         R_Mettaur_CanMoveToPanel
    add        r2,r0,#0x0
    pop        {r0,r1}
    tst        r2,r2
    beq        LAB_0805a984
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x1
    b          LAB_0805a986
LAB_0805a984:
    mov        r0,#0x0
LAB_0805a986:
    strb       r0,[r5,#0x7]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x14
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805a9a0:
    pop        {pc}


_nt R_Mettaur_1_4_2_PrepareNextAction
    push       {lr}
    bl         R_Actor_WaitCounter
    bne        LAB_0805a9c4
    ldrb       r0,[r5,#0x7]
    tst        r0,r0
    bne        LAB_0805a9b4
    mov        r0,#0xc
    b          LAB_0805a9b6
LAB_0805a9b4:
    mov        r0,#0x8
LAB_0805a9b6:
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0805a9c4:
    pop        {pc}


_nt R_Mettaur_1_6_Guard
    push       {lr}
    ldr        r7,PTR_PTR_R_Mettaur_1_6_0_StartAnimShield_0805aa04
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805a9ee
    mov        r1,#0x8
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0xc]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    bic        r0,r1
    str        r0,[r7,#0xc]
LAB_0805a9ee:
    pop        {pc}

PTR_R_Mettaur_1_6_0_StartAnimShield_0805a9f0:
    .word R_Mettaur_1_6_0_StartAnimShield
    .word R_Mettaur_1_6_1_SetDelayAnim
    .word R_Mettaur_1_6_2_WaitAnimAndStartPopup
    .word R_Mettaur_1_6_3_SetDelayAnimPopup
    .word R_Mettaur_1_6_4_WaitAnimPopup

PTR_PTR_R_Mettaur_1_6_0_StartAnimShield_0805aa04:
    .word PTR_R_Mettaur_1_6_0_StartAnimShield_0805a9f0


_ts R_Mettaur_1_6_0_StartAnimShield
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Mettaur_1_6_1_SetDelayAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805aa38
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0xc]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    orr        r0,r1
    str        r0,[r7,#0xc]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
LAB_0805aa38:
    pop        {pc}


_nt R_Mettaur_1_6_2_WaitAnimAndStartPopup
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805aa5c
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0xc]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    bic        r0,r1
    str        r0,[r7,#0xc]
LAB_0805aa5c:
    pop        {pc}


_nt R_Mettaur_1_6_3_SetDelayAnimPopup
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805aa72
    mov        r0,#0x3c
    strb       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0805aa72:
    pop        {pc}


_ts R_Mettaur_1_6_4_WaitAnimPopup
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805aa82
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_0805aa82:
    pop        {pc}


_ts R_Mettaur_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Mettaur_2_0_0805aa9c
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Mettaur_2_0_0805aa94:
    .word R_Mettaur_2_0
    .word R_Mettaur_2_1

PTR_PTR_R_Mettaur_2_0_0805aa9c:
    .word PTR_R_Mettaur_2_0_0805aa94


_ts R_Mettaur_2_0
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Battle_PriorityQueueRemove
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x7c]
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Mettaur_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805aada
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805aada:
    pop        {pc}


_ts Entity_CompareToPlayerRow
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r5,#0x19]
    ldrb       r0,[r7,#0x19]
    sub        r0,r0,r1
    mov        pc,lr


_nt R_Mettaur_CanMoveToPanel
    push       {lr}
    cmp        r0,#0x2
    bmi        LAB_0805ab0a
    bl         Field_GetPanelFlags
    mov        r3,#0x1
    tst        r0,r3
    beq        LAB_0805ab0a
    mov        r3,#0x2
    tst        r0,r3
    beq        LAB_0805ab0a
    ldr        r3,DAT_0805ab10
    tst        r0,r3
    bne        LAB_0805ab0a
    mov        r0,#0x1
    pop        {pc}
LAB_0805ab0a:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


DAT_0805ab10:
    .word 0xC20


_ts R_Actor_WaitCounter
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        pc,lr

DAT_0805ab1c:
    .word 0x100000

DAT_0805ab20:
    .word 0xA0000
