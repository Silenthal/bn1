#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_VirusDeleteExplosion_Create, 0x807CE16+1


_ts Routine_Mole
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Mole_0_Init_0806f06c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mole_0_Init_0806f06c:
    .word PTR_R_Mole_0_Init_0806f070

PTR_R_Mole_0_Init_0806f070:
    .word R_Mole_0_Init
    .word R_Mole_1_Main
    .word R_Mole_2_Free


_ts R_Mole_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x65
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x2
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
    str        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x1
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_Mole_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts R_Mole_1_Main
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_DisableIfHitFlagSet
    bl         R_Mole_CheckDamage
    tst        r0,r0
    bne        LAB_0806f102
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806f110
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806f102:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0806f110:
    .word PTR_R_Actor_1_0_Spawn_0806f114

PTR_R_Actor_1_0_Spawn_0806f114:
    .word R_Actor_1_0_Spawn
    .word R_Mole_1_1_WaitForBattleStart
    .word R_Mole_1_2_Idle
    .word R_Mole_1_3_Hurt
    .word R_Mole_1_4_GoUnder
    .word R_Mole_1_5_PreparePopUp
    .word R_Mole_1_6_PopUp
    .word R_Mole_1_7_Escape


_ts R_Mole_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806f14e
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806f14e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806f160
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806f160:
    pop        {pc}


_nt R_Mole_1_2_Idle
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mole_1_2_0_StartAnimIdle_0806f184
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806f180
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806f180:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mole_1_2_0_StartAnimIdle_0806f184:
    .word PTR_R_Mole_1_2_0_StartAnimIdle_0806f188

PTR_R_Mole_1_2_0_StartAnimIdle_0806f188:
    .word R_Mole_1_2_0_StartAnimIdle
    .word R_Mole_1_2_1_WaitAnim


_ts R_Mole_1_2_0_StartAnimIdle
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    ldrh       r0,[r5,#0x20]
    ldr        r7,PTR_listIdleAnimDelay_0806f1a4
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

PTR_listIdleAnimDelay_0806f1a4:
    .word listIdleAnimDelay

listIdleAnimDelay:
    .byte 0x05
    .byte 0x09
    .byte 0x0A
    .byte 0x0C
    .byte 0x0E
    .byte 0x14
    .byte 0x1E
    .byte 0x28
    .byte 0x3C
    .byte 0x50
    .byte 0xAA

    .align 2, 0



_ts R_Mole_1_2_1_WaitAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806f1c6
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806f1c6:
    pop        {pc}


_ts R_Mole_1_3_Hurt
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mole_1_3_0_StartAnimHurt_0806f1d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mole_1_3_0_StartAnimHurt_0806f1d8:
    .word PTR_R_Mole_1_3_0_StartAnimHurt_0806f1dc

PTR_R_Mole_1_3_0_StartAnimHurt_0806f1dc:
    .word R_Mole_1_3_0_StartAnimHurt
    .word R_Mole_1_3_1_WaitAnim


_ts R_Mole_1_3_0_StartAnimHurt
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Mole_1_3_1_WaitAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806f206
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806f206:
    pop        {pc}


_ts R_Mole_1_4_GoUnder
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mole_1_4_0_StartAnim_0806f218
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mole_1_4_0_StartAnim_0806f218:
    .word PTR_R_Mole_1_4_0_StartAnim_0806f21c

PTR_R_Mole_1_4_0_StartAnim_0806f21c:
    .word R_Mole_1_4_0_StartAnim
    .word R_Mole_1_4_1_WaitAnim


_ts R_Mole_1_4_0_StartAnim
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    bl         R_Mole_CheckChildren
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Mole_1_4_1_WaitAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806f24e
    ldr        r0,[r5,#0x60]
    push       {r0}
    bl         FieldObject_Disable
    pop        {r0}
    bl         FieldObject_ClearHitFlag
LAB_0806f24e:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806f260
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806f260:
    pop        {pc}


_nt R_Mole_1_5_PreparePopUp
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mole_1_5_0_Delay_0806f270
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Mole_1_5_0_Delay_0806f270:
    .word PTR_R_Mole_1_5_0_Delay_0806f274

PTR_R_Mole_1_5_0_Delay_0806f274:
    .word R_Mole_1_5_0_Delay
    .word R_Mole_1_5_1_PreparePopUp


_ts R_Mole_1_5_0_Delay
    push       {lr}
    bl         Rng_RandomUint
    lsr        r0,r0,#0x19
    add        r0,#0xa
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Mole_1_5_1_PreparePopUp
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806f32a
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_0806f32c
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x14
    mov        r7,sp
    ldr        r1,DAT_0806f338
    ldr        r2,DAT_0806f33c
    push       {r7}
    add        r0,r7,#0x0
    bl         Field_Search
    pop        {r7}
    tst        r1,r1
    beq        LAB_0806f304
    mov        r2,#0x14
    push       {r1,r7}
    add        r0,r7,#0x0
    bl         ArrayShuffle
    pop        {r2,r7}
    ldrb       r0,[r7,#0x0]
    push       {r2,r7}
    bl         Field_IndexToCellXY
    pop        {r2,r7}
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    sub        r2,#0x1
    beq        LAB_0806f304
    ldrb       r0,[r7,#0x1]
    push       {r2,r7}
    bl         Field_IndexToCellXY
    mov        r4,#0x0
    bl         Attack_MoleHole_Create
    str        r7,[r5,#0x68]
    pop        {r2,r7}
    sub        r2,#0x1
    beq        LAB_0806f304
    ldrb       r0,[r7,#0x2]
    bl         Field_IndexToCellXY
    mov        r4,#0x0
    bl         Attack_MoleHole_Create
    str        r7,[r5,#0x6c]
LAB_0806f304:
    add        sp,#0x14
    ldrh       r0,[r5,#0x18]
    ldr        r7,[r5,#0x64]
    strh       r0,[r7,#0x4]
    strh       r0,[r7,#0x2]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806f32a:
    pop        {pc}
LAB_0806f32c:
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_0806f338:
    .word 0x3

DAT_0806f33c:
    .word 0xC20


_ts R_Mole_1_6_PopUp
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mole_1_6_0_PopUp_0806f350
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mole_1_6_0_PopUp_0806f350:
    .word PTR_R_Mole_1_6_0_PopUp_0806f354

PTR_R_Mole_1_6_0_PopUp_0806f354:
    .word R_Mole_1_6_0_PopUp
    .word R_Mole_1_6_1_Wait


_ts R_Mole_1_6_0_PopUp
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x93
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Mole_1_6_1_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806f38c
    ldr        r0,[r5,#0x60]
    push       {r0}
    bl         FieldObject_Enable
    pop        {r0}
    bl         FieldObject_ClearHitFlag
LAB_0806f38c:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806f39e
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806f39e:
    pop        {pc}


_ts R_Mole_1_7_Escape
    push       {lr}
    mov        r0,#0x8
    mov        r1,#0x0
    ldrb       r2,[r5,#0x16]
    mov        r3,#0x0
    bl         ScreenDim_Alloc
    pop        {pc}


_ts R_Mole_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Mole_2_0_0806f3c0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mole_2_0_0806f3c0:
    .word PTR_R_Mole_2_0_0806f3c4

PTR_R_Mole_2_0_0806f3c4:
    .word R_Mole_2_0
    .word R_Mole_2_1


_ts R_Mole_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDeleteExplosion_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_Mole_2_1
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806f416
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         R_Mole_CheckChildren
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806f416:
    pop        {pc}


_ts R_Mole_CheckChildren
    mov        r1,#0x1
    mov        r2,#0x0
    ldr        r0,[r5,#0x68]
    tst        r0,r0
    beq        LAB_0806f426
    strb       r1,[r0,#0x5]
    str        r2,[r5,#0x68]
LAB_0806f426:
    ldr        r0,[r5,#0x6c]
    tst        r0,r0
    beq        LAB_0806f430
    strb       r1,[r0,#0x5]
    str        r2,[r5,#0x6c]
LAB_0806f430:
    mov        pc,lr


_nt R_Mole_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0806f4b2
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806f47c
    ldr        r1,[r5,#0x60]
    ldrb       r0,[r1,#0x0]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_0806f4b2
    mov        r0,#0x1e
    ldrb       r1,[r5,#0x16]
    add        r0,r0,r1
    bl         Battle_GetBattleFlag
    tst        r0,r0
    bne        LAB_0806f46e
    mov        r0,#0xa
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0806f4b2
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0806f4b2
LAB_0806f46e:
    mov        r0,#0x1
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0806f494
    bl         SpritePtr_SetFlashPalette
LAB_0806f47c:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0806f494:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
    mov        r0,#0xec
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
LAB_0806f4b2:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

