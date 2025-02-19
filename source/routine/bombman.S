#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_BombMan
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_BombMan_0_Init_0806723c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BombMan_0_Init_0806723c:
    .word PTR_R_BombMan_0_Init_08067240

PTR_R_BombMan_0_Init_08067240:
    .word R_BombMan_0_Init
    .word R_BombMan_1_Main
    .word R_BombMan_2_Free


_ts R_BombMan_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x5b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    FieldObject_Create PFI_Self_Actor, 0x60
    FieldObject_Create PFI_Moving, 0x64
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_68]
    str        r0,[r5,#Actor_param_6C]
    str        r0,[r5,#Actor_param_70]
    mov        r6,#0x68
    add        r6,r6,r5
    ldr        r7,PTR_DAT_080672e0
    mov        r2,#0x1
LAB_080672aa:
    push       {r2,r6,r7}
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    add        r2,r6,#0x0
    mov        r6,#0x78
    mov        r4,#0x1
    bl         Attack_BombManBomb_Create
    pop        {r2,r6,r7}
    str        r0,[r6,#0x0]
    add        r6,#0x4
    add        r7,#0x2
    sub        r2,#0x1
    bgt        LAB_080672aa
    mov        r0,#0x0
    strb       r0,[r5,#Actor_be]
    strb       r0,[r5,#Actor_b1b]
    strb       r0,[r5,#Actor_bf]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}

DAT_080672d8:
    .byte 0x06

DAT_080672d9:
    .byte 0x02

DAT_080672da:
    .byte 0x05

DAT_080672db:
    .byte 0x03
    .byte 0x05
    .byte 0x01

    .align 2, 0


PTR_DAT_080672e0:
    .word DAT_080672d8


_ts R_BombMan_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r0,#0x0
    strb       r0,[r5,#Actor_b1b]
    ldr        r0,[r5,#Actor_param_60]
    mov        r1,#0x1
    lsl        r1,r1,#0x14
    bl         FieldObject_SetPanelFlag
    mov        r0,#0x3
    ldrb       r1,[r5,#Actor_be]
    tst        r1,r1
    beq        LAB_0806731c
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_0806730a
    mov        r0,#0x1
LAB_0806730a:
    sub        r1,#0x1
    strb       r1,[r5,#Actor_be]
    push       {r0}
    ldr        r0,[r5,#Actor_param_60]
    mov        r1,#0x1
    lsl        r1,r1,#0x14
    bl         FieldObject_ClearPanelFlag
    pop        {r0}
LAB_0806731c:
    strb       r0,[r5,#Actor_header_entityFlags]
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_08067374
    bl         Battle_IsInputLocked
    bne        LAB_08067374
    ldrb       r0,[r5,#Actor_be]
    tst        r0,r0
    bne        LAB_08067374
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#Actor_param_60]
    ldrh       r0,[r5,#Actor_cPos_x]
    ldr        r1,PanelFlag_080673cc
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
    beq        LAB_08067374
    cmp        r0,#0x64
    bmi        LAB_08067362
    mov        r1,#0x1
    strb       r0,[r5,#Actor_b1b]
LAB_08067362:
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08067374:
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    beq        LAB_08067396
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_080673ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_080673a8
LAB_08067396:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_SetDeletedFlag
LAB_080673a8:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_080673ac:
    .word PTR_R_Actor_1_0_Spawn_080673b0

PTR_R_Actor_1_0_Spawn_080673b0:
    .word R_Actor_1_0_Spawn
    .word R_BombMan_1_1_Wait
    .word R_BombMan_1_2_Decide
    .word R_BombMan_1_3_BombShoot
    .word R_BombMan_1_4_Move
    .word R_BombMan_1_5_BecomeInvulnerable
    .word R_BombMan_1_6_Mine

PanelFlag_080673cc:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_BombMan_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_080673ee
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_080673ee:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08067404
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
LAB_08067404:
    pop        {pc}


_nt R_BombMan_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BombMan_1_2_0_08067438
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_BombMan_BecomeInvulnerable
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08067428
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_08067428:
    pop        {pc}

    .align 2, 0


PTR_R_BombMan_1_2_0_0806742c:
    .word R_BombMan_1_2_0
    .word R_BombMan_1_2_1
    .word R_BombMan_1_2_2

PTR_PTR_R_BombMan_1_2_0_08067438:
    .word PTR_R_BombMan_1_2_0_0806742c


_ts R_BombMan_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_USHORT_08067458
    ldrb       r0,[r5,#Actor_family_family]
    add        r0,r0,r0
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#Actor_counterA]
    pop        {pc}

USHORT_08067452:
    .short 0x12C
    .short 0xF0
    .short 0xB4

PTR_USHORT_08067458:
    .word USHORT_08067452


_ts R_BombMan_1_2_1
    push       {lr}
    sub        sp,#0x14
    bl         R_BombMan_CheckBombCount
    tst        r0,r0
    bne        LAB_080674aa
    mov        r0,sp
    bl         R_BombMan_GetFreePanels
    tst        r1,r1
    beq        LAB_080674aa
    mov        r0,sp
    mov        r2,#0xa
    push       {r1}
    bl         ArrayShuffle
    pop        {r1}
    cmp        r1,#0x3
    ble        LAB_08067484
    mov        r1,#0x3
LAB_08067484:
    mov        r7,sp
    mov        r4,#0x68
    add        r4,r4,r5
    mov        r3,#0x0
LAB_0806748c:
    push       {r1,r3,r4,r7}
    ldrb       r0,[r7,r3]
    bl         Field_IndexToCellXY
    add        r2,r4,#0x0
    mov        r6,#0x8c
    mov        r4,#0x0
    bl         Attack_BombManBomb_Create
    pop        {r1,r3,r4,r7}
    str        r0,[r4,#0x0]
    add        r4,#0x4
    add        r3,#0x1
    cmp        r3,r1
    blt        LAB_0806748c
LAB_080674aa:
    ldrb       r0,[r5,#Actor_bf]
    tst        r0,r0
    bne        LAB_080674bc
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_080674f0
    mov        r0,#0x1
    strb       r0,[r5,#Actor_bf]
LAB_080674bc:
    ldrh       r0,[r5,#Actor_hpMax]
    lsr        r0,r0,#0x1
    ldrh       r1,[r5,#Actor_hpCurrent]
    cmp        r1,r0
    bge        LAB_080674dc
    bl         R_BombMan_FindFreeTargetPanel
    tst        r0,r0
    bne        LAB_080674dc
    mov        r0,#0x18
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bf]
    b          LAB_080674f0
LAB_080674dc:
    bl         R_BombMan_CheckBombCount
    tst        r0,r0
    bne        LAB_080674e8
    bl         R_BombMan_CreateBomb
LAB_080674e8:
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080674f0:
    add        sp,#0x14
    pop        {pc}


_ts R_BombMan_1_2_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08067518
    mov        r0,#0x1
    strb       r0,[r5,#Actor_bf]
    bl         R_BombMan_CheckBombCount
    tst        r0,r0
    bne        LAB_0806750e
    bl         R_BombMan_CreateBomb
LAB_0806750e:
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    b          LAB_08067518
LAB_08067518:
    pop        {pc}


_nt R_BombMan_1_3_BombShoot
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BombMan_1_3_0_08067540
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_BombMan_BecomeInvulnerable
    pop        {pc}

PTR_R_BombMan_1_3_0_0806752c:
    .word R_BombMan_1_3_0
    .word R_BombMan_1_3_1
    .word R_BombMan_1_3_2
    .word R_BombMan_1_3_3
    .word R_BombMan_1_3_4_BombShoot

PTR_PTR_R_BombMan_1_3_0_08067540:
    .word PTR_R_BombMan_1_3_0_0806752c


_ts R_BombMan_1_3_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bd]
    pop        {pc}


_ts R_BombMan_1_3_1
    push       {lr}
LAB_08067552:
    bl         R_BombMan_CheckBomb
    add        r6,r0,#0x0
    tst        r0,r0
    bne        LAB_08067588
    bl         R_BombMan_UpdateFreeCount
    tst        r0,r0
    bne        LAB_08067552
    bl         R_BombMan_GetRandomTargetPanel
    cmp        r0,#0xff
    bne        LAB_0806757a
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bf]
    b          LAB_080675a8
LAB_0806757a:
    strb       r0,[r5,#Actor_family_b2]
    strb       r1,[r5,#Actor_family_b3]
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    b          LAB_080675a8
LAB_08067588:
    ldr        r7,[r5,#Actor_param_64]
    ldrb       r0,[r6,#0x18]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r6,#0x19]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    strb       r1,[r5,#Actor_family_b3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_080675a8:
    pop        {pc}


_nt R_BombMan_1_3_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080675d0
    ldrb       r0,[r5,#Actor_family_b2]
    strb       r0,[r5,#Actor_cPos_x]
    ldrb       r0,[r5,#Actor_family_b3]
    strb       r0,[r5,#Actor_cPos_y]
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_080675d0:
    pop        {pc}


_nt R_BombMan_1_3_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080675e2
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_080675e2:
    pop        {pc}


_ts R_BombMan_1_3_4_BombShoot
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s3]
    ldr        r7,PTR_PTR_R_BombMan_1_3_4_0_08067604
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_BombMan_1_3_4_0_080675f4:
    .word R_BombMan_1_3_4_0
    .word R_BombMan_1_3_4_1
    .word R_BombMan_1_3_4_2
    .word R_BombMan_1_3_4_3

PTR_PTR_R_BombMan_1_3_4_0_08067604:
    .word PTR_R_BombMan_1_3_4_0_080675f4


_ts R_BombMan_1_3_4_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_counterA]
    pop        {pc}


_ts R_BombMan_1_3_4_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    add        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    cmp        r0,#0xf
    bne        LAB_08067646
    bl         R_BombMan_CheckBomb
    tst        r0,r0
    beq        LAB_08067642
    push       {r0}
    bl         R_BombMan_FindAvailablePanel
    cmp        r0,#0xff
    pop        {r7}
    beq        LAB_08067642
    bl         A_BombManBomb_Kick
    mov        r0,#0x8e
    bl         Sound_PlaySE
LAB_08067642:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s3]
LAB_08067646:
    pop        {pc}


_ts R_BombMan_1_3_4_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067660
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s3]
    mov        r0,#0x7
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x19
    strh       r0,[r5,#Actor_counterA]
LAB_08067660:
    pop        {pc}


_nt R_BombMan_1_3_4_3
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_080676ac
    bl         R_BombMan_UpdateFreeCount
    tst        r0,r0
    bne        LAB_080676a8
    bl         R_BombMan_GetRandomTargetPanel
    cmp        r0,#0xff
    bne        LAB_08067686
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    b          LAB_080676ac
LAB_08067686:
    strb       r0,[r5,#Actor_family_b2]
    strb       r1,[r5,#Actor_family_b3]
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    ldr        r7,[r5,#Actor_param_64]
    ldrb       r0,[r5,#Actor_family_b2]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    ldrb       r1,[r5,#Actor_family_b3]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    b          LAB_080676ac
LAB_080676a8:
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_080676ac:
    pop        {pc}


_nt R_BombMan_1_4_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BombMan_1_4_0_080676c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_BombMan_1_4_0_080676bc:
    .word R_BombMan_1_4_0
    .word R_BombMan_1_4_1
    .word R_BombMan_1_4_2

PTR_PTR_R_BombMan_1_4_0_080676c8:
    .word PTR_R_BombMan_1_4_0_080676bc


_ts R_BombMan_1_4_0
    push       {lr}
    ldr        r7,[r5,#Actor_param_64]
    ldrb       r0,[r5,#Actor_family_b2]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    ldrb       r1,[r5,#Actor_family_b3]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_BombMan_1_4_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067712
    ldrb       r0,[r5,#Actor_family_b2]
    strb       r0,[r5,#Actor_cPos_x]
    ldrb       r0,[r5,#Actor_family_b3]
    strb       r0,[r5,#Actor_cPos_y]
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_08067712:
    pop        {pc}


_ts R_BombMan_1_4_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806772c
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bf]
LAB_0806772c:
    pop        {pc}


_nt R_BombMan_1_5_BecomeInvulnerable
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BombMan_1_5_0_08067744
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_BombMan_1_5_0_0806773c:
    .word R_BombMan_1_5_0
    .word R_BombMan_1_5_1

PTR_PTR_R_BombMan_1_5_0_08067744:
    .word PTR_R_BombMan_1_5_0_0806773c


_ts R_BombMan_1_5_0
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x32
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_BombMan_1_5_1
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrh       r0,[r5,#Actor_counterA]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0806776e
    bl         SpritePtr_EnableFlash
LAB_0806776e:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08067786
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    mov        r0,#0x78
    strb       r0,[r5,#Actor_be]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
LAB_08067786:
    pop        {pc}


_ts R_BombMan_1_6_Mine
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_080677a0
    mov        r0,#0x15
    ldrb       r1,[r5,#Actor_family_family]
    ldrb       r2,[r5,#Actor_owner]
    bl         ScreenDim_Alloc
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    b          LAB_080677a8
LAB_080677a0:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_080677a8:
    pop        {pc}


_nt R_BombMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_BombMan_2_0_Delete_080677c0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_BombMan_2_0_Delete_080677b8:
    .word R_BombMan_2_0_Delete
    .word R_BombMan_2_1_Free

PTR_PTR_R_BombMan_2_0_Delete_080677c0:
    .word PTR_R_BombMan_2_0_Delete_080677b8


_ts R_BombMan_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#Actor_counterA]
    pop        {pc}


_ts R_BombMan_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08067802
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08067802:
    pop        {pc}


_ts R_BombMan_CheckBombCount
    mov        r7,#0x68
    add        r7,r7,r5
    mov        r3,#0x0
    mov        r4,#0x0
LAB_0806780c:
    ldr        r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_08067814
    add        r4,#0x1
LAB_08067814:
    add        r7,#0x4
    add        r3,#0x1
    cmp        r3,#0x3
    blt        LAB_0806780c
    add        r0,r4,#0x0
    mov        pc,lr


_ts R_BombMan_CheckBomb
    ldrb       r0,[r5,#Actor_bd]
    mov        r7,#0x68
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    ldr        r0,[r5,r7]
    mov        pc,lr


_ts R_BombMan_UpdateFreeCount
    mov        r0,#0x0
    ldrb       r1,[r5,#Actor_bd]
LAB_08067830:
    add        r1,#0x1
    cmp        r1,#0x3
    bge        LAB_08067846
    mov        r7,#0x68
    lsl        r2,r1,#0x2
    add        r7,r7,r2
    ldr        r2,[r5,r7]
    tst        r2,r2
    beq        LAB_08067830
    strb       r1,[r5,#Actor_bd]
    mov        r0,#0x1
LAB_08067846:
    mov        pc,lr


_ts R_BombMan_FindAvailablePanel
    push       {lr}
    sub        sp,#0x20
    mov        r0,sp
    mov        r1,#0x1
    ldr        r2,PanelFlag_08067884
    bl         Field_Search
    tst        r1,r1
    bne        LAB_0806786c
    mov        r0,sp
    mov        r1,#0x1
    ldr        r2,PanelFlag_08067888
    bl         Field_Search
    tst        r1,r1
    bne        LAB_0806786c
    mov        r0,#0xff
    b          LAB_08067880
LAB_0806786c:
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r7,sp
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
LAB_08067880:
    add        sp,#0x20
    pop        {pc}

PanelFlag_08067884:
    .word PF_EnemyTerritory | PF_Solid | PF_Sealed | PF_Trap

PanelFlag_08067888:
    .word PF_EnemyTerritory | PF_Sealed | PF_Trap


_ts R_BombMan_GetRandomTargetPanel
    push       {lr}
    sub        sp,#0x10
    mov        r0,#0x0
    mov        r1,#0x1
    mov        r7,sp
    bl         Field_FindWalkablePlayerPanelsRight
    mov        r0,#0xff
    tst        r1,r1
    beq        LAB_080678b4
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r7,sp
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
LAB_080678b4:
    add        sp,#0x10
    pop        {pc}


_ts R_BombMan_GetFreePanels
    push       {lr}
    sub        sp,#0x28
    str        r0,[sp,#0x24]
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,PanelFlag_08067914
    bl         Field_Search
    tst        r1,r1
    beq        LAB_08067910
    mov        r6,sp
    add        r6,#0x12
    mov        r7,sp
    add        r3,r1,#0x0
    mov        r4,#0x0
LAB_080678d6:
    ldrb       r0,[r7,#0x0]
    push       {r0,r1}
    bl         Field_IndexToCellXY
    cmp        r0,#0x6
    pop        {r0,r1}
    beq        LAB_080678e8
    strb       r0,[r6,r4]
    add        r4,#0x1
LAB_080678e8:
    add        r7,#0x1
    sub        r3,#0x1
    bgt        LAB_080678d6
    tst        r4,r4
    beq        LAB_08067902
    add        r2,r4,#0x0
    mov        r0,sp
    add        r0,#0x12
    mov        r1,sp
    push       {r2}
    bl         memcpy_8
    pop        {r1}
LAB_08067902:
    add        r2,r1,#0x0
    mov        r0,sp
    ldr        r1,[sp,#0x24]
    push       {r2}
    bl         memcpy_8
    pop        {r1}
LAB_08067910:
    add        sp,#0x28
    pop        {pc}

PanelFlag_08067914:
    .word PF_EnemyOccupied | PF_Solid | PF_Sealed | PF_Trap


_ts R_BombMan_CreateBomb
    push       {lr}
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r2,#0x68
    add        r2,r2,r5
    mov        r6,#0x8c
    mov        r4,#0x0
    bl         Attack_BombManBomb_Create
    str        r0,[r5,#Actor_param_68]
    pop        {pc}


_nt R_BombMan_BecomeInvulnerable
    ldrb       r0,[r5,#Actor_b1b]
    tst        r0,r0
    beq        LAB_0806793c
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806793c:
    mov        pc,lr


_nt R_BombMan_FindFreeTargetPanel
    push       {lr}
    mov        r1,#0x1
LAB_08067942:
    mov        r0,#0x1
LAB_08067944:
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x2
    tst        r2,r3
    bne        LAB_0806795c
    mov        r3,#0x4
    lsl        r3,r3,#0x18
    tst        r2,r3
    bne        LAB_0806796c
LAB_0806795c:
    add        r0,#0x1
    cmp        r0,#0x6
    ble        LAB_08067944
    add        r1,#0x1
    cmp        r1,#0x3
    ble        LAB_08067942
    mov        r0,#0x0
    b          LAB_0806796e
LAB_0806796c:
    mov        r0,#0x1
LAB_0806796e:
    pop        {pc}
