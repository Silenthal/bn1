#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Prog
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
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
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#Actor_family_family]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    FieldObject_Create PFI_Self_Actor, 0x60
    ldr        r7,[r5,#Actor_param_60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    FieldObject_CreateInitMoving 0x64, inherit_element=1
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldr        r7,PTR_DAT_08066228
    ldrb       r0,[r5,#Actor_family_family]
    add        r0,r0,r0
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    strb       r0,[r5,#Actor_bc]
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#Actor_be]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bd]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterB]
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
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
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_08066290
    bl         Battle_IsInputLocked
    bne        LAB_08066290
    bl         Routine_CheckPoisonDrain
    ldrb       r0,[r5,#Actor_owner]
    bl         Field_CheckInterrupt
    beq        LAB_0806625c
    mov        r0,#0x0
    str        r0,[r5,#Actor_bc]
LAB_0806625c:
    ldr        r6,[r5,#Actor_param_60]
    ldrh       r0,[r5,#Actor_cPos_x]
    ldr        r1,PanelFlag_080662f4
    ldrb       r2,[r5,#Actor_element]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#Actor_param_60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08066290
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08066290:
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    beq        LAB_080662c4
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_080662d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_080662b6
    mov        r0,#0x9
    b          LAB_080662b8
LAB_080662b6:
    mov        r0,#PFI_Moving
LAB_080662b8:
    ldr        r1,[r5,#Actor_param_60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_080662d6
LAB_080662c4:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_SetDeletedFlag
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
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0806631a
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0806631a:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08066330
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x6e
    strh       r0,[r5,#Actor_counterA]
LAB_08066330:
    pop        {pc}


_nt R_Prog_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Prog_1_2_0_0806635c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08066350
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
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
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    ldrb       r0,[r5,#Actor_family_family]
    ldr        r7,PTR_BYTE_ARRAY_08066378
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#Actor_counterA]
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
    ldrh       r0,[r5,#Actor_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterB]
    bne        LAB_08066390
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    b          LAB_0806641a
LAB_08066390:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806641a
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    push       {r0,r1}
    bl         R_Prog_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_080663bc
    mov        r2,#0x0
    strb       r2,[r5,#Actor_bd]
LAB_080663ae:
    strb       r0,[r5,#Actor_family_b2]
    strb       r1,[r5,#Actor_family_b3]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
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
    ldrb       r2,[r5,#Actor_bd]
    add        r2,#0x1
    strb       r2,[r5,#Actor_bd]
    b          LAB_080663ae
LAB_080663e6:
    LoadMain battle, r7, r7
    ldr        r7,[r7,#Battle_actorListPlayer]
    ldrb       r2,[r7,#0x18]
    sub        r0,#0x1
    cmp        r0,r2
    beq        LAB_08066416
    ldrb       r2,[r5,#Actor_bd]
    add        r2,#0x1
    strb       r2,[r5,#Actor_bd]
    ldrb       r3,[r5,#Actor_be]
    cmp        r2,r3
    blt        LAB_08066416
    ldrb       r0,[r5,#Actor_bc]
    tst        r0,r0
    beq        LAB_08066416
    sub        r0,#0x1
    strb       r0,[r5,#Actor_bc]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bd]
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08066416:
    mov        r0,#0x0
    strb       r0,[r5,#Actor_state_s2]
LAB_0806641a:
    pop        {pc}


_ts R_Prog_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s3]
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
    ldrb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r5,#Actor_family_b3]
    bl         R_Prog_IsPanelWalkable
    tst        r0,r0
    beq        LAB_0806646c
    ldrb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r5,#Actor_family_b3]
    ldr        r7,[r5,#Actor_param_64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x3
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    b          LAB_08066474
LAB_0806646c:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08066474:
    pop        {pc}


_nt R_Prog_1_3_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806649c
    ldrb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r5,#Actor_family_b3]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x3
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s3]
LAB_0806649c:
    pop        {pc}


_nt R_Prog_1_3_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_080664b6
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
LAB_080664b6:
    pop        {pc}


_ts R_Prog_1_4_Steal
    push       {lr}
    mov        r0,#0x2
    mov        r1,#0x2
    ldrb       r2,[r5,#Actor_owner]
    bl         ScreenDim_Alloc
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_Prog_1_5_RingZap
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
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
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
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
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r2,#0x1
    mov        r3,#0x5c
    add        r3,r3,r5
    mov        r6,#0x64
    bl         Attack_ProgThunder_Create
LAB_08066526:
    pop        {pc}


_ts R_Prog_1_5_2
    push       {lr}
    ldr        r0,[r5,#Actor_param_5C]
    tst        r0,r0
    bne        LAB_08066538
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
LAB_08066538:
    pop        {pc}


_nt R_Prog_1_5_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08066556
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterB]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_08066556:
    pop        {pc}


_ts R_Prog_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
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
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
    pop        {pc}


_ts R_Prog_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
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
    bl         FieldObject_GetPanelFlags
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

