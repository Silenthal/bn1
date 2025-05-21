#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Gaia
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_Gaia_0_Init_0806c708
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Gaia_0_Init_0806c708:
    .word PTR_R_Gaia_0_Init_0806c70c

PTR_R_Gaia_0_Init_0806c70c:
    .word R_Gaia_0_Init
    .word R_Gaia_1_Main
    .word R_Gaia_2_Free


_ts R_Gaia_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x4d
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_canBeDamaged]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldr        r7,PTR_listGaiaDamage_0806c7a0
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x1
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#Actor_damage]
    FieldObject_Create PFI_Self_Actor, 0x68
    FieldObject_Create PFI_Moving, 0x6c
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    ldrb       r1,[r5,#Actor_cPos_x]
    ldrb       r2,[r5,#Actor_cPos_y]
    ldrb       r4,[r5,#Actor_family_family]
    bl         Effect_GaiaBase_Create
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         R_Gaia_1_Main
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_listGaiaDamage_0806c7a0:
    .word listGaiaDamage

listGaiaDamage:
    .short 0xC8
    .short 0x12C
    .short 0x190


_nt R_Gaia_1_Main
    push       {lr}
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_DisableIfDeleted
    bl         R_Gaia_CheckDamage
    tst        r0,r0
    bne        LAB_0806c7c4
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806c7d0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806c7c4:
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806c7d0:
    .word PTR_R_Actor_1_0_Spawn_0806c7d4

PTR_R_Actor_1_0_Spawn_0806c7d4:
    .word R_Actor_1_0_Spawn
    .word R_Gaia_1_1
    .word R_Gaia_1_2
    .word R_Gaia_1_3
    .word R_Gaia_1_4
    .word R_Gaia_1_5


_ts R_Gaia_1_1
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0806c806
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0806c806:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806c818
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806c818:
    pop        {pc}


_nt R_Gaia_1_2
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Gaia_1_2_0_0806c83c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806c838
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0806c838:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Gaia_1_2_0_0806c83c:
    .word PTR_R_Gaia_1_2_0_0806c840

PTR_R_Gaia_1_2_0_0806c840:
    .word R_Gaia_1_2_0
    .word R_Gaia_1_2_1


_ts R_Gaia_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_family_b3]
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#Actor_family_family]
    ldr        r7,PTR_DAT_0806c868
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

    .align 2, 0


PTR_DAT_0806c868:
    .word DAT_0806c86c

DAT_0806c86c:
    .byte 0x78
    .byte 0x5A
    .byte 0x3C


_ts R_Gaia_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806c87e
    bl         R_Gaia_Decide
LAB_0806c87e:
    pop        {pc}


_ts R_Gaia_1_3
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Gaia_1_3_0_0806c890
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Gaia_1_3_0_0806c890:
    .word PTR_R_Gaia_1_3_0_0806c894

PTR_R_Gaia_1_3_0_0806c894:
    .word R_Gaia_1_3_0
    .word R_Gaia_1_3_1


_ts R_Gaia_1_3_0
    push       {lr}
    mov        r0,#0x0
    push       {r7}
    bl         FieldObject_UpdateField
    pop        {r7}
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    push       {r0,r1}
    bl         R_Gaia_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_0806c8d4
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#Actor_param_6C]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0806c8d4:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_Gaia_1_3_1
    push       {lr}
    bl         R_Gaia_Move
    ldrb       r0,[r5,#Actor_state_s3]
    tst        r0,r0
    bne        LAB_0806c8f8
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806c8f8:
    pop        {pc}


_nt R_Gaia_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s3]
    ldr        r7,PTR_PTR_R_Gaia_Move_0_0806c908
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Gaia_Move_0_0806c908:
    .word PTR_R_Gaia_Move_0_0806c90c

PTR_R_Gaia_Move_0_0806c90c:
    .word R_Gaia_Move_0
    .word R_Gaia_Move_1
    .word R_Gaia_Move_2


_ts R_Gaia_Move_0
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x2
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    pop        {pc}


_nt R_Gaia_Move_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806c976
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x2
    strh       r0,[r5,#Actor_counterA]
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s3]
LAB_0806c976:
    pop        {pc}


_ts R_Gaia_Move_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806c986
    mov        r0,#0x0
    strb       r0,[r5,#Actor_state_s3]
LAB_0806c986:
    pop        {pc}


_ts R_Gaia_1_4
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Gaia_1_4_0_0806c998
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Gaia_1_4_0_0806c998:
    .word PTR_R_Gaia_1_4_0_0806c99c

PTR_R_Gaia_1_4_0_0806c99c:
    .word R_Gaia_1_4_0
    .word R_Gaia_1_4_1
    .word R_Gaia_1_4_2
    .word R_Gaia_1_4_3
    .word R_Gaia_1_4_4
    .word R_Gaia_1_4_5


_ts R_Gaia_1_4_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Gaia_1_4_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806c9d8
    mov        r0,#0x1
    strb       r0,[r5,#Actor_family_b3]
    mov        r0,#0x28
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
LAB_0806c9d8:
    pop        {pc}


_nt R_Gaia_1_4_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806c9ec
    mov        r0,#0x4
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_0806c9ec:
    pop        {pc}


_nt R_Gaia_1_4_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0806ca66
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    push       {r0}
    bl         FieldObject_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0}
    mov        r1,#0x1
    tst        r2,r1
    beq        LAB_0806ca8a
    ldr        r1,PanelFlag_0806ca90
    tst        r2,r1
    bne        LAB_0806ca68
    add        r1,r0,#0x0
    mov        r2,#0x3
    ldrb       r4,[r5,#Actor_family_family]
    ldrh       r6,[r5,#Actor_damage]
LAB_0806ca2c:
    push       {r1,r2,r4,r6}
    bl         Attack_GaiaExplosion_Create
    pop        {r1,r2,r4,r6}
    sub        r2,#0x1
    bne        LAB_0806ca2c
    mov        r0,#0x2
    mov        r1,#0x3c
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x7e
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,DAT_0806ca8c
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
LAB_0806ca66:
    pop        {pc}
LAB_0806ca68:
    mov        r0,#0x7e
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,DAT_0806ca8c
    ldrh       r6,[r5,#Actor_damage]
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
LAB_0806ca8a:
    pop        {pc}

DAT_0806ca8c:
    strike_attribute PFI_Target_BreakingBlock, effect_target=0, effect_type=QE_SwordStrike

PanelFlag_0806ca90:
    .word PF_PlayerOccupied | PF_Solid


_ts R_Gaia_1_4_4
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806caaa
    mov        r0,#0x5
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x78
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s2]
LAB_0806caaa:
    pop        {pc}


_ts R_Gaia_1_4_5
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806cabe
    mov        r0,#0x14
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806cabe:
    pop        {pc}


_ts R_Gaia_1_5
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_Gaia_1_5_0_0806cad0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Gaia_1_5_0_0806cad0:
    .word PTR_R_Gaia_1_5_0_0806cad4

PTR_R_Gaia_1_5_0_0806cad4:
    .word R_Gaia_1_5_0
    .word R_Gaia_1_5_1
    .word R_Gaia_1_5_2


_ts R_Gaia_1_5_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_Gaia_1_5_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806cb38
    mov        r0,#0x0
    strb       r0,[r5,#Actor_family_b3]
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r0,[r5,#Actor_initial_x]
    ldr        r1,[r5,#Actor_initial_y]
    bl         Battle_SpriteCoordsToCell
    ldrb       r2,[r5,#Actor_cPos_x]
    ldrb       r3,[r5,#Actor_cPos_y]
    cmp        r0,r2
    bne        LAB_0806cb20
    cmp        r1,r3
    bne        LAB_0806cb20
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0806cb20:
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#Actor_param_6C]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0806cb38:
    pop        {pc}


_nt R_Gaia_1_5_2
    push       {lr}
    bl         R_Gaia_Move
    ldrb       r0,[r5,#Actor_state_s3]
    tst        r0,r0
    bne        LAB_0806cb38
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Disable
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_Gaia_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Gaia_2_0_0806cb64
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Gaia_2_0_0806cb64:
    .word PTR_R_Gaia_2_0_0806cb68

PTR_R_Gaia_2_0_0806cb68:
    .word R_Gaia_2_0
    .word R_Gaia_2_1


_ts R_Gaia_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Disable
    mov        r0,#0x0
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


_ts R_Gaia_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806cbb2
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_Free
    ldr        r0,[r5,#Actor_param_6C]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806cbb2:
    pop        {pc}


_ts R_Gaia_Decide
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_cPos_x]
    sub        r0,#0x1
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldr        r1,PanelFlag_0806cc00
    tst        r0,r1
    bne        LAB_0806cbe8
    mov        r1,#0x20
    tst        r0,r1
    bne        LAB_0806cbf2
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0806cbe8
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806cbe8
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0806cbe8:
    mov        r0,#0x10
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
LAB_0806cbf2:
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}
    .byte 0x02

    .align 2, 0


PanelFlag_0806cc00:
    .word PF_PlayerOccupied | PF_Solid


_ts R_Gaia_IsPanelWalkable
    push       {lr}
    bl         FieldObject_GetPanelFlags
    ldr        r1,PanelFlag_0806cc24
    tst        r0,r1
    bne        LAB_0806cc1c
    ldr        r1,PanelFlag_0806cc20
    and        r0,r1
    cmp        r0,r1
    bne        LAB_0806cc1c
    mov        r0,#0x1
    pop        {pc}
LAB_0806cc1c:
    mov        r0,#0x0
    pop        {pc}

PanelFlag_0806cc20:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_0806cc24:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_Gaia_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0806cc86
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    ble        LAB_0806cc68
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806cc68
    FieldObject_GetDamage PFI_Target_Object, 0x68
    tst        r0,r0
    beq        LAB_0806cc86
    ldrb       r0,[r5,#Actor_element]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0806cc86
    ldrb       r1,[r5,#Actor_family_b3]
    tst        r1,r1
    bne        LAB_0806cc5c
    mov        r0,#0x1
LAB_0806cc5c:
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0806cc80
    bl         SpritePtr_EnableFlash
LAB_0806cc68:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#Actor_param_68]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_0806cc80:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0806cc86:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

