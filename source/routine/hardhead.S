#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listHardHeadAttackDelay:
    .byte 0xF0
    .byte 0xB4
    .byte 0x5A


_ts Routine_HardHead
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    bl         SpritePtr_DisableFlash
    ldr        r7,PTR_PTR_R_HardHead_0_Init_0805c7c4
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_HardHead_0_Init_0805c7c4:
    .word PTR_R_HardHead_0_Init_0805c7c8

PTR_R_HardHead_0_Init_0805c7c8:
    .word R_HardHead_0_Init
    .word R_HardHead_1_Main
    .word R_HardHead_2_Free


_ts R_HardHead_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x25
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_family_family]
    bl         SpritePtr_SetPaletteIndex
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_damage]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_element]
    FieldObject_Create PFI_Self_Actor_Armored, 0x64, offset_reg=3
    mov        r0,#0x1
    strb       r0,[r5,#Actor_family_b1]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_HardHead_1_Main
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts R_HardHead_1_Main
    push       {lr}
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0805c86a
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    pop        {pc}
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_SetDeletedFlag
    b          LAB_0805c8d0
LAB_0805c86a:
    bl         Battle_IsInputLocked
    bne        LAB_0805c8d0
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_0805c8b0
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0805c8b0
    FieldObject_GetDamage PFI_Target_Object, 0x64
    tst        r0,r0
    beq        LAB_0805c8d0
    mov        r1,#0x40
    lsl        r1,r1,#0x8
    tst        r0,r1
    bne        LAB_0805c8b0
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0805c8d0
    ldrb       r1,[r5,#Actor_family_b1]
    tst        r1,r1
    bne        LAB_0805c8d0
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_0805c8ca
LAB_0805c8b0:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x0
    strh       r0,[r5,#Actor_hpCurrent]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    pop        {pc}
LAB_0805c8ca:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0805c8d0:
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0805c8e0
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0805c8e0:
    .word PTR_R_Actor_1_0_Spawn_0805c8e4

PTR_R_Actor_1_0_Spawn_0805c8e4:
    .word R_Actor_1_0_Spawn
    .word R_HardHead_1_1_WaitUntilBattleStart
    .word R_HardHead_1_2_Wait
    .word R_HardHead_1_3_Attack


_ts R_HardHead_1_1_WaitUntilBattleStart
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0805c90e
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c90e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805c920
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c920:
    pop        {pc}


_nt R_HardHead_1_2_Wait
    push       {lr}
    ldr        r7,PTR_PTR_R_HardHead_1_2_0_SetDelay_0805c944
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805c940
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0805c940:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_HardHead_1_2_0_SetDelay_0805c944:
    .word PTR_R_HardHead_1_2_0_SetDelay_0805c948

PTR_R_HardHead_1_2_0_SetDelay_0805c948:
    .word R_HardHead_1_2_0_SetDelay
    .word R_HardHead_1_2_1_Next


_ts R_HardHead_1_2_0_SetDelay
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    ldr        r7,PTR_listHardHeadAttackDelay_0805c964
    ldrb       r0,[r5,#Actor_family_family]
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

PTR_listHardHeadAttackDelay_0805c964:
    .word listHardHeadAttackDelay


_ts R_HardHead_1_2_1_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805c97a
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c97a:
    pop        {pc}


_ts R_HardHead_1_3_Attack
    push       {lr}
    ldr        r7,PTR_PTR_R_HardHead_1_3_0_PrepareOpen_0805c98c
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_HardHead_1_3_0_PrepareOpen_0805c98c:
    .word PTR_R_HardHead_1_3_0_PrepareOpen_0805c990

PTR_R_HardHead_1_3_0_PrepareOpen_0805c990:
    .word R_HardHead_1_3_0_PrepareOpen
    .word R_HardHead_1_3_1_Open
    .word R_HardHead_1_3_2_Wait
    .word R_HardHead_1_3_3_Fire
    .word R_HardHead_1_3_4_Recover
    .word R_HardHead_1_3_5_Close
    .word R_HardHead_1_3_6_Next


_ts R_HardHead_1_3_0_PrepareOpen
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x5
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_HardHead_1_3_1_Open
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805c9da
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_family_b1]
    FieldObject_SetAttributeGroup PFI_Self_Actor, 0x64
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c9da:
    pop        {pc}


_ts R_HardHead_1_3_2_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805c9f0
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0805c9f0:
    pop        {pc}


_nt R_HardHead_1_3_3_Fire
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805ca2c
    LoadMain battle, r7, r7
    ldr        r7,[r7,#Battle_actorListPlayer]
    ldrb       r0,[r7,#0x18]
    lsl        r0,r0,#0x10
    ldrb       r4,[r7,#0x19]
    lsl        r4,r4,#0x18
    orr        r4,r0
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r6,#0x10
    lsl        r6,r6,#0x10
    sub        r1,r1,r6
    add        r3,r3,r6
    mov        r6,#0x1e
    bl         Attack_Howitzer_Create
    mov        r0,#0x74
    bl         Sound_PlaySE
    mov        r0,#0x10
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ca2c:
    pop        {pc}


_nt R_HardHead_1_3_4_Recover
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805ca42
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x14
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ca42:
    pop        {pc}


_ts R_HardHead_1_3_5_Close
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805ca56
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x18
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ca56:
    pop        {pc}


_ts R_HardHead_1_3_6_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805ca78
    mov        r0,#0x1
    strb       r0,[r5,#Actor_family_b1]
    FieldObject_SetAttributeGroup PFI_Self_Actor_Armored, 0x64
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805ca78:
    pop        {pc}


_nt R_HardHead_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_HardHead_2_0_Delete_0805ca88
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_HardHead_2_0_Delete_0805ca88:
    .word PTR_R_HardHead_2_0_Delete_0805ca8c

PTR_R_HardHead_2_0_Delete_0805ca8c:
    .word R_HardHead_2_0_Delete
    .word R_HardHead_2_1_Free


_ts R_HardHead_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    pop        {pc}


_ts R_HardHead_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805cad0
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805cad0:
    pop        {pc}

    .align 2, 0

