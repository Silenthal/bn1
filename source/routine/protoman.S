#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_MetGuard_Create, 0x806FF1E+1
    .set Attack_Charging_Create, 0x8070392+1
    .set Attack_SharpStrike_Create, 0x80719AC+1
    .set Effect_QuickEffect_Create, 0x807B5E8+1
    .set Effect_SwordSlash_Create, 0x807BFA0+1
    .set Effect_NaviDelete_Create, 0x8081D7C+1


_ts Routine_ProtoMan
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_ProtoMan_0_Init_08064674
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoMan_0_Init_08064674:
    .word PTR_R_ProtoMan_0_Init_08064678

PTR_R_ProtoMan_0_Init_08064678:
    .word R_ProtoMan_0_Init
    .word R_ProtoMan_1_Main
    .word R_ProtoMan_2_Free


_ts R_ProtoMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x48
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
    str        r0,[r5,#0x5c]
    str        r0,[r5,#0x70]
    mov        r3,#0x66
    strh       r0,[r5,r3]
    mov        r3,#0x64
    strb       r0,[r5,r3]
    mov        r3,#0x62
    mov        r0,#0xa
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0xc8
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r1,#0x68
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r1,#0x6c
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_ProtoMan_1_Main
    ldr        r0,[r5,#0x68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts R_ProtoMan_1_Main
    push       {lr}
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfHitFlagSet
    mov        r3,#0x64
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0806471e
    ldr        r0,[r5,#0x68]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    bl         FieldObject_ClearPanelFlag
LAB_0806471e:
    bl         R_ProtoMan_CheckDamage
    tst        r0,r0
    bne        LAB_08064730
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806473c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08064730:
    ldr        r0,[r5,#0x68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806473c:
    .word PTR_R_Actor_1_0_Spawn_08064740

PTR_R_Actor_1_0_Spawn_08064740:
    .word R_Actor_1_0_Spawn
    .word R_ProtoMan_1_1_Wait
    .word R_ProtoMan_1_2_Decide
    .word R_ProtoMan_1_3_Flinch
    .word R_ProtoMan_1_4_MoveToFront
    .word R_ProtoMan_1_5_ProtoShield
    .word R_ProtoMan_1_6_FighterSword
    .word R_ProtoMan_1_7_WideSword
    .word R_ProtoMan_1_8_AreaGrab


_ts R_ProtoMan_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806477e
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806477e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08064790
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08064790:
    pop        {pc}


_nt R_ProtoMan_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoMan_1_2_0_Wait_080647b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080647b0
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_080647b0:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoMan_1_2_0_Wait_080647b4:
    .word PTR_R_ProtoMan_1_2_0_Wait_080647b8

PTR_R_ProtoMan_1_2_0_Wait_080647b8:
    .word R_ProtoMan_1_2_0_Wait
    .word R_ProtoMan_1_2_1_Decide


_ts R_ProtoMan_1_2_0_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_DAT_080647dc
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


PTR_DAT_080647dc:
    .word DAT_080647e0

DAT_080647e0:
    .byte 0x3C
    .byte 0x32
    .byte 0x28

    .align 2, 0



_ts R_ProtoMan_1_2_1_Decide
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         R_ProtoMan_IsPlayerAttackInRange
    tst        r0,r0
    beq        LAB_08064804
    mov        r0,#0x1
    mov        r3,#0x64
    strb       r0,[r5,r3]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    pop        {pc}
LAB_08064804:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064810
    bl         R_ProtoMan_Decide
LAB_08064810:
    pop        {pc}


_nt R_ProtoMan_1_3_Flinch
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r0,[r7,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_08064822
    bl         SpritePtr_SetFlashPalette
LAB_08064822:
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoMan_1_3_0_Flinch_08064830
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoMan_1_3_0_Flinch_08064830:
    .word PTR_R_ProtoMan_1_3_0_Flinch_08064834

PTR_R_ProtoMan_1_3_0_Flinch_08064834:
    .word R_ProtoMan_1_3_0_Flinch
    .word R_ProtoMan_1_3_1_Reset
    .word R_ProtoMan_1_3_2_Next


_ts R_ProtoMan_1_3_0_Flinch
    push       {lr}
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    ldr        r0,[r5,#0x68]
    mov        r1,#0x10
    lsl        r1,r1,#0x10
    bl         FieldObject_ClearPanelFlag
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    bl         R_ProtoMan_DestroyExistingAttacks
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoMan_1_3_1_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064882
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08064882:
    pop        {pc}


_ts R_ProtoMan_1_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080648a0
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x5a
    mov        r3,#0x66
    strh       r0,[r5,r3]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080648a0:
    pop        {pc}


_nt R_ProtoMan_1_5_ProtoShield
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoMan_1_5_0_080648b0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ProtoMan_1_5_0_080648b0:
    .word PTR_R_ProtoMan_1_5_0_080648b4

PTR_R_ProtoMan_1_5_0_080648b4:
    .word R_ProtoMan_1_5_0
    .word R_ProtoMan_1_5_1


_ts R_ProtoMan_1_5_0
    push       {lr}
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    bne        LAB_080648fc
    add        r0,r5,#0x0
    add        r0,#0x5c
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x1
    bl         Attack_MetGuard_Create
    mov        r0,#0x8c
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x68]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    bl         FieldObject_SetPanelFlag
    mov        r0,#0x0
    mov        r3,#0x66
    strh       r0,[r5,r3]
    ldr        r0,[r5,#0x68]
    mov        r1,#0x10
    lsl        r1,r1,#0x10
    bl         FieldObject_SetPanelFlag
    mov        r0,#0x3c
    strb       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_080648fc:
    pop        {pc}


_nt R_ProtoMan_1_5_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806491a
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08064916
    mov        r0,#0x2
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
LAB_08064916:
    bl         R_ProtoMan_Decide
LAB_0806491a:
    pop        {pc}


_ts R_ProtoMan_1_6_FighterSword
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoMan_1_6_0_ChooseMovePanel_08064934
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Routine_IsPlayerInvulnerable
    ldrb       r1,[r5,#0x5]
    orr        r1,r0
    strb       r1,[r5,#0x5]
    pop        {pc}

PTR_PTR_R_ProtoMan_1_6_0_ChooseMovePanel_08064934:
    .word PTR_R_ProtoMan_1_6_0_ChooseMovePanel_08064938

PTR_R_ProtoMan_1_6_0_ChooseMovePanel_08064938:
    .word R_ProtoMan_1_6_0_ChooseMovePanel
    .word R_ProtoMan_1_6_1_Move
    .word R_ProtoMan_1_6_2_Slash
    .word R_ProtoMan_1_6_3_FighterSword
    .word R_ProtoMan_1_6_4_Wait
    .word R_ProtoMan_1_6_5_Reset
    .word R_ProtoMan_1_6_6_RepeatOrNext


_ts R_ProtoMan_1_6_0_ChooseMovePanel
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x4
    mov        r7,sp
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldr        r6,[r6,#0x40]
    ldrb       r4,[r6,#0x19]
    ldrb       r0,[r5,#0x16]
    ldr        r1,DAT_080649d8
    ldr        r2,DAT_080649dc
    push       {r4,r7}
    bl         Field_GetFirstInRowForward
    pop        {r4,r7}
    tst        r0,r0
    beq        LAB_08064982
    add        r1,r4,#0x0
    b          LAB_080649aa
LAB_08064982:
    ldrb       r0,[r5,#0x16]
    ldr        r1,DAT_080649d8
    ldr        r2,DAT_080649dc
    add        r3,r7,#0x0
    push       {r7}
    bl         Field_FindFirstEdgeForward
    pop        {r7}
    tst        r0,r0
    beq        LAB_080649ca
    add        r1,r0,#0x0
    add        r2,r0,#0x0
    add        r0,r7,#0x0
    push       {r7}
    bl         ArrayShuffle
    pop        {r7}
    ldrb       r0,[r7,#0x0]
    bl         Field_IndexToCellXY
LAB_080649aa:
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
    add        sp,#0x4
    pop        {pc}
LAB_080649ca:
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}

    .align 2, 0


DAT_080649d8:
    .word 0x3

DAT_080649dc:
    .word 0xC20


_ts R_ProtoMan_1_6_1_Move
    push       {lr}
    bl         R_ProtoMan_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_080649fe
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    bl         FUN_0806506a
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080649fe:
    pop        {pc}


_ts R_ProtoMan_1_6_2_Slash
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064a18
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08064a18:
    pop        {pc}


_nt R_ProtoMan_1_6_3_FighterSword
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_08064a6e
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x28
    lsl        r4,r4,#0x10
    neg        r4,r4
    add        r1,r1,r4
    mov        r4,#0x10
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x6
    bl         Effect_SwordSlash_Create
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x3
LAB_08064a48:
    push       {r0,r1,r2}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,DAT_08064a70
    mov        r6,#0xc8
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    pop        {r0,r1,r2}
    sub        r0,#0x1
    beq        LAB_08064a6a
    sub        r2,#0x1
    bne        LAB_08064a48
LAB_08064a6a:
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08064a6e:
    pop        {pc}

DAT_08064a70:
    .byte 0x19
    .byte 0x00
    .byte 0x03
    .byte 0x02


_ts R_ProtoMan_1_6_4_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064a88
    mov        r0,#0x19
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_08064a88:
    pop        {pc}


_nt R_ProtoMan_1_6_5_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064a9c
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strh       r0,[r5,#0xa]
LAB_08064a9c:
    pop        {pc}


_nt R_ProtoMan_1_6_6_RepeatOrNext
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064acc
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x19]
    ldrb       r1,[r5,#0x19]
    cmp        r0,r1
    beq        LAB_08064ace
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08064ace
    mov        r3,#0x63
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    beq        LAB_08064ace
    strb       r0,[r5,r3]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08064acc:
    pop        {pc}
LAB_08064ace:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoMan_1_7_WideSword
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoMan_1_7_0_Charge_08064af0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Routine_IsPlayerInvulnerable
    ldrb       r1,[r5,#0x5]
    orr        r1,r0
    strb       r1,[r5,#0x5]
    pop        {pc}

PTR_PTR_R_ProtoMan_1_7_0_Charge_08064af0:
    .word PTR_R_ProtoMan_1_7_0_Charge_08064af4

PTR_R_ProtoMan_1_7_0_Charge_08064af4:
    .word R_ProtoMan_1_7_0_Charge
    .word R_ProtoMan_1_7_1_ChooseMovePanel
    .word R_ProtoMan_1_7_2_Move
    .word R_ProtoMan_1_7_3_Slash
    .word R_ProtoMan_1_7_4_WideSword
    .word R_ProtoMan_1_7_5_Wait
    .word R_ProtoMan_1_7_6_Reset
    .word R_ProtoMan_1_7_7_MoveBack
    .word R_ProtoMan_1_7_8_Move
    .word R_ProtoMan_1_7_9_RepeatOrNext


_ts R_ProtoMan_1_7_0_Charge
    push       {lr}
    bl         FUN_0806506a
    mov        r4,#0x0
    bl         Attack_Charging_Create
    str        r7,[r5,#0x70]
    mov        r0,#0x30
    strh       r0,[r5,#0x1c]
    mov        r0,#0xb5
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ProtoMan_1_7_1_ChooseMovePanel
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064ba4
    ldr        r0,[r5,#0x70]
    tst        r0,r0
    beq        LAB_08064b58
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x70]
LAB_08064b58:
    mov        r0,#0x1
    mov        r3,#0x64
    strb       r0,[r5,r3]
    ldr        r0,[r5,#0x68]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    bl         FieldObject_SetPanelFlag
    mov        r0,#0x0
    mov        r3,#0x66
    strh       r0,[r5,r3]
    ldr        r0,[r5,#0x68]
    mov        r1,#0x10
    lsl        r1,r1,#0x10
    bl         FieldObject_SetPanelFlag
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x18]
    add        r0,#0x1
    ldrb       r1,[r7,#0x19]
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    bl         Field_IsCellPositionValid
    beq        LAB_08064bb0
    ldr        r0,[r5,#0x6c]
    ldrh       r1,[r5,#0x18]
    strh       r1,[r0,#0x4]
    strh       r1,[r0,#0x2]
    bl         FieldObject_Enable
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08064ba4:
    lsr        r0,r0,#0x4
    mov        r1,#0x2
    sub        r1,r1,r0
    ldr        r7,[r5,#0x70]
    strb       r1,[r7,#0x14]
    pop        {pc}
LAB_08064bb0:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ProtoMan_1_7_2_Move
    push       {lr}
    bl         R_ProtoMan_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08064bd2
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    bl         FUN_0806506a
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08064bd2:
    pop        {pc}


_ts R_ProtoMan_1_7_3_Slash
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064bf0
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08064bf0:
    pop        {pc}


_nt R_ProtoMan_1_7_4_WideSword
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_08064c46
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x28
    lsl        r4,r4,#0x10
    neg        r4,r4
    add        r1,r1,r4
    mov        r4,#0x10
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x1
    bl         Effect_SwordSlash_Create
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    add        r1,#0x1
    mov        r2,#0x3
LAB_08064c22:
    push       {r0,r1,r2}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,PTR_DAT_08064c48
    mov        r6,#0xc8
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    pop        {r0,r1,r2}
    sub        r1,#0x1
    sub        r2,#0x1
    bne        LAB_08064c22
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_08064c46:
    pop        {pc}

PTR_DAT_08064c48:
    .word 0x2030019


_ts R_ProtoMan_1_7_5_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064c60
    mov        r0,#0x19
    strh       r0,[r5,#0x1c]
    mov        r0,#0x18
    strh       r0,[r5,#0xa]
LAB_08064c60:
    pop        {pc}


_nt R_ProtoMan_1_7_6_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064c74
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x1c
    strh       r0,[r5,#0xa]
LAB_08064c74:
    pop        {pc}


_nt R_ProtoMan_1_7_7_MoveBack
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064cda
    ldr        r0,[r5,#0x6c]
    ldr        r0,[r0,#0x10]
    bl         FieldObject_UpdateField
    sub        sp,#0x14
    mov        r7,sp
    add        r0,r7,#0x0
    ldr        r1,PanelFlag_08064cdc
    ldr        r2,PanelFlag_08064ce0
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    bne        LAB_08064cac
    ldr        r7,[r5,#0x6c]
    ldrb       r0,[r7,#0x4]
    ldrb       r1,[r7,#0x5]
    ldrb       r0,[r7,#0x2]
    ldrb       r1,[r7,#0x3]
    b          LAB_08064cbc
LAB_08064cac:
    add        r2,r1,#0x0
    push       {r0}
    bl         ArrayShuffle
    pop        {r0}
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
LAB_08064cbc:
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
    mov        r0,#0x20
    strh       r0,[r5,#0xa]
    add        sp,#0x14
LAB_08064cda:
    pop        {pc}

PanelFlag_08064cdc:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08064ce0:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_ProtoMan_1_7_8_Move
    push       {lr}
    bl         R_ProtoMan_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08064d02
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0x24
    strh       r0,[r5,#0xa]
LAB_08064d02:
    pop        {pc}


_ts R_ProtoMan_1_7_9_RepeatOrNext
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064d26
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08064d28
    mov        r3,#0x63
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    beq        LAB_08064d28
    strb       r0,[r5,r3]
    mov        r0,#0x1
    strb       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08064d26:
    pop        {pc}
LAB_08064d28:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_ProtoMan_1_8_AreaGrab
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoMan_1_8_0_AreaGrab_08064d40
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ProtoMan_1_8_0_AreaGrab_08064d40:
    .word PTR_R_ProtoMan_1_8_0_AreaGrab_08064d44

PTR_R_ProtoMan_1_8_0_AreaGrab_08064d44:
    .word R_ProtoMan_1_8_0_AreaGrab
    .word R_ProtoMan_1_8_1_Wait


_ts R_ProtoMan_1_8_0_AreaGrab
    push       {lr}
    mov        r0,#0x2
    mov        r1,#0x2
    ldrb       r2,[r5,#0x16]
    mov        r3,#0x1e
    bl         ScreenDim_Alloc
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoMan_1_8_1_Wait
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoMan_1_4_MoveToFront
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ProtoMan_1_4_0_ChooseFrontMovePanel_08064d7c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoMan_1_4_0_ChooseFrontMovePanel_08064d7c:
    .word PTR_R_ProtoMan_1_4_0_ChooseFrontMovePanel_08064d80

PTR_R_ProtoMan_1_4_0_ChooseFrontMovePanel_08064d80:
    .word R_ProtoMan_1_4_0_ChooseFrontMovePanel
    .word R_ProtoMan_1_4_1_Move


_ts R_ProtoMan_1_4_0_ChooseFrontMovePanel
    push       {lr}
    sub        sp,#0x14
    mov        r7,sp
    mov        r0,#0x0
    push       {r7}
    bl         FieldObject_UpdateField
    pop        {r7}
    mov        r0,#0x0
    ldrb       r1,[r5,#0x19]
    bl         Field_FindEmptyOpponentWalkableEdgeFront
    tst        r1,r1
    beq        LAB_08064dd2
    push       {r7}
    add        r0,r7,#0x0
    add        r2,r1,#0x0
    bl         ArrayShuffle
    pop        {r7}
    ldrb       r0,[r7,#0x0]
    bl         Field_IndexToCellXY
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    add        sp,#0x14
    pop        {pc}
LAB_08064dd2:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    add        sp,#0x14
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_ProtoMan_1_4_1_Move
    push       {lr}
    bl         R_ProtoMan_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08064e06
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    bl         FUN_0806506a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08064e06:
    pop        {pc}


_ts R_ProtoMan_Move
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_ProtoMan_Move_0_TeleportStart_08064e18
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoMan_Move_0_TeleportStart_08064e18:
    .word PTR_R_ProtoMan_Move_0_TeleportStart_08064e1c

PTR_R_ProtoMan_Move_0_TeleportStart_08064e1c:
    .word R_ProtoMan_Move_0_TeleportStart
    .word R_ProtoMan_Move_1_TeleportEnd
    .word R_ProtoMan_Move_2_Next


_ts R_ProtoMan_Move_0_TeleportStart
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}


_nt R_ProtoMan_Move_1_TeleportEnd
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064e88
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_08064e88:
    pop        {pc}


_nt R_ProtoMan_Move_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08064e9a
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_08064e9a:
    pop        {pc}


_ts R_ProtoMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_ProtoMan_2_0_Delete_08064eac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ProtoMan_2_0_Delete_08064eac:
    .word PTR_R_ProtoMan_2_0_Delete_08064eb0

PTR_R_ProtoMan_2_0_Delete_08064eb0:
    .word R_ProtoMan_2_0_Delete
    .word R_ProtoMan_2_1_Free


_ts R_ProtoMan_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    bl         R_ProtoMan_DestroyExistingAttacks
    ldr        r0,[r5,#0x68]
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


_ts R_ProtoMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08064f02
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08064f02:
    pop        {pc}


_ts R_ProtoMan_IsPlayerAttackInRange
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x3
LAB_08064f0c:
    push       {r0,r1,r2}
    bl         Field_GetPanelFlags
    mov        r1,#0x40
    tst        r0,r1
    pop        {r0,r1,r2}
    bne        LAB_08064f26
    sub        r0,#0x1
    ble        LAB_08064f22
    sub        r2,#0x1
    bpl        LAB_08064f0c
LAB_08064f22:
    mov        r0,#0x0
    pop        {pc}
LAB_08064f26:
    mov        r0,#0x1
    pop        {pc}


_nt R_ProtoMan_Decide
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r3,#0x62
    ldrsb      r0,[r5,r3]
    sub        r0,#0x2
    bmi        LAB_08064f46
    strb       r0,[r5,r3]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08064f46:
    mov        r0,#0xa
    strb       r0,[r5,r3]
    mov        r0,#0x4
    mov        r1,#0x3
LAB_08064f4e:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_08064f86
    sub        r1,#0x1
    bne        LAB_08064f4e
    mov        r3,#0x63
    mov        r0,#0x3
    strb       r0,[r5,r3]
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1d
    cmp        r0,#0x5
    bmi        LAB_08064f7c
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08064f7c:
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08064f86:
    mov        r0,#0x20
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_ProtoMan_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08065042
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806501a
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806501a
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_08065042
    mov        r3,#0x66
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_08064fd4
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_08064fc6
    ldr        r0,[r5,#0x68]
    mov        r1,#0x10
    lsl        r1,r1,#0x10
    bl         FieldObject_SetPanelFlag
    b          LAB_08065042
LAB_08064fc6:
    lsr        r0,r0,#0x1
    bcc        LAB_08065042
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_08065042
LAB_08064fd4:
    mov        r0,#0xa
    ldr        r1,[r5,#0x68]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08065042
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08065042
    mov        r3,#0x64
    ldrb       r1,[r5,r3]
    tst        r1,r1
    beq        LAB_08065000
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    asr        r1,r0,#0x1f
    orr        r0,r1
    strb       r0,[r5,r3]
    b          LAB_08065042
LAB_08065000:
    bl         Field_SubtractHP
    cmp        r0,#0x3c
    bcc        LAB_08065010
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065010:
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806503c
LAB_0806501a:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetHitFlag
    ldr        r0,[r5,#0x68]
    mov        r1,#0x10
    lsl        r1,r1,#0x10
    bl         FieldObject_ClearPanelFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0806503c:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08065042:
    mov        r0,#0x0
    pop        {pc}


_nt R_ProtoMan_DestroyExistingAttacks
    push       {lr}
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08065058
    push       {r5}
    add        r5,r7,#0x0
    bl         Attack_Free
    pop        {r5}
LAB_08065058:
    ldr        r7,[r5,#0x70]
    tst        r7,r7
    beq        LAB_08065068
    push       {r5}
    add        r5,r7,#0x0
    bl         Attack_Free
    pop        {r5}
LAB_08065068:
    pop        {pc}


_nt FUN_0806506a
    push       {lr}
    mov        r0,#0x0
    mov        r3,#0x64
    strb       r0,[r5,r3]
    pop        {pc}
