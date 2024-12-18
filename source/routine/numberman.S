#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listNumberManAttackChoice:
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x01
    .byte 0x01

FuncState_ARRAY_0805d1e4:
    .byte FS_6
    .byte FS_7

    .align 2, 0



_ts Routine_NumberMan
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_NumberMan_0_Init_0805d218
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r3,#0x6a
    ldrh       r0,[r5,r3]
    sub        r0,#0x1
    lsr        r1,r0,#0x10
    bic        r0,r1
    strh       r0,[r5,r3]
    pop        {pc}

    .align 2, 0


PTR_PTR_R_NumberMan_0_Init_0805d218:
    .word PTR_R_NumberMan_0_Init_0805d21c

PTR_R_NumberMan_0_Init_0805d21c:
    .word R_NumberMan_0_Init
    .word R_NumberMan_1_Main
    .word R_NumberMan_2_Free


_ts R_NumberMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x24
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
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
    str        r0,[r5,#0x5c]
    mov        r3,#0x6a
    strh       r0,[r5,r3]
    mov        r3,#0x68
    strh       r0,[r5,r3]
    mov        r7,#0x62
    add        r7,r7,r5
    strb       r0,[r7,#0x0]
    strb       r0,[r7,#0x1]
    strb       r0,[r7,#0x2]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x14
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
    bl         R_NumberMan_1_Main
    ldr        r0,[r5,#0x70]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_nt R_NumberMan_1_Main
    push       {lr}
    ldr        r0,[r5,#0x70]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0805d2d6
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}
LAB_0805d2d6:
    bl         R_NumberMan_CheckDamage
    tst        r0,r0
    bne        LAB_0805d2e8
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0805d2f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0805d2e8:
    ldr        r0,[r5,#0x70]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0805d2f4:
    .word PTR_R_Actor_1_0_Spawn_0805d2f8

PTR_R_Actor_1_0_Spawn_0805d2f8:
    .word R_Actor_1_0_Spawn
    .word R_NumberMan_1_1_WaitForBattleStart
    .word R_NumberMan_1_2_Wait
    .word R_NumberMan_1_3_Flinch
    .word R_NumberMan_1_4_ChargeUp
    .word R_NumberMan_1_5_NumberBall
    .word R_NumberMan_1_6_TimeBomb
    .word R_NumberMan_1_7_DieBomb


_ts R_NumberMan_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805d332
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0805d332:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805d344
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d344:
    pop        {pc}


_nt R_NumberMan_1_2_Wait
    push       {lr}
    ldr        r7,PTR_PTR_R_NumberMan_1_2_0_0805d368
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805d364
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805d364:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_NumberMan_1_2_0_0805d368:
    .word PTR_R_NumberMan_1_2_0_0805d36c

PTR_R_NumberMan_1_2_0_0805d36c:
    .word R_NumberMan_1_2_0
    .word R_NumberMan_1_2_1
    .word R_NumberMan_1_2_2


_ts R_NumberMan_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_NumberMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805d39c
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0805d39c:
    pop        {pc}


_nt R_NumberMan_1_2_2
    push       {lr}
    mov        r3,#0x6a
    ldrh       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0805d3bc
    mov        r3,#0x62
    add        r7,r3,r5
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    ldrb       r2,[r7,#0x2]
    orr        r0,r1
    orr        r0,r2
    bne        LAB_0805d3bc
    bl         R_NumberMan_StartAttack
LAB_0805d3bc:
    pop        {pc}


_nt R_NumberMan_1_3_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_0805d3e8
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_0805d3cc
    bl         SpritePtr_SetFlashPalette
LAB_0805d3cc:
    ldr        r7,PTR_PTR_R_NumberMan_1_3_0_0805d3d8
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_NumberMan_1_3_0_0805d3d8:
    .word PTR_R_NumberMan_1_3_0_0805d3dc

PTR_R_NumberMan_1_3_0_0805d3dc:
    .word R_NumberMan_1_3_0
    .word R_NumberMan_1_3_1
    .word R_NumberMan_1_3_2

PTR_gFrameCounter_0805d3e8:
    .word gFrameCounter


_ts R_NumberMan_1_3_0
    push       {lr}
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0xd
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    bl         R_Actor_ClearCurrentAttack
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_NumberMan_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805d42c
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0805d42c:
    pop        {pc}


_nt R_NumberMan_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805d452
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x5a
    mov        r3,#0x68
    strh       r0,[r5,r3]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
    bl         Battle_PriorityQueueEnqueue
LAB_0805d452:
    pop        {pc}


_ts R_NumberMan_1_4_ChargeUp
    push       {lr}
    ldr        r7,PTR_PTR_R_NumberMan_1_4_0_StartAnim_0805d464
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_NumberMan_1_4_0_StartAnim_0805d464:
    .word PTR_R_NumberMan_1_4_0_StartAnim_0805d468

PTR_R_NumberMan_1_4_0_StartAnim_0805d468:
    .word R_NumberMan_1_4_0_StartAnim
    .word R_NumberMan_1_4_1_ChooseAttack


_ts R_NumberMan_1_4_0_StartAnim
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x82
    lsl        r4,r0,#0x10
    mov        r0,#0x0
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x8f
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_NumberMan_1_4_1_ChooseAttack
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805d4a4
    bl         R_NumberMan_ChooseAttack
LAB_0805d4a4:
    pop        {pc}


_nt R_NumberMan_1_5_NumberBall
    push       {lr}
    ldr        r7,PTR_PTR_R_NumberMan_1_5_0_NumberBall_0805d4b4
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_NumberMan_1_5_0_NumberBall_0805d4b4:
    .word PTR_R_NumberMan_1_5_0_NumberBall_0805d4b8

PTR_R_NumberMan_1_5_0_NumberBall_0805d4b8:
    .word R_NumberMan_1_5_0_NumberBall
    .word R_NumberMan_1_5_1_Wait
    .word R_NumberMan_1_5_2_Next


_ts R_NumberMan_1_5_0_NumberBall
    push       {lr}
    sub        sp,#0x4
    mov        r7,sp
    ldr        r0,DAT_0805d508
    str        r0,[r7,#0x0]
    mov        r1,#0x3
    mov        r2,#0x3
    push       {r7}
    add        r0,r7,#0x0
    bl         ArrayShuffle
    pop        {r7}
    mov        r0,#0x2
LAB_0805d4de:
    push       {r0,r7}
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    ldrb       r2,[r7,r0]
    mov        r3,#0x0
    ldrb       r4,[r5,#0x4]
    lsl        r6,r0,#0x8
    orr        r4,r6
    ldrh       r6,[r5,#0x24]
    mov        r3,#0x62
    add        r0,r0,r5
    add        r0,r0,r3
    bl         Attack_NumberBall_Create
    pop        {r0,r7}
    sub        r0,#0x1
    bpl        LAB_0805d4de
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}

DAT_0805d508:
    .word 0x30201


_ts R_NumberMan_1_5_1_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805d520
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805d520:
    pop        {pc}


_nt R_NumberMan_1_5_2_Next
    push       {lr}
    mov        r3,#0x62
    add        r7,r3,r5
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    ldrb       r2,[r7,#0x2]
    orr        r0,r1
    orr        r0,r2
    bne        LAB_0805d53c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d53c:
    pop        {pc}


_nt R_NumberMan_1_6_TimeBomb
    push       {lr}
    ldr        r7,PTR_PTR_R_NumberMan_1_6_0_TimeBomb_0805d54c
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_NumberMan_1_6_0_TimeBomb_0805d54c:
    .word PTR_R_NumberMan_1_6_0_TimeBomb_0805d550

PTR_R_NumberMan_1_6_0_TimeBomb_0805d550:
    .word R_NumberMan_1_6_0_TimeBomb
    .word R_NumberMan_1_6_1_Next


_ts R_NumberMan_1_6_0_TimeBomb
    push       {lr}
    mov        r0,#0x1
    bl         Field_FindEmptyEnemyPanelForward
    tst        r0,r0
    beq        LAB_0805d572
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldrb       r4,[r5,#0x4]
    mov        r6,#0x28
    bl         Attack_TimeBomb_Create
LAB_0805d572:
    mov        r0,#0xf0
    mov        r3,#0x6a
    strh       r0,[r5,r3]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x02

    .align 2, 0



_ts R_NumberMan_1_6_1_Next
    push       {lr}
    mov        r3,#0x6a
    ldrh       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0805d5a0
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805d5a0
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d5a0:
    pop        {pc}


_nt R_NumberMan_1_7_DieBomb
    push       {lr}
    ldr        r7,PTR_PTR_R_NumberMan_1_7_0_DieBomb_0805d5b0
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_NumberMan_1_7_0_DieBomb_0805d5b0:
    .word PTR_R_NumberMan_1_7_0_DieBomb_0805d5b4

PTR_R_NumberMan_1_7_0_DieBomb_0805d5b4:
    .word R_NumberMan_1_7_0_DieBomb
    .word R_NumberMan_1_7_1


_ts R_NumberMan_1_7_0_DieBomb
    push       {lr}
    mov        r0,#0x1
    bl         Field_FindEmptyEnemyPanelForward
    tst        r0,r0
    beq        LAB_0805d5d2
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldrb       r4,[r5,#0x4]
    bl         Attack_DieBomb_Create
LAB_0805d5d2:
    mov        r0,#0xff
    mov        r3,#0x6a
    strh       r0,[r5,r3]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PF_EnemyTerritory


_ts R_NumberMan_1_7_1
    push       {lr}
    mov        r3,#0x6a
    ldrh       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0805d600
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805d600
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d600:
    pop        {pc}


_nt R_NumberMan_1_8_None
    push       {lr}
    ldr        r7,PTR_PTR_R_NumberMan_1_8_0_Next_0805d610
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_NumberMan_1_8_0_Next_0805d610:
    .word PTR_R_NumberMan_1_8_0_Next_0805d614

PTR_R_NumberMan_1_8_0_Next_0805d614:
    .word R_NumberMan_1_8_0_Next


_ts R_NumberMan_1_8_0_Next
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_NumberMan_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_NumberMan_2_0_Delete_0805d634
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_NumberMan_2_0_Delete_0805d634:
    .word PTR_R_NumberMan_2_0_Delete_0805d638

PTR_R_NumberMan_2_0_Delete_0805d638:
    .word R_NumberMan_2_0_Delete
    .word R_NumberMan_2_1_Free


_ts R_NumberMan_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    bl         R_Actor_ClearCurrentAttack
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_NumberMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805d68a
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805d68a:
    pop        {pc}


_ts R_NumberMan_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0805d728
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0805d6fe
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0805d6fe
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_0805d728
    mov        r3,#0x68
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_0805d6ce
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_0805d6c0
    mov        r0,#0x9
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    b          LAB_0805d728
LAB_0805d6c0:
    lsr        r0,r0,#0x1
    bcc        LAB_0805d728
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_0805d728
LAB_0805d6ce:
    mov        r0,#0xa
    ldr        r1,[r5,#0x70]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0805d728
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0805d728
    bl         Field_SubtractHP
    cmp        r0,#0x1e
    bcc        LAB_0805d6f4
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d6f4:
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805d71e
LAB_0805d6fe:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x70]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0xd
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0805d71e:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    pop        {pc}
LAB_0805d728:
    mov        r0,#0x0
    pop        {pc}


_ts R_NumberMan_StartAttack
    push       {lr}
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts _R_NumberMan_StartAttack
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_NumberMan_ChooseAttack
    push       {lr}
    ldrh       r0,[r5,#0x22]
    lsr        r0,r0,#0x1
    ldrh       r1,[r5,#0x20]
    cmp        r0,r1
    bmi        LAB_0805d766
    bl         Rng_RandomUint
    mov        r1,#0x7
    and        r0,r1
    ldr        r7,PTR_listNumberManAttackChoice_0805d770
    ldrb       r0,[r7,r0]
    ldr        r7,PTR_FuncState_ARRAY_0805d774
    ldrb       r0,[r7,r0]
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805d766:
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

PTR_listNumberManAttackChoice_0805d770:
    .word listNumberManAttackChoice

PTR_FuncState_ARRAY_0805d774:
    .word FuncState_ARRAY_0805d1e4
