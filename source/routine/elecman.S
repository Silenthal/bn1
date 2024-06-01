#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_NaviDelete_Create, 0x8081D7C+1


listElecManSpec:
    .byte 0x64, 0xC8, 0x04, 0x00
    .byte 0x64, 0xC8, 0x05, 0x00
    .byte 0x64, 0xC8, 0x06, 0x00
    .byte 0x64, 0xC8, 0x04, 0x00


_ts Routine_ElecMan
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_ElecMan_0_Init_08063e00
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecMan_0_Init_08063e00:
    .word PTR_R_ElecMan_0_Init_08063e04

PTR_R_ElecMan_0_Init_08063e04:
    .word R_ElecMan_0_Init
    .word R_ElecMan_1_Main
    .word R_ElecMan_2_Free


_ts R_ElecMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x5a
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
    mov        r3,#0x64
    strh       r0,[r5,r3]
    mov        r3,#0x62
    mov        r0,#0x5
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listElecManSpec_08063eac
    add        r7,r7,r0
    str        r7,[r5,#0x70]
    mov        r0,#0x32
    strh       r0,[r5,#0x24]
    mov        r0,#0x3
    strb       r0,[r5,#0x6]
    mov        r0,#0x9
    mov        r3,#0x68
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r3,#0x6c
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x32
    mov        r1,#0x74
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x6
    mov        r1,#0x2
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_ElecMan_1_Main
    ldr        r0,[r5,#0x68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_listElecManSpec_08063eac:
    .word listElecManSpec


_ts R_ElecMan_1_Main
    push       {lr}
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfHitFlagSet
    bl         R_ElecMan_CheckDamage
    tst        r0,r0
    bne        LAB_08063eca
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08063ed8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08063eca:
    ldr        r0,[r5,#0x68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08063ed8:
    .word PTR_R_Actor_1_0_Spawn_08063edc

PTR_R_Actor_1_0_Spawn_08063edc:
    .word R_Actor_1_0_Spawn
    .word R_ElecMan_1_1_Reset
    .word R_ElecMan_1_2_Decide
    .word R_ElecMan_1_3_Flinch
    .word R_ElecMan_1_4_Move
    .word R_ElecMan_1_5_SparkStrike
    .word R_ElecMan_1_6_ColumnCurrent
    .word R_ElecMan_1_7_ColumnCurrentRecover
    .word R_ElecMan_1_8_Escape


_ts R_ElecMan_1_1_Reset
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08063f1a
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08063f1a:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08063f2c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063f2c:
    pop        {pc}


_nt R_ElecMan_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ElecMan_1_2_0_08063f50
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08063f4c
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08063f4c:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecMan_1_2_0_08063f50:
    .word PTR_R_ElecMan_1_2_0_08063f54

PTR_R_ElecMan_1_2_0_08063f54:
    .word R_ElecMan_1_2_0
    .word R_ElecMan_1_2_1


_ts R_ElecMan_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x30
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ElecMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063f80
    bl         R_ElecMan_1_2_1_ChooseNext
LAB_08063f80:
    pop        {pc}


_nt R_ElecMan_1_3_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_08063fac
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_08063f90
    bl         SpritePtr_SetFlashPalette
LAB_08063f90:
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ElecMan_1_3_0_Flinch_08063f9c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ElecMan_1_3_0_Flinch_08063f9c:
    .word PTR_R_ElecMan_1_3_0_Flinch_08063fa0

PTR_R_ElecMan_1_3_0_Flinch_08063fa0:
    .word R_ElecMan_1_3_0_Flinch
    .word R_ElecMan_1_3_1_Wait
    .word R_ElecMan_1_3_2_Next

PTR_gFrameCounter_08063fac:
    .word gFrameCounter


_ts R_ElecMan_1_3_0_Flinch
    push       {lr}
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0xd
    ldr        r1,[r5,#0x68]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    bl         R_ElecMan_SetColumnFlag
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ElecMan_1_3_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063ff0
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08063ff0:
    pop        {pc}


_nt R_ElecMan_1_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806400e
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x5a
    mov        r3,#0x64
    strh       r0,[r5,r3]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806400e:
    pop        {pc}


_ts R_ElecMan_1_5_SparkStrike
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ElecMan_1_5_0_RaiseHands_08064020
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecMan_1_5_0_RaiseHands_08064020:
    .word PTR_R_ElecMan_1_5_0_RaiseHands_08064024

PTR_R_ElecMan_1_5_0_RaiseHands_08064024:
    .word R_ElecMan_1_5_0_RaiseHands
    .word R_ElecMan_1_5_1_Electrify
    .word R_ElecMan_1_5_2_SparkStrike
    .word R_ElecMan_1_5_3_Reset
    .word R_ElecMan_1_5_4_Next


_ts R_ElecMan_1_5_0_RaiseHands
    push       {lr}
    ldr        r7,[r5,#0x70]
    ldrb       r0,[r7,#0x2]
    mov        r3,#0x63
    strb       r0,[r5,r3]
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ElecMan_1_5_1_Electrify
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064064
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08064064:
    pop        {pc}


_nt R_ElecMan_1_5_2_SparkStrike
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064098
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    mov        r4,#0x0
    ldr        r7,[r5,#0x70]
    ldrb       r6,[r7,#0x1]
    bl         Attack_SparkStrike_Create
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r3,#0x63
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    beq        LAB_08064094
    strb       r0,[r5,r3]
    pop        {pc}
LAB_08064094:
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08064098:
    pop        {pc}


_nt R_ElecMan_1_5_3_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080640ac
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_080640ac:
    pop        {pc}


_nt R_ElecMan_1_5_4_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080640c2
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080640c2:
    pop        {pc}


_ts R_ElecMan_1_6_ColumnCurrent
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ElecMan_1_6_0_RaiseArms_080640d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecMan_1_6_0_RaiseArms_080640d4:
    .word PTR_R_ElecMan_1_6_0_RaiseArms_080640d8

PTR_R_ElecMan_1_6_0_RaiseArms_080640d8:
    .word R_ElecMan_1_6_0_RaiseArms
    .word R_ElecMan_1_6_1_Electrify
    .word R_ElecMan_1_6_2_ColumnCurrent
    .word R_ElecMan_1_6_3_Reset
    .word R_ElecMan_1_6_4_Next


_ts R_ElecMan_1_6_0_RaiseArms
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ElecMan_1_6_1_Electrify
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064110
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08064110:
    pop        {pc}


_nt R_ElecMan_1_6_2_ColumnCurrent
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064132
    bl         Rng_RandomUint
    lsr        r4,r0,#0x1e
    ldr        r7,[r5,#0x70]
    ldrb       r6,[r7,#0x0]
    bl         Attack_ColumnCurrentH_Create
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08064132:
    pop        {pc}


_ts R_ElecMan_1_6_3_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064146
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08064146:
    pop        {pc}


_ts R_ElecMan_1_6_4_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806415c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806415c:
    pop        {pc}


_nt R_ElecMan_1_7_ColumnCurrentRecover
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ElecMan_1_7_0_0806416c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ElecMan_1_7_0_0806416c:
    .word PTR_R_ElecMan_1_7_0_08064170

PTR_R_ElecMan_1_7_0_08064170:
    .word R_ElecMan_1_7_0
    .word R_ElecMan_1_7_1
    .word R_ElecMan_1_7_2
    .word R_ElecMan_1_7_3
    .word R_ElecMan_1_7_4
    .word R_ElecMan_1_7_5


_ts R_ElecMan_1_7_0
    push       {lr}
    bl         R_ElecMan_SetColumnFlag
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r0,#0x6
    mov        r1,#0x2
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldrb       r2,[r5,#0x18]
    ldrb       r3,[r5,#0x19]
    cmp        r0,r2
    bne        LAB_080641b0
    cmp        r1,r3
    bne        LAB_080641b0
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080641b0:
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ElecMan_1_7_1
    push       {lr}
    bl         R_ElecMan_Teleport
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_080641d6
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080641d6:
    pop        {pc}


_ts R_ElecMan_1_7_2
    push       {lr}
    mov        r1,#0x6
    mov        r2,#0x1
    ldr        r7,[r5,#0x70]
    ldrb       r6,[r7,#0x0]
    push       {r1,r6}
    bl         Attack_ColumnCurrentV_Create
    pop        {r1,r6}
    mov        r2,#0x3
    bl         Attack_ColumnCurrentV_Create
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ElecMan_1_7_3
    push       {lr}
    mov        r0,#0x3
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_08064254
    mov        r0,#0x1
    bl         Battle_SetBattleFlag
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064252
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x64
    bl         Field_AddHp
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1c
    sub        r0,#0x7
    lsl        r0,r0,#0x10
    ldr        r1,[r5,#0x28]
    add        r1,r1,r0
    ldr        r2,[r5,#0x2c]
    mov        r3,#0x14
    lsl        r3,r3,#0x10
    mov        r4,#0x23
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xbb
    bl         Sound_PlaySongImmediate
    mov        r0,#0xf
    strh       r0,[r5,#0x1e]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08064252:
    pop        {pc}
LAB_08064254:
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    bl         R_ElecMan_SetColumnFlag
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ElecMan_1_7_4
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08064276
    mov        r0,#0xbc
    bl         Sound_PlaySongImmediate
    mov        r0,#0xf
    strh       r0,[r5,#0x1e]
LAB_08064276:
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r0,[r7,#0x0]
    lsr        r0,r0,#0x2
    bcc        LAB_08064284
    bl         SpritePtr_SetFlashPalette
LAB_08064284:
    mov        r0,#0x1
    bl         Battle_SetBattleFlag
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806429e
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    bl         R_ElecMan_SetColumnFlag
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_0806429e:
    pop        {pc}


_ts R_ElecMan_1_7_5
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806429e
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ElecMan_1_8_Escape
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ElecMan_1_8_0_RaiseArms_080642c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ElecMan_1_8_0_RaiseArms_080642c4:
    .word PTR_R_ElecMan_1_8_0_RaiseArms_080642c8

PTR_R_ElecMan_1_8_0_RaiseArms_080642c8:
    .word R_ElecMan_1_8_0_RaiseArms
    .word R_ElecMan_1_8_1_Electrify
    .word R_ElecMan_1_8_2_Recover
    .word R_ElecMan_1_8_3_Reset
    .word R_ElecMan_1_8_4_NextOrEscape


_ts R_ElecMan_1_8_0_RaiseArms
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ElecMan_1_8_1_Electrify
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064304
    mov        r0,#0x78
    strb       r0,[r5,#0x1c]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08064304:
    pop        {pc}


_nt R_ElecMan_1_8_2_Recover
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064340
    mov        r0,#0x5a
    strb       r0,[r5,#0x1c]
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1c
    sub        r0,#0x7
    lsl        r0,r0,#0x10
    ldr        r1,[r5,#0x28]
    add        r1,r1,r0
    ldr        r2,[r5,#0x2c]
    mov        r3,#0x14
    lsl        r3,r3,#0x10
    mov        r4,#0x23
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xbb
    bl         Sound_PlaySongImmediate
    ldrh       r0,[r5,#0x22]
    strh       r0,[r5,#0x20]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08064340:
    pop        {pc}


_nt R_ElecMan_1_8_3_Reset
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r0,[r7,#0x0]
    lsr        r0,r0,#0x2
    bcc        LAB_08064352
    bl         SpritePtr_SetFlashPalette
LAB_08064352:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064340
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ElecMan_1_8_4_NextOrEscape
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064384
    ldrb       r0,[r5,#0x6]
    sub        r0,#0x1
    strb       r0,[r5,#0x6]
    beq        LAB_08064386
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08064384:
    pop        {pc}
LAB_08064386:
    mov        r0,#0x14
    mov        r1,#0x0
    mov        r2,#0x1
    mov        r3,#0x0
    bl         ScreenDim_Alloc
    pop        {pc}


_ts R_ElecMan_1_4_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ElecMan_1_4_0_ChooseNextPanel_080643a4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ElecMan_1_4_0_ChooseNextPanel_080643a4:
    .word PTR_R_ElecMan_1_4_0_ChooseNextPanel_080643a8

PTR_R_ElecMan_1_4_0_ChooseNextPanel_080643a8:
    .word R_ElecMan_1_4_0_ChooseNextPanel
    .word R_ElecMan_1_4_1_Next


_ts R_ElecMan_1_4_0_ChooseNextPanel
    push       {lr}
    sub        sp,#0x14
    mov        r6,sp
    add        r0,r6,#0x0
    ldr        r1,DAT_08064404
    ldr        r2,DAT_08064408
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_080643f8
    mov        r2,#0x14
    push       {r0}
    bl         ArrayShuffle
    pop        {r0}
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    add        sp,#0x14
    pop        {pc}
LAB_080643f8:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    add        sp,#0x14
    pop        {pc}

DAT_08064404:
    .word 0x2

DAT_08064408:
    .word 0xC20


_ts R_ElecMan_1_4_1_Next
    push       {lr}
    bl         R_ElecMan_Teleport
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08064420
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08064420:
    pop        {pc}


_nt R_ElecMan_Teleport
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_ElecMan_Teleport_0_TeleportStart_08064430
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ElecMan_Teleport_0_TeleportStart_08064430:
    .word PTR_R_ElecMan_Teleport_0_TeleportStart_08064434

PTR_R_ElecMan_Teleport_0_TeleportStart_08064434:
    .word R_ElecMan_Teleport_0_TeleportStart
    .word R_ElecMan_Teleport_1_TeleportEnd
    .word R_ElecMan_Teleport_2_Next


_ts R_ElecMan_Teleport_0_TeleportStart
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x1e
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}


_nt R_ElecMan_Teleport_1_TeleportEnd
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080644a6
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x1e
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_080644a6:
    pop        {pc}


_ts R_ElecMan_Teleport_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080644b8
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_080644b8:
    pop        {pc}


_nt R_ElecMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_ElecMan_2_0_Delete_080644c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ElecMan_2_0_Delete_080644c8:
    .word PTR_R_ElecMan_2_0_Delete_080644cc

PTR_R_ElecMan_2_0_Delete_080644cc:
    .word R_ElecMan_2_0_Delete
    .word R_ElecMan_2_1_Free


_ts R_ElecMan_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    bl         R_ElecMan_SetColumnFlag
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Disable
    mov        r0,#0x7
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


_ts R_ElecMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064524
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08064524:
    pop        {pc}


_nt R_ElecMan_1_2_1_ChooseNext
    push       {lr}
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x3
    bne        LAB_08064542
    ldrh       r0,[r5,#0x20]
    ldrh       r1,[r5,#0x22]
    sub        r1,r1,r0
    cmp        r1,#0x32
    bmi        LAB_08064542
    mov        r0,#0x20
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08064542:
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    bmi        LAB_08064556
    strb       r0,[r5,r3]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08064556:
    mov        r0,#0x5
    strb       r0,[r5,r3]
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x3
    beq        LAB_0806459c
    ldrh       r0,[r5,#0x22]
    lsr        r0,r0,#0x2
    ldrh       r1,[r5,#0x20]
    cmp        r1,r0
    bhi        LAB_0806457e
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1d
    cmp        r0,#0x5
    bmi        LAB_0806457e
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806457e:
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_0806459c
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1d
    cmp        r0,#0x2
    bmi        LAB_0806459c
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806459c:
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ElecMan_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0806464a
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806461e
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806461e
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_0806464a
    mov        r3,#0x64
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_080645e8
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_080645da
    mov        r0,#0x9
    ldr        r1,[r5,#0x68]
    bl         Field_SetPanelFlagsOnEntity
    b          LAB_0806464a
LAB_080645da:
    lsr        r0,r0,#0x1
    bcc        LAB_0806464a
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_0806464a
LAB_080645e8:
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0806464a
    mov        r0,#0xa
    ldr        r1,[r5,#0x68]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0806464a
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0806464a
    bl         Field_SubtractHP
    cmp        r0,#0x5a
    bcc        LAB_08064614
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08064614:
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08064644
LAB_0806461e:
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x3
    beq        LAB_0806464a
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetHitFlag
    mov        r0,#0xd
    ldr        r1,[r5,#0x68]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08064644:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0806464a:
    mov        r0,#0x0
    pop        {pc}


_nt R_ElecMan_SetColumnFlag
    push       {lr}
    mov        r0,#0x3
    bl         Battle_SetBattleFlag
    pop        {pc}
