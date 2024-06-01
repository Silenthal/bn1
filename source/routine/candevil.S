#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_VirusDeleteExplosion_Create, 0x807CE16+1


DAT_080686e4:
    .byte 0x5A
    .byte 0x00
    .byte 0x18
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte 0x5A
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x01
    .byte 0x00
    .byte 0x5A
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x01

    .align 2, 0



_ts Routine_CanDevil
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_CanDevil_0_Init_08068710
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_CanDevil_0_Init_08068710:
    .word PTR_R_CanDevil_0_Init_08068714

PTR_R_CanDevil_0_Init_08068714:
    .word R_CanDevil_0_Init
    .word R_CanDevil_1_Main
    .word R_CanDevil_2_Free


_ts R_CanDevil_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x60
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x3
    ldr        r7,PTR_DAT_080687b0
    add        r7,r7,r0
    str        r7,[r5,#0x70]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldr        r7,PTR_listCanDevilFireballDamage_080687ac
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r1,#0x68
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r3,#0x6c
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x5c
    add        r0,r0,r5
    mov        r1,#0x6
    ldrb       r2,[r5,#0x19]
    ldrb       r4,[r5,#0x4]
    add        r4,#0x80
    ldrb       r6,[r5,#0x16]
    bl         Attack_Candle_Create
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_CanDevil_1_Main
    ldr        r0,[r5,#0x68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_listCanDevilFireballDamage_080687ac:
    .word listCanDevilFireballDamage

PTR_DAT_080687b0:
    .word DAT_080686e4

listCanDevilFireballDamage:
    .short 0x64
    .short 0x96
    .short 0xC8


_nt R_CanDevil_1_Main
    push       {lr}
    ldr        r1,[r5,#0x5c]
    tst        r1,r1
    bne        LAB_080687ca
    mov        r0,#0x62
    lsl        r0,r0,#0x18
    bl         SpritePtr_SetObjectExcludeFlags
LAB_080687ca:
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfHitFlagSet
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080687f4
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetHitFlag
    b          LAB_08068848
LAB_080687f4:
    bl         Battle_IsInputLocked
    bne        LAB_08068848
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806882c
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806882c
    mov        r0,#0xa
    ldr        r1,[r5,#0x68]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08068848
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08068848
    bl         Field_SubtractHP
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08068842
LAB_0806882c:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_08068842:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08068848:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08068868
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r0,[r5,#0x68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08068868:
    .word PTR_R_Actor_1_0_Spawn_0806886c

PTR_R_Actor_1_0_Spawn_0806886c:
    .word R_Actor_1_0_Spawn
    .word R_CanDevil_1_1_Wait
    .word R_CanDevil_1_2_Decide
    .word R_CanDevil_1_3_Move
    .word R_CanDevil_1_4_Fireball


_ts R_CanDevil_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806889a
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806889a:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080688ac
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080688ac:
    pop        {pc}


_nt R_CanDevil_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_CanDevil_1_2_0_080688d0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080688cc
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_080688cc:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_CanDevil_1_2_0_080688d0:
    .word PTR_R_CanDevil_1_2_0_080688d4

PTR_R_CanDevil_1_2_0_080688d4:
    .word R_CanDevil_1_2_0
    .word R_CanDevil_1_2_1


_ts R_CanDevil_1_2_0
    push       {lr}
    ldr        r7,[r5,#0x70]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x70]
    ldrh       r0,[r7,#0x0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_CanDevil_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068902
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08068902:
    pop        {pc}


_ts R_CanDevil_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_CanDevil_1_3_0_0806891c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_CanDevil_1_3_0_08068914:
    .word R_CanDevil_1_3_0
    .word R_CanDevil_1_3_1

PTR_PTR_R_CanDevil_1_3_0_0806891c:
    .word PTR_R_CanDevil_1_3_0_08068914


_ts R_CanDevil_1_3_0
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,[r5,#0x70]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#0x1c]
    mov        r2,#0x1
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x19]
    ldrb       r1,[r5,#0x19]
    mov        r3,#0x61
    strb       r0,[r5,r3]
    cmp        r1,r0
    beq        LAB_08068984
    bcc        LAB_08068946
    neg        r2,r2
LAB_08068946:
    ldr        r7,[r5,#0x70]
    ldr        r0,[r7,#0x4]
    mul        r0,r2
    str        r0,[r5,#0x48]
    add        r1,r1,r2
    ldrb       r0,[r5,#0x18]
    push       {r1}
    bl         Field_GetPanelFlags
    pop        {r1}
    ldr        r2,PanelFlag_08068994
    tst        r0,r2
    bne        LAB_08068984
    ldr        r2,PanelFlag_08068990
    and        r0,r2
    cmp        r0,r2
    bne        LAB_08068984
    ldrb       r0,[r5,#0x18]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Enable
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08068984:
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


PanelFlag_08068990:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08068994:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_CanDevil_1_3_1
    push       {lr}
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x48]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068a08
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r2,#0x1
    mov        r3,#0x61
    ldrb       r0,[r5,r3]
    ldrb       r1,[r5,#0x19]
    cmp        r1,r0
    beq        LAB_08068a0a
    bcc        LAB_080689d6
    neg        r2,r2
LAB_080689d6:
    add        r1,r1,r2
    ldrb       r0,[r5,#0x18]
    push       {r1}
    bl         Field_GetPanelFlags
    pop        {r1}
    ldr        r2,PanelFlag_08068a18
    tst        r0,r2
    bne        LAB_08068a0a
    ldr        r2,PanelFlag_08068a14
    and        r0,r2
    cmp        r0,r2
    bne        LAB_08068a0a
    ldrb       r0,[r5,#0x18]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Enable
    ldr        r7,[r5,#0x70]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#0x1c]
LAB_08068a08:
    pop        {pc}
LAB_08068a0a:
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

PanelFlag_08068a14:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08068a18:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_CanDevil_1_4_Fireball
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_CanDevil_1_4_0_08068a30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_CanDevil_1_4_0_08068a2c:
    .word R_CanDevil_1_4_0

PTR_PTR_R_CanDevil_1_4_0_08068a30:
    .word PTR_R_CanDevil_1_4_0_08068a2c


_ts R_CanDevil_1_4_0
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    mov        r4,#0x1
    ldrh       r6,[r5,#0x24]
    bl         Attack_MagicFire_Create
    mov        r0,#0xb6
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_CanDevil_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_CanDevil_2_0_08068a68
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_CanDevil_2_0_08068a68:
    .word PTR_R_CanDevil_2_0_08068a6c

PTR_R_CanDevil_2_0_08068a6c:
    .word R_CanDevil_2_0
    .word R_CanDevil_2_1


_ts R_CanDevil_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDeleteExplosion_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_CanDevil_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068ac0
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_08068ab8
    mov        r1,#0x1
    strb       r1,[r0,#0x5]
LAB_08068ab8:
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08068ac0:
    pop        {pc}

    .align 2, 0

