#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_080633c0:
    .byte 0x68
    .byte 0x01
    .byte 0x0E
    .byte 0x01
    .byte 0xB4
    .byte 0x00


_nt Routine_ColorMan
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_ColorMan_0_Init_080633e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ColorMan_0_Init_080633e0:
    .word PTR_R_ColorMan_0_Init_080633e4

PTR_R_ColorMan_0_Init_080633e4:
    .word R_ColorMan_0_Init
    .word R_ColorMan_1_Main
    .word R_ColorMan_2_Free


_ts R_ColorMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x47
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x1
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
    mov        r3,#0x64
    strh       r0,[r5,r3]
    mov        r0,#0x0
    str        r0,[r5,#0x74]
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r0,[r5,r3]
    mov        r0,#0x3
    mov        r3,#0x62
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_DAT_0806348c
    add        r7,r7,r0
    str        r7,[r5,#0x68]
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1f
    lsl        r0,r0,#0x1
    sub        r0,#0x1
    mov        r1,#0xc0
    lsl        r1,r1,#0x8
    mul        r0,r1
    str        r0,[r5,#0x48]
    mov        r0,#0x9
    mov        r3,#0x6c
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r3,#0x70
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_ColorMan_1_Main
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_DAT_0806348c:
    .word DAT_080633c0


_ts R_ColorMan_1_Main
    push       {lr}
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080634bc
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}
LAB_080634bc:
    mov        r0,#0x1
    bl         Battle_GetBattleFlagBuffer
    tst        r0,r0
    beq        LAB_080634cc
    mov        r0,#0x0
    mov        r3,#0x62
    strb       r0,[r5,r3]
LAB_080634cc:
    bl         R_ColorMan_CheckDamage
    tst        r0,r0
    bne        LAB_080634e2
    bl         R_ColorMan_CheckFrontColumn
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_080634f0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_080634e2:
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_080634f0:
    .word PTR_R_Actor_1_0_Spawn_080634f4

PTR_R_Actor_1_0_Spawn_080634f4:
    .word R_Actor_1_0_Spawn
    .word R_ColorMan_1_1_Wait
    .word R_ColorMan_1_2_Reset
    .word R_ColorMan_1_3_Flinch
    .word R_ColorMan_1_4_Move
    .word R_ColorMan_1_5_Ball
    .word R_ColorMan_1_6_Steal
    .word R_ColorMan_1_7_Reset


_ts R_ColorMan_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806352e
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806352e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08063540
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063540:
    pop        {pc}


_nt R_ColorMan_1_2_Reset
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorMan_1_2_0_Wait_08063564
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08063560
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08063560:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ColorMan_1_2_0_Wait_08063564:
    .word PTR_R_ColorMan_1_2_0_Wait_08063568

PTR_R_ColorMan_1_2_0_Wait_08063568:
    .word R_ColorMan_1_2_0_Wait
    .word R_ColorMan_1_2_1_Next


_ts R_ColorMan_1_2_0_Wait
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x30
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ColorMan_1_2_1_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063598
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063598:
    pop        {pc}


_nt R_ColorMan_1_3_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_080635c4
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_080635a8
    bl         SpritePtr_EnableFlash
LAB_080635a8:
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorMan_1_3_0_Flinch_080635b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ColorMan_1_3_0_Flinch_080635b4:
    .word PTR_R_ColorMan_1_3_0_Flinch_080635b8

PTR_R_ColorMan_1_3_0_Flinch_080635b8:
    .word R_ColorMan_1_3_0_Flinch
    .word R_ColorMan_1_3_1_Wait
    .word R_ColorMan_1_3_2_Reset

PTR_gFrameCounter_080635c4:
    .word gFrameCounter


_ts R_ColorMan_1_3_0_Flinch
    push       {lr}
    bl         R_ColorMan_DestroyOwnedAttacks
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0xd
    ldr        r1,[r5,#0x6c]
    bl         Field_SetPanelFlagsOnEntity
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


_nt R_ColorMan_1_3_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063608
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08063608:
    pop        {pc}


_nt R_ColorMan_1_3_2_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063626
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x5a
    mov        r3,#0x64
    strh       r0,[r5,r3]
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063626:
    pop        {pc}


_ts R_ColorMan_1_4_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorMan_1_4_0_StartMove_08063638
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ColorMan_1_4_0_StartMove_08063638:
    .word PTR_R_ColorMan_1_4_0_StartMove_0806363c

PTR_R_ColorMan_1_4_0_StartMove_0806363c:
    .word R_ColorMan_1_4_0_StartMove
    .word R_ColorMan_1_4_1_EndMove


_ts R_ColorMan_1_4_0_StartMove
    push       {lr}
    ldr        r0,[r5,#0x48]
    mov        r6,#0x2
LAB_0806364a:
    lsr        r1,r0,#0x1f
    lsl        r1,r1,#0x1
    neg        r1,r1
    add        r1,#0x1
    ldrb       r0,[r5,#0x19]
    add        r1,r1,r0
    ldrb       r0,[r5,#0x18]
    ldr        r7,[r5,#0x70]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    push       {r6}
    bl         Field_GetPanelFlags
    pop        {r6}
    ldr        r1,DAT_0806369c
    tst        r0,r1
    bne        LAB_08063678
    ldr        r1,DAT_08063698
    and        r0,r1
    cmp        r0,r1
    beq        LAB_08063688
LAB_08063678:
    ldr        r0,[r5,#0x48]
    neg        r0,r0
    str        r0,[r5,#0x48]
    sub        r6,#0x1
    bne        LAB_0806364a
    bl         R_ColorMan_Decide
    pop        {pc}
LAB_08063688:
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_08063698:
    .word 0x3

DAT_0806369c:
    .word 0xC20


_ts R_ColorMan_1_4_1_EndMove
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_080636be
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    ldr        r2,[r5,#0x48]
    add        r1,r1,r2
    str        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}
LAB_080636be:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    bl         R_ColorMan_Decide
    pop        {pc}


_nt R_ColorMan_1_5_Ball
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorMan_1_5_0_StartAnim_080636e4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ColorMan_1_5_0_StartAnim_080636e4:
    .word PTR_R_ColorMan_1_5_0_StartAnim_080636e8

PTR_R_ColorMan_1_5_0_StartAnim_080636e8:
    .word R_ColorMan_1_5_0_StartAnim
    .word R_ColorMan_1_5_1_Ball
    .word R_ColorMan_1_5_2_Reset
    .word R_ColorMan_1_5_3_Next


_ts R_ColorMan_1_5_0_StartAnim
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    mov        r0,#0x6
    bl         Battle_GetBattleFlagMulti
    mov        r1,#0x6
    cmp        r0,r1
    bne        LAB_08063714
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08063714:
    pop        {pc}


_nt R_ColorMan_1_5_1_Ball
    push       {lr}
    mov        r0,#0x3
    bl         Battle_SetBattleFlag
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08063748
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    mov        r4,#0x0
    ldr        r7,[r5,#0x68]
    mov        r6,#0x64
    mov        r0,#0x74
    add        r0,r0,r5
    bl         Attack_ColorManBall_Create
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08063748:
    pop        {pc}


_nt R_ColorMan_1_5_2_Reset
    push       {lr}
    ldr        r7,[r5,#0x74]
    tst        r7,r7
    bne        LAB_0806375a
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806375a:
    mov        r0,#0x0
    mov        r3,#0x60
    strb       r0,[r5,r3]
    pop        {pc}


_nt R_ColorMan_1_5_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08063778
    mov        r0,#0x0
    mov        r3,#0x60
    strb       r0,[r5,r3]
    bl         R_ColorMan_Decide
LAB_08063778:
    pop        {pc}


_nt R_ColorMan_1_6_Steal
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorMan_1_6_0_Steal_08063788
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ColorMan_1_6_0_Steal_08063788:
    .word PTR_R_ColorMan_1_6_0_Steal_0806378c

PTR_R_ColorMan_1_6_0_Steal_0806378c:
    .word R_ColorMan_1_6_0_Steal
    .word R_ColorMan_1_6_1_Next


_ts R_ColorMan_1_6_0_Steal
    push       {lr}
    mov        r0,#0x2
    mov        r1,#0x2
    ldrb       r2,[r5,#0x16]
    mov        r3,#0x1e
    bl         ScreenDim_Alloc
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    strb       r0,[r5,r3]
    mov        r3,#0x61
    mov        r1,#0x0
    strb       r1,[r5,r3]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ColorMan_1_6_1_Next
    push       {lr}
    bl         R_ColorMan_Decide
    pop        {pc}


_nt R_ColorMan_1_7_Reset
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ColorMan_1_7_0_StartMove_080637cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ColorMan_1_7_0_StartMove_080637cc:
    .word PTR_R_ColorMan_1_7_0_StartMove_080637d0

PTR_R_ColorMan_1_7_0_StartMove_080637d0:
    .word R_ColorMan_1_7_0_StartMove
    .word R_ColorMan_1_7_1_EndMove


_ts R_ColorMan_1_7_0_StartMove
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0xc0
    lsl        r2,r2,#0x8
    ldr        r0,[r5,#0x2c]
    sub        r0,r1,r0
    beq        LAB_0806380a
    bpl        LAB_080637f4
    neg        r2,r2
LAB_080637f4:
    str        r2,[r5,#0x48]
    add        r1,r2,#0x0
    bl         SWI_Div
    tst        r1,r1
    beq        LAB_08063802
    add        r0,#0x1
LAB_08063802:
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806380a:
    bl         R_ColorMan_Decide
    pop        {pc}


_ts R_ColorMan_1_7_1_EndMove
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806382a
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r1,[r5,#0x2c]
    bl         R_ColorMan_Decide
    pop        {pc}
LAB_0806382a:
    ldr        r0,[r5,#0x48]
    ldr        r1,[r5,#0x2c]
    add        r1,r1,r0
    str        r1,[r5,#0x2c]
    pop        {pc}


_ts R_ColorMan_2_Free
    push       {lr}
    mov        r0,#0x4
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_ColorMan_2_0_Delete_08063848
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ColorMan_2_0_Delete_08063848:
    .word PTR_R_ColorMan_2_0_Delete_0806384c

PTR_R_ColorMan_2_0_Delete_0806384c:
    .word R_ColorMan_2_0_Delete
    .word R_ColorMan_2_1_Free


_ts R_ColorMan_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    bl         R_ColorMan_DestroyOwnedAttacks
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
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


_ts R_ColorMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806389e
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806389e:
    pop        {pc}


_ts R_ColorMan_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08063958
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806392e
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806392e
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_08063958
    mov        r3,#0x64
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_080638e2
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_080638d4
    mov        r0,#0x9
    ldr        r1,[r5,#0x6c]
    bl         Field_SetPanelFlagsOnEntity
    b          LAB_08063958
LAB_080638d4:
    lsr        r0,r0,#0x1
    bcc        LAB_08063958
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_08063958
LAB_080638e2:
    mov        r0,#0xa
    ldr        r1,[r5,#0x6c]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08063958
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08063958
    mov        r3,#0x60
    ldrb       r1,[r5,r3]
    add        r1,r1,r0
    cmp        r1,#0xff
    ble        LAB_08063904
    mov        r1,#0xff
LAB_08063904:
    strb       r1,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    add        r1,r1,r0
    cmp        r1,#0xff
    ble        LAB_08063912
    mov        r1,#0xff
LAB_08063912:
    strb       r1,[r5,r3]
    bl         Field_SubtractHP
    cmp        r0,#0x64
    bcc        LAB_08063924
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063924:
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806394e
LAB_0806392e:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0xd
    ldr        r1,[r5,#0x6c]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0806394e:
    mov        r0,#0x6f
    bl         Sound_PlaySE
    mov        r0,#0x0
    pop        {pc}
LAB_08063958:
    mov        r0,#0x0
    pop        {pc}


_ts R_ColorMan_Decide
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_0806397a
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    cmp        r0,#0x64
    bcc        LAB_0806397a
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        pc,lr
LAB_0806397a:
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    ldrh       r1,[r5,#0x22]
    lsr        r1,r1,#0x2
    cmp        r0,r1
    bcc        LAB_08063994
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        pc,lr
LAB_08063994:
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        pc,lr


_nt R_ColorMan_CheckFrontColumn
    push       {lr}
    mov        r0,#0x4
    mov        r1,#0x3
LAB_080639a8:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_080639c0
    sub        r1,#0x1
    bne        LAB_080639a8
    mov        r3,#0x61
    strb       r1,[r5,r3]
LAB_080639c0:
    pop        {pc}


_nt R_ColorMan_DestroyOwnedAttacks
    ldr        r7,[r5,#0x74]
    tst        r7,r7
    beq        LAB_080639d0
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    str        r0,[r5,#0x74]
LAB_080639d0:
    mov        pc,lr

    .align 2, 0

