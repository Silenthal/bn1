#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Player
    @@ Notes:
    @@ 74: PlayerBattleState
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Player_0_Init_08056320
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_R_Player_0_Init_08056314:
    .word R_Player_0_Init
    .word R_Player_1_Main
    .word R_Player_2_Free

PTR_PTR_R_Player_0_Init_08056320:
    .word PTR_R_Player_0_Init_08056314


_ts R_Player_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Sprite_InitSpritePtr
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0805634e
    mov        r0,#0x4
LAB_0805634e:
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    str        r0,[r5,#0x5c]
    mov        r0,#0x60
    add        r0,r0,r5
    mov        r1,#0x20
    bl         memset0_32
    mov        r6,r10
    LoadMain playerBattleState, r7, r7
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0805637a
    add        r7,#0x70
    push       {r7}
    mov        r0,#0x1
    bl         SpritePtr_SetFlipType
    pop        {r7}
LAB_0805637a:
    str        r7,[r5,#0x74]
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    strb       r0,[r7,#0x1]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x3]
    strb       r0,[r7,#0x4]
    strb       r0,[r7,#0x5]
    strb       r0,[r7,#0x6]
    strb       r0,[r7,#0x7]
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0xc]
    strb       r0,[r7,#0xd]
    strb       r0,[r7,#0xe]
    strh       r0,[r7,#0x10]
    strh       r0,[r7,#0x12]
    strh       r0,[r7,#0x14]
    strh       r0,[r7,#0x16]
    strh       r0,[r7,#0x18]
    strh       r0,[r7,#0x1a]
    strh       r0,[r7,#0x1c]
    strh       r0,[r7,#0x2c]
    strh       r0,[r7,#0x2e]
    strh       r0,[r7,#0x30]
    strh       r0,[r7,#0x1e]
    strh       r0,[r7,#0x20]
    strh       r0,[r7,#0x22]
    strh       r0,[r7,#0x24]
    add        r0,r7,#0x0
    add        r0,#0x40
    mov        r1,#0x20
    push       {r7}
    bl         memset0_32
    pop        {r7}
    add        r0,r7,#0x0
    add        r0,#0x60
    mov        r1,#0x10
    mov        r2,#0xff
    bl         memset
    ldrb       r0,[r5,#0x16]
    bl         Routine_ClearBetaSigmaTimer
    mov        r0,#0xff
    mov        r3,#0x63
    strb       r0,[r5,r3]
    mov        r0,#0x0
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    mov        r3,#0x50
    add        r7,r5,r3
    stmia      r7!,{r0,r1,r2}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x26]
    strh       r0,[r5,#0x20]
    ldrh       r0,[r7,#0x28]
    strh       r0,[r5,#0x22]
    bl         R_Player_SetElement
    mov        r0,#0x0
    strh       r0,[r5,#0x24]
    push       {r5}
    bl         BattleUi_InitHpDisplay
    pop        {r5}
    mov        r0,#0x9
    ldr        r1,[r5,#0x74]
    add        r1,#0x44
    bl         Field_CreateEntity
    mov        r0,#0xf
    ldr        r1,[r5,#0x74]
    add        r1,#0x48
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_Player_1_Main
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x44]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0



_ts R_Player_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    bl         FUN_08057164
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_ResetPalette
    bl         R_Player_SetVisibleEffect
    bl         Battle_GetEntryState
    tst        r0,r0
    bne        LAB_0805646c
    bl         R_Player_CheckDamage
LAB_0805646c:
    bl         UpdateAttackButtonState
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_dummy_56510_080564b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_PlayerB_0_EnterBattle_080564b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r7,PTR_PTR_R_PlayerC_0_CheckMove_080564bc
    mov        r3,#0x64
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_Player_HandleBattleChip
    ldr        r0,[r5,#0x74]
    ldr        r0,[r0,#0x44]
    bl         FieldObject_UpdateCellPosition
    bl         R_Player_HandleBusterCharge
    bl         R_Player_CheckIronBodyStatus
    bl         R_Player_CheckNumbStatus
    bl         R_Player_ShowActivePAInfo
    bl         R_Player_SetPlayerPanelFlag
    pop        {pc}

    .align 2, 0


PTR_PTR_dummy_56510_080564b4:
    .word PTR_dummy_56510_080564c0

PTR_PTR_R_PlayerB_0_EnterBattle_080564b8:
    .word PTR_R_PlayerB_0_EnterBattle_080564e0

PTR_PTR_R_PlayerC_0_CheckMove_080564bc:
    .word PTR_R_PlayerC_0_CheckMove_08056500

PTR_dummy_56510_080564c0:
    .word dummy_56510
    .word R_PlayerA_1
    .word dummy_565c6
    .word dummy_5664a
    .word dummy_5679e
    .word dummy_5681c
    .word R_PlayerA_6_DecreaseFreezeTimer
    .word dummy_569fc

PTR_R_PlayerB_0_EnterBattle_080564e0:
    .word R_PlayerB_0_EnterBattle
    .word R_PlayerB_1_Blink
    .word R_PlayerB_2
    .word R_PlayerB_3
    .word R_PlayerB_4
    .word R_PlayerB_5_Delete
    .word R_PlayerB_6_Freeze
    .word R_PlayerB_7_Drain

PTR_R_PlayerC_0_CheckMove_08056500:
    .word R_PlayerC_0_CheckMove
    .word R_PlayerC_1_StartMove
    .word R_PlayerC_2_ChangePos
    .word R_PlayerC_3_EndMove


_ts dummy_56510
    push       {lr}
    pop        {pc}


_ts R_PlayerB_0_EnterBattle
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_0_0_RegisterSpawn_0805652c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_PlayerB_0_0_RegisterSpawn_08056524:
    .word R_PlayerB_0_0_RegisterSpawn
    .word R_PlayerB_0_1_SetSpawnFlag

PTR_PTR_R_PlayerB_0_0_RegisterSpawn_0805652c:
    .word PTR_R_PlayerB_0_0_RegisterSpawn_08056524


_ts R_PlayerB_0_0_RegisterSpawn
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x6]
    add        r0,#0x1
    strb       r0,[r7,#0x6]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_PlayerB_0_1_SetSpawnFlag
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805655c
    mov        r0,#0x8
    bl         ActorPlayer_SetFlag_1
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805655c:
    pop        {pc}


_nt R_PlayerA_1
    push       {lr}
    bl         R_Player_CheckBusterChipActivation
    bl         Battle_IsInputLocked
    beq        LAB_08056570
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
LAB_08056570:
    mov        r3,#0x64
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_08056588
    bl         Battle_GetEntryState
    bl         FUN_08056ba2
    tst        r1,r1
    bne        LAB_08056588
    bl         R_Player_HandleChipActivation
LAB_08056588:
    pop        {pc}
    .word PF_Drain


_nt R_PlayerB_1_Blink
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_1_0_Blink_0805659c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_PlayerB_1_0_Blink_0805659c:
    .word PTR_R_PlayerB_1_0_Blink_080565a0

PTR_R_PlayerB_1_0_Blink_080565a0:
    .word R_PlayerB_1_0_Blink
    .word dummy_565c2


_ts R_PlayerB_1_0_Blink
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xf
    bl         ActorPlayer_SetFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt dummy_565c2
    push       {lr}
    pop        {pc}


_nt dummy_565c6
    push       {lr}
    pop        {pc}


_nt R_PlayerB_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_2_0_080565d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_PlayerB_2_0_080565d8:
    .word PTR_R_PlayerB_2_0_080565dc

PTR_R_PlayerB_2_0_080565dc:
    .word R_PlayerB_2_0
    .word R_PlayerB_2_1


_ts R_PlayerB_2_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x16]
    add        r7,#0x6
    ldrb       r0,[r7,r0]
    add        r0,#0x1
    strb       r0,[r7,r0]
    bl         R_Player_ClearAttack
    bl         R_Player_EndShield
    bl         R_Player_CheckBubbleShieldPop
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
    ldr        r7,[r5,#0x74]
    str        r0,[r7,#0x10]
    ldrb       r0,[r5,#0x16]
    bl         Routine_ClearBetaSigmaTimer
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_PlayerB_2_1
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x1
    beq        LAB_08056648
    ldr        r7,[r5,#0x74]
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r3,#0x62
    mov        r0,#0x0
    strb       r0,[r5,r3]
LAB_08056648:
    pop        {pc}


_nt dummy_5664a
    push       {lr}
    pop        {pc}


_nt R_PlayerB_3
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_3_0_0805665c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_PlayerB_3_0_0805665c:
    .word PTR_R_PlayerB_3_0_08056660

PTR_R_PlayerB_3_0_08056660:
    .word R_PlayerB_3_0
    .word R_PlayerB_3_1
    .word R_PlayerB_3_2


_ts R_PlayerB_3_0
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    bl         R_Player_ClearChip
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    mov        r0,#0x4
    bl         ActorPlayer_CheckStatus
    beq        LAB_080566a8
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x73
    bl         Sound_PlaySongImmediate
    pop        {pc}
LAB_080566a8:
    mov        r0,#0x71
    bl         Sound_PlaySongImmediate
    mov        r0,#0x20
    bl         ActorPlayer_CheckStatus
    beq        LAB_080566ca
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x4
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r0,#0x14
    strb       r0,[r5,#0x14]
    pop        {pc}
LAB_080566ca:
    mov        r0,#0x80
    bl         ActorPlayer_CheckStatus
    beq        LAB_080566e6
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0xc
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r0,#0x14
    strb       r0,[r5,#0x14]
    pop        {pc}
LAB_080566e6:
    ldr        r7,[r5,#0x74]
    mov        r0,#0x4e
    strb       r0,[r7,#0x0]
    ldrb       r0,[r7,#0xb]
    cmp        r0,#0x5
    beq        LAB_0805670e
    ldrb       r0,[r5,#0x17]
    lsr        r0,r0,#0x2
    bcc        LAB_080566fc
    mov        r0,#0x5
    b          LAB_08056706
LAB_080566fc:
    mov        r0,#0x5
    ldrb       r1,[r5,#0x1a]
    tst        r1,r1
    beq        LAB_08056706
    mov        r0,#0xe
LAB_08056706:
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805670e:
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    mov        r0,#0x8
    bl         ActorPlayer_SetFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_PlayerB_3_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08056756
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08056756:
    ldrb       r0,[r5,#0x17]
    lsr        r0,r0,#0x2
    bcc        LAB_0805676e
    ldr        r1,[r5,#0x44]
    tst        r1,r1
    beq        LAB_0805676e
    ldr        r0,[r5,#0x4c]
    add        r1,r1,r0
    str        r1,[r5,#0x44]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
LAB_0805676e:
    pop        {pc}


_ts R_PlayerB_3_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0805679c
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    mov        r0,#0x8
    bl         ActorPlayer_SetFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805679c:
    pop        {pc}


_nt dummy_5679e
    push       {lr}
    pop        {pc}


_nt R_PlayerB_4
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_4_0_080567bc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_PlayerB_4_0_080567b0:
    .word R_PlayerB_4_0
    .word R_PlayerB_4_1
    .word R_PlayerB_4_2

PTR_PTR_R_PlayerB_4_0_080567bc:
    .word PTR_R_PlayerB_4_0_080567b0


_ts R_PlayerB_4_0
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x1
    bl         ActorPlayer_SetStatus
    ldr        r0,DAT_080567e0
    str        r0,[r5,#0x4c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_080567e0:
    .word 0xC0000


_ts R_PlayerB_4_1
    push       {lr}
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x4c]
    add        r0,r0,r1
    bpl        LAB_080567f4
    mov        r0,#0x0
    mov        r2,#0x8
    strh       r2,[r5,#0xa]
LAB_080567f4:
    str        r0,[r5,#0x30]
    ldr        r0,DAT_08056800
    add        r1,r1,r0
    str        r1,[r5,#0x4c]
    pop        {pc}

    .align 2, 0


DAT_08056800:
    .word 0xFFFEC000


_ts R_PlayerB_4_2
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0xf
    bl         ActorPlayer_SetFlag_1
    mov        r0,#0x1
    bl         ActorPlayer_ClearStatus
    pop        {pc}


_ts dummy_5681c
    push       {lr}
    pop        {pc}


_ts R_PlayerB_5_Delete
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_5_0_Glint_0805683c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_PlayerB_5_0_Glint_08056830:
    .word R_PlayerB_5_0_Glint
    .word R_PlayerB_5_1_Delete
    .word R_PlayerB_5_2_Next

PTR_PTR_R_PlayerB_5_0_Glint_0805683c:
    .word PTR_R_PlayerB_5_0_Glint_08056830


_ts R_PlayerB_5_0_Glint
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    bl         Battle_ClearState_InBattle
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x15
    mov        r6,#0xf
    lsl        r6,r6,#0x10
    orr        r4,r6
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x16
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_PlayerB_5_1_Delete
    push       {lr}
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080568ac
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
LAB_08056896:
    push       {r1,r2,r3,r4,r5}
    bl         Effect_MegaManDelete_Create
    pop        {r1,r2,r3,r4,r5}
    mov        r0,#0x20
    lsl        r0,r0,#0x8
    add        r4,r4,r0
    lsl        r0,r4,#0x10
    bcc        LAB_08056896
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080568ac:
    pop        {pc}


_nt R_PlayerB_5_2_Next
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080568c4
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
LAB_080568c4:
    pop        {pc}


_nt R_PlayerA_6_DecreaseFreezeTimer
    push       {lr}
    mov        r0,#0x8
    ldrh       r1,[r5,#0xa]
    cmp        r1,r0
    bne        LAB_0805690e
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x20]
    ldr        r1,DAT_08056910
    and        r0,r1
    add        r2,r0,#0x0
    lsr        r0,r0,#0x1
LAB_080568dc:
    sub        r2,r2,r0
    lsr        r0,r0,#0x1
    bne        LAB_080568dc
    mov        r1,#0xa
    mul        r2,r1
    add        r2,#0x1
    ldrh       r0,[r5,#0x1c]
    sub        r0,r0,r2
    strh       r0,[r5,#0x1c]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0805690e
    sub        r2,#0x1
    beq        LAB_08056904
    push       {r5}
    add        r5,r7,#0x0
    bl         SpritePtr_SetFlashPalette
    pop        {r5}
    pop        {pc}
LAB_08056904:
    push       {r5}
    add        r5,r7,#0x0
    bl         SpritePtr_ResetPalette
    pop        {r5}
LAB_0805690e:
    pop        {pc}

DAT_08056910:
    .word 0xF3


_ts R_PlayerB_6_Freeze
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_6_0_Delay_08056930
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_PlayerB_6_0_Delay_08056924:
    .word R_PlayerB_6_0_Delay
    .word R_PlayerB_6_1_Freeze
    .word R_PlayerB_6_2_Break

PTR_PTR_R_PlayerB_6_0_Delay_08056930:
    .word PTR_R_PlayerB_6_0_Delay_08056924


_ts R_PlayerB_6_0_Delay
    push       {lr}
    ldrb       r0,[r5,#0x16]
    bl         R_Player_ResetPlayerDefenseState
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_PlayerB_6_1_Freeze
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    ldrh       r2,[r5,#0x1c]
    lsr        r2,r2,#0x1
    bcc        LAB_08056956
    bic        r0,r1
LAB_08056956:
    strb       r0,[r5,#0x0]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08056986
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x96
    lsl        r0,r0,#0x2
    strh       r0,[r5,#0x1c]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,familyFreeze
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08056986:
    pop        {pc}

familyFreeze:
    .byte 0xC0, 0x02, 0x9D, 0x00


_ts R_PlayerB_6_2_Break
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0805699c
    mov        r3,#0x1c
    ldrsh      r0,[r5,r3]
    tst        r0,r0
    bpl        LAB_080569fa
LAB_0805699c:
    mov        r0,#0x20
    bl         ActorPlayer_ClearStatus
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    bl         R_Player_ClearAttack
    mov        r0,#0x95
    bl         Sound_PlaySongImmediate
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x7
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x2
    bl         Effect_CubeBreak_Create
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x7
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x2
    bl         Effect_CubeBreak_Create
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    mov        r0,#0x8
    bl         ActorPlayer_SetFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x0
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080569fa:
    pop        {pc}


_ts dummy_569fc
    push       {lr}
    pop        {pc}
    .byte 0xF3

    .align 2, 0



_ts R_PlayerB_7_Drain
    push       {lr}
    LoadMain frameCounter, r7, r7
    ldrh       r0,[r7,#0x0]
    lsr        r0,r0,#0x2
    bcc        LAB_08056a14
    bl         SpritePtr_SetFlashPalette
LAB_08056a14:
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_PlayerB_7_0_StartWait_08056a28
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_PlayerB_7_0_StartWait_08056a20:
    .word R_PlayerB_7_0_StartWait
    .word R_PlayerB_7_1_Wait

PTR_PTR_R_PlayerB_7_0_StartWait_08056a28:
    .word PTR_R_PlayerB_7_0_StartWait_08056a20


_ts R_PlayerB_7_0_StartWait
    push       {lr}
    ldrb       r0,[r5,#0x16]
    bl         R_Player_ResetPlayerDefenseState
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_PlayerB_7_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08056a74
    mov        r0,#0x80
    bl         ActorPlayer_ClearStatus
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    mov        r0,#0x8
    bl         ActorPlayer_SetFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
    mov        r0,#0x0
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08056a74:
    pop        {pc}


_nt R_PlayerC_0_CheckMove
    push       {lr}
    mov        r3,#0x70
    ldrh       r0,[r5,r3]
    bl         R_Player_IsMoving
    tst        r0,r0
    beq        LAB_08056a92
    mov        r0,#0xb
    bl         ActorPlayer_ClearFlag_1
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Enable
LAB_08056a92:
    pop        {pc}


_ts R_PlayerC_1_StartMove
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    mov        r3,#0x64
    strh       r0,[r5,r3]
    pop        {pc}

    .align 2, 0



_ts R_PlayerC_2_ChangePos
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08056af4
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x10]
    ldr        r7,PTR_cellDirToOffset_08056af8
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r5,#0x18]
    mov        r2,#0x0
    ldrsb      r2,[r7,r2]
    add        r0,r0,r2
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x1
    ldrsb      r2,[r7,r2]
    add        r1,r1,r2
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0xc
    mov        r3,#0x64
    strh       r0,[r5,r3]
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0x2]
    add        r0,#0x1
    lsr        r1,r0,#0x8
    neg        r1,r1
    orr        r0,r1
    strb       r0,[r7,#0x2]
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Disable
LAB_08056af4:
    pop        {pc}

    .align 2, 0


PTR_cellDirToOffset_08056af8:
    .word cellDirToOffset


_ts R_PlayerC_3_EndMove
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08056b2a
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x2
    bl         ActorPlayer_CheckStatus
    beq        LAB_08056b1e
    ldr        r7,[r5,#0x74]
    mov        r0,#0xa
    strb       r0,[r7,#0xe]
    bl         SpritePtr_SetFlashPalette
LAB_08056b1e:
    mov        r0,#0xf
    bl         ActorPlayer_SetFlag_1
    mov        r0,#0x0
    mov        r3,#0x64
    strh       r0,[r5,r3]
LAB_08056b2a:
    pop        {pc}


_ts R_Player_2_Free
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x44]
    bl         FieldObject_Free
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    bl         FieldObject_Free
    ldrb       r0,[r5,#0x16]
    bl         R_Player_ResetPlayerDefenseState
    LoadMain battle, r7, r7
    ldrb       r3,[r5,#0x16]
    add        r3,#0x4
    ldrb       r0,[r7,r3]
    sub        r0,#0x1
    strb       r0,[r7,r3]
    bl         Actor_Free
    pop        {pc}


_ts R_Player_IsMoving
    push       {lr}
    push       {r0}
    mov        r0,#0x58
    bl         ActorPlayer_CheckStatus
    pop        {r0}
    bne        LAB_08056b9e
    push       {r0}
    mov        r0,#0x1
    bl         ActorPlayer_CheckFlag_1
    pop        {r0}
    beq        LAB_08056b9e
    mov        r1,#0x20
    tst        r0,r1
    beq        LAB_08056b9e
    push       {r0}
    mov        r2,#0xf
    and        r0,r2
    strb       r0,[r5,#0x10]
    bl         R_Player_CanMove
    tst        r0,r0
    pop        {r0}
    beq        LAB_08056b9e
    mov        r0,#0xb
    bl         ActorPlayer_ClearFlag_1
    bl         R_Player_ClearChip
    mov        r0,#0x4
    mov        r3,#0x64
    strh       r0,[r5,r3]
    mov        r0,#0x1
    pop        {pc}
LAB_08056b9e:
    mov        r0,#0x0
    pop        {pc}


_nt FUN_08056ba2
    push       {lr}
    push       {r0}
    mov        r0,#0x8
    bl         ActorPlayer_CheckFlag_1
    pop        {r0}
    beq        LAB_08056bb6
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08056bba
LAB_08056bb6:
    mov        r1,#0x0
    pop        {pc}
LAB_08056bba:
    mov        r1,#0x8
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    mov        r1,#0x1
    pop        {pc}


_nt BC_Buster_GetTargetDist
    push       {lr}
    bl         Battle_EntitySpriteCoordsToCell
    mov        r2,#0x0
    push       {r0,r1,r2}
    bl         Field_GetAttackDirectionOffset_MP
    add        r4,r0,#0x0
    pop        {r0,r1,r2}
    add        r0,r0,r4
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_08056c00
    ldr        r6,[r7,r3]
LAB_08056be2:
    sub        r3,r0,#0x1
    cmp        r3,#0x5
    bhi        LAB_08056bfc
    push       {r0,r1,r2,r4,r6}
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r4,r6}
    tst        r7,r6
    bne        LAB_08056bfc
    add        r2,#0x1
    add        r0,r0,r4
    b          LAB_08056be2
LAB_08056bfc:
    add        r0,r2,#0x0
    pop        {pc}

PTR_PanelFlag_ARRAY_08056c00:
    .word PanelFlag_ARRAY_08056c04

PanelFlag_ARRAY_08056c04:
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid


_ts UpdateAttackButtonState
    push       {lr}
    mov        r0,#0x0
    ldr        r7,[r5,#0x74]
    ldrh       r1,[r7,#0x1e]
    ldrh       r2,[r7,#0x20]
    ldrh       r3,[r7,#0x24]
    mov        r4,#0xf0
    and        r4,r1
    beq        LAB_08056c2c
    lsr        r4,r4,#0x4
    ldr        r7,PTR_dpadInputFilter_08056c80
    ldrb       r4,[r7,r4]
    orr        r0,r4
    beq        LAB_08056c2c
    mov        r4,#0x20
    orr        r0,r4
LAB_08056c2c:
    ldr        r7,[r5,#0x74]
    ldrb       r4,[r7,#0x8]
    tst        r4,r4
    bne        LAB_08056c64
    ldrb       r4,[r7,#0xb]
    tst        r4,r4
    beq        LAB_08056c64
    mov        r4,#0x2
    tst        r2,r4
    beq        LAB_08056c4c
    mov        r4,#0x2
    lsl        r4,r4,#0x8
    orr        r0,r4
    mov        r4,#0x40
    orr        r0,r4
    b          LAB_08056c70
LAB_08056c4c:
    tst        r1,r4
    beq        LAB_08056c58
    mov        r4,#0x2
    lsl        r4,r4,#0x8
    orr        r0,r4
    b          LAB_08056c70
LAB_08056c58:
    tst        r3,r4
    beq        LAB_08056c70
    mov        r4,#0x8
    lsl        r4,r4,#0x8
    orr        r0,r4
    b          LAB_08056c70
LAB_08056c64:
    mov        r4,#0x2
    tst        r2,r4
    beq        LAB_08056c70
    mov        r4,#0x8
    lsl        r4,r4,#0x8
    orr        r0,r4
LAB_08056c70:
    mov        r4,#0x1
    tst        r2,r4
    beq        LAB_08056c7a
    mov        r4,#0x80
    orr        r0,r4
LAB_08056c7a:
    mov        r3,#0x70
    strh       r0,[r5,r3]
    pop        {pc}

PTR_dpadInputFilter_08056c80:
    .word dpadInputFilter


_ts R_Player_HandleBusterCharge
    push       {lr}
    mov        r0,#0x4
    bl         ActorPlayer_CheckFlag_1
    beq        LAB_08056cf4
    mov        r0,#0x18
    bl         ActorPlayer_CheckStatus
    bne        LAB_08056cf4
    mov        r3,#0x70
    ldrh       r0,[r5,r3]
    ldr        r1,DAT_08056d18
    tst        r0,r1
    beq        LAB_08056cf4
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0xb]
    tst        r0,r0
    beq        LAB_08056cf4
    ldr        r7,[r5,#0x74]
    ldrh       r1,[r7,#0x10]
    cmp        r1,r1
    bne        LAB_08056cd4
    ldrh       r0,[r7,#0x14]
    cmp        r0,#0xa
    beq        LAB_08056cbc
    add        r0,#0x1
    strh       r0,[r7,#0x14]
    b          LAB_08056d10
LAB_08056cbc:
    ldr        r0,[r5,#0x78]
    tst        r0,r0
    bne        LAB_08056cd4
    push       {r1,r7}
    mov        r4,#0x0
    bl         Attack_Charging_Create
    str        r7,[r5,#0x78]
    mov        r0,#0xb5
    bl         Sound_PlaySongImmediate
    pop        {r1,r7}
LAB_08056cd4:
    ldrb       r0,[r7,#0xb]
    lsl        r0,r0,#0x1
    ldr        r6,PTR_SHORT_ARRAY_08056d14
    ldrh       r0,[r6,r0]
    add        r1,r1,r0
    lsr        r0,r1,#0x10
    neg        r0,r0
    lsr        r0,r0,#0x10
    orr        r1,r0
    strh       r1,[r7,#0x10]
    add        r0,r1,#0x0
    bl         Player_GetChargeStrength
    ldr        r7,[r5,#0x78]
    strb       r0,[r7,#0x14]
    pop        {pc}
LAB_08056cf4:
    mov        r0,#0x0
    ldr        r7,[r5,#0x74]
    strh       r0,[r7,#0x10]
    strh       r0,[r7,#0x14]
    ldr        r0,[r5,#0x78]
    tst        r0,r0
    beq        LAB_08056d10
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x78]
LAB_08056d10:
    pop        {pc}

    .align 2, 0


PTR_SHORT_ARRAY_08056d14:
    .word SHORT_ARRAY_08058bde

DAT_08056d18:
    .word 0x200


_ts Player_GetChargeStrength
    lsl        r0,r0,#0x10
    bpl        LAB_08056d32
    asr        r0,r0,#0x10
    add        r0,#0x1
    beq        LAB_08056d2c
    mov        r0,#0x1
    ldr        r1,DAT_08056d3c
    mov        pc,lr
LAB_08056d2c:
    mov        r0,#0x2
    ldr        r1,DAT_08056d40
    mov        pc,lr
LAB_08056d32:
    mov        r0,#0x0
    ldr        r1,DAT_08056d38
    mov        pc,lr

DAT_08056d38:
    .word 0x10000

DAT_08056d3c:
    .word 0x80000

DAT_08056d40:
    .word 0x100000


_ts R_Player_ShowActivePAInfo
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldrh       r2,[r7,#0x1a]
    sub        r2,#0x1
    bmi        LAB_08056d7a
    strh       r2,[r7,#0x1a]
    push       {r2,r5}
    bl         Battle_GetEntryState
    pop        {r2,r5}
    tst        r0,r0
    bne        LAB_08056d7a
    push       {r2,r5}
    ldrb       r0,[r5,#0x16]
    add        r0,#0x8
    bl         BattleMessage_Main
    pop        {r2,r5}
    tst        r2,r2
    bne        LAB_08056d7a
    push       {r5}
    ldrb       r0,[r5,#0x16]
    add        r0,#0x8
    bl         BattleMessage_Disable
    pop        {r5}
    pop        {pc}
LAB_08056d7a:
    ldr        r7,[r5,#0x74]
    ldrb       r3,[r7,#0x7]
    mov        r0,#0x60
    add        r0,r0,r7
    ldrb       r0,[r0,r3]
    cmp        r0,#0xff
    beq        LAB_08056da4
    push       {r5}
    bl         Battle_GetEntryState
    pop        {r5}
    tst        r0,r0
    bne        LAB_08056da4
    push       {r5}
    bl         R_Player_GetBetaSigmaChipCount
    ldrb       r0,[r5,#0x16]
    add        r0,#0xa
    bl         BattleMessage_Main
    pop        {r5}
LAB_08056da4:
    pop        {pc}


_nt R_Player_GetBetaSigmaChipCount
    mov        r2,#0x0
    ldr        r7,[r5,#0x74]
    ldrb       r3,[r7,#0x7]
    add        r7,#0x60
LAB_08056dae:
    ldrb       r1,[r7,r3]
    cmp        r1,#0xff
    beq        LAB_08056dba
    add        r2,#0x1
    add        r3,#0x1
    b          LAB_08056dae
LAB_08056dba:
    mov        pc,lr


_ts R_Player_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08056e48
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_08056e4a
    bl         R_Player_CheckBubbleShieldRespawn
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_08056de2
    sub        r0,#0x1
    strb       r0,[r7,#0x0]
    lsr        r0,r0,#0x2
    bcc        LAB_08056de2
    bl         SpritePtr_SetFlashPalette
LAB_08056de2:
    mov        r0,#0x0
    ldr        r7,[r5,#0x74]
    strh       r0,[r7,#0x2a]
    str        r0,[r7,#0x5c]
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_08056e4a
    bl         R_Player_CalculateDamage
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x5c]
    mov        r1,#0x2
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_08056e0c
    push       {r0}
    mov        r0,#0xc8
    bl         Field_AddHp
    pop        {r0}
LAB_08056e0c:
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x2a]
    ldrb       r1,[r7,#0xe]
    add        r0,r0,r1
    strh       r0,[r7,#0x2a]
    tst        r0,r0
    beq        LAB_08056e48
    mov        r1,#0x0
    strb       r1,[r7,#0xe]
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x2a]
    bl         Field_SubtractHP
    tst        r1,r1
    beq        LAB_08056e4a
    bl         SpritePtr_SetFlashPalette
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0x3]
    add        r0,#0x1
    lsr        r1,r0,#0x8
    neg        r1,r1
    orr        r0,r1
    strb       r0,[r7,#0x3]
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    ldr        r7,PTR_PTR_FUN_08056f7e_08056e8c
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
LAB_08056e48:
    pop        {pc}
LAB_08056e4a:
    mov        r1,#0x1
    strb       r1,[r5,#0x17]
    mov        r0,#0x4
    bl         ActorPlayer_SetStatus
    bl         Battle_DecreaseOpponentCount
    ldr        r0,[r5,#0x74]
    ldr        r0,[r0,#0x44]
    bl         FieldObject_SetDeletedFlag
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    bl         R_Player_ClearChip
    bl         FUN_080572c8
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

PTR_FUN_08056f7e_08056e7c:
    .word FUN_08056f7e
    .word FUN_08057000
    .word FUN_0805702c
    .word dummy_5703a

PTR_PTR_FUN_08056f7e_08056e8c:
    .word PTR_FUN_08056f7e_08056e7c


_ts R_Player_CalculateDamage
    push       {lr}
    mov        r0,#0xa
    ldr        r1,[r5,#0x74]
    ldr        r1,[r1,#0x44]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08056f0c
    ldr        r1,[r5,#0x74]
    str        r0,[r1,#0x5c]
    mov        r0,#0x0
    orr        r0,r2
    orr        r0,r3
    orr        r0,r4
    orr        r0,r6
    orr        r0,r7
    beq        LAB_08056f0c
    mov        r0,#0x68
    ldrb       r0,[r5,r0]
    tst        r0,r0
    bne        LAB_08056f0e
    bl         R_Player_CheckShield
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageTaken
    tst        r0,r0
    beq        LAB_08056f0c
    push       {r0}
    mov        r0,#0x40
    bl         ActorPlayer_CheckStatus
    pop        {r0}
    beq        LAB_08056ed8
    add        r0,#0x7
    lsr        r0,r0,#0x3
LAB_08056ed8:
    ldr        r7,[r5,#0x74]
    strh       r0,[r7,#0x2a]
    mov        r0,#0x80
    bl         ActorPlayer_CheckStatus
    bne        LAB_08056f1a
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_08056f1a
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_08056f1a
    ldrb       r0,[r7,#0xd]
    cmp        r0,#0x3
    bne        LAB_08056f00
    mov        r3,#0x66
    ldrb       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_08056f1a
    b          LAB_08056f04
LAB_08056f00:
    tst        r0,r0
    bne        LAB_08056f1a
LAB_08056f04:
    mov        r0,#0x1
    bl         ActorPlayer_CheckStatus
    bne        LAB_08056f1a
LAB_08056f0c:
    pop        {pc}
LAB_08056f0e:
    ldr        r7,[r5,#0x74]
    ldr        r7,[r7,#0x54]
    tst        r7,r7
    beq        LAB_08056f1a
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
LAB_08056f1a:
    ldr        r7,[r5,#0x74]
    mov        r0,#0x0
    strh       r0,[r7,#0x2a]
    pop        {pc}


_nt R_Player_CheckShield
    push       {lr}
    mov        r0,#0x63
    ldrsb      r0,[r5,r0]
    tst        r0,r0
    bmi        LAB_08056f36
    bl         R_Actor_IsShieldPopped
    tst        r0,r0
    beq        LAB_08056f7c
    b          LAB_08056f74
LAB_08056f36:
    add        r1,r0,#0x1
    bpl        LAB_08056f7c
    lsl        r1,r0,#0x18
    lsr        r1,r1,#0x18
    cmp        r1,#0x82
    bne        LAB_08056f5c
    add        r0,r2,#0x0
    add        r0,r0,r3
    add        r0,r0,r6
    add        r0,r0,r7


_nt FUN_08056f4a
    push       {r2,r3,r4,r6,r7}
    bl         Field_AddHp
    pop        {r2,r3,r4,r6,r7}
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r6,#0x0
    mov        r7,#0x0
    b          LAB_08056f74
LAB_08056f5c:
    cmp        r1,#0x81
    bne        LAB_08056f6a
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r6,#0x0


_nt FUN_08056f66
    mov        r7,#0x0
    b          LAB_08056f74
LAB_08056f6a:
    mov        r2,#0x0
    mov        r3,#0x0


_nt FUN_08056f6e
    mov        r4,#0x0
    mov        r6,#0x0
    mov        r7,#0x0
LAB_08056f74:
    push       {r2,r3,r4,r6,r7}


_nt FUN_08056f76
    bl         R_Player_CheckBubbleShieldPop


_nt FUN_08056f7a
    pop        {r2,r3,r4,r6,r7}
LAB_08056f7c:
    pop        {pc}


_nt FUN_08056f7e
    push       {lr}
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x40
    bl         ActorPlayer_CheckStatus
    bne        LAB_08056ffa
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    bl         R_Player_ClearChip
    bl         FUN_080572c8
    mov        r1,#0x1
    strb       r1,[r5,#0x17]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x5c]
    mov        r1,#0x1
    lsl        r1,r1,#0x18
    tst        r0,r1
    beq        LAB_08056fba
    mov        r0,#0x80
    bl         ActorPlayer_SetStatus
    b          LAB_08056ffa
LAB_08056fba:
    mov        r1,#0x20
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_08056fca
    mov        r0,#0x20
    bl         ActorPlayer_SetStatus
    b          LAB_08056ffa
LAB_08056fca:
    mov        r1,#0x80
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_08056fda
    ldrb       r0,[r5,#0x16]
    bl         R_Player_ApplyNumbStatus
    b          LAB_08056ffa
LAB_08056fda:
    mov        r1,#0x1
    lsl        r1,r1,#0x18
    tst        r0,r1
    beq        LAB_08056fea
    mov        r0,#0x80
    bl         ActorPlayer_SetStatus
    b          LAB_08056ffa
LAB_08056fea:
    mov        r1,#0x80
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_08056ffa
    bl         FUN_0805703e
    mov        r0,#0x3
    strb       r0,[r5,#0x17]
LAB_08056ffa:
    pop        {pc}
    .word PF_Ground | PF_PlayerOccupied | PF_Player | PF_Deleted


_ts FUN_08057000
    push       {lr}
    mov        r0,#0x20
    bl         ActorPlayer_ClearStatus
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    bl         R_Player_ClearChip
    bl         FUN_080572c8
    mov        r0,#0x0
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
    .byte 0x00
    .byte 0xBD


_ts FUN_0805702c
    push       {lr}
    bl         SpritePtr_SetFlashPalette
    ldr        r7,[r5,#0x74]
    mov        r0,#0x4e
    strb       r0,[r7,#0x0]
    pop        {pc}


_nt dummy_5703a
    push       {lr}
    pop        {pc}


_nt FUN_0805703e
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    neg        r0,r0
    ldrb       r2,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    add        r0,r0,r2
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    ldr        r7,PTR_DAT_080570ac
    ldrb       r4,[r5,#0x16]
    lsl        r4,r4,#0x2
    ldr        r3,[r7,r4]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08057090
    ldr        r7,PTR_PanelFlag_ARRAY_080570b0
    ldr        r3,[r7,r4]
    tst        r2,r3
    bne        LAB_08057090
    ldr        r7,[r5,#0x74]
    ldr        r7,[r7,#0x48]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r1,DAT_080570b4
    mul        r1,r0
    str        r1,[r5,#0x44]
    ldr        r1,DAT_080570b8
    mul        r1,r0
    str        r1,[r5,#0x4c]
    pop        {pc}
LAB_08057090:
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    strb       r1,[r0,#0x4]
    strb       r2,[r0,#0x5]
    strb       r1,[r0,#0x2]
    strb       r2,[r0,#0x3]
    bl         FieldObject_Enable
    mov        r0,#0x0
    str        r0,[r5,#0x44]
    pop        {pc}

    .align 2, 0


PTR_DAT_080570ac:
    .word DAT_080570bc

PTR_PanelFlag_ARRAY_080570b0:
    .word PanelFlag_ARRAY_080570c4

DAT_080570b4:
    .word 0xFFF60000

DAT_080570b8:
    .word 0x14000

DAT_080570bc:
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x03

    .align 2, 0


PanelFlag_ARRAY_080570c4:
    .word PF_EnemyTerritory | PF_PlayerOccupied | PF_Teleporting | PF_Solid | PF_Sealed
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed


_ts R_Player_SetElement
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0xf]
    ldr        r7,PTR_ElementID_ARRAY_080570d8
    ldrb       r0,[r7,r0]
    strb       r0,[r5,#0x1a]
    mov        pc,lr

PTR_ElementID_ARRAY_080570d8:
    .word ElementID_ARRAY_080570dc

ElementID_ARRAY_080570dc:
    element None
    element Elec
    element Fire
    element Water
    element Wood

    .align 2, 0



_ts R_Player_CheckBubbleShieldRespawn
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0xc]
    tst        r0,r0
    beq        LAB_08057118
    mov        r3,#0x63
    ldrsb      r1,[r5,r3]
    add        r1,#0x1
    bne        LAB_08057118
    ldrh       r1,[r7,#0x2c]
    add        r1,#0x1
    strh       r1,[r7,#0x2c]
    ldr        r6,PTR_listBubbleShieldTimer_0805711c
    ldrb       r0,[r6,r0]
    cmp        r1,r0
    bmi        LAB_08057118
    mov        r1,#0x0
    strh       r1,[r7,#0x2c]
    ldrb       r4,[r7,#0xc]
    bl         Attack_Aura_Create
    ldr        r6,[r5,#0x74]
    str        r7,[r6,#0x40]
    mov        r0,#0x81
    mov        r3,#0x63
    strb       r0,[r5,r3]
LAB_08057118:
    pop        {pc}

    .align 2, 0


PTR_listBubbleShieldTimer_0805711c:
    .word listBubbleShieldTimer


_ts R_Player_CheckIronBodyStatus
    push       {lr}
    mov        r0,#0x40
    bl         ActorPlayer_CheckStatus
    beq        LAB_08057146
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x2e]
    sub        r0,#0x1
    strh       r0,[r7,#0x2e]
    bne        LAB_08057146
    ldrb       r0,[r5,#0x16]
    push       {r0}
    bl         R_Player_ResetPlayerDefenseState
    pop        {r0}
    mov        r1,#0x3c
    mov        r2,#0x1
    bl         R_Player_SetInvisible
LAB_08057146:
    pop        {pc}


_ts R_Player_CheckNumbStatus
    push       {lr}
    mov        r0,#0x2
    bl         ActorPlayer_CheckStatus
    beq        LAB_08057162
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x30]
    sub        r0,#0x1
    strh       r0,[r7,#0x30]
    bne        LAB_08057162
    ldrb       r0,[r5,#0x16]
    bl         R_Player_ResetPlayerDefenseState
LAB_08057162:
    pop        {pc}


_ts FUN_08057164
    push       {lr}
    mov        r0,#0x26
    bl         Flag_GetEvent
    bne        LAB_08057176
    mov        r0,#0x32
    bl         Flag_GetEvent
    beq        LAB_08057180
LAB_08057176:
    mov        r0,#0x5
    ldr        r7,[r5,#0x74]
    strb       r0,[r7,#0x9]
    strb       r0,[r7,#0xa]
    strb       r0,[r7,#0xb]
LAB_08057180:
    pop        {pc}

    .align 2, 0



_ts ActorPlayer_SetStatus
    mov        r3,#0x6c
    ldrh       r1,[r5,r3]
    orr        r1,r0
    strh       r1,[r5,r3]
    mov        pc,lr


_nt ActorPlayer_ClearStatus
    mov        r3,#0x6c
    ldrh       r1,[r5,r3]
    bic        r1,r0
    strh       r1,[r5,r3]
    mov        pc,lr


_ts ActorPlayer_CheckStatus
    mov        r3,#0x6c
    ldrh       r1,[r5,r3]
    tst        r1,r0
    mov        pc,lr


_ts ActorPlayer_SetFlagDirect_1
    mov        r3,#0x6e
    strh       r0,[r5,r3]
    mov        pc,lr


_nt ActorPlayer_SetFlag_1
    mov        r3,#0x6e
    ldrh       r1,[r5,r3]
    orr        r1,r0
    strh       r1,[r5,r3]
    mov        pc,lr


_ts ActorPlayer_ClearFlag_1
    mov        r3,#0x6e
    ldrh       r1,[r5,r3]
    bic        r1,r0
    strh       r1,[r5,r3]
    mov        pc,lr


_nt ActorPlayer_CheckFlag_1
    mov        r3,#0x6e
    ldrh       r1,[r5,r3]
    tst        r1,r0
    mov        pc,lr


_nt R_Player_CanMove
    push       {lr}
    push       {r0}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    pop        {r0}
    ldr        r7,PTR_cellDirToOffset_08057214
    add        r0,r0,r0
    add        r7,r7,r0
    ldrb       r0,[r5,#0x18]
    mov        r2,#0x0
    ldrsb      r2,[r7,r2]
    add        r0,r0,r2
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x1
    ldrsb      r2,[r7,r2]
    add        r1,r1,r2
    ldr        r7,[r5,#0x74]
    ldr        r7,[r7,#0x48]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         Field_GetPanelFlags
    ldrb       r2,[r5,#0x16]
    lsl        r2,r2,#0x2
    ldr        r1,PTR_listPlayerMoveExclude_0805721c
    ldr        r1,[r1,r2]
    tst        r0,r1
    bne        LAB_0805720e
    ldr        r1,PTR_listPlayerMoveInclude_08057218
    ldr        r1,[r1,r2]
    and        r0,r1
    cmp        r0,r1
    bne        LAB_0805720e
    mov        r0,#0x1
    pop        {pc}
LAB_0805720e:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_cellDirToOffset_08057214:
    .word cellDirToOffset

PTR_listPlayerMoveInclude_08057218:
    .word listPlayerMoveInclude

PTR_listPlayerMoveExclude_0805721c:
    .word listPlayerMoveExclude

listPlayerMoveInclude:
    .word PF_Walkable
    .word PF_Walkable | PF_EnemyTerritory

listPlayerMoveExclude:
    .word PF_EnemyTerritory | PF_PlayerOccupied | PF_Teleporting | PF_Solid | PF_Sealed
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed


_ts R_Player_ClearAttack
    push       {lr}
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_08057246
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
LAB_08057246:
    pop        {pc}


_ts R_Player_EndShield
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x54]
    tst        r0,r0
    beq        LAB_0805725a
    mov        r1,#0x2
    strb       r1,[r0,#0x5]
    mov        r0,#0x0
    str        r0,[r7,#0x54]
LAB_0805725a:
    mov        r0,#0x0
    mov        r3,#0x68
    strb       r0,[r5,r3]
    pop        {pc}


_nt R_Player_CheckBubbleShieldPop
    push       {lr}
    ldr        r6,[r5,#0x74]
    ldr        r0,[r6,#0x40]
    tst        r0,r0
    beq        LAB_0805728c
    mov        r1,#0x1
    strb       r1,[r0,#0x5]
    mov        r0,#0x0
    str        r0,[r6,#0x40]
    mov        r3,#0x63
    ldrb       r0,[r5,r3]
    cmp        r0,#0x81
    bne        LAB_0805728c
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x27
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
LAB_0805728c:
    mov        r0,#0xff
    mov        r3,#0x63
    strb       r0,[r5,r3]
    pop        {pc}


_ts R_Player_ClearOwnedEntity
    LoadMain playerBattleState, r7, r7
    tst        r0,r0
    beq        LAB_0805729e
    add        r7,#0x70
LAB_0805729e:
    ldr        r0,[r7,#0x50]
    tst        r0,r0
    beq        LAB_080572b4
    mov        r1,#0x1
    strb       r1,[r0,#0x5]
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x4
    orr        r1,r2
    strb       r1,[r0,#0x0]
    mov        r0,#0x0
    str        r0,[r7,#0x50]
LAB_080572b4:
    mov        pc,lr


_nt R_Player_ClearChip
    push       {lr}
    mov        r3,#0x66
    mov        r0,#0x0
    strh       r0,[r5,r3]
    bl         R_Player_ClearAttack
    bl         R_Player_EndShield
    pop        {pc}


_ts FUN_080572c8
    push       {lr}
    mov        r3,#0x64
    mov        r0,#0x0
    strh       r0,[r5,r3]
    pop        {pc}


_nt ScreenDim_HidePlayer
    LoadMain battle, r7, r7
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    mov        r2,#0x2
    ldrb       r1,[r7,#0x0]
    bic        r1,r2
    strb       r1,[r7,#0x0]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    beq        LAB_080572f0
    ldrb       r1,[r0,#0x0]
    bic        r1,r2
    strb       r1,[r0,#0x0]
LAB_080572f0:
    ldr        r6,[r7,#0x74]
    ldr        r0,[r6,#0x40]
    tst        r0,r0
    beq        LAB_080572fe
    ldrb       r1,[r0,#0x0]
    bic        r1,r2
    strb       r1,[r0,#0x0]
LAB_080572fe:
    mov        pc,lr


_ts FUN_08057300
    LoadMain battle, r7, r7
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    mov        r2,#0x2
    ldrb       r1,[r7,#0x0]
    orr        r1,r2
    strb       r1,[r7,#0x0]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    beq        LAB_0805731e
    ldrb       r1,[r0,#0x0]
    orr        r1,r2
    strb       r1,[r0,#0x0]
LAB_0805731e:
    ldr        r6,[r7,#0x74]
    ldr        r0,[r6,#0x40]
    tst        r0,r0
    beq        LAB_0805732c
    ldrb       r1,[r0,#0x0]
    orr        r1,r2
    strb       r1,[r0,#0x0]
LAB_0805732c:
    mov        pc,lr


_nt DisableZetaOmegaTimer
    push       {lr}
    LoadMain playerBattleState, r7, r7
    tst        r0,r0
    beq        LAB_0805733a
    add        r7,#0x70
LAB_0805733a:
    ldrh       r1,[r7,#0x1a]
    tst        r1,r1
    beq        LAB_0805734e
    push       {r5,r7}
    add        r0,#0x8
    bl         BattleMessage_Disable
    pop        {r5,r7}
    mov        r0,#0x0
    strh       r0,[r7,#0x1a]
LAB_0805734e:
    pop        {pc}


_ts Routine_IsPlayerFrozen
    push       {r5,lr}
    LoadMain battle, r7, r7
    ldr        r5,[r7,#0x40]
    mov        r0,#0x20
    bl         ActorPlayer_CheckStatus
    beq        LAB_08057364
    mov        r0,#0x1
    pop        {r5,pc}
LAB_08057364:
    mov        r0,#0x0
    pop        {r5,pc}


_ts Routine_IsPlayerInvulnerable
    LoadMain battle, r0, r0
    ldr        r0,[r0,#0x40]
    ldrb       r0,[r0,#0x17]
    mov        pc,lr


_nt Routine_IsPlayerDrainActive
    push       {r5,lr}
    LoadMain battle, r7, r7
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r5,[r7,r0]
    mov        r0,#0x80
    bl         ActorPlayer_CheckStatus
    beq        LAB_0805738a
    mov        r0,#0x1
    pop        {r5,pc}
LAB_0805738a:
    mov        r0,#0x0
    pop        {r5,pc}


_nt Routine_ClearBetaSigmaTimer
    push       {lr}
    push       {r0}
    bl         DisableZetaOmegaTimer
    pop        {r0}
    LoadMain playerBattleState, r7, r7
    mov        r1,#0x70
    mul        r1,r0
    add        r7,r7,r1
    ldrb       r1,[r7,#0x7]
    add        r1,#0x60
    ldrb       r1,[r7,r1]
    cmp        r1,#0xff
    beq        LAB_080573b6
    push       {r5,r7}
    add        r0,#0xa
    bl         BattleMessage_Disable
    pop        {r5,r7}
LAB_080573b6:
    mov        r0,#0x0
    strb       r0,[r7,#0x7]
    mov        r0,#0x60
    add        r0,r0,r7
    mov        r1,#0xa
    mov        r2,#0xff
    bl         memset
    pop        {pc}


_ts R_Player_ClearBusterChip
    LoadMain playerBattleState, r7, r7
    mov        r1,#0x70
    mul        r0,r1
    add        r7,r7,r0
    mov        r0,#0x0
    strb       r0,[r7,#0x8]
    mov        pc,lr


_ts R_Player_SetVisibleEffect
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    beq        LAB_0805741e
    cmp        r0,#0x1
    bne        LAB_080573f2
    ldrh       r0,[r7,#0x1c]
    tst        r0,r0
    beq        LAB_08057414
    sub        r0,#0x1
    strh       r0,[r7,#0x1c]
    b          LAB_080573fa
LAB_080573f2:
    mov        r3,#0x66
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0805741e
LAB_080573fa:
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    bne        LAB_0805740a
    LoadMain frameCounter, r7, r7
    ldrh       r0,[r7,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_0805741e
LAB_0805740a:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08057414:
    mov        r0,#0x0
    strb       r0,[r7,#0xd]
    mov        r0,#0x92
    bl         Sound_PlaySongImmediate
LAB_0805741e:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Barrier_Activate
    push       {r5,lr}
    push       {r0,r1}
    add        r0,r1,#0x0
    bl         R_Player_ResetPlayerDefenseState
    pop        {r0,r1}
    LoadMain battle, r7, r7
    lsl        r1,r1,#0x2
    add        r1,#0x40
    ldr        r5,[r7,r1]
    add        r4,r0,#0x0
    push       {r4,r5}
    bl         Attack_Aura_Create
    pop        {r4,r5}
    tst        r7,r7
    beq        LAB_0805746a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    ldr        r6,[r5,#0x74]
    str        r7,[r6,#0x40]
    ldr        r7,PTR_listRespawnFamily_0805746c
    ldrb       r0,[r7,r4]
    strb       r0,[r6,#0xc]
    mov        r0,#0x0
    strh       r0,[r6,#0x2c]
    ldr        r7,PTR_listShieldId_08057470
    ldrb       r0,[r7,r4]
    mov        r3,#0x63
    strb       r0,[r5,r3]
LAB_0805746a:
    pop        {r5,pc}

PTR_listRespawnFamily_0805746c:
    .word listRespawnFamily

PTR_listShieldId_08057470:
    .word listShieldId

listRespawnFamily:
    .byte 0x00
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00

listShieldId:
    .byte ST_Barrier
    .byte ST_BubbleWrap
    .byte ST_BubbleWrap
    .byte ST_BubbleWrap
    .byte ST_LifeAura
    .byte ST_AquaAura
    .byte ST_FireAura
    .byte ST_WoodAura
    .byte ST_LeafShield

    .align 2, 0



_ts R_Player_SetInvisible
    push       {lr}
    push       {r0,r1,r2}
    bl         R_Player_ResetPlayerDefenseState
    pop        {r0,r1,r2}
    LoadMain battle, r7, r7
    add        r7,#0x40
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldr        r7,[r7,#0x74]
    strh       r1,[r7,#0x1c]
    strb       r2,[r7,#0xd]
    pop        {pc}


_ts R_Player_ApplyIronBody
    push       {r5,lr}
    push       {r0}
    bl         R_Player_ResetPlayerDefenseState
    pop        {r0}
    LoadMain battle, r7, r7
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r5,[r7,r0]
    ldr        r7,[r5,#0x74]
    ldr        r0,DAT_080574dc
    strh       r0,[r7,#0x2e]
    mov        r0,#0x40
    bl         ActorPlayer_SetStatus
    mov        r3,#0x62
    mov        r0,#0x8
    strb       r0,[r5,r3]
    mov        r0,#0x3
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_080574d4
    add        r0,#0x4
LAB_080574d4:
    bl         SpritePtr_SetPaletteIndex
    pop        {r5,pc}

    .align 2, 0


DAT_080574dc:
    .word 0x708


_ts R_Player_ApplyNumbStatus
    push       {r5,lr}
    push       {r0}
    bl         R_Player_ResetPlayerDefenseState
    pop        {r0}
    LoadMain battle, r7, r7
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r5,[r7,r0]
    ldr        r7,[r5,#0x74]
    ldr        r0,DAT_08057520
    strh       r0,[r7,#0x30]
    ldrb       r0,[r5,#0x16]
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,FamilyDetail_08057524
    bl         Attack_AnimationOnly_Create
    ldr        r6,[r5,#0x74]
    str        r7,[r6,#0x58]
    tst        r7,r7
    beq        LAB_08057518
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08057518:
    mov        r0,#0x2
    bl         ActorPlayer_SetStatus
    pop        {r5,pc}

DAT_08057520:
    .word 0x258

FamilyDetail_08057524:
    .byte 0x80, 0x00, 0x07, 0x01


_ts R_Player_SetChipActivationDelay
    push       {r5,lr}
    mov        r3,#0x69
    ldrb       r1,[r5,r3]
    cmp        r1,r0
    bcs        LAB_08057534
    strb       r0,[r5,r3]
LAB_08057534:
    pop        {r5,pc}


_nt R_Player_ClearIronBody
    push       {lr}
    ldr        r7,[r5,#0x74]
    mov        r0,#0x0
    strh       r0,[r7,#0x2e]
    mov        r0,#0x40
    push       {r0}
    bl         ActorPlayer_CheckStatus
    pop        {r0}
    beq        LAB_08057562
    bl         ActorPlayer_ClearStatus
    mov        r3,#0x62
    mov        r0,#0x0
    strb       r0,[r5,r3]
    mov        r0,#0x0
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0805755e
    mov        r0,#0x4
LAB_0805755e:
    bl         SpritePtr_SetPaletteIndex
LAB_08057562:
    pop        {pc}


_ts R_Player_ClearNumbStatus
    push       {lr}
    ldr        r7,[r5,#0x74]
    mov        r0,#0x0
    strh       r0,[r7,#0x30]
    mov        r0,#0x2
    bl         ActorPlayer_ClearStatus
    ldr        r7,[r5,#0x74]
    ldr        r6,[r7,#0x58]
    tst        r6,r6
    beq        LAB_08057588
    mov        r0,#0x0
    str        r0,[r7,#0x58]
    push       {r5}
    add        r5,r6,#0x0
    bl         Attack_Free
    pop        {r5}
LAB_08057588:
    pop        {pc}


_nt R_Player_ResetBusterAndShields
    push       {r5,lr}
    mov        r0,#0x0
    bl         R_Player_ClearBusterChip
    mov        r0,#0x1
    bl         R_Player_ClearBusterChip
    LoadMain battle, r7, r7
    push       {r7}
    ldr        r5,[r7,#0x40]
    tst        r5,r5
    beq        LAB_080575b6
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0xc]
    tst        r0,r0
    beq        LAB_080575b6
    mov        r0,#0x0
    strb       r0,[r7,#0xc]
    strh       r0,[r7,#0x2c]
    bl         R_Player_CheckBubbleShieldPop
LAB_080575b6:
    pop        {r7}
    ldr        r5,[r7,#0x44]
    tst        r5,r5
    beq        LAB_080575d0
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0xc]
    tst        r0,r0
    beq        LAB_080575d0
    mov        r0,#0x0
    strb       r0,[r7,#0xc]
    strh       r0,[r7,#0x2c]
    bl         R_Player_CheckBubbleShieldPop
LAB_080575d0:
    mov        r0,#0x0
    LoadMain battle, r7, r7
    ldr        r6,[r7,#0x40]
    tst        r6,r6
    beq        LAB_080575e8
    ldr        r6,[r6,#0x74]
    ldrb       r1,[r6,#0xd]
    cmp        r1,#0x1
    beq        LAB_080575e8
    strb       r0,[r6,#0xd]
    strh       r0,[r6,#0x1c]
LAB_080575e8:
    ldr        r6,[r7,#0x44]
    tst        r6,r6
    beq        LAB_080575fa
    ldr        r6,[r6,#0x74]
    ldrb       r1,[r6,#0xd]
    cmp        r1,#0x1
    beq        LAB_080575fa
    strb       r0,[r6,#0xd]
    strh       r0,[r6,#0x1c]
LAB_080575fa:
    pop        {r5,pc}


_ts R_Player_ResetPlayerDefenseState
    push       {r5,lr}
    LoadMain battle, r7, r7
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r5,[r7,r0]
    ldr        r7,[r5,#0x74]
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    strb       r0,[r7,#0xc]
    strb       r0,[r7,#0xd]
    strh       r0,[r7,#0x2c]
    strh       r0,[r7,#0x2e]
    strh       r0,[r7,#0x1c]
    bl         R_Player_CheckBubbleShieldPop
    bl         R_Player_ClearIronBody
    bl         R_Player_ClearNumbStatus
    ldr        r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    pop        {r5,pc}


_nt R_Player_SetPlayerPanelFlag
    push       {lr}
    mov        r0,#0x68
    ldrb       r0,[r5,r0]
    tst        r0,r0
    bne        LAB_08057666
    mov        r0,#0x63
    ldrsb      r0,[r5,r0]
    cmp        r0,#0xff
    bne        LAB_08057666
    mov        r0,#0x1
    bl         ActorPlayer_CheckStatus
    bne        LAB_08057666
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_08057666
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    bne        LAB_08057666
    ldr        r0,PTR_listActorPanelFlag_08057678
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r0,r1]
    ldr        r0,[r7,#0x44]
    bl         FieldObject_ClearPanelFlag
    pop        {pc}
LAB_08057666:
    ldr        r0,PTR_listActorPanelFlag_08057678
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r0,r1]
    ldr        r0,[r7,#0x44]
    bl         FieldObject_SetPanelFlag
    pop        {pc}

    .align 2, 0


PTR_listActorPanelFlag_08057678:
    .word listActorPanelFlag

listActorPanelFlag:
    .word PF_ActorPlayer
    .word PF_ActorEnemy


_ts R_Player_HandleBattleChip
    push       {lr}
    ldr        r7,PTR_listHandlerBattleChip_08057694
    mov        r3,#0x66
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_listHandlerBattleChip_08057694:
    .word listHandlerBattleChip

listHandlerBattleChip:
    .word BattleChip_None
    .word BattleChip_Buster
    .word BattleChip_Cannon
    .word BattleChip_Sword
    .word BattleChip_Bomb
    .word BattleChip_Shotgun
    .word BattleChip_MetGuard
    .word FUN_08057c06
    .word BattleChip_Shockwave
    .word BattleChip_TowerPunch
    .word BattleChip_Barrier
    .word BattleChip_XPanel
    .word BattleChip_Recover
    .word BattleChip_ScreenDim
    .word BattleChip_PoweredCannon
    .word BattleChip_ZetaOmegaPA
    .word BattleChip_Navi
    .word BattleChip_Arrow
    .word BattleChip_Hammer
    .word BattleChip_Dash
    .word BattleChip_BetaSigmaPA
    .word BattleChip_BusterChip
    .word BattleChip_Geddon
    .word BattleChip_WaveRatton
    .word BattleChip_IronShield
    .word BattleChip_Thunder
    .word BattleChip_RingZap
    .word BattleChip_BodyBurn
    .word BattleChip_Typhoon
    .word BattleChip_Gaia


_ts BattleChip_None
    mov        pc,lr


_nt BattleChip_Buster
    push       {lr}
    ldr        r7,PTR_PTR_BC_Buster_0_Init_08057724
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_BC_Buster_0_Init_08057724:
    .word PTR_BC_Buster_0_Init_08057728

PTR_BC_Buster_0_Init_08057728:
    .word BC_Buster_0_Init
    .word BC_Buster_1_Attack
    .word BC_Buster_2
    .word BC_Buster_3


_ts BC_Buster_0_Init
    push       {lr}
    mov        r0,#0x2
    strh       r0,[r5,#0x1e]
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_Buster_1_Attack
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080577b8
    mov        r0,#0x0
    ldr        r7,[r5,#0x74]
    ldrb       r1,[r7,#0x9]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_USHORT_ARRAY_ARRAY_080577c0
    add        r7,r7,r1
    ldrh       r6,[r7,#0x0]
    ldrh       r1,[r7,#0x2]
    bl         SWI_DivMod
    add        r6,r6,r0
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x12]
    bl         Player_GetChargeStrength
    mul        r6,r1
    lsr        r6,r6,#0x10
    add        r4,r0,#0x1
    push       {r4,r6}
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    pop        {r4,r6}
    ldrb       r2,[r5,#0x19]
    ldr        r3,[r5,#0x30]
    ldr        r7,DAT_080577c4
    add        r3,r3,r7
    bl         Attack_Buster_Create
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    bl         BC_Buster_GetTargetDist
    ldr        r7,[r5,#0x74]
    ldrb       r1,[r7,#0xa]
    lsl        r1,r1,#0x3
    add        r0,r0,r1
    ldr        r3,PTR_listBusterDelay_080577bc
    ldrb       r0,[r3,r0]
    strh       r0,[r5,#0x1e]
    mov        r3,#0x67
    mov        r0,#0x8
    strb       r0,[r5,r3]
LAB_080577b8:
    pop        {pc}

    .align 2, 0


PTR_listBusterDelay_080577bc:
    .word listBusterDelay

PTR_USHORT_ARRAY_ARRAY_080577c0:
    .word USHORT_ARRAY_ARRAY_08058bc6

DAT_080577c4:
    .word 0x180000


_ts BC_Buster_2
    push       {lr}
    mov        r0,#0x9
    bl         ActorPlayer_SetFlag_1
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080577f2
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    bl         R_Player_SetChipActivationDelay
    mov        r0,#0x2
    bl         ActorPlayer_SetFlag_1
    mov        r3,#0x67
    mov        r0,#0xc
    strb       r0,[r5,r3]
LAB_080577f2:
    pop        {pc}


_ts BC_Buster_3
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057802
    bl         R_Player_ResetChipUseState
LAB_08057802:
    pop        {pc}


_ts BattleChip_Cannon
    push       {lr}
    ldr        r7,PTR_PTR_BC_Cannon_0_Init_08057820
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_Cannon_0_Init_08057814:
    .word BC_Cannon_0_Init
    .word BC_Cannon_1_Attack
    .word BC_Cannon_2_End

PTR_PTR_BC_Cannon_0_Init_08057820:
    .word PTR_BC_Cannon_0_Init_08057814


_ts BC_Cannon_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r6,#0x28
    add        r6,r6,r5
    add        r7,r6,#0x0
    ldmia      r6!,{r1,r2,r3}
    ldr        r4,DAT_08057870
    mov        r0,#0x61
    ldrb       r0,[r5,r0]
    orr        r4,r0
    ldrb       r0,[r5,#0x16]
    push       {r7}
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    pop        {r7}
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x3
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x7
    orr        r4,r0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xf
    strh       r0,[r5,#0x1e]
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}

    .align 2, 0


DAT_08057870:
    .word 0x6D0000


_ts BC_Cannon_1_Attack
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080578a0
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    ldr        r3,[r5,#0x30]
    ldr        r4,DAT_080578b8
    add        r3,r3,r4
    mov        r4,#0x61
    ldrb       r4,[r5,r4]
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    bl         Attack_Buster_Create
    mov        r0,#0x74
    bl         Sound_PlaySongImmediate
LAB_080578a0:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080578b4
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r3,#0x67
    mov        r0,#0x8
    strb       r0,[r5,r3]
LAB_080578b4:
    pop        {pc}

    .align 2, 0


DAT_080578b8:
    .word 0x180000


_ts BC_Cannon_2_End
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080578cc
    bl         R_Player_ResetChipUseState
LAB_080578cc:
    pop        {pc}


_nt BattleChip_Sword
    push       {lr}
    ldr        r7,PTR_PTR_BC_Sword_0_Init_080578f0
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_Sword_0_Init_080578e0:
    .word BC_Sword_0_Init
    .word BC_Sword_1
    .word BC_Sword_2
    .word BC_Sword_3

PTR_PTR_BC_Sword_0_Init_080578f0:
    .word PTR_BC_Sword_0_Init_080578e0


_ts BC_Sword_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x61
    ldrb       r0,[r5,r0]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_FamilyDetail_ARRAY_0805793c
    ldr        r4,[r7,r0]
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x61
    ldrb       r0,[r5,r0]
    cmp        r0,#0x9
    bne        LAB_0805792e
    ldrh       r0,[r5,#0x20]
    ldrh       r1,[r5,#0x22]
    sub        r1,r1,r0
    ldr        r7,[r5,#0x74]
    strh       r1,[r7,#0x18]
LAB_0805792e:
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}

PTR_FamilyDetail_ARRAY_0805793c:
    .word FamilyDetail_ARRAY_08057940

FamilyDetail_ARRAY_08057940:
    .byte 0x00, 0x00, 0x6C, 0x00
    .byte 0x00, 0x00, 0x6C, 0x00
    .byte 0x00, 0x00, 0x6C, 0x00
    .byte 0x00, 0x00, 0x92, 0x00
    .byte 0x00, 0x00, 0x93, 0x00
    .byte 0x00, 0x00, 0x94, 0x00
    .byte 0x00, 0x00, 0x6C, 0x00
    .byte 0x00, 0x00, 0x6C, 0x00
    .byte 0x00, 0x00, 0x6C, 0x00
    .byte 0x00, 0x00, 0x6C, 0x00


_ts BC_Sword_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805798e
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x61
    ldrb       r4,[r5,r4]
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    ldrb       r0,[r7,#0x6]
    bl         Attack_Sword_Create
    mov        r3,#0x67
    mov        r0,#0x8
    strb       r0,[r5,r3]
LAB_0805798e:
    pop        {pc}


_ts BC_Sword_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080579a6
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r3,#0x67
    mov        r0,#0xc
    strb       r0,[r5,r3]
LAB_080579a6:
    pop        {pc}


_ts BC_Sword_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080579b8
    bl         R_Player_ResetChipUseState
LAB_080579b8:
    pop        {pc}


_nt BattleChip_Bomb
    push       {lr}
    ldr        r7,PTR_PTR_BC_Bomb_0_Init_080579d8
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_Bomb_0_Init_080579cc:
    .word BC_Bomb_0_Init
    .word BC_Bomb_1_Main
    .word BC_Bomb_2_Free

PTR_PTR_BC_Bomb_0_Init_080579d8:
    .word PTR_BC_Bomb_0_Init_080579cc


_ts BC_Bomb_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0xa
    strb       r0,[r5,#0x14]
    mvn        r0,r0
    strb       r0,[r5,#0x15]
    mov        r4,#0x61
    ldrb       r4,[r5,r4]
    cmp        r4,#0x4
    beq        LAB_08057a18
    mov        r7,#0x28
    add        r7,r5,r7
    ldmia      r7!,{r1,r2,r3}
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    ldrb       r0,[r7,#0x6]
    mov        r4,#0x61
    ldrb       r4,[r5,r4]
    cmp        r4,#0x5
    bpl        LAB_08057a0e
    bl         Attack_Bomb_Create
    b          LAB_08057a14
LAB_08057a0e:
    sub        r4,#0x5
    bl         Attack_Quake_Create
LAB_08057a14:
    mov        r3,#0x5c
    str        r7,[r5,r3]
LAB_08057a18:
    mov        r0,#0x7
    strh       r0,[r5,#0x1e]
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_Bomb_1_Main
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057a80
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    mov        r0,#0x77
    bl         Sound_PlaySongImmediate
    mov        r4,#0x61
    ldrb       r4,[r5,r4]
    cmp        r4,#0x4
    bne        LAB_08057a7a
    bl         Field_GetAttackDirectionOffset_MP
    lsl        r1,r0,#0x1
    add        r0,r0,r1
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    add        r1,r1,r0
    lsl        r4,r2,#0x8
    orr        r4,r1
    lsl        r4,r4,#0x10
    mov        r7,#0x28
    add        r7,r5,r7
    ldmia      r7!,{r1,r2,r3}
    ldrb       r6,[r5,#0x16]
    LoadMain battle, r7, r7
    ldrb       r7,[r7,#0x1a]
    eor        r6,r7
    lsl        r6,r6,#0x2
    ldr        r7,PTR_INT_ARRAY_08057a84
    ldr        r6,[r7,r6]
    sub        r1,r1,r6
    mov        r6,#0x30
    lsl        r6,r6,#0x10
    add        r3,r3,r6
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    bl         Attack_Howitzer_Create
LAB_08057a7a:
    mov        r3,#0x67
    mov        r0,#0x8
    strb       r0,[r5,r3]
LAB_08057a80:
    pop        {pc}

    .align 2, 0


PTR_INT_ARRAY_08057a84:
    .word INT_ARRAY_08057a88

INT_ARRAY_08057a88:
    .word 0x40000
    .word 0xFFFC0000


_ts BC_Bomb_2_Free
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08057aa6
    mov        r0,#0x3c
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_08057aa6:
    pop        {pc}


_ts BattleChip_Shotgun
    push       {lr}
    ldr        r7,PTR_PTR_BC_Shotgun_0_Init_08057ac4
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_Shotgun_0_Init_08057ab8:
    .word BC_Shotgun_0_Init
    .word BC_Shotgun_1_Attack
    .word BC_Shotgun_2_Recover

PTR_PTR_BC_Shotgun_0_Init_08057ac4:
    .word PTR_BC_Shotgun_0_Init_08057ab8


_ts BC_Shotgun_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x2
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mvn        r0,r0
    strb       r0,[r5,#0x15]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x6
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x7
    orr        r4,r0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x7d
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_Shotgun_1_Attack
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057b36
    bl         Field_GetAttackDirectionOffset_MP
    mov        r3,#0x61
    ldrb       r4,[r5,r3]
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    ldrb       r0,[r7,#0x6]
    bl         Attack_Shotgun_Create
    tst        r7,r7
    beq        LAB_08057b2c
    ldr        r0,DAT_08057b54
    str        r0,[r7,#0x44]
LAB_08057b2c:
    mov        r0,#0x1e
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057b36:
    pop        {pc}


_ts BC_Shotgun_2_Recover
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057b4c
    mov        r0,#0x1e
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_08057b4c:
    pop        {pc}

    .align 2, 0

    .word PF_ActorPlayer | PF_ActorEnemy

DAT_08057b54:
    .word 0xA0000


_ts BattleChip_MetGuard
    push       {lr}
    ldr        r7,PTR_PTR_BC_MetGuard_0_Init_08057b78
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_MetGuard_0_Init_08057b68:
    .word BC_MetGuard_0_Init
    .word BC_MetGuard_1_Wait
    .word BC_MetGuard_2_CheckHold
    .word BC_MetGuard_3_Free

PTR_PTR_BC_MetGuard_0_Init_08057b78:
    .word PTR_BC_MetGuard_0_Init_08057b68


_ts BC_MetGuard_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x74]
    add        r0,#0x54
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    bl         Attack_MetGuard_Create
    tst        r7,r7
    beq        LAB_08057bae
    mov        r0,#0x8
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}
LAB_08057bae:
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_nt BC_MetGuard_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057bd4
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    mov        r3,#0x68
    strb       r0,[r5,r3]
    mov        r0,#0xb4
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057bd4:
    pop        {pc}


_nt BC_MetGuard_2_CheckHold
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x1e]
    mov        r1,#0x3
    tst        r0,r1
    beq        LAB_08057bea
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057bf4
LAB_08057bea:
    bl         R_Player_EndShield
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057bf4:
    pop        {pc}


_nt BC_MetGuard_3_Free
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x54]
    tst        r0,r0
    bne        LAB_08057c04
    bl         R_Player_ResetChipUseState
LAB_08057c04:
    pop        {pc}


_nt FUN_08057c06
    push       {lr}
    ldr        r7,PTR_PTR_FUN_08057c28_08057c18
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_FUN_08057c28_08057c18:
    .word PTR_FUN_08057c28_08057c1c

PTR_FUN_08057c28_08057c1c:
    .word FUN_08057c28
    .word FUN_08057c54
    .word FUN_08057c6c


_ts FUN_08057c28
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    push       {r5}
    bl         Attack_Unk05_Create
    add        r7,r5,#0x0
    pop        {r5}
    str        r7,[r5,#0x5c]
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}


_ts FUN_08057c54
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08057c6a
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r3,#0x67
    mov        r0,#0x8
    strb       r0,[r5,r3]
LAB_08057c6a:
    pop        {pc}


_ts FUN_08057c6c
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08057c7c
    bl         R_Player_ResetChipUseState
LAB_08057c7c:
    pop        {pc}


_nt BattleChip_Shockwave
    push       {lr}
    ldr        r7,PTR_PTR_BC_Shockwave_0_Init_08057ca0
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_Shockwave_0_Init_08057c90:
    .word BC_Shockwave_0_Init
    .word BC_Shockwave_1_Attack
    .word BC_Shockwave_2_Recover
    .word BC_Shockwave_3_Free

PTR_PTR_BC_Shockwave_0_Init_08057ca0:
    .word PTR_BC_Shockwave_0_Init_08057c90


_ts BC_Shockwave_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0xc
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x14
    strh       r0,[r5,#0x1e]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08057cd0
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

DAT_08057cd0:
    .byte 0x00
    .byte 0x00
    .short SP_BattleEffect_XPanel


_ts BC_Shockwave_1_Attack
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057cfe
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x61
    ldrb       r4,[r5,r3]
    add        r4,#0x4
    mov        r3,#0x0
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    bl         Attack_Shockwave_Create
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057cfe:
    pop        {pc}


_ts BC_Shockwave_2_Recover
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08057d26
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08057d28
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057d26:
    pop        {pc}

DAT_08057d28:
    .word 0x740100


_ts BC_Shockwave_3_Free
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08057d42
    mov        r0,#0x3c
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_08057d42:
    pop        {pc}


_ts BattleChip_TowerPunch
    push       {lr}
    ldr        r7,PTR_PTR_BC_TowerPunch_0_Init_08057d6c
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_TowerPunch_0_Init_08057d54:
    .word BC_TowerPunch_0_Init
    .word BC_TowerPunch_1_LaunchTowerSE
    .word BC_TowerPunch_2_AttackTower
    .word BG_TowerPunch_3_AttackPunch
    .word BC_TowerPunch_4_RecoverTower
    .word BC_TowerPunch_5_RecoverPunch

PTR_PTR_BC_TowerPunch_0_Init_08057d6c:
    .word PTR_BC_TowerPunch_0_Init_08057d54


_ts BC_TowerPunch_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x61
    ldrb       r0,[r5,r0]
    push       {r0}
    lsl        r0,r0,#0x2
    ldr        r4,PTR_listTowerPunchParam_08057dc4
    ldr        r4,[r4,r0]
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    pop        {r0}
    cmp        r0,#0x3
    bpl        LAB_08057dae
    mov        r0,#0xf
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x8f
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}
LAB_08057dae:
    mov        r0,#0x26
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x7f
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

PTR_listTowerPunchParam_08057dc4:
    .word listTowerPunchParam

listTowerPunchParam:
    .byte 0x00, 0x00, 0x7C, 0x00
    .byte 0x00, 0x00, 0x7C, 0x00
    .byte 0x00, 0x00, 0x7C, 0x00
    .byte 0x00, 0x00, 0x95, 0x00
    .byte 0x01, 0x00, 0x95, 0x00


_ts BC_TowerPunch_1_LaunchTowerSE
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x82
    tst        r0,r1
    beq        LAB_08057df4
    mov        r0,#0xb4
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057df4:
    pop        {pc}


_nt BC_TowerPunch_2_AttackTower
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_08057e28
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x2c
    add        r2,r2,r5
    mov        r3,#0x61
    ldrb       r3,[r5,r3]
    lsl        r3,r3,#0x2
    ldr        r4,PTR_UNION_FamilyDetail_U_ARRAY_08057e2c
    ldr        r4,[r4,r3]
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    ldrb       r3,[r7,#0x6]
    push       {r5}
    bl         Attack_Tower_Create
    pop        {r5}
    mov        r0,#0x10
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057e28:
    pop        {pc}

    .align 2, 0


PTR_UNION_FamilyDetail_U_ARRAY_08057e2c:
    .word UNION_FamilyDetail_U_ARRAY_08057e30

UNION_FamilyDetail_U_ARRAY_08057e30:
    .byte 0x01, 0x00, 0x00, 0x00
    .byte 0x02, 0x00, 0x00, 0x00
    .byte 0x03, 0x00, 0x00, 0x00


_ts BG_TowerPunch_3_AttackPunch
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x82
    tst        r0,r1
    beq        LAB_08057e72
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r2,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    add        r0,r0,r2
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x20
    lsl        r3,r3,#0x10
    ldr        r4,FamilyDetail_08057e74
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    ldrb       r0,[r7,#0x6]
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    mov        r0,#0x14
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057e72:
    pop        {pc}

FamilyDetail_08057e74:
    .byte 0x01, 0x00, 0x23, 0x02


_ts BC_TowerPunch_4_RecoverTower
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08057e8e
    mov        r0,#0x78
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_08057e8e:
    pop        {pc}


_ts BC_TowerPunch_5_RecoverPunch
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08057ea0
    bl         R_Player_ResetChipUseState
LAB_08057ea0:
    pop        {pc}


_nt BattleChip_Barrier
    push       {lr}
    ldr        r7,PTR_PTR_BC_Barrier_0_Init_08057ebc
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_Barrier_0_Init_08057eb4:
    .word BC_Barrier_0_Init
    .word BC_Barrier_1_Free

PTR_PTR_BC_Barrier_0_Init_08057ebc:
    .word PTR_BC_Barrier_0_Init_08057eb4


_ts BC_Barrier_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    bl         R_Player_CheckBubbleShieldPop
    mov        r0,#0x0
    ldr        r7,[r5,#0x74]
    strb       r0,[r7,#0xc]
    mov        r0,#0x17
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    ldrb       r2,[r5,#0x16]
    ldr        r7,[r5,#0x74]
    ldrh       r3,[r7,#0x18]
    bl         ScreenDim_Alloc
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_nt BC_Barrier_1_Free
    push       {lr}
    bl         R_Player_ResetChipUseState
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    pop        {pc}


_ts BattleChip_XPanel
    push       {lr}
    ldr        r7,PTR_PTR_BC_XPanel_0_Init_08057f18
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_XPanel_0_Init_08057f08:
    .word BC_XPanel_0_Init
    .word BC_XPanel_1_Break
    .word BC_XPanel_2_Recover
    .word BC_XPanel_3_Wait

PTR_PTR_BC_XPanel_0_Init_08057f18:
    .word PTR_BC_XPanel_0_Init_08057f08


_ts BC_XPanel_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0xc
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x14
    strh       r0,[r5,#0x1e]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08057f48
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

DAT_08057f48:
    .word 0x740000


_ts BC_XPanel_1_Break
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08057ff4
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    sub        r1,#0x1
    mov        r6,#0x1
    mov        r3,#0x61
    ldrb       r3,[r5,r3]
    cmp        r3,#0x1
    bne        LAB_08057f70
    sub        r1,#0x1
    mov        r6,#0x3
LAB_08057f70:
    add        r1,#0x1
    push       {r0,r1,r6}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r6}
    ldr        r4,PanelFlag_08057ff8
    tst        r3,r4
    bne        LAB_08057fac
    push       {r0,r1,r6}
    bl         Field_GetPanelProperty
    pop        {r0,r1,r6}
    mov        r3,#0x1
    bic        r2,r3
    push       {r0,r1,r6}
    bl         Field_SetPanelProperty
    pop        {r0,r1,r6}
    push       {r0,r1,r5,r6}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x2b
    bl         Effect_QuickEffect_Create
    pop        {r0,r1,r5,r6}
    b          LAB_08057fe4
LAB_08057fac:
    push       {r0,r1,r5,r6}
    push       {r0,r1}
    mov        r0,#0x1
    bl         Field_GetPanelFlagGroup
    add        r4,r1,#0x0
    pop        {r0,r1}
    ldrb       r2,[r5,#0x16]
    mov        r3,#0xa
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r0,r1,r5,r6}
    push       {r0,r1,r5,r6}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x8
    lsl        r3,r3,#0x10
    mov        r0,#0xf
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x1
    bl         Effect_QuickEffect_Create
    pop        {r0,r1,r5,r6}
LAB_08057fe4:
    sub        r6,#0x1
    bne        LAB_08057f70
    mov        r0,#0x7b
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08057ff4:
    pop        {pc}

    .align 2, 0


PanelFlag_08057ff8:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed


_ts BC_XPanel_2_Recover
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08058022
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08058024
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08058022:
    pop        {pc}

DAT_08058024:
    .word 0x740100


_ts BC_XPanel_3_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08058038
    bl         R_Player_ResetChipUseState
LAB_08058038:
    pop        {pc}


_nt BattleChip_Recover
    push       {lr}
    ldr        r7,PTR_PTR_BC_Recover_0_Init_08058054
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_Recover_0_Init_0805804c:
    .word BC_Recover_0_Init
    .word BC_Recover_1_Free

PTR_PTR_BC_Recover_0_Init_08058054:
    .word PTR_BC_Recover_0_Init_0805804c


_ts BC_Recover_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    add        r0,r5,#0x0
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    bl         ScreenDim_Recover_Create
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_nt BC_Recover_1_Free
    push       {lr}
    bl         R_Player_ResetChipUseState
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    pop        {pc}


_ts BattleChip_ScreenDim
    push       {lr}
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_080580b0
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r3,#0x61
    ldrb       r3,[r5,r3]
    lsl        r3,r3,#0x1
    ldr        r7,PTR_BYTE_ARRAY_ARRAY_080580bc
    ldrb       r0,[r7,r3]
    add        r3,#0x1
    ldrb       r1,[r7,r3]
    ldrb       r2,[r5,#0x16]
    ldr        r7,[r5,#0x74]
    ldrh       r3,[r7,#0x18]
    bl         ScreenDim_Alloc
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}
LAB_080580b0:
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
    pop        {pc}

PTR_BYTE_ARRAY_ARRAY_080580bc:
    .word BYTE_ARRAY_ARRAY_080580c0

BYTE_ARRAY_ARRAY_080580c0:
    .byte 0x02
    .byte 0x02
    .byte 0x08
    .byte 0x00
    .byte 0x09
    .byte 0x00
    .byte 0x0A
    .byte 0x00
    .byte 0x0A
    .byte 0x01
    .byte 0x0C
    .byte 0x00
    .byte 0x0C
    .byte 0x01
    .byte 0x0C
    .byte 0x02
    .byte 0x0F
    .byte 0x00
    .byte 0x0F
    .byte 0x01
    .byte 0x0F
    .byte 0x02
    .byte 0x0F
    .byte 0x03
    .byte 0x0F
    .byte 0x04
    .byte 0x15
    .byte 0x00
    .byte 0x15
    .byte 0x01
    .byte 0x15
    .byte 0x02
    .byte 0x13
    .byte 0x00
    .byte 0x13
    .byte 0x01
    .byte 0x13
    .byte 0x02
    .byte 0x16
    .byte 0x00
    .byte 0x18
    .byte 0x00
    .byte 0x19
    .byte 0x00
    .byte 0x19
    .byte 0x01
    .byte 0x19
    .byte 0x02
    .byte 0x1A
    .byte 0x00
    .byte 0x1A
    .byte 0x01
    .byte 0x1B
    .byte 0x00
    .byte 0x1B
    .byte 0x01
    .byte 0x1B
    .byte 0x02
    .byte 0x1C
    .byte 0x00
    .byte 0x1F
    .byte 0x00
    .byte 0x20
    .byte 0x00
    .byte 0x21
    .byte 0x00
    .byte 0x22
    .byte 0x00
    .byte 0x22
    .byte 0x01
    .byte 0x22
    .byte 0x02
    .byte 0x28
    .byte 0x00
    .byte 0x28
    .byte 0x01
    .byte 0x28
    .byte 0x02
    .byte 0x29
    .byte 0x00
    .byte 0x29
    .byte 0x01
    .byte 0x29
    .byte 0x02
    .byte 0x2F
    .byte 0x00
    .byte 0x2F
    .byte 0x01
    .byte 0x2F
    .byte 0x02
    .byte 0x30
    .byte 0x00
    .byte 0x31
    .byte 0x00
    .byte 0x32
    .byte 0x00
    .byte 0x33
    .byte 0x00


_nt BattleChip_Navi
    push       {lr}
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_0805815a
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    ldr        r7,PTR_ScreenDimArg_ARRAY_080581c8
    mov        r3,#0x61
    ldrb       r3,[r5,r3]
    lsl        r3,r3,#0x1
    add        r7,r7,r3
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    ldrb       r2,[r5,#0x16]
    ldr        r7,[r5,#0x74]
    ldrh       r3,[r7,#0x18]
    push       {r7}
    bl         ScreenDim_Alloc
    pop        {r7}
    mov        r0,#0x1
    strb       r0,[r7,#0x4]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}
LAB_0805815a:
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
    pop        {pc}

ScreenDimArg_ARRAY_08058166:
    .byte 0x01, 0x00
    .byte 0x01, 0x01
    .byte 0x01, 0x02
    .byte 0x05, 0x00
    .byte 0x05, 0x01
    .byte 0x05, 0x02
    .byte 0x06, 0x00
    .byte 0x06, 0x01
    .byte 0x06, 0x02
    .byte 0x07, 0x00
    .byte 0x07, 0x01
    .byte 0x07, 0x02
    .byte 0x10, 0x00
    .byte 0x10, 0x01
    .byte 0x10, 0x02
    .byte 0x11, 0x00
    .byte 0x11, 0x01
    .byte 0x11, 0x02
    .byte 0x1D, 0x00
    .byte 0x1D, 0x01
    .byte 0x1D, 0x02
    .byte 0x1E, 0x00
    .byte 0x1E, 0x01
    .byte 0x1E, 0x02
    .byte 0x23, 0x00
    .byte 0x23, 0x01
    .byte 0x23, 0x02
    .byte 0x24, 0x00
    .byte 0x24, 0x01
    .byte 0x24, 0x02
    .byte 0x25, 0x00
    .byte 0x25, 0x01
    .byte 0x25, 0x02
    .byte 0x26, 0x00
    .byte 0x26, 0x01
    .byte 0x26, 0x02
    .byte 0x2A, 0x00
    .byte 0x2A, 0x01
    .byte 0x2A, 0x02
    .byte 0x2B, 0x00
    .byte 0x2B, 0x01
    .byte 0x2B, 0x02
    .byte 0x2C, 0x00
    .byte 0x2C, 0x01
    .byte 0x2C, 0x02
    .byte 0x2D, 0x00
    .byte 0x2D, 0x01
    .byte 0x2D, 0x02
    .byte 0x2E, 0x00

PTR_ScreenDimArg_ARRAY_080581c8:
    .word ScreenDimArg_ARRAY_08058166


_ts BattleChip_Arrow
    push       {lr}
    ldr        r7,PTR_PTR_BC_Arrow_0_080581dc
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_BC_Arrow_0_080581dc:
    .word PTR_BC_Arrow_0_080581e0

PTR_BC_Arrow_0_080581e0:
    .word BC_Arrow_0
    .word BC_Arrow_1
    .word BC_Arrow_1
    .word BC_Arrow_1
    .word BC_Arrow_4
    .word BC_Arrow_5


_ts BC_Arrow_0
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x18
    strh       r0,[r5,#0x1e]
    mov        r0,#0x11
    strb       r0,[r5,#0x14]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08058220
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

DAT_08058220:
    .word 0x980080


_ts BC_Arrow_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0805827c
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    ldr        r7,PTR_listArrowDelay_08058284
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x12
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    bl         R_Player_ClearAttack
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08058280
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    mov        r3,#0x1a
    lsl        r3,r3,#0x10
    mov        r4,#0x1
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    bl         Attack_Arrow_Create
    mov        r0,#0x7d
    bl         Sound_PlaySongImmediate
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    add        r0,#0x4
    strb       r0,[r5,r3]
LAB_0805827c:
    pop        {pc}

    .align 2, 0


DAT_08058280:
    .word 0x980180

PTR_listArrowDelay_08058284:
    .word listArrowDelay

listArrowDelay:
    .byte 0x14
    .byte 0x0E
    .byte 0x08

    .align 2, 0



_ts BC_Arrow_4
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080582b8
    mov        r0,#0x7
    strh       r0,[r5,#0x1e]
    mov        r0,#0x13
    strb       r0,[r5,#0x14]
    bl         R_Player_ClearAttack
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_080582bc
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r3,#0x67
    mov        r0,#0x14
    strb       r0,[r5,r3]
LAB_080582b8:
    pop        {pc}

    .align 2, 0


DAT_080582bc:
    .word 0x980280


_ts BC_Arrow_5
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080582d2
    bl         R_Player_ClearAttack
    bl         R_Player_ResetChipUseState
LAB_080582d2:
    pop        {pc}


_ts BattleChip_Hammer
    push       {lr}
    ldr        r7,PTR_PTR_BC_Hammer_0_Init_080582e4
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_BC_Hammer_0_Init_080582e4:
    .word PTR_BC_Hammer_0_Init_080582e8

PTR_BC_Hammer_0_Init_080582e8:
    .word BC_Hammer_0_Init
    .word BC_Hammer_1
    .word BC_Hammer_2
    .word BC_Hammer_3


_ts BC_Hammer_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0xc
    strb       r0,[r5,#0x14]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0805831c
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

DAT_0805831c:
    .word 0x970000


_ts BC_Hammer_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080583a8
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1}
    ldr        r4,DAT_080583ac
    tst        r3,r4
    bne        LAB_08058362
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x18
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xcd
    bl         Sound_PlaySongImmediate
    b          LAB_080583a2
LAB_08058362:
    push       {r0,r1}
    mov        r0,#0x18
    bl         Field_GetPanelFlagGroup
    add        r4,r1,#0x0
    pop        {r0,r1}
    ldrb       r2,[r5,#0x16]
    ldr        r7,[r5,#0x74]
    ldrh       r3,[r7,#0x18]
    mov        r6,#0x0
    mov        r7,#0x1
    push       {r5}
    bl         Attack_QuickAttack_Create
    pop        {r5}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x8
    lsl        r3,r3,#0x10
    mov        r0,#0xf
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x1
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x7e
    bl         Sound_PlaySongImmediate
LAB_080583a2:
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_080583a8:
    pop        {pc}

    .align 2, 0


DAT_080583ac:
    .word 0x830


_ts BC_Hammer_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080583d6
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_080583d8
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_080583d6:
    pop        {pc}

DAT_080583d8:
    .word 0x970100


_ts BC_Hammer_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080583ec
    bl         R_Player_ResetChipUseState
LAB_080583ec:
    pop        {pc}


_nt BattleChip_Dash
    push       {lr}
    ldr        r7,PTR_PTR_BC_Dash_0_Init_08058418
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_Dash_0_Init_08058400:
    .word BC_Dash_0_Init
    .word BC_Dash_1
    .word BC_Dash_2
    .word BC_Dash_3
    .word BC_Dash_4
    .word BC_Dash_5

PTR_PTR_BC_Dash_0_Init_08058418:
    .word PTR_BC_Dash_0_Init_08058400


_ts BC_Dash_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x15
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08058444
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

DAT_08058444:
    .word 0x990080


_ts BC_Dash_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x82
    tst        r0,r1
    beq        LAB_08058460
    mov        r0,#0x94
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08058460:
    pop        {pc}


_nt BC_Dash_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080584b2
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r1,DAT_080584b4
    mul        r0,r1
    str        r0,[r5,#0x44]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    ldrh       r1,[r5,#0x18]
    strh       r1,[r0,#0x4]
    strh       r1,[r0,#0x2]
    bl         FieldObject_Enable
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,FamilyDetail_0805851c
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    mov        r7,#0x2
    bl         Attack_SharpStrike_Create
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_080584b2:
    pop        {pc}

DAT_080584b4:
    .word 0xA0000


_ts BC_Dash_3
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    push       {r0}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    ldrb       r2,[r5,#0x18]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    cmp        r0,r2
    beq        LAB_080584fa
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,FamilyDetail_0805851c
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    mov        r7,#0x4
    bl         Attack_SharpStrike_Create
LAB_080584fa:
    pop        {r2}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    add        r0,r0,r2
    bl         Field_IsCellPositionValid
    tst        r0,r0
    bne        LAB_08058518
    bl         R_Player_ClearAttack
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08058518:
    pop        {pc}

    .align 2, 0


FamilyDetail_0805851c:
    .byte 0x19, 0x00, 0x01, 0x02


_ts BC_Dash_4
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805854c
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x48]
    ldrh       r1,[r0,#0x2]
    strh       r1,[r5,#0x18]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x14
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_0805854c:
    pop        {pc}


_nt BC_Dash_5
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08058562
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    bl         R_Player_ResetChipUseState
LAB_08058562:
    pop        {pc}


_ts BattleChip_WaveRatton
    push       {lr}
    ldr        r7,PTR_PTR_BC_WaveRatton_0_Init_08058580
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_WaveRatton_0_Init_08058574:
    .word BC_WaveRatton_0_Init
    .word BC_WaveRatton_1_Main
    .word BC_WaveRatton_2_Free

PTR_PTR_BC_WaveRatton_0_Init_08058580:
    .word PTR_BC_WaveRatton_0_Init_08058574


_ts BC_WaveRatton_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x23
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_WaveRatton_1_Main
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080585e6
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    cmp        r0,#0x3
    bmi        LAB_080585ca
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    mov        r3,#0x61
    ldrb       r4,[r5,r3]
    bl         Attack_Ratton_Create
    mov        r0,#0xb0
    bl         Sound_PlaySongImmediate
    b          LAB_080585e0
LAB_080585ca:
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldr        r7,[r5,#0x74]
    ldrb       r2,[r7,#0x6]
    ldrh       r6,[r7,#0x18]
    mov        r3,#0x61
    ldrb       r4,[r5,r3]
    bl         Attack_Wave_CreateColumn
LAB_080585e0:
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_080585e6:
    pop        {pc}


_ts BC_WaveRatton_2_Free
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080585fe
    mov        r0,#0x1e
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_080585fe:
    pop        {pc}


_ts BattleChip_IronShield
    push       {lr}
    ldr        r7,PTR_PTR_BC_IronShield_0_Init_08058620
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_IronShield_0_Init_08058610:
    .word BC_IronShield_0_Init
    .word BC_IronShield_1
    .word BC_IronShield_2
    .word BC_IronShield_3

PTR_PTR_BC_IronShield_0_Init_08058620:
    .word PTR_BC_IronShield_0_Init_08058610


_ts BC_IronShield_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    ldr        r0,[r5,#0x74]
    add        r0,#0x54
    mov        r4,#0x0
    mov        r6,#0x64
    bl         Attack_IronShield_Create
    tst        r7,r7
    beq        LAB_0805865e
    mov        r0,#0x8
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}
LAB_0805865e:
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_nt BC_IronShield_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0805867a
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_0805867a:
    pop        {pc}


_ts BC_IronShield_2
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x1e]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805868e
    ldr        r0,[r7,#0x54]
    tst        r0,r0
    bne        LAB_08058698
LAB_0805868e:
    bl         R_Player_EndShield
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08058698:
    pop        {pc}


_nt BC_IronShield_3
    push       {lr}
    ldr        r7,[r5,#0x74]
    ldr        r0,[r7,#0x54]
    tst        r0,r0
    bne        LAB_080586a8
    bl         R_Player_ResetChipUseState
LAB_080586a8:
    pop        {pc}


_nt BattleChip_Thunder
    push       {lr}
    ldr        r7,PTR_PTR_BC_Thunder_0_Init_080586c8
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_Thunder_0_Init_080586bc:
    .word BC_Thunder_0_Init
    .word BC_Thunder_1
    .word BC_Thunder_2_Free

PTR_PTR_BC_Thunder_0_Init_080586c8:
    .word PTR_BC_Thunder_0_Init_080586bc


_ts BC_Thunder_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_Thunder_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805871e
    push       {r5}
    bl         Field_GetAttackDirectionOffset_MP
    mov        r3,#0x61
    ldrb       r3,[r5,r3]
    lsl        r1,r3,#0x2
    ldr        r7,PTR_listThunderSpeed_08058720
    ldr        r2,[r7,r1]
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    add        r3,#0x2
    mov        r4,#0x0
    ldr        r6,[r5,#0x74]
    ldrh       r6,[r6,#0x18]
    mov        r7,#0xe
    lsl        r7,r7,#0x10
    bl         Attack_Thunder_Create
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_0805871e:
    pop        {pc}

PTR_listThunderSpeed_08058720:
    .word listThunderSpeed

listThunderSpeed:
    .word 0xAAAA
    .word 0xCCCC
    .word 0x10000


_ts BC_Thunder_2_Free
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0805873e
    bl         R_Player_ResetChipUseState
LAB_0805873e:
    pop        {pc}


_ts BattleChip_RingZap
    push       {lr}
    ldr        r7,PTR_PTR_BC_RingZap_0_08058758
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_RingZap_0_08058750:
    .word BC_RingZap_0
    .word BC_RingZap_1

PTR_PTR_BC_RingZap_0_08058758:
    .word PTR_BC_RingZap_0_08058750


_ts BC_RingZap_0
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x61
    ldrb       r2,[r5,r2]
    mov        r3,#0x5c
    add        r3,r3,r5
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    bl         Attack_ProgThunder_Create
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_RingZap_1
    push       {lr}
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    bne        LAB_08058790
    bl         R_Player_ResetChipUseState
LAB_08058790:
    pop        {pc}


_nt BattleChip_BodyBurn
    push       {lr}
    ldr        r7,PTR_PTR_BC_BodyBurn_0_Init_080587b0
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_BC_BodyBurn_0_Init_080587a4:
    .word BC_BodyBurn_0_Init
    .word BC_BodyBurn_1_Main
    .word BC_BodyBurn_2_Free

PTR_PTR_BC_BodyBurn_0_Init_080587b0:
    .word PTR_BC_BodyBurn_0_Init_080587a4


_ts BC_BodyBurn_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x23
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_BodyBurn_1_Main
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805881a
    mov        r0,#0x80
    bl         Sound_PlaySongImmediate
    ldr        r7,PTR_CellPosition_ARRAY_0805881c
    mov        r2,#0x8
LAB_080587e2:
    push       {r2,r7}
    ldrsb      r3,[r7,r2]
    ldrb       r0,[r5,#0x16]
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r0,r4
    beq        LAB_080587f4
    neg        r3,r3
LAB_080587f4:
    add        r2,#0x1
    ldrsb      r4,[r7,r2]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    add        r0,r0,r3
    add        r1,r1,r4
    mov        r4,#0x0
    ldr        r6,[r5,#0x74]
    ldrh       r6,[r6,#0x18]
    bl         Attack_BodyBurn_Create
    pop        {r2,r7}
    sub        r2,#0x2
    bpl        LAB_080587e2
    mov        r0,#0x1e
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_0805881a:
    pop        {pc}

PTR_CellPosition_ARRAY_0805881c:
    .word CellPosition_ARRAY_08058820

CellPosition_ARRAY_08058820:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0
    cell_pos 0, 0


_ts BC_BodyBurn_2_Free
    push       {lr}
    bl         SpritePtr_SetFlashPalette
    ldr        r7,[r5,#0x74]
    mov        r0,#0x1
    strb       r0,[r7,#0x0]
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0805884a
    mov        r0,#0x1e
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_0805884a:
    pop        {pc}


_ts BattleChip_Typhoon
    push       {lr}
    ldr        r7,PTR_PTR_BC_Typhoon_0_Init_0805886c
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_BC_Typhoon_0_Init_0805885c:
    .word BC_Typhoon_0_Init
    .word BC_Typhoon_1
    .word BC_Typhoon_2
    .word BC_Typhoon_3_Free

PTR_PTR_BC_Typhoon_0_Init_0805886c:
    .word PTR_BC_Typhoon_0_Init_0805885c


_ts BC_Typhoon_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x17
    strb       r0,[r5,#0x14]
    ldr        r4,DAT_08058890
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

    .align 2, 0


DAT_08058890:
    .word 0xB40080


_ts BC_Typhoon_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080588d6
    mov        r0,#0x19
    strb       r0,[r5,#0x14]
    bl         R_Player_ClearAttack
    ldr        r4,DAT_080588d8
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1e]
    bl         Field_GetAttackDirectionOffset_MP
    lsl        r0,r0,#0x1
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    mov        r0,#0x61
    ldrb       r4,[r5,r0]
    ldr        r7,[r5,#0x74]
    ldrh       r6,[r7,#0x18]
    bl         Attack_Tornado_Chip_Create
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_080588d6:
    pop        {pc}

DAT_080588d8:
    .word 0xB40280


_ts BC_Typhoon_2
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080588fe
    mov        r0,#0x1a
    strb       r0,[r5,#0x14]
    bl         R_Player_ClearAttack
    ldr        r4,DAT_08058900
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_080588fe:
    pop        {pc}

DAT_08058900:
    .word 0xB40380


_ts BC_Typhoon_3_Free
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805891e
    bl         R_Player_ClearAttack
    mov        r0,#0x1e
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_0805891e:
    pop        {pc}


_ts BattleChip_Gaia
    push       {lr}
    ldr        r7,PTR_PTR_BC_Gaia_0_08058930
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_BC_Gaia_0_08058930:
    .word PTR_BC_Gaia_0_08058934

PTR_BC_Gaia_0_08058934:
    .word BC_Gaia_0
    .word BC_Gaia_1
    .word BC_Gaia_2
    .word BC_Gaia_3


_ts BC_Gaia_0
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0xc
    strb       r0,[r5,#0x14]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08058970
    mov        r0,#0x61
    ldrb       r0,[r5,r0]
    add        r4,r4,r0
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r3,#0x67
    strb       r0,[r5,r3]
    pop        {pc}

    .align 2, 0


DAT_08058970:
    .word 0xBB0080


_ts BC_Gaia_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080589ee
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,DAT_080589f0
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    pop        {r0,r1}
    push       {r0}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0}
    mov        r1,#0x1
    tst        r2,r1
    beq        LAB_080589e4
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    tst        r2,r1
    bne        LAB_080589e4
    add        r1,r0,#0x0
    mov        r2,#0x3
    ldrb       r4,[r5,#0x4]
    ldr        r6,[r5,#0x74]
    ldrh       r6,[r6,#0x18]
LAB_080589c6:
    push       {r1,r2,r4,r6}
    bl         Attack_GaiaExplosion_Create
    pop        {r1,r2,r4,r6}
    sub        r2,#0x1
    bne        LAB_080589c6
    mov        r0,#0x7e
    bl         Sound_PlaySongImmediate
    mov        r0,#0x2
    mov        r1,#0x3c
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
LAB_080589e4:
    mov        r0,#0x3c
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_080589ee:
    pop        {pc}

DAT_080589f0:
    .word 0x330019


_ts BC_Gaia_2
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08058a22
    bl         R_Player_ClearAttack
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08058a24
    mov        r0,#0x61
    ldrb       r0,[r5,r0]
    add        r4,r4,r0
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    mov        r3,#0x67
    strb       r0,[r5,r3]
LAB_08058a22:
    pop        {pc}

DAT_08058a24:
    .word 0xBB0100


_ts BC_Gaia_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08058a3e
    mov        r0,#0x28
    bl         R_Player_SetChipActivationDelay
    bl         R_Player_ResetChipUseState
LAB_08058a3e:
    pop        {pc}


_ts R_Player_ResetChipUseState
    push       {lr}
    mov        r3,#0x66
    mov        r0,#0x0
    strh       r0,[r5,r3]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xf
    bl         ActorPlayer_SetFlag_1
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    bne        LAB_08058a6e
    bl         Battle_GetEntryState
    tst        r0,r0
    bne        LAB_08058a6e
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
LAB_08058a6e:
    pop        {pc}


_ts R_Player_HandleChipActivation
    push       {lr}
    mov        r0,#0x2
    bl         ActorPlayer_CheckFlag_1
    beq        LAB_08058b1c
    mov        r0,#0x10
    bl         ActorPlayer_CheckStatus
    beq        LAB_08058ac6
    ldr        r7,[r5,#0x74]
    ldrb       r3,[r7,#0x7]
    mov        r0,#0x60
    add        r0,r0,r7
    ldrb       r0,[r0,r3]
    cmp        r0,#0xff
    beq        LAB_08058aa8
    add        r3,#0x1
    strb       r3,[r7,#0x7]
    ldrb       r1,[r0,r3]
    cmp        r1,#0xff
    bne        LAB_08058ad8
    push       {r0,r5}
    ldrb       r0,[r5,#0x16]
    add        r0,#0xa
    bl         BattleMessage_Disable
    pop        {r0,r5}
    b          LAB_08058ad8
LAB_08058aa8:
    ldr        r7,[r5,#0x74]
    ldrh       r1,[r7,#0x1a]
    tst        r1,r1
    beq        LAB_08058ab4
    ldrb       r0,[r7,#0x5]
    b          LAB_08058ad8
LAB_08058ab4:
    bl         R_Player_GetIndexOfNextChip
    cmp        r0,#0xff
    beq        LAB_08058ac6
    ldr        r7,[r5,#0x74]
    ldrb       r3,[r7,#0x1]
    add        r3,#0x1
    strb       r3,[r7,#0x1]
    b          LAB_08058ad8
LAB_08058ac6:
    mov        r0,#0x10
    bl         ActorPlayer_ClearStatus
    mov        r0,#0x8
    bl         ActorPlayer_CheckStatus
    beq        LAB_08058b1c
    ldr        r7,[r5,#0x74]
    ldrb       r0,[r7,#0x8]
LAB_08058ad8:
    tst        r0,r0
    beq        LAB_08058aea
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    bne        LAB_08058aea
    push       {r0,r5}
    bl         BattleUi_ClearActiveChip
    pop        {r0,r5}
LAB_08058aea:
    bl         BattleChip_GetChipData
    ldrb       r1,[r0,#0x6]
    mov        r3,#0xff
    cmp        r1,r3
    beq        LAB_08058b1e
    mov        r3,#0x66
    strh       r1,[r5,r3]
    ldrb       r1,[r0,#0x7]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldrh       r1,[r0,#0xc]
    ldr        r7,[r5,#0x74]
    strh       r1,[r7,#0x18]
    ldrb       r1,[r0,#0x5]
    strb       r1,[r7,#0x6]
    ldrb       r0,[r7,#0xd]
    cmp        r0,#0x2
    bne        LAB_08058b1c
    mov        r0,#0x0
    strb       r0,[r7,#0xd]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08058b1c:
    pop        {pc}
LAB_08058b1e:
    mov        r0,#0x18
    bl         ActorPlayer_ClearStatus
    pop        {pc}


_nt R_Player_GetIndexOfNextChip
    ldr        r7,[r5,#0x74]
    ldrb       r3,[r7,#0x1]
    add        r3,#0x6a
    ldrb       r0,[r7,r3]
    mov        pc,lr


_ts R_Player_CheckBusterChipActivation
    push       {lr}
    mov        r3,#0x70
    ldrh       r0,[r5,r3]
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_08058b4e
    mov        r0,#0x8
    bl         ActorPlayer_SetStatus
    ldr        r7,[r5,#0x74]
    ldrh       r0,[r7,#0x10]
    strh       r0,[r7,#0x12]
    mov        r0,#0x0
    strh       r0,[r7,#0x10]
LAB_08058b4e:
    mov        r3,#0x69
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_08058b68
    mov        r3,#0x70
    ldrh       r0,[r5,r3]
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08058b66
    mov        r0,#0x10
    bl         ActorPlayer_SetStatus
LAB_08058b66:
    pop        {pc}
LAB_08058b68:
    sub        r0,#0x1
    strb       r0,[r5,r3]
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x08

    .align 2, 0


dpadInputFilter:
    .byte 0x00
    .byte 0x03
    .byte 0x07
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x05
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00

cellDirToOffset:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 1, -1
    cell_pos 1, 0
    cell_pos 1, 1
    cell_pos 0, 1
    cell_pos -1, 1
    cell_pos -1, 0
    cell_pos -1, -1

listBusterDelay:
    .byte 0x04
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x14
    .byte 0x18
    .byte 0x18
    .byte 0x18
    .byte 0x03
    .byte 0x07
    .byte 0x0A
    .byte 0x0E
    .byte 0x11
    .byte 0x14
    .byte 0x14
    .byte 0x14
    .byte 0x03
    .byte 0x06
    .byte 0x09
    .byte 0x0C
    .byte 0x0F
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x02
    .byte 0x05
    .byte 0x07
    .byte 0x0A
    .byte 0x0D
    .byte 0x0F
    .byte 0x0F
    .byte 0x0F
    .byte 0x02
    .byte 0x04
    .byte 0x06
    .byte 0x08
    .byte 0x0A
    .byte 0x0C
    .byte 0x0C
    .byte 0x0C
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x02

USHORT_ARRAY_ARRAY_08058bc6:
    .short 0x1
    .short 0x1
    .short 0x2
    .short 0x1
    .short 0x3
    .short 0x1
    .short 0x4
    .short 0x1
    .short 0x5
    .short 0x1
    .short 0x6
    .short 0x1

SHORT_ARRAY_08058bde:
    .short 0x0
    .short 0x106
    .short 0x147
    .short 0x1B4
    .short 0x28F
    .short 0x28F

listBubbleShieldTimer:
    .byte 0x01
    .byte 0xF0
    .byte 0xB4
    .byte 0x78

    .align 2, 0

