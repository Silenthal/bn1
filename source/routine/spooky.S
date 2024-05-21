#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_CreateQuickAttack, 0x80718E6+1
    .set Effect_VirusDeleteExplosion_Create, 0x807CE16+1
    .set ScreenDim_Recover_Create, 0x809843C+1


_ts Routine_Spooky
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Spooky_0_Init_0805b8bc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Spooky_0_Init_0805b8bc:
    .word PTR_R_Spooky_0_Init_0805b8c0

PTR_R_Spooky_0_Init_0805b8c0:
    .word R_Spooky_0_Init
    .word R_Spooky_1_Main
    .word R_Spooky_2_Free


_ts R_Spooky_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x20
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
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_listSpookyRecoverCount_0805b964
    ldrb       r0,[r7,r0]
    strb       r0,[r5,#0xc]
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    ldr        r0,[r5,#0x28]
    str        r0,[r5,#0x50]
    ldr        r0,[r5,#0x2c]
    str        r0,[r5,#0x54]
    ldr        r0,[r5,#0x30]
    str        r0,[r5,#0x58]
    mov        r0,#0x4b
    lsl        r0,r0,#0x2
    strh       r0,[r5,#0x1e]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_listSpookyActorDamage_0805b968
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    bne        LAB_0805b958
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_0805b958:
    bl         R_Spooky_1_Main
    pop        {pc}

listSpookyRecoverCount:
    .byte 0x00
    .byte 0x01
    .byte 0x01

listSpookyActorDamage:
    .byte 0x0F
    .byte 0x3C
    .byte 0x78

PTR_listSpookyRecoverCount_0805b964:
    .word listSpookyRecoverCount

PTR_listSpookyActorDamage_0805b968:
    .word 0x805B961


_ts R_Spooky_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrb       r0,[r5,#0x16]
    bl         Battle_GetBattleFlagBuffer
    beq        LAB_0805b988
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
LAB_0805b988:
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805b9d0
    bl         Battle_IsInputLocked
    bne        LAB_0805b9d0
    bl         Routine_CheckPoisonDrain
    bl         SpritePtr_ResetPalette
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,INT_0805ba34
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
    beq        LAB_0805b9d0
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0805b9d0:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0805ba04
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Spooky_1_0_Spawn_0805ba30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805b9f6
    mov        r0,#0x9
    b          LAB_0805b9f8
LAB_0805b9f6:
    mov        r0,#0xf
LAB_0805b9f8:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805ba16
LAB_0805ba04:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
LAB_0805ba16:
    pop        {pc}

PTR_R_Spooky_1_0_Spawn_0805ba18:
    .word R_Spooky_1_0_Spawn
    .word R_Spooky_1_1_WaitForBattleStart
    .word R_Spooky_1_2_Decide
    .word R_Spooky_1_3_Move
    .word R_Spooky_1_4_Attack
    .word R_Spooky_1_5_Recover

PTR_PTR_R_Spooky_1_0_Spawn_0805ba30:
    .word PTR_R_Spooky_1_0_Spawn_0805ba18

INT_0805ba34:
    .word 0x28850
    .word 0x400
    .word 0x20


_ts R_Spooky_1_0_Spawn
    push       {lr}
    ldr        r7,PTR_PTR_R_Spooky_1_0_0_ResetAnimState_0805ba5c
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Spooky_1_0_0_ResetAnimState_0805ba50:
    .word R_Spooky_1_0_0_ResetAnimState
    .word R_Spooky_1_0_1_WaitForAnimEnd
    .word R_Spooky_1_0_2_WaitForBattleStart

PTR_PTR_R_Spooky_1_0_0_ResetAnimState_0805ba5c:
    .word PTR_R_Spooky_1_0_0_ResetAnimState_0805ba50


_ts R_Spooky_1_0_0_ResetAnimState
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805ba72
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0805ba72:
    pop        {pc}


_ts R_Spooky_1_0_1_WaitForAnimEnd
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805ba86
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_0805ba86:
    pop        {pc}


_ts R_Spooky_1_0_2_WaitForBattleStart
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805ba9c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ba9c:
    pop        {pc}


_nt R_Spooky_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805bab8
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805bab8:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805baca
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805baca:
    pop        {pc}


_ts R_Spooky_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Spooky_1_2_0_ResetAnim_0805bb30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805baec
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    b          LAB_0805bb26
LAB_0805baec:
    bl         R_Spooky_CheckAttack
    tst        r0,r0
    beq        LAB_0805bb16
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldr        r0,[r5,#0x64]
    ldrb       r1,[r5,#0x18]
    strb       r1,[r0,#0x2]
    ldrb       r1,[r5,#0x19]
    strb       r1,[r0,#0x3]
    bl         FieldObject_UpdateCellPosition
    bl         FieldObject_Enable
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0805bb26
LAB_0805bb16:
    bl         R_Spooky_FindTarget
    tst        r0,r0
    beq        LAB_0805bb26
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805bb26:
    pop        {pc}

PTR_R_Spooky_1_2_0_ResetAnim_0805bb28:
    .word R_Spooky_1_2_0_ResetAnim
    .word R_Spooky_1_2_1_CheckRow

PTR_PTR_R_Spooky_1_2_0_ResetAnim_0805bb30:
    .word PTR_R_Spooky_1_2_0_ResetAnim_0805bb28


_ts R_Spooky_1_2_0_ResetAnim
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Spooky_1_2_1_CheckRow
    pop        {pc}


_ts R_Spooky_1_2_1_CheckRow
    push       {lr}
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    bne        LAB_0805bb5e
    bl         R_Actor_GetNewY
    cmp        r0,#0xff
    beq        LAB_0805bb5e
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805bb5e:
    pop        {pc}


_ts R_Spooky_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Spooky_1_3_0_Delay_0805bb90
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805bb7e
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805bb7e:
    pop        {pc}

PTR_R_Spooky_1_3_0_Delay_0805bb80:
    .word R_Spooky_1_3_0_Delay
    .word R_Spooky_1_3_1_StartMove
    .word R_Spooky_1_3_2_ChooseNewRow
    .word R_Spooky_1_3_3_EndMove

PTR_PTR_R_Spooky_1_3_0_Delay_0805bb90:
    .word PTR_R_Spooky_1_3_0_Delay_0805bb80


_ts R_Spooky_1_3_0_Delay
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Spooky_1_3_1_StartMove
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805bbae
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805bbae:
    mov        pc,lr


_ts R_Spooky_1_3_2_ChooseNewRow
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805bbdc
    ldrb       r0,[r5,#0x19]
    bl         R_Actor_GetNewY
    cmp        r0,#0xff
    beq        LAB_0805bbd4
    strb       r0,[r5,#0x19]
    add        r1,r0,#0x0
    ldrb       r0,[r5,#0x18]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
LAB_0805bbd4:
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0805bbdc:
    pop        {pc}


_nt R_Spooky_1_3_3_EndMove
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805bbf2
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805bbf2:
    pop        {pc}


_ts R_Spooky_1_4_Attack
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Spooky_1_4_0_TeleportToPlayer_0805bc30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805bc18
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805bc18:
    pop        {pc}

    .align 2, 0


PTR_R_Spooky_1_4_0_TeleportToPlayer_0805bc1c:
    .word R_Spooky_1_4_0_TeleportToPlayer
    .word R_Spooky_1_4_0_TeleportToPlayer
    .word R_Spooky_1_4_0_TeleportToPlayer
    .word R_Spooky_1_4_3_Attack
    .word R_Spooky_1_4_5_TeleportBack

PTR_PTR_R_Spooky_1_4_0_TeleportToPlayer_0805bc30:
    .word PTR_R_Spooky_1_4_0_TeleportToPlayer_0805bc1c


_ts R_Spooky_1_4_0_TeleportToPlayer
    push       {lr}
    ldr        r7,PTR_PTR_R_Spooky_1_4_0_0_StartAnimVanish_0805bc44
    ldrb       r0,[r5,#0xb]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Spooky_1_4_0_0_StartAnimVanish_0805bc44:
    .word PTR_R_Spooky_1_4_0_0_StartAnimVanish_0805bc48

PTR_R_Spooky_1_4_0_0_StartAnimVanish_0805bc48:
    .word R_Spooky_1_4_0_0_StartAnimVanish
    .word R_Spooky_1_4_0_1_WaitAnim
    .word R_Spooky_1_4_0_2_StartAnimReappear
    .word R_Spooky_1_4_0_3_WaitAnim


_ts R_Spooky_1_4_0_0_StartAnimVanish
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    ldrb       r0,[r5,#0x18]
    strb       r0,[r5,#0x7]
    strb       r0,[r5,#0x6]
    ldrb       r0,[r5,#0x19]
    strb       r0,[r5,#0x5]
    mov        pc,lr


_ts R_Spooky_1_4_0_1_WaitAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805bc8c
    ldrb       r0,[r5,#0x0]
    mov        r1,#0xfd
    and        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
LAB_0805bc8c:
    pop        {pc}


_nt R_Spooky_1_4_0_2_StartAnimReappear
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805bca6
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x6]
    sub        r0,#0x1
    strb       r0,[r5,#0x6]
    cmp        r0,#0x2
    bmi        LAB_0805bcb6
LAB_0805bca6:
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x18]
    add        r1,#0x1
    cmp        r1,r0
    beq        LAB_0805bcc0
    b          LAB_0805bcd8
LAB_0805bcb6:
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
    b          LAB_0805bcd8
LAB_0805bcc0:
    add        r0,r1,#0x0
    ldrb       r1,[r7,#0x19]
    bl         R_Spooky_SetPosition
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xb]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0805bcd8:
    pop        {pc}


_nt R_Spooky_1_4_0_3_WaitAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805bcee
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_0805bcee:
    pop        {pc}


_ts R_Spooky_1_4_3_Attack
    push       {lr}
    ldr        r7,PTR_PTR_R_Spooky_1_4_3_0_StartAnimAttack_0805bd00
    ldrb       r0,[r5,#0xb]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Spooky_1_4_3_0_StartAnimAttack_0805bd00:
    .word PTR_R_Spooky_1_4_3_0_StartAnimAttack_0805bd04

PTR_R_Spooky_1_4_3_0_StartAnimAttack_0805bd04:
    .word R_Spooky_1_4_3_0_StartAnimAttack
    .word R_Spooky_1_4_3_1_Damage
    .word R_Spooky_1_4_3_2_WaitAnim


_ts R_Spooky_1_4_3_0_StartAnimAttack
    push       {lr}
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x89
    bl         Sound_PlaySongImmediate
    pop        {pc}


_nt R_Spooky_1_4_3_1_Damage
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805bd54
    push       {r5}
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    ldrb       r3,[r5,#0x4]
    ldr        r7,PTR_listSpookyTongueDamage_0805bd5c
    ldrb       r3,[r7,r3]
    mov        r4,#0x80
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_CreateQuickAttack
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0805bd54:
    pop        {pc}

listSpookyTongueDamage:
    .byte 0x0F
    .byte 0x3C
    .byte 0x78

    .align 2, 0


PTR_listSpookyTongueDamage_0805bd5c:
    .word listSpookyTongueDamage


_ts R_Spooky_1_4_3_2_WaitAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805bd74
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_0805bd74:
    pop        {pc}


_nt R_Spooky_1_4_5_TeleportBack
    push       {lr}
    ldr        r7,PTR_PTR_R_Spooky_1_4_5_0_StartAnimTeleport_0805bd84
    ldrb       r0,[r5,#0xb]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Spooky_1_4_5_0_StartAnimTeleport_0805bd84:
    .word PTR_R_Spooky_1_4_5_0_StartAnimTeleport_0805bd88

PTR_R_Spooky_1_4_5_0_StartAnimTeleport_0805bd88:
    .word R_Spooky_1_4_5_0_StartAnimTeleport
    .word R_Spooky_1_4_5_1_SetPosition
    .word R_Spooky_1_4_5_2_WaitAnim


_ts R_Spooky_1_4_5_0_StartAnimTeleport
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    pop        {pc}


_ts R_Spooky_1_4_5_1_SetPosition
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0805bdc0
    ldrb       r0,[r5,#0x7]
    ldrb       r1,[r5,#0x5]
    bl         R_Spooky_SetPosition
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0805bdc0:
    pop        {pc}


_nt R_Spooky_1_4_5_2_WaitAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0805bde2
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    mov        r0,#0x4b
    lsl        r0,r0,#0x2
    strh       r0,[r5,#0x1e]
LAB_0805bde2:
    pop        {pc}


_ts R_Spooky_1_5_Recover
    push       {lr}
    ldr        r7,PTR_PTR_R_Spooky_1_5_0_StartAnim_0805bdf4
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Spooky_1_5_0_StartAnim_0805bdf4:
    .word PTR_R_Spooky_1_5_0_StartAnim_0805bdf8

PTR_R_Spooky_1_5_0_StartAnim_0805bdf8:
    .word R_Spooky_1_5_0_StartAnim
    .word R_Spooky_1_5_1_Recover
    .word R_Spooky_1_5_2_Next


_ts R_Spooky_1_5_0_StartAnim
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Spooky_1_5_1_Recover
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805be3a
    ldr        r0,[r5,#0x6c]
    ldr        r7,PTR_BYTE_ARRAY_0805be40
    ldrb       r1,[r5,#0x4]
    ldrb       r1,[r7,r1]
    bl         ScreenDim_Recover_Create
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x1
    strb       r0,[r5,#0xc]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0xc]
    strb       r0,[r5,#0x1b]
LAB_0805be3a:
    pop        {pc}

BYTE_ARRAY_0805be3c:
    .byte 0x01
    .byte 0x02
    .byte 0x05

    .align 2, 0


PTR_BYTE_ARRAY_0805be40:
    .word BYTE_ARRAY_0805be3c


_ts R_Spooky_1_5_2_Next
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Spooky_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Spooky_2_0_StartAnimDelete_0805be68
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Spooky_2_0_StartAnimDelete_0805be60:
    .word R_Spooky_2_0_StartAnimDelete
    .word R_Spooky_2_1_WaitAnim

PTR_PTR_R_Spooky_2_0_StartAnimDelete_0805be68:
    .word PTR_R_Spooky_2_0_StartAnimDelete_0805be60


_ts R_Spooky_2_0_StartAnimDelete
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
    str        r0,[r5,#0x7c]
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt R_Spooky_2_1_WaitAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805bea8
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805bea8:
    pop        {pc}


_nt R_Spooky_SetPositionFromSprite
    push       {lr}
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}


_nt R_Spooky_SetPosition
    push       {lr}
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    pop        {pc}


_nt R_Spooky_CheckAttack
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    bge        LAB_0805bed4
    mov        r0,#0x0
LAB_0805bed4:
    strh       r0,[r5,#0x1e]
    tst        r0,r0
    bgt        LAB_0805bee6
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    bne        LAB_0805bee6
    mov        r0,#0x1
    b          LAB_0805bee8
LAB_0805bee6:
    mov        r0,#0x0
LAB_0805bee8:
    pop        {pc}


_nt R_Spooky_FindTarget
    push       {lr}
    mov        r0,#0x0
    ldrb       r1,[r5,#0xc]
    tst        r1,r1
    beq        LAB_0805bf12
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0xc]
    ldrb       r2,[r5,#0x1b]
    cmp        r1,r2
    ble        LAB_0805bf12
    push       {r0}
    bl         R_Spooky_GetAnyLiveEnemy
    add        r1,r0,#0x0
    pop        {r0}
    tst        r1,r1
    beq        LAB_0805bf12
    str        r1,[r5,#0x6c]
    mov        r0,#0x1
LAB_0805bf12:
    pop        {pc}


_ts R_Spooky_GetAnyLiveEnemy
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    add        r7,#0x54
    mov        r0,#0x0
LAB_0805bf1e:
    ldr        r6,[r7,#0x0]
    tst        r6,r6
    beq        LAB_0805bf32
    ldrh       r1,[r6,#0x20]
    tst        r1,r1
    beq        LAB_0805bf32
    cmp        r1,#0x1e
    bpl        LAB_0805bf32
    add        r0,r6,#0x0
    b          LAB_0805bf3c
LAB_0805bf32:
    add        r7,#0x4
    add        r0,#0x1
    cmp        r0,#0x4
    bmi        LAB_0805bf1e
    mov        r0,#0x0
LAB_0805bf3c:
    pop        {pc}

    .align 2, 0

