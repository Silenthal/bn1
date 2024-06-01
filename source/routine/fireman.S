#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_NaviDelete_Create, 0x8081D7C+1

DAT_08059c74:
    .byte 0x0A
    .byte 0x0F
    .byte 0x14
    .byte 0x00
    .byte 0x0A
    .byte 0x0F
    .byte 0x14
    .byte 0x00
    .byte 0x0A
    .byte 0x0F
    .byte 0x14

    .align 2, 0


FuncState_ARRAY_08059c80:
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_5
    .byte FS_3
    .byte FS_3
    .byte FS_3
    .byte FS_3
    .byte FS_4
    .byte FS_4
    .byte FS_4
    .byte FS_4


_ts Routine_FireMan
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
    ldr        r7,PTR_PTR_R_FireMan_0_Init_08059cb4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_FireMan_0_Init_08059cb4:
    .word PTR_R_FireMan_0_Init_08059cb8

PTR_R_FireMan_0_Init_08059cb8:
    .word R_FireMan_0_Init
    .word R_FireMan_1_Main
    .word R_FireMan_2_Free


_ts R_FireMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x11
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_DAT_08059d50
    add        r7,r7,r0
    str        r7,[r5,#0x7c]
    mov        r0,#0x0
    str        r0,[r5,#0x40]
    str        r0,[r5,#0x5c]
    strb       r0,[r5,#0x17]
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x68
    strh       r0,[r5,r3]
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x0
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r1,#0x74
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r3,#0x78
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x78]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_FireMan_1_Main
    ldr        r0,[r5,#0x74]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_DAT_08059d50:
    .word DAT_08059c74


_ts R_FireMan_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08059d7a
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x74]
    bl         FieldObject_SetHitFlag
    pop        {pc}
LAB_08059d7a:
    bl         Battle_IsInputLocked
    bne        LAB_08059e0e
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_08059df0
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_08059de0
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_08059e0e
    mov        r3,#0x68
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_08059dba
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_08059dac
    mov        r0,#0x9
    ldr        r1,[r5,#0x74]
    bl         Field_SetPanelFlagsOnEntity
    b          LAB_08059e0e
LAB_08059dac:
    lsr        r0,r0,#0x1
    bcc        LAB_08059e0e
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_08059e0e
LAB_08059dba:
    mov        r0,#0xa
    ldr        r1,[r5,#0x74]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08059e0e
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08059e0e
    bl         Field_SubtractHP
    cmp        r0,#0x1e
    bcc        LAB_08059de0
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059de0:
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08059e0e
LAB_08059df0:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x74]
    bl         FieldObject_SetHitFlag
    mov        r0,#0xd
    ldr        r1,[r5,#0x74]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    b          LAB_08059e18
LAB_08059e0e:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08059e24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08059e18:
    ldr        r0,[r5,#0x74]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_08059e24:
    .word PTR_R_Actor_1_0_Spawn_08059e28

PTR_R_Actor_1_0_Spawn_08059e28:
    .word R_Actor_1_0_Spawn
    .word R_FireMan_1_1_WaitForBattleStart
    .word R_FireMan_1_2_Idle
    .word R_FireMan_1_3_BurnerBomb
    .word R_FireMan_1_4_FlameTower
    .word R_FireMan_1_5_FireArm
    .word R_FireMan_1_6_Move
    .word R_FireMan_1_7_Flinch
    .word PF_Player


_ts R_FireMan_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08059e66
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08059e66:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08059e78
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059e78:
    pop        {pc}


_nt R_FireMan_1_2_Idle
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_FireMan_1_2_0_Delay_08059e9c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08059e98
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08059e98:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_FireMan_1_2_0_Delay_08059e9c:
    .word PTR_R_FireMan_1_2_0_Delay_08059ea0

PTR_R_FireMan_1_2_0_Delay_08059ea0:
    .word R_FireMan_1_2_0_Delay
    .word R_FireMan_1_2_1_Wait
    .word R_FireMan_1_2_2_ChooseNextMove


_ts R_FireMan_1_2_0_Delay
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_FireMan_1_2_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059ece
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08059ece:
    pop        {pc}


_ts R_FireMan_1_2_2_ChooseNextMove
    push       {lr}
    bl         R_FireMan_Decide
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_FireMan_1_3_BurnerBomb
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_FireMan_1_3_0_FindNextPanel_08059eec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_FireMan_1_3_0_FindNextPanel_08059eec:
    .word PTR_R_FireMan_1_3_0_FindNextPanel_08059ef0

PTR_R_FireMan_1_3_0_FindNextPanel_08059ef0:
    .word R_FireMan_1_3_0_FindNextPanel
    .word R_FireMan_1_3_1_Move
    .word R_FireMan_1_3_2_StartAnimPrepareFire
    .word R_FireMan_1_3_3_AnimChargeFlamethrower
    .word R_FireMan_1_3_4_AnimReachBack
    .word R_FireMan_1_3_5_ChooseTargets
    .word R_FireMan_1_3_6_BurnerBomb
    .word R_FireMan_1_3_7_Recover


_ts R_FireMan_1_3_0_FindNextPanel
    push       {lr}
    sub        sp,#0x4
    mov        r7,sp
    mov        r0,#0x0
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldr        r6,[r6,#0x40]
    ldrb       r1,[r6,#0x19]
    bl         Field_FindEmptyOpponentWalkableEdgeFront
    tst        r1,r1
    beq        LAB_08059f60
    add        r0,r7,#0x0
    mov        r2,#0x6
    push       {r7}
    bl         ArrayShuffle
    pop        {r7}
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x7
    and        r1,r0
    lsr        r0,r0,#0x3
    mov        r3,#0x61
    strb       r1,[r5,r3]
    mov        r3,#0x62
    strb       r0,[r5,r3]
    ldr        r7,[r5,#0x78]
    strb       r1,[r7,#0x4]
    strb       r0,[r7,#0x5]
    strb       r1,[r7,#0x2]
    strb       r0,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}
LAB_08059f60:
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}


_ts R_FireMan_1_3_1_Move
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08059f96
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    mov        r3,#0x62
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x78]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08059f96:
    pop        {pc}


_ts R_FireMan_1_3_2_StartAnimPrepareFire
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08059fac
    mov        r0,#0xc
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08059fac:
    pop        {pc}


_nt R_FireMan_1_3_3_AnimChargeFlamethrower
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08059fc6
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    mov        r0,#0x60
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08059fc6:
    pop        {pc}


_ts R_FireMan_1_3_4_AnimReachBack
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059fda
    mov        r0,#0xe
    strb       r0,[r5,#0x14]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_08059fda:
    pop        {pc}


_ts R_FireMan_1_3_5_ChooseTargets
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a026
    mov        r0,#0xf
    strb       r0,[r5,#0x14]
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x1
    mov        r2,#0x2
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_0805a028
    add        r2,r1,#0x0
    push       {r0,r1}
    bl         ArrayShuffle
    pop        {r0,r1}
    cmp        r1,#0x3
    bls        LAB_0805a010
    mov        r1,#0x3
LAB_0805a010:
    strh       r1,[r5,#0x1e]
    mov        r3,#0x70
LAB_0805a014:
    ldrb       r2,[r0,#0x0]
    strb       r2,[r5,r3]
    add        r0,#0x1
    add        r3,#0x1
    sub        r1,#0x1
    bne        LAB_0805a014
    add        sp,#0x14
    mov        r0,#0x18
    strh       r0,[r5,#0xa]
LAB_0805a026:
    pop        {pc}
LAB_0805a028:
    mov        r0,#0x10
    strb       r0,[r5,#0x14]
    mov        r0,#0x1c
    strh       r0,[r5,#0xa]
    add        sp,#0x14
    pop        {pc}


_ts R_FireMan_1_3_6_BurnerBomb
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a076
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bmi        LAB_0805a078
    mov        r3,#0x70
    add        r3,r3,r0
    ldrb       r0,[r5,r3]
    bl         Field_IndexToCellXY
    lsl        r4,r1,#0x18
    lsl        r0,r0,#0x10
    orr        r4,r0
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    ldr        r7,[r5,#0x7c]
    ldrb       r6,[r7,#0x0]
    bl         Attack_BurnerBomb_Create
    mov        r0,#0x81
    bl         Sound_PlaySongImmediate
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
LAB_0805a076:
    pop        {pc}
LAB_0805a078:
    mov        r0,#0x10
    strb       r0,[r5,#0x14]
    mov        r0,#0x1c
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_FireMan_1_3_7_Recover
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a096
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805a096:
    pop        {pc}


_ts R_FireMan_1_4_FlameTower
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_FireMan_1_4_0_FindNextPanel_0805a0a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_FireMan_1_4_0_FindNextPanel_0805a0a8:
    .word PTR_R_FireMan_1_4_0_FindNextPanel_0805a0ac

PTR_R_FireMan_1_4_0_FindNextPanel_0805a0ac:
    .word R_FireMan_1_4_0_FindNextPanel
    .word R_FireMan_1_4_1_Move
    .word R_FireMan_1_4_2_AnimRaiseArm
    .word R_FireMan_1_4_3_AnimFireCharge
    .word R_FireMan_1_4_4_FlameTower
    .word R_FireMan_1_4_5_AnimStandUp
    .word R_FireMan_1_4_6_End


_ts R_FireMan_1_4_0_FindNextPanel
    push       {lr}
    sub        sp,#0x4
    mov        r7,sp
    mov        r0,#0x1
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldr        r6,[r6,#0x40]
    ldrb       r1,[r6,#0x19]
    bl         Field_FindEmptyOpponentWalkablePanelsFront
    tst        r1,r1
    beq        LAB_0805a118
    add        r0,r7,#0x0
    mov        r2,#0x6
    push       {r7}
    bl         ArrayShuffle
    pop        {r7}
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x7
    and        r1,r0
    lsr        r0,r0,#0x3
    mov        r3,#0x61
    strb       r1,[r5,r3]
    mov        r3,#0x62
    strb       r0,[r5,r3]
    ldr        r7,[r5,#0x78]
    strb       r1,[r7,#0x4]
    strb       r0,[r7,#0x5]
    strb       r1,[r7,#0x2]
    strb       r0,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}
LAB_0805a118:
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}


_ts R_FireMan_1_4_1_Move
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a14e
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    mov        r3,#0x62
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x78]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0805a14e:
    pop        {pc}


_ts R_FireMan_1_4_2_AnimRaiseArm
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a164
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0805a164:
    pop        {pc}


_nt R_FireMan_1_4_3_AnimFireCharge
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a17e
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x30
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0805a17e:
    pop        {pc}


_ts R_FireMan_1_4_4_FlameTower
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a1ae
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x64
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r2,[r7,#0x40]
    add        r2,#0x2c
    mov        r4,#0x1
    ldr        r7,[r5,#0x7c]
    ldrb       r6,[r7,#0x1]
    mov        r3,#0x2
    bl         Attack_Tower_Create
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_0805a1ae:
    pop        {pc}


_ts R_FireMan_1_4_5_AnimStandUp
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a1c2
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strh       r0,[r5,#0xa]
LAB_0805a1c2:
    pop        {pc}


_ts R_FireMan_1_4_6_End
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a1d8
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805a1d8:
    pop        {pc}


_nt R_FireMan_1_5_FireArm
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_FireMan_1_5_0_0805a1e8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_FireMan_1_5_0_0805a1e8:
    .word PTR_R_FireMan_1_5_0_0805a1ec

PTR_R_FireMan_1_5_0_0805a1ec:
    .word R_FireMan_1_5_0
    .word R_FireMan_1_5_1
    .word R_FireMan_1_5_2
    .word R_FireMan_1_5_3
    .word R_FireMan_1_5_4
    .word R_FireMan_1_5_5
    .word R_FireMan_1_5_6_End


_ts R_FireMan_1_5_0
    push       {lr}
    sub        sp,#0x4
    mov        r7,sp
    mov        r0,#0x0
    mov        r1,#0x0
    bl         Field_FindEmptyOpponentWalkablePanelsFront
    tst        r1,r1
    beq        LAB_0805a252
    add        r0,r7,#0x0
    mov        r2,#0x6
    push       {r7}
    bl         ArrayShuffle
    pop        {r7}
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x7
    and        r1,r0
    lsr        r0,r0,#0x3
    mov        r3,#0x61
    strb       r1,[r5,r3]
    mov        r3,#0x62
    strb       r0,[r5,r3]
    ldr        r7,[r5,#0x78]
    strb       r1,[r7,#0x4]
    strb       r0,[r7,#0x5]
    strb       r1,[r7,#0x2]
    strb       r0,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}
LAB_0805a252:
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}


_nt R_FireMan_1_5_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a288
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    mov        r3,#0x62
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x78]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0805a288:
    pop        {pc}


_nt R_FireMan_1_5_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a2a2
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x2d
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0805a2a2:
    pop        {pc}


_ts R_FireMan_1_5_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a2b6
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0805a2b6:
    pop        {pc}


_ts R_FireMan_1_5_4
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a2a2
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r4,#0x1
    mov        r2,#0x2
    ldr        r7,[r5,#0x7c]
    ldrb       r6,[r7,#0x2]
    bl         Attack_FireArm_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x82
    bl         Sound_PlaySongImmediate
    mov        r0,#0xf
    strh       r0,[r5,#0x1e]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_FireMan_1_5_5
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0805a302
    mov        r0,#0x82
    bl         Sound_PlaySongImmediate
    mov        r0,#0xf
    strh       r0,[r5,#0x1e]
LAB_0805a302:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a2b6
    mov        r0,#0xa
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strh       r0,[r5,#0xa]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0805a322
    mov        r0,#0x1
    strb       r0,[r7,#0x6]
    mov        r0,#0x83
    bl         Sound_PlaySongImmediate
LAB_0805a322:
    pop        {pc}


_ts R_FireMan_1_5_6_End
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a338
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805a338:
    pop        {pc}


_nt R_FireMan_1_6_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_FireMan_1_6_0_AnimTeleportOut_0805a348
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_FireMan_1_6_0_AnimTeleportOut_0805a348:
    .word PTR_R_FireMan_1_6_0_AnimTeleportOut_0805a34c

PTR_R_FireMan_1_6_0_AnimTeleportOut_0805a34c:
    .word R_FireMan_1_6_0_AnimTeleportOut
    .word R_FireMan_1_6_1_AnimTeleportOut
    .word R_FireMan_1_6_2_ChooseNextPanel
    .word R_FireMan_1_6_3_AnimRecover
    .word R_FireMan_1_6_4_Decide


_ts R_FireMan_1_6_0_AnimTeleportOut
    push       {lr}
    mov        r0,#0x3
    strh       r0,[r5,#0x1e]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_FireMan_1_6_1_AnimTeleportOut
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_FireMan_1_6_2_ChooseNextPanel
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a3c2
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,DAT_0805a3c4
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_0805a3bc
    mov        r2,#0x14
    push       {r0}
    bl         ArrayShuffle
    pop        {r0}
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
LAB_0805a3bc:
    add        sp,#0x14
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0805a3c2:
    pop        {pc}

DAT_0805a3c4:
    .word 0xC20


_ts R_FireMan_1_6_3_AnimRecover
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a3e0
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0805a3e0:
    pop        {pc}


_nt R_FireMan_1_6_4_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a3fc
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    beq        LAB_0805a3fe
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0805a3fc:
    pop        {pc}
LAB_0805a3fe:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_FireMan_1_7_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_0805a434
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_0805a416
    bl         SpritePtr_SetFlashPalette
LAB_0805a416:
    ldr        r7,PTR_PTR_R_FireMan_1_7_0_Flinch_0805a424
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_FireMan_1_7_0_Flinch_0805a424:
    .word PTR_R_FireMan_1_7_0_Flinch_0805a428

PTR_R_FireMan_1_7_0_Flinch_0805a428:
    .word R_FireMan_1_7_0_Flinch
    .word R_FireMan_1_7_1_Recover
    .word R_FireMan_1_7_2_End

PTR_gFrameCounter_0805a434:
    .word gFrameCounter


_ts R_FireMan_1_7_0_Flinch
    push       {lr}
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0805a452
    mov        r0,#0x1
    strb       r0,[r7,#0x6]
    ldr        r0,[r5,#0x78]
    bl         FieldObject_Disable
    mov        r0,#0xd
    ldr        r1,[r5,#0x74]
    bl         Field_SetPanelFlagsOnEntity
LAB_0805a452:
    mov        r0,#0xb
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_FireMan_1_7_1_Recover
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805a47c
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0805a47c:
    pop        {pc}


_nt R_FireMan_1_7_2_End
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a4a4
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x2a
    mov        r3,#0x68
    strh       r0,[r5,r3]
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,r3]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805a4a4:
    pop        {pc}


_nt R_FireMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_FireMan_2_0_Delete_0805a4b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_FireMan_2_0_Delete_0805a4b4:
    .word PTR_R_FireMan_2_0_Delete_0805a4b8

PTR_R_FireMan_2_0_Delete_0805a4b8:
    .word R_FireMan_2_0_Delete
    .word R_FireMan_2_1_Free


_ts R_FireMan_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0805a4d0
    mov        r0,#0x1
    strb       r0,[r7,#0x6]
LAB_0805a4d0:
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_nt R_FireMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805a514
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x78]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805a514:
    pop        {pc}


_nt R_FireMan_Decide
    push       {lr}
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r1,#0x2
    tst        r0,r1
    bne        LAB_0805a52c
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,r3]
    mov        r0,#0x18
    pop        {pc}
LAB_0805a52c:
    bic        r0,r1
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805a544
    strb       r0,[r5,r3]
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r0,r1
    ldr        r7,PTR_FuncState_ARRAY_0805a54c
    ldrb       r0,[r7,r0]
    pop        {pc}
LAB_0805a544:
    orr        r0,r1
    strb       r0,[r5,r3]
    mov        r0,#0x14
    pop        {pc}

PTR_FuncState_ARRAY_0805a54c:
    .word FuncState_ARRAY_08059c80
