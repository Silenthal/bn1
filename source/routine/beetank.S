#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_0805b468:
    .byte 0x08
    .byte 0x07
    .byte 0x04
    .byte 0x02
    .byte 0x01
    .byte 0x00

DAT_0805b46e:
    .byte 0x08
    .byte 0x08
    .byte 0x07
    .byte 0x04
    .byte 0x02
    .byte 0x01


_ts Routine_Beetank
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    bl         SpritePtr_DisableFlash
    ldr        r7,PTR_PTR_R_Beetank_0_Init_0805b490
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Beetank_0_Init_0805b490:
    .word PTR_R_Beetank_0_Init_0805b494

PTR_R_Beetank_0_Init_0805b494:
    .word R_Beetank_0_Init
    .word R_Beetank_1_Main
    .word R_Beetank_2_Free


_ts R_Beetank_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x1f
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
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    mov        r0,#0x5
    mov        r3,#0x60
    strb       r0,[r5,r3]
    bl         Rng_RandomUint
    ldr        r1,DAT_0805b52c
    lsr        r0,r0,#0x1
    bcc        LAB_0805b4ec
    neg        r1,r1
LAB_0805b4ec:
    str        r1,[r5,#Actor_diff_y]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x19
    strh       r0,[r5,#Actor_damage]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_element]
    FieldObject_Create PFI_Self_Actor, 0x64, offset_reg=3
    FieldObject_Create PFI_Moving, 0x68, offset_reg=3
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_Beetank_1_Main
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

DAT_0805b52c:
    .word 0xC000


_ts R_Beetank_1_Main
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
    bne        LAB_0805b55c
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_SetDeletedFlag
    b          LAB_0805b5b0
LAB_0805b55c:
    bl         Battle_IsInputLocked
    bne        LAB_0805b5b0
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_0805b594
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0805b594
    FieldObject_GetDamage PFI_Target_Object, 0x64
    tst        r0,r0
    beq        LAB_0805b5b0
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0805b5b0
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_0805b5aa
LAB_0805b594:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    pop        {pc}
LAB_0805b5aa:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0805b5b0:
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0805b5d0
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0805b5d0:
    .word PTR_R_Actor_1_0_Spawn_0805b5d4

PTR_R_Actor_1_0_Spawn_0805b5d4:
    .word R_Actor_1_0_Spawn
    .word R_Beetank_1_1_WaitForBattleStart
    .word R_Beetank_1_2
    .word R_Beetank_1_3
    .word R_Beetank_1_4


_ts R_Beetank_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0805b602
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0805b602:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805b614
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805b614:
    pop        {pc}


_nt R_Beetank_1_2
    push       {lr}
    ldr        r7,PTR_PTR_R_Beetank_1_2_0_0805b638
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805b634
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0805b634:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Beetank_1_2_0_0805b638:
    .word PTR_R_Beetank_1_2_0_0805b63c

PTR_R_Beetank_1_2_0_0805b63c:
    .word R_Beetank_1_2_0
    .word R_Beetank_1_2_1


_ts R_Beetank_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x64
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Beetank_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805b666
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805b666:
    pop        {pc}


_ts R_Beetank_1_3
    push       {lr}
    ldr        r7,PTR_PTR_R_Beetank_1_3_0_0805b680
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Beetank_1_3_0_0805b678:
    .word R_Beetank_1_3_0
    .word R_Beetank_1_3_1

PTR_PTR_R_Beetank_1_3_0_0805b680:
    .word PTR_R_Beetank_1_3_0_0805b678


_ts R_Beetank_1_3_0
    push       {lr}
    ldr        r0,[r5,#Actor_diff_y]
    lsr        r1,r0,#0x1f
    ldr        r0,PTR_DAT_0805b728
    ldrsb      r1,[r0,r1]
    ldrb       r0,[r5,#Actor_cPos_x]
    mov        r3,#0x61
    strb       r0,[r5,r3]
    ldrb       r2,[r5,#Actor_cPos_y]
    add        r1,r1,r2
    mov        r3,#0x62
    strb       r1,[r5,r3]
    bl         FieldObject_GetPanelFlags
    ldr        r1,DAT_0805b724
    tst        r0,r1
    bne        LAB_0805b6b0
    ldr        r1,DAT_0805b720
    and        r0,r1
    cmp        r0,r1
    bne        LAB_0805b6b0
    b          LAB_0805b6dc
LAB_0805b6b0:
    ldr        r0,[r5,#Actor_diff_y]
    neg        r0,r0
    lsr        r1,r0,#0x1f
    ldr        r0,PTR_DAT_0805b728
    ldrsb      r1,[r0,r1]
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r2,[r5,#Actor_cPos_y]
    add        r1,r1,r2
    mov        r3,#0x62
    strb       r1,[r5,r3]
    bl         FieldObject_GetPanelFlags
    ldr        r1,DAT_0805b724
    tst        r0,r1
    bne        LAB_0805b702
    ldr        r1,DAT_0805b720
    and        r0,r1
    cmp        r0,r1
    bne        LAB_0805b702
    ldr        r0,[r5,#Actor_diff_y]
    neg        r0,r0
    str        r0,[r5,#Actor_diff_y]
LAB_0805b6dc:
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x20
    strh       r0,[r5,#Actor_counterA]
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Enable
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    mov        r3,#0x62
    ldrb       r1,[r5,r3]
    ldr        r7,[r5,#Actor_param_68]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0805b702:
    bl         FUN_0805b856
    tst        r0,r0
    bne        LAB_0805b714
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0805b714:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

    .align 2, 0


DAT_0805b720:
    .word 0x3

DAT_0805b724:
    .word 0xC20

PTR_DAT_0805b728:
    .word DAT_0805b72c

DAT_0805b72c:
    .byte 0x01
    .byte -1

    .align 2, 0



_ts R_Beetank_1_3_1
    push       {lr}
    ldr        r0,[r5,#Actor_pos_curr_y]
    ldr        r1,[r5,#Actor_diff_y]
    add        r0,r0,r1
    str        r0,[r5,#Actor_pos_curr_y]
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805b768
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Disable
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    strb       r0,[r5,#Actor_cPos_x]
    mov        r3,#0x62
    ldrb       r1,[r5,r3]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    bl         FUN_0805b856
    tst        r0,r0
    bne        LAB_0805b76a
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805b768:
    pop        {pc}
LAB_0805b76a:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Beetank_1_4
    push       {lr}
    ldr        r7,PTR_PTR_R_Beetank_1_4_0_0805b790
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Beetank_1_4_0_0805b784:
    .word R_Beetank_1_4_0
    .word R_Beetank_1_4_1
    .word R_Beetank_1_4_2

PTR_PTR_R_Beetank_1_4_0_0805b790:
    .word PTR_R_Beetank_1_4_0_0805b784


_ts R_Beetank_1_4_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xa
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Beetank_1_4_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805b7de
    mov        r0,#0x0
    bl         Field_GetActorById
    ldrh       r0,[r7,#0x18]
    lsl        r0,r0,#0x10
    ldrb       r4,[r5,#Actor_family_family]
    add        r4,#0x4
    orr        r4,r0
    mov        r7,#0x28
    add        r7,r5,r7
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    sub        r1,r1,r0
    mov        r3,#0x20
    lsl        r3,r3,#0x10
    mov        r0,#0x0
    ldr        r7,PTR_DAT_0805b7e0
    ldrb       r6,[r5,#Actor_family_family]
    ldrb       r6,[r7,r6]
    bl         Attack_IceManBeetankBomb_Create
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805b7de:
    pop        {pc}

PTR_DAT_0805b7e0:
    .word DAT_0805b7e4

DAT_0805b7e4:
    .byte 0x0F
    .byte 0x50
    .byte 0x8C

    .align 2, 0



_ts R_Beetank_1_4_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805b7fc
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805b7fc:
    pop        {pc}


_nt R_Beetank_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Beetank_2_0_Destroy_0805b80c
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Beetank_2_0_Destroy_0805b80c:
    .word PTR_R_Beetank_2_0_Destroy_0805b810

PTR_R_Beetank_2_0_Destroy_0805b810:
    .word R_Beetank_2_0_Destroy
    .word R_Beetank_2_1_Free


_ts R_Beetank_2_0_Destroy
    push       {lr}
    bl         Battle_RegisterVirusDelete
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


_nt R_Beetank_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805b854
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805b854:
    pop        {pc}


_nt FUN_0805b856
    push       {lr}
    ldrb       r0,[r5,#Actor_cPos_x]
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x18]
    cmp        r1,r0
    bpl        LAB_0805b890
    bl         Rng_RandomUint
    mov        r1,#0x7
    and        r0,r1
    ldrb       r4,[r5,#Actor_family_family]
    lsl        r4,r4,#0x2
    ldr        r7,PTR_PTR_DAT_0805b898
    ldr        r7,[r7,r4]
    mov        r3,#0x60
    ldrb       r2,[r5,r3]
    ldrb       r1,[r7,r2]
    cmp        r0,r1
    bmi        LAB_0805b888
    sub        r2,#0x1
    strb       r2,[r5,r3]
    mov        r0,#0x0
    pop        {pc}
LAB_0805b888:
    mov        r2,#0x5
    strb       r2,[r5,r3]
    mov        r0,#0x1
    pop        {pc}
LAB_0805b890:
    mov        r2,#0x5
    strb       r2,[r5,r3]
    mov        r0,#0x0
    pop        {pc}

PTR_PTR_DAT_0805b898:
    .word PTR_DAT_0805b89c

PTR_DAT_0805b89c:
    .word DAT_0805b468
    .word DAT_0805b46e
    .word DAT_0805b46e
