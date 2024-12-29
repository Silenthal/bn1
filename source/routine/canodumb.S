#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Canodumb
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Canodumb_0_Init_08059930
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_R_Canodumb_0_Init_08059924:
    .word R_Canodumb_0_Init
    .word R_Canodumb_1_Main
    .word R_Canodumb_2_Free

PTR_PTR_R_Canodumb_0_Init_08059930:
    .word PTR_R_Canodumb_0_Init_08059924


_ts R_Canodumb_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x10
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
    strb       r0,[r5,#0x16]
    ldr        r0,[r5,#0x28]
    str        r0,[r5,#0x50]
    ldr        r0,[r5,#0x2c]
    str        r0,[r5,#0x54]
    ldr        r0,[r5,#0x30]
    str        r0,[r5,#0x58]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x60]
    mov        r1,#0x20
    strb       r1,[r7,#0x8]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_Canodumb_1_Main
    push       {lr}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         IsPanelWalkable
    tst        r0,r0
    bne        LAB_080599b6
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}
LAB_080599b6:
    bl         SpritePtr_ResetPalette
    bl         Battle_IsInputLocked
    bne        LAB_080599f8
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_08059a44
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
    beq        LAB_080599f8
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_080599f8:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Canodumb_1_0_Spawn_08059a40
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Routine_CheckPoisonDrain
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08059a24
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08059a24:
    pop        {pc}

    .align 2, 0


PTR_R_Canodumb_1_0_Spawn_08059a28:
    .word R_Canodumb_1_0_Spawn
    .word R_Canodumb_1_1_WaitForBattleStart
    .word R_Canodumb_1_4_Observe
    .word R_Canodumb_1_4_Observe
    .word R_Canodumb_1_4_Observe
    .word R_Canodumb_1_5_Act

PTR_PTR_R_Canodumb_1_0_Spawn_08059a40:
    .word PTR_R_Canodumb_1_0_Spawn_08059a28

PanelFlag_08059a44:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple


_ts R_Canodumb_1_0_Spawn
    push       {lr}
    ldr        r7,PTR_PTR_R_Canodumb_1_0_0_ResetAnimState_08059a64
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Canodumb_1_0_0_ResetAnimState_08059a58:
    .word R_Canodumb_1_0_0_ResetAnimState
    .word R_Canodumb_1_0_1_InitSpawn
    .word R_Canodumb_1_0_2_WaitForBattleStart

PTR_PTR_R_Canodumb_1_0_0_ResetAnimState_08059a64:
    .word PTR_R_Canodumb_1_0_0_ResetAnimState_08059a58


_ts R_Canodumb_1_0_0_ResetAnimState
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_08059a7a
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_08059a7a:
    pop        {pc}


_ts R_Canodumb_1_0_1_InitSpawn
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_08059a8e
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_08059a8e:
    pop        {pc}


_ts R_Canodumb_1_0_2_WaitForBattleStart
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_08059aa4
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059aa4:
    pop        {pc}


_nt R_Canodumb_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08059ac0
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08059ac0:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08059ad2
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059ad2:
    pop        {pc}


_ts R_Canodumb_1_4_Observe
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Canodumb_1_4_0_CheckRow_08059afc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08059af2
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08059af2:
    pop        {pc}

PTR_R_Canodumb_1_4_0_CheckRow_08059af4:
    .word R_Canodumb_1_4_0_CheckRow
    .word R_Canodumb_1_4_1_CheckRow

PTR_PTR_R_Canodumb_1_4_0_CheckRow_08059afc:
    .word PTR_R_Canodumb_1_4_0_CheckRow_08059af4


_ts R_Canodumb_1_4_0_CheckRow
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Canodumb_1_4_1_CheckRow
    pop        {pc}


_ts R_Canodumb_1_4_1_CheckRow
    push       {lr}
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    bne        LAB_08059b22
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059b22:
    pop        {pc}


_ts R_Canodumb_1_5_Act
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Canodumb_1_5_0_Delay_08059b48
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Canodumb_1_5_0_Delay_08059b34:
    .word R_Canodumb_1_5_0_Delay
    .word R_Canodumb_1_5_1_CreateTarget
    .word R_Canodumb_1_5_2_Attack
    .word R_Canodumb_1_5_3_WaitForAnimEnd
    .word R_Canodumb_1_5_4_Recovery

PTR_PTR_R_Canodumb_1_5_0_Delay_08059b48:
    .word PTR_R_Canodumb_1_5_0_Delay_08059b34


_ts R_Canodumb_1_5_0_Delay
    push       {lr}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Canodumb_1_5_1_CreateTarget
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059b90
    ldrb       r0,[r5,#0x18]
    ldrb       r2,[r5,#0x16]
    tst        r2,r2
    bne        LAB_08059b6e
    add        r0,#0x1
    b          LAB_08059b70
LAB_08059b6e:
    sub        r0,#0x1
LAB_08059b70:
    ldrb       r1,[r5,#0x19]
    add        r3,r5,#0x0
    ldrb       r4,[r5,#0x4]
    bl         Attack_CanodumbTarget_Create
    str        r0,[r5,#0x6c]
    str        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_08059b88
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    b          LAB_08059b90
LAB_08059b88:
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059b90:
    pop        {pc}


_nt R_Canodumb_1_5_2_Attack
    push       {lr}
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_08059bb6
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_08059bb6
    ldrb       r0,[r7,#0x5]
    cmp        r0,#0x0
    beq        LAB_08059bbe
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x74
    bl         Sound_PlaySongImmediate
    b          LAB_08059bbe
LAB_08059bb6:
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059bbe:
    pop        {pc}


_ts R_Canodumb_1_5_3_WaitForAnimEnd
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08059bd4
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_08059bd4:
    pop        {pc}


_nt R_Canodumb_1_5_4_Recovery
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059be8
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059be8:
    pop        {pc}


_nt R_Canodumb_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Canodumb_2_0_StartAnimExplode_08059c00
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Canodumb_2_0_StartAnimExplode_08059bf8:
    .word R_Canodumb_2_0_StartAnimExplode
    .word R_Canodumb_2_1_Free

PTR_PTR_R_Canodumb_2_0_StartAnimExplode_08059c00:
    .word PTR_R_Canodumb_2_0_StartAnimExplode_08059bf8


_ts R_Canodumb_2_0_StartAnimExplode
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
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


_ts R_Canodumb_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059c3e
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08059c3e:
    pop        {pc}


_ts IsPanelWalkable
    push       {lr}
    sub        sp,#0x4
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    str        r0,[sp,#0x0]
    tst        r0,r1
    beq        LAB_08059c6a
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    bne        LAB_08059c60
    mov        r1,#0x2
    tst        r0,r1
    bne        LAB_08059c6a
    mov        r0,#0x1
    b          LAB_08059c6c
LAB_08059c60:
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08059c6a
    mov        r0,#0x1
    b          LAB_08059c6c
LAB_08059c6a:
    mov        r0,#0x0
LAB_08059c6c:
    ldr        r3,[sp,#0x0]
    add        sp,#0x4
    pop        {pc}

    .align 2, 0

