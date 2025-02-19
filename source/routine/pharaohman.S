#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_PharaohMan
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_PharaohMan_0_Init_0806adb8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_PharaohMan_0_Init_0806adb8:
    .word PTR_R_PharaohMan_0_Init_0806adbc

PTR_R_PharaohMan_0_Init_0806adbc:
    .word R_PharaohMan_0_Init
    .word R_PharaohMan_1_Main
    .word R_PharaohMan_2_Free


_ts R_PharaohMan_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x61
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_canBeDamaged]
    strb       r0,[r5,#Actor_b1b]
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    strb       r0,[r5,#Actor_be]
    strb       r0,[r5,#Actor_bf]
    str        r0,[r5,#Actor_param_68]
    str        r0,[r5,#Actor_param_6C]
    str        r0,[r5,#Actor_param_70]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_bc]
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x1
    ldr        r7,PTR_DAT_0806ae68
    ldrh       r0,[r7,r0]
    str        r0,[r5,#Actor_param_78]
    strh       r0,[r5,#Actor_counterB]
    ldrb       r2,[r5,#Actor_family_family]
    lsl        r2,r2,#0x2
    ldr        r7,PTR_INT_ARRAY_0806ae58
    ldr        r2,[r7,r2]
    str        r2,[r5,#Actor_diff_y]
    FieldObject_Create PFI_Self_Actor, 0x60
    FieldObject_Create PFI_Moving, 0x64
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x4
    mov        r1,#0x2
    mov        r2,#0x5c
    add        r2,r2,r5
    bl         Attack_Sarcophagus_Create
    bl         R_PharaohMan_1_Main
    pop        {pc}

DAT_0806ae52:
    .byte 0xE0
    .byte 0x01
    .byte 0x68
    .byte 0x01
    .byte 0xF0

    .align 2, 0


PTR_INT_ARRAY_0806ae58:
    .word INT_ARRAY_0806ae5c

INT_ARRAY_0806ae5c:
    .word 0x8000
    .word 0xA000
    .word 0xC000

PTR_DAT_0806ae68:
    .word DAT_0806ae52


_ts R_PharaohMan_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#Actor_owner]
    bl         Field_CheckInterrupt
    beq        LAB_0806ae84
    mov        r0,#0x0
    strb       r0,[r5,#Actor_b1b]
LAB_0806ae84:
    ldrb       r0,[r5,#Actor_canBeDamaged]
    tst        r0,r0
    beq        LAB_0806aeae
    bl         Battle_IsInputLocked
    bne        LAB_0806aeae
    bl         Routine_CheckPoisonDrain
    bl         R_PharaohMan_CheckDamage
    tst        r0,r0
    beq        LAB_0806aeae
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0806aeae:
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    beq        LAB_0806aee0
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806af00
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_MarkAsChecked
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_UpdateCellPosition
    mov        r0,#0x9
    ldr        r1,[r5,#Actor_param_60]
    ldrb       r2,[r5,#Actor_canBeDamaged]
    tst        r2,r2
    bne        LAB_0806aed6
    mov        r0,#PFI_Moving
LAB_0806aed6:
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#Actor_hpCurrent]
    tst        r0,r0
    bne        LAB_0806aef2
LAB_0806aee0:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_SetDeletedFlag
LAB_0806aef2:
    bl         R_PharaohMan_SetTrap
    tst        r0,r0
    bne        LAB_0806aefe
    bl         R_PharaohMan_Steal
LAB_0806aefe:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806af00:
    .word PTR_R_Actor_1_0_Spawn_0806af04

PTR_R_Actor_1_0_Spawn_0806af04:
    .word R_Actor_1_0_Spawn
    .word R_PharaohMan_1_1_WaitForBattleStart
    .word R_PharaohMan_1_2_Decide
    .word R_PharaohMan_1_3_Move


_ts R_PharaohMan_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    tst        r0,r0
    bne        LAB_0806af2a
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0806af2a:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806af3c
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806af3c:
    pop        {pc}


_nt R_PharaohMan_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_PharaohMan_1_2_0_0806af68
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806af5c
    mov        r1,#0x4
    strb       r1,[r5,#Actor_state_s1]
    mov        r1,#0x0
    strh       r1,[r5,#Actor_state_s2]
LAB_0806af5c:
    pop        {pc}

    .align 2, 0


PTR_R_PharaohMan_1_2_0_0806af60:
    .word R_PharaohMan_1_2_0
    .word R_PharaohMan_1_2_1

PTR_PTR_R_PharaohMan_1_2_0_0806af68:
    .word PTR_R_PharaohMan_1_2_0_0806af60


_ts R_PharaohMan_1_2_0
    push       {lr}
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_PharaohMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806af8a
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806af8a:
    pop        {pc}


_ts R_PharaohMan_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_PharaohMan_1_3_0_0806afa8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_PharaohMan_1_3_0_0806af9c:
    .word R_PharaohMan_1_3_0
    .word R_PharaohMan_1_3_1
    .word R_PharaohMan_1_3_2

PTR_PTR_R_PharaohMan_1_3_0_0806afa8:
    .word PTR_R_PharaohMan_1_3_0_0806af9c


_ts R_PharaohMan_1_3_0
    push       {lr}
    bl         R_PharaohMan_GetNextMovePanel
    cmp        r0,#0xff
    bne        LAB_0806afc6
    ldr        r0,[r5,#Actor_diff_y]
    neg        r0,r0
    str        r0,[r5,#Actor_diff_y]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
    b          LAB_0806afde
LAB_0806afc6:
    ldr        r7,[r5,#Actor_param_64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    strb       r0,[r5,#Actor_family_b2]
    strb       r1,[r5,#Actor_family_b3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0806afde:
    pop        {pc}


_ts R_PharaohMan_1_3_1
    push       {lr}
    ldrb       r0,[r5,#Actor_family_b2]
    ldrb       r1,[r5,#Actor_family_b3]
    bl         Battle_CellCoordsToSprite
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_diff_y]
    tst        r3,r3
    bmi        LAB_0806affa
    add        r2,r2,r3
    cmp        r2,r1
    bmi        LAB_0806b012
    b          LAB_0806b000
LAB_0806affa:
    add        r2,r2,r3
    cmp        r2,r1
    bgt        LAB_0806b012
LAB_0806b000:
    str        r2,[r5,#Actor_pos_curr_y]
    mov        r0,#0x5
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    ldr        r0,[r5,#Actor_param_64]
    bl         FieldObject_Disable
    b          LAB_0806b014
LAB_0806b012:
    str        r2,[r5,#Actor_pos_curr_y]
LAB_0806b014:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_nt R_PharaohMan_1_3_2
    push       {lr}
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    push       {r2}
    bl         Battle_CellCoordsToSprite
    pop        {r2}
    add        r1,r1,r2
    str        r1,[r5,#Actor_pos_curr_y]
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x0
    strb       r0,[r5,#Actor_state_s2]
    pop        {pc}


_nt R_PharaohMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_PharaohMan_2_0_Delete_0806b04c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_PharaohMan_2_0_Delete_0806b044:
    .word R_PharaohMan_2_0_Delete
    .word R_PharaohMan_2_1_Free

PTR_PTR_R_PharaohMan_2_0_Delete_0806b04c:
    .word PTR_R_PharaohMan_2_0_Delete_0806b044


_ts R_PharaohMan_2_0_Delete
    push       {lr}
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_68]
    str        r0,[r5,#Actor_param_6C]
    str        r0,[r5,#Actor_param_70]
    str        r0,[r5,#Actor_param_5C]
    str        r0,[r5,#Actor_param_74]
    ldr        r0,[r5,#Actor_param_60]
    bl         FieldObject_Free
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    pop        {pc}


_nt R_PharaohMan_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806b090
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806b090:
    pop        {pc}


_nt R_PharaohMan_CheckDamage
    push       {lr}
    ldr        r6,[r5,#Actor_param_60]
    ldrh       r0,[r6,#0x2]
    ldr        r1,DAT_0806b0b4
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
    pop        {pc}

DAT_0806b0b4:
    .word 0x28850


_ts R_PharaohMan_GetNextMovePanel
    push       {lr}
    sub        sp,#0x4
    mov        r2,#0x0
    str        r2,[sp,#0x0]
    ldr        r2,[r5,#Actor_diff_y]
    tst        r2,r2
    bgt        LAB_0806b0e0
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    sub        r1,#0x1
    push       {r0,r1}
    bl         R_PharaohMan_IsPanelAvailable
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0806b0fc
    mov        r0,#0xff
    b          LAB_0806b0fc
    .byte 0x01
    .byte 0x22
    .byte 0x00
    .byte 0x92
LAB_0806b0e0:
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    add        r1,#0x1
    push       {r0,r1}
    bl         R_PharaohMan_IsPanelAvailable
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0806b0fc
    mov        r0,#0xff
    b          LAB_0806b0fc
    .byte 0x01
    .byte 0x22
    .byte 0x00
    .byte 0x92
    .byte 0xE4
    .byte 0xE7
LAB_0806b0fc:
    add        sp,#0x4
    pop        {pc}


_ts R_PharaohMan_IsPanelAvailable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_0806b126
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_0806b126
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0806b126
    mov        r2,#0x1
LAB_0806b126:
    add        r0,r2,#0x0
    pop        {pc}


_nt R_PharaohMan_Steal
    push       {lr}
    ldrb       r0,[r5,#Actor_b1b]
    tst        r0,r0
    beq        LAB_0806b186
    ldrb       r0,[r5,#Actor_be]
    tst        r0,r0
    bne        LAB_0806b16c
    mov        r0,#0x0
    ldrh       r1,[r5,#Actor_bc]
    sub        r1,#0x1
    strh       r1,[r5,#Actor_bc]
    bgt        LAB_0806b186
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_bc]
    mov        r1,#0x1
LAB_0806b148:
    push       {r1}
    mov        r0,#0x4
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x2
    tst        r0,r1
    pop        {r1}
    beq        LAB_0806b162
    add        r1,#0x1
    cmp        r1,#0x3
    ble        LAB_0806b148
    mov        r0,#0x0
    b          LAB_0806b168
LAB_0806b162:
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_bc]
    mov        r0,#0x1
LAB_0806b168:
    strb       r0,[r5,#Actor_be]
    b          LAB_0806b186
LAB_0806b16c:
    ldrh       r1,[r5,#Actor_bc]
    sub        r1,#0x1
    strh       r1,[r5,#Actor_bc]
    bgt        LAB_0806b186
    mov        r0,#0x0
    strb       r0,[r5,#Actor_be]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_bc]
    mov        r0,#0x2
    mov        r1,#0x2
    ldrb       r2,[r5,#Actor_owner]
    bl         ScreenDim_Alloc
LAB_0806b186:
    pop        {pc}


_ts R_PharaohMan_SetTrap
    push       {lr}
    ldrb       r0,[r5,#Actor_bf]
    tst        r0,r0
    bne        LAB_0806b1c6
    ldrh       r1,[r5,#Actor_counterB]
    sub        r1,#0x1
    strh       r1,[r5,#Actor_counterB]
    bne        LAB_0806b1e6
    ldr        r0,[r5,#Actor_param_78]
    strh       r0,[r5,#Actor_counterB]
    mov        r0,#0x0
    ldr        r1,[r5,#Actor_param_68]
    orr        r0,r1
    ldr        r1,[r5,#Actor_param_6C]
    orr        r0,r1
    ldr        r1,[r5,#Actor_param_70]
    orr        r0,r1
    tst        r0,r0
    bne        LAB_0806b1e6
    add        r0,r5,#0x0
    bl         A_PharaohTrap_SearchForClearPanel
    tst        r1,r1
    beq        LAB_0806b1e6
    mov        r0,#0x1
    strb       r0,[r5,#Actor_bf]
    mov        r2,#0x74
    add        r2,r2,r5
    bl         Effect_PharaohManCurse_Create
    b          LAB_0806b1e6
LAB_0806b1c6:
    mov        r0,#0x0
    ldr        r7,[r5,#Actor_param_74]
    tst        r7,r7
    bne        LAB_0806b1e8
    mov        r0,#0x0
    strb       r0,[r5,#Actor_bf]
    mov        r0,#0x27
    mov        r1,#0x0
    ldrb       r2,[r5,#Actor_owner]
    bl         ScreenDim_Alloc
    LoadMain screenDim, r7, r7
    str        r5,[r7,#0x14]
    mov        r0,#0x1
    b          LAB_0806b1e8
LAB_0806b1e6:
    mov        r0,#0x0
LAB_0806b1e8:
    pop        {pc}

    .align 2, 0

