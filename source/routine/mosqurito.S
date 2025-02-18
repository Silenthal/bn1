#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


MosquritoParam_ARRAY_08068d2c:
    .byte 0x0D, 0x00, 0x32, 0x00, 0x00, 0x00, 0x03, 0x00
    .byte 0x08, 0x00, 0x64, 0x00, 0x00, 0x00, 0x05, 0x00
    .byte 0x28, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x01, 0x00


_ts Routine_Mosqurito
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Mosqurito_0_Init_08068d5c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mosqurito_0_Init_08068d5c:
    .word PTR_R_Mosqurito_0_Init_08068d60

PTR_R_Mosqurito_0_Init_08068d60:
    .word R_Mosqurito_0_Init
    .word R_Mosqurito_1_Main
    .word R_Mosqurito_2_Free


_ts R_Mosqurito_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x69
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r2,#0x0
    str        r2,[r5,#0x30]
    mov        r7,#0x50
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r3,#0x60
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x3
    ldr        r7,PTR_MosquritoParam_ARRAY_08068e00
    add        r7,r7,r0
    str        r7,[r5,#0x68]
    ldrb       r0,[r7,#0x2]
    strh       r0,[r5,#0x24]
    ldr        r0,[r7,#0x4]
    neg        r0,r0
    str        r0,[r5,#0x44]
    FieldObject_Create PFI_Self_Actor_Drain, 0x6c
    FieldObject_Create PFI_Moving, 0x70
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_Mosqurito_1_Main
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_MosquritoParam_ARRAY_08068e00:
    .word MosquritoParam_ARRAY_08068d2c


_ts R_Mosqurito_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_DisableIfDeleted
    ldr        r7,[r5,#0x6c]
    ldr        r0,[r7,#0x10]
    bl         FieldObject_UpdateField
    bl         R_Mosqurito_CheckDamage
    tst        r0,r0
    bne        LAB_08068e2a
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Drone_1_0_Spawn_08068e38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08068e2a:
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Drone_1_0_Spawn_08068e38:
    .word PTR_R_Drone_1_0_Spawn_08068e3c

PTR_R_Drone_1_0_Spawn_08068e3c:
    .word R_Drone_1_0_Spawn
    .word R_Mosqurito_1_1_WaitForBattleStart
    .word R_Mosqurito_1_2_SetSpeedY
    .word R_Mosqurito_1_3_MoveY
    .word R_Mosqurito_1_4_ChargeForward
    .word R_Mosqurito_1_5_Drain


_ts R_Mosqurito_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08068e6e
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08068e6e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08068e80
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08068e80:
    pop        {pc}


_nt R_Mosqurito_1_2_SetSpeedY
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mosqurito_1_2_0_Wait_08068ea4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08068ea0
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08068ea0:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mosqurito_1_2_0_Wait_08068ea4:
    .word PTR_R_Mosqurito_1_2_0_Wait_08068ea8

PTR_R_Mosqurito_1_2_0_Wait_08068ea8:
    .word R_Mosqurito_1_2_0_Wait
    .word R_Mosqurito_1_2_1_SetSpeedY


_ts R_Mosqurito_1_2_0_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Mosqurito_1_2_1_SetSpeedY
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068ee8
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1f
    lsl        r0,r0,#0x1
    sub        r0,#0x1
    ldr        r1,DAT_08068eec
    mul        r0,r1
    str        r0,[r5,#0x48]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08068ee8:
    pop        {pc}

    .align 2, 0


DAT_08068eec:
    .word 0xCCCC


_ts R_Mosqurito_1_3_MoveY
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mosqurito_1_3_0_CheckY_08068f00
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mosqurito_1_3_0_CheckY_08068f00:
    .word PTR_R_Mosqurito_1_3_0_CheckY_08068f04

PTR_R_Mosqurito_1_3_0_CheckY_08068f04:
    .word R_Mosqurito_1_3_0_CheckY
    .word R_Mosqurito_1_3_1_MoveY


_ts R_Mosqurito_1_3_0_CheckY
    push       {lr}
    ldr        r0,[r5,#0x48]
    mov        r6,#0x2
LAB_08068f12:
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
    bl         FieldObject_GetPanelFlags
    pop        {r6}
    ldr        r1,DAT_08068f64
    tst        r0,r1
    bne        LAB_08068f40
    ldr        r1,DAT_08068f60
    and        r0,r1
    cmp        r0,r1
    beq        LAB_08068f50
LAB_08068f40:
    ldr        r0,[r5,#0x48]
    neg        r0,r0
    str        r0,[r5,#0x48]
    sub        r6,#0x1
    bne        LAB_08068f12
    bl         R_Mosqurito_Decide
    pop        {pc}
LAB_08068f50:
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_08068f60:
    .word 0x2

DAT_08068f64:
    .word 0x800


_ts R_Mosqurito_1_3_1_MoveY
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_08068f86
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    ldr        r2,[r5,#0x48]
    add        r1,r1,r2
    str        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}
LAB_08068f86:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    bl         R_Mosqurito_Decide
    pop        {pc}


_nt R_Mosqurito_1_4_ChargeForward
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mosqurito_1_4_0_StartMove_08068fb4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Mosqurito_1_4_0_StartMove_08068fb4:
    .word PTR_R_Mosqurito_1_4_0_StartMove_08068fb8

PTR_R_Mosqurito_1_4_0_StartMove_08068fb8:
    .word R_Mosqurito_1_4_0_StartMove
    .word R_Mosqurito_1_4_1_ChargeForward
    .word R_Mosqurito_1_4_2_Return


_ts R_Mosqurito_1_4_0_StartMove
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldrh       r1,[r5,#0x18]
    ldr        r0,[r5,#0x70]
    strh       r1,[r0,#0x4]
    strh       r1,[r0,#0x2]
    bl         FieldObject_Enable
    mov        r0,#0x94
    bl         Sound_PlaySE
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Mosqurito_1_4_1_ChargeForward
    push       {lr}
    ldr        r0,[r5,#0x74]
    mov        r1,#0x8
    lsl        r1,r1,#0x10
    tst        r0,r1
    bne        LAB_08069010
    ldr        r1,PanelFlag_08069034
    tst        r0,r1
    bne        LAB_0806902e
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_0806902e
    ldr        r1,[r5,#0x44]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}
LAB_08069010:
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    tst        r0,r1
    bne        LAB_0806902e
    mov        r0,#0x1
    mov        r3,#0x60
    strb       r0,[r5,r3]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806902e:
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    pop        {pc}

PanelFlag_08069034:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid


_ts R_Mosqurito_1_4_2_Return
    push       {lr}
    ldr        r0,[r5,#0x70]
    ldrh       r1,[r0,#0x4]
    strh       r1,[r5,#0x18]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    push       {r5}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Mosqurito_1_5_Drain
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Mosqurito_1_5_0_StartDrain_08069084
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Mosqurito_1_5_0_StartDrain_08069084:
    .word PTR_R_Mosqurito_1_5_0_StartDrain_08069088

PTR_R_Mosqurito_1_5_0_StartDrain_08069088:
    .word R_Mosqurito_1_5_0_StartDrain
    .word R_Mosqurito_1_5_1_Drain
    .word R_Mosqurito_1_5_2_Wait
    .word R_Mosqurito_1_5_3_Return


_ts R_Mosqurito_1_5_0_StartDrain
    push       {lr}
    mov        r0,#0x0
    bl         Routine_IsPlayerDrainActive
    tst        r0,r0
    beq        LAB_080690ba
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_080690ba:
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Mosqurito_1_5_1_Drain
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080690ea
    mov        r0,#0x0
    bl         Routine_IsPlayerDrainActive
    tst        r0,r0
    beq        LAB_080690ec
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    ldr        r7,[r5,#0x68]
    ldrh       r0,[r7,#0x2]
    bl         FieldObject_AddHp
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080690ea:
    pop        {pc}
LAB_080690ec:
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Mosqurito_1_5_2_Wait
    push       {lr}
    mov        r0,#0x0
    bl         Routine_IsPlayerDrainActive
    tst        r0,r0
    beq        LAB_08069106
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806910a
LAB_08069106:
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806910a:
    pop        {pc}


_ts R_Mosqurito_1_5_3_Return
    push       {lr}
    ldr        r0,[r5,#0x70]
    ldrh       r1,[r0,#0x4]
    strh       r1,[r5,#0x18]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    mov        r3,#0x60
    strb       r0,[r5,r3]
    ldr        r0,[r5,#0x6c]
    ldrh       r1,[r5,#0x18]
    strh       r1,[r0,#0x2]
    strh       r1,[r0,#0x4]
    bl         FieldObject_Enable
    push       {r5}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Mosqurito_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Mosqurito_2_0_Delete_08069168
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Mosqurito_2_0_Delete_08069168:
    .word PTR_R_Mosqurito_2_0_Delete_0806916c

PTR_R_Mosqurito_2_0_Delete_0806916c:
    .word R_Mosqurito_2_0_Delete
    .word R_Mosqurito_2_1_Free


_ts R_Mosqurito_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_Mosqurito_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080691bc
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Free
    ldrb       r1,[r5,#0x4]
    lsr        r1,r1,#0x8
    bcs        LAB_080691b4
LAB_080691b4:
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_080691bc:
    pop        {pc}


_nt R_Mosqurito_CheckDamage
    push       {lr}
    mov        r0,#0x0
    str        r0,[r5,#0x74]
    bl         Battle_IsInputLocked
    bne        LAB_0806922a
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806920c
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806920c
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0806922a
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_0806922a
    FieldObject_GetDamage PFI_Target_Object, 0x6c
    tst        r0,r0
    beq        LAB_0806922a
    str        r0,[r5,#0x74]
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0806922a
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08069224
LAB_0806920c:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08069224:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0806922a:
    mov        r0,#0x0
    pop        {pc}


_nt R_Mosqurito_Decide
    push       {lr}
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x19]
    ldrb       r1,[r5,#0x19]
    cmp        r0,r1
    bne        LAB_08069258
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_08069258
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    pop        {pc}
LAB_08069258:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0

