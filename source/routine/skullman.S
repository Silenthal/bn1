#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listSkullManSpec:
    .byte 0x50
    .byte 0x50
    .byte 0x64
    .byte 0x32
    .byte 0x50
    .byte 0x50
    .byte 0x64
    .byte 0x32
    .byte 0x50
    .byte 0x50
    .byte 0x64
    .byte 0x32


_ts Routine_SkullMan
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_SkullMan_0_Init_08062ce0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullMan_0_Init_08062ce0:
    .word PTR_R_SkullMan_0_Init_08062ce4

PTR_R_SkullMan_0_Init_08062ce4:
    .word R_SkullMan_0_Init
    .word R_SkullMan_1_Main
    .word R_SkullMan_2_Free


_ts R_SkullMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x46
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
    mov        r3,#0x66
    strh       r0,[r5,r3]
    str        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    str        r0,[r5,#0x7c]
    mov        r3,#0x62
    mov        r0,#0x5
    strb       r0,[r5,r3]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listSkullManSpec_08062d78
    add        r7,r7,r0
    str        r7,[r5,#0x78]
    ldrb       r0,[r7,#0x2]
    strh       r0,[r5,#0x24]
    mov        r0,#0x9
    mov        r3,#0x70
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r3,#0x74
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_SkullMan_1_Main
    ldr        r0,[r5,#0x70]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_listSkullManSpec_08062d78:
    .word listSkullManSpec


_ts R_SkullMan_1_Main
    push       {lr}
    ldr        r0,[r5,#0x70]
    bl         FieldObject_DisableIfDeleted
    ldr        r0,[r5,#0x68]
    ldr        r1,[r5,#0x6c]
    orr        r0,r1
    beq        LAB_08062d90
    mov        r0,#0xe0
    lsl        r0,r0,#0x10
LAB_08062d90:
    bl         SpritePtr_SetObjectExcludeFlags
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08062db8
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}
LAB_08062db8:
    bl         R_SkullMan_CheckDamage
    tst        r0,r0
    bne        LAB_08062dca
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08062dd8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08062dca:
    ldr        r0,[r5,#0x70]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08062dd8:
    .word PTR_R_Actor_1_0_Spawn_08062ddc

PTR_R_Actor_1_0_Spawn_08062ddc:
    .word R_Actor_1_0_Spawn
    .word R_SkullMan_1_1_Wait
    .word R_SkullMan_1_2_Decide
    .word R_SkullMan_1_3_Flinch
    .word R_SkullMan_1_4_Move
    .word R_SkullMan_1_5_Onibi
    .word R_SkullMan_1_6_BoneCrush
    .word R_SkullMan_1_7_Skull


_ts R_SkullMan_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08062e16
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08062e16:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08062e28
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08062e28:
    pop        {pc}


_nt R_SkullMan_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullMan_1_2_0_Wait_08062e4c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08062e48
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08062e48:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullMan_1_2_0_Wait_08062e4c:
    .word PTR_R_SkullMan_1_2_0_Wait_08062e50

PTR_R_SkullMan_1_2_0_Wait_08062e50:
    .word R_SkullMan_1_2_0_Wait
    .word R_SkullMan_1_2_1_Decide


_ts R_SkullMan_1_2_0_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_SkullMan_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062e7c
    bl         R_SkullMan_Decide
LAB_08062e7c:
    pop        {pc}


_nt R_SkullMan_1_3_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_08062ea8
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_08062e8c
    bl         SpritePtr_SetFlashPalette
LAB_08062e8c:
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullMan_1_3_0_Flinch_08062e98
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SkullMan_1_3_0_Flinch_08062e98:
    .word PTR_R_SkullMan_1_3_0_Flinch_08062e9c

PTR_R_SkullMan_1_3_0_Flinch_08062e9c:
    .word R_SkullMan_1_3_0_Flinch
    .word R_SkullMan_1_3_1_Reset
    .word R_SkullMan_1_3_2_Next

PTR_gFrameCounter_08062ea8:
    .word gFrameCounter


_ts R_SkullMan_1_3_0_Flinch
    push       {lr}
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0xd
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0xa
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    bl         R_SkullMan_DestroyOwnedAttacks
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_SkullMan_1_3_1_Reset
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062eec
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08062eec:
    pop        {pc}


_nt R_SkullMan_1_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062f0a
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x5a
    mov        r3,#0x66
    strh       r0,[r5,r3]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08062f0a:
    pop        {pc}


_ts R_SkullMan_1_4_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullMan_1_4_0_FindNextMovePanel_08062f1c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullMan_1_4_0_FindNextMovePanel_08062f1c:
    .word PTR_R_SkullMan_1_4_0_FindNextMovePanel_08062f20

PTR_R_SkullMan_1_4_0_FindNextMovePanel_08062f20:
    .word R_SkullMan_1_4_0_FindNextMovePanel
    .word R_SkullMan_1_4_1_Move


_ts R_SkullMan_1_4_0_FindNextMovePanel
    push       {lr}
    sub        sp,#0x14
    mov        r6,sp
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x19]
    ldrb       r1,[r5,#0x19]
    cmp        r0,r1
    beq        LAB_08062fa6
    push       {r6}
    add        r2,r0,#0x0
    ldr        r0,PanelFlag_08062fb4
    ldr        r1,PanelFlag_08062fb8
    add        r3,r6,#0x0
    bl         Field_OpponentFindInRowForward
    pop        {r6}
    tst        r1,r1
    beq        LAB_08062f64
    add        r0,r6,#0x0
    add        r2,r1,#0x0
    push       {r6}
    bl         ArrayShuffle
    pop        {r6}
    ldrb       r0,[r6,#0x0]
    bl         Field_IndexToCellXY
    b          LAB_08062f86
LAB_08062f64:
    add        r0,r6,#0x0
    ldr        r1,PanelFlag_08062fb4
    ldr        r2,PanelFlag_08062fb8
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_08062fa6
    mov        r2,#0x14
    push       {r0}
    bl         ArrayShuffle
    pop        {r0}
    ldrb       r0,[r0,#0x0]
    bl         Field_IndexToCellXY
LAB_08062f86:
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#0x74]
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
LAB_08062fa6:
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PanelFlag_08062fb4:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08062fb8:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_SkullMan_1_4_1_Move
    push       {lr}
    bl         R_SkullMan_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08062fd0
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08062fd0:
    pop        {pc}


_nt R_SkullMan_1_5_Onibi
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullMan_1_5_0_StartAnim_08062fe0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SkullMan_1_5_0_StartAnim_08062fe0:
    .word PTR_R_SkullMan_1_5_0_StartAnim_08062fe4

PTR_R_SkullMan_1_5_0_StartAnim_08062fe4:
    .word R_SkullMan_1_5_0_StartAnim
    .word R_SkullMan_1_5_1_Onibi
    .word R_SkullMan_1_5_2_Next


_ts R_SkullMan_1_5_0_StartAnim
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_SkullMan_1_5_1_Onibi
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_08063028
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    mov        r4,#0x0
    ldr        r7,[r5,#0x78]
    ldrb       r6,[r7,#0x0]
    bl         Attack_MagicFire_Create
    mov        r0,#0xb6
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08063028:
    pop        {pc}


_nt R_SkullMan_1_5_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806303e
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806303e:
    pop        {pc}


_ts R_SkullMan_1_6_BoneCrush
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullMan_1_6_0_FindTargetPanels_08063050
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullMan_1_6_0_FindTargetPanels_08063050:
    .word PTR_R_SkullMan_1_6_0_FindTargetPanels_08063054

PTR_R_SkullMan_1_6_0_FindTargetPanels_08063054:
    .word R_SkullMan_1_6_0_FindTargetPanels
    .word R_SkullMan_1_6_1_RaiseArms
    .word R_SkullMan_1_6_2_BoneCrush
    .word R_SkullMan_1_6_3_Next


_ts R_SkullMan_1_6_0_FindTargetPanels
    push       {lr}
    sub        sp,#0x4
    mov        r7,sp
    mov        r0,#0x0
    ldr        r1,DAT_080630a8
    ldr        r2,DAT_080630ac
    add        r3,r7,#0x0
    push       {r7}
    bl         Field_FindFirstEdgeForward
    pop        {r7}
    cmp        r0,#0x2
    bmi        LAB_0806309e
    cmp        r0,#0x2
    bne        LAB_08063086
    ldrb       r0,[r7,#0x1]
    strb       r0,[r7,#0x2]
LAB_08063086:
    mov        r3,#0x63
    add        r6,r5,r3
    ldrb       r0,[r7,#0x0]
    strb       r0,[r6,#0x0]
    ldrb       r0,[r7,#0x2]
    strb       r0,[r6,#0x1]
    add        sp,#0x4
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806309e:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_080630a8:
    .word 0x0

DAT_080630ac:
    .word 0x2


_ts R_SkullMan_1_6_1_RaiseArms
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080630c4
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080630c4:
    pop        {pc}


_nt R_SkullMan_1_6_2_BoneCrush
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08063122
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x63
    ldrb       r0,[r5,r0]
    bl         Field_IndexToCellXY
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    ldrb       r4,[r5,#0x4]
    ldr        r7,[r5,#0x78]
    ldrb       r6,[r7,#0x1]
    mov        r0,#0x68
    add        r0,r0,r5
    bl         Attack_BoneCrush_Create
    mov        r0,#0x64
    ldrb       r0,[r5,r0]
    bl         Field_IndexToCellXY
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    ldrb       r4,[r5,#0x4]
    mov        r0,#0x1
    lsl        r0,r0,#0x8
    orr        r4,r0
    ldr        r7,[r5,#0x78]
    ldrb       r6,[r7,#0x1]
    mov        r0,#0x6c
    add        r0,r0,r5
    bl         Attack_BoneCrush_Create
    mov        r0,#0xb7
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08063122:
    pop        {pc}


_ts R_SkullMan_1_6_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08063138
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063138:
    pop        {pc}


_nt R_SkullMan_1_7_Skull
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SkullMan_1_7_0_LeanBack_08063148
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SkullMan_1_7_0_LeanBack_08063148:
    .word PTR_R_SkullMan_1_7_0_LeanBack_0806314c

PTR_R_SkullMan_1_7_0_LeanBack_0806314c:
    .word R_SkullMan_1_7_0_LeanBack
    .word R_SkullMan_1_7_1_Skull
    .word R_SkullMan_1_7_2_Reset
    .word R_SkullMan_1_7_3_Reset


_ts R_SkullMan_1_7_0_LeanBack
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_SkullMan_1_7_1_Skull
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0806319a
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    ldrb       r4,[r5,#0x4]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrh       r0,[r7,#0x18]
    lsl        r0,r0,#0x10
    orr        r4,r0
    ldr        r7,[r5,#0x78]
    ldrb       r6,[r7,#0x2]
    mov        r0,#0x7c
    add        r0,r0,r5
    bl         Attack_Skull_Create
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806319a:
    pop        {pc}


_ts R_SkullMan_1_7_2_Reset
    push       {lr}
    ldr        r0,[r5,#0x7c]
    tst        r0,r0
    bne        LAB_080631ac
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_080631ac:
    pop        {pc}


_nt R_SkullMan_1_7_3_Reset
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080631c2
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080631c2:
    pop        {pc}


_ts R_SkullMan_Move
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_SkullMan_Move_0_TeleportStart_080631d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SkullMan_Move_0_TeleportStart_080631d4:
    .word PTR_R_SkullMan_Move_0_TeleportStart_080631d8

PTR_R_SkullMan_Move_0_TeleportStart_080631d8:
    .word R_SkullMan_Move_0_TeleportStart
    .word R_SkullMan_Move_1_TeleportEnd
    .word R_SkullMan_Move_2_Next


_ts R_SkullMan_Move_0_TeleportStart
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


_nt R_SkullMan_Move_1_TeleportEnd
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806324a
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x74]
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
LAB_0806324a:
    pop        {pc}


_ts R_SkullMan_Move_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806325c
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_0806325c:
    pop        {pc}


_nt R_SkullMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_SkullMan_2_0_0806326c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SkullMan_2_0_0806326c:
    .word PTR_R_SkullMan_2_0_08063270

PTR_R_SkullMan_2_0_08063270:
    .word R_SkullMan_2_0
    .word R_SkullMan_2_1


_ts R_SkullMan_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    bl         R_SkullMan_DestroyOwnedAttacks
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0xa
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


_ts R_SkullMan_2_1
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080632c2
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_080632c2:
    pop        {pc}


_ts R_SkullMan_Decide
    push       {lr}
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    bmi        LAB_080632da
    strb       r0,[r5,r3]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_080632da:
    mov        r0,#0x5
    strb       r0,[r5,r3]
    ldr        r0,[r5,#0x68]
    ldr        r1,[r5,#0x6c]
    orr        r0,r1
    beq        LAB_080632f0
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_080632f0:
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_SkullMan_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08063396
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806336c
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806336c
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_08063396
    mov        r3,#0x66
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_0806333c
    sub        r0,#0x1
    strh       r0,[r5,r3]
    bne        LAB_0806332e
    mov        r0,#0x9
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    b          LAB_08063396
LAB_0806332e:
    lsr        r0,r0,#0x1
    bcc        LAB_08063396
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_08063396
LAB_0806333c:
    mov        r0,#0xa
    ldr        r1,[r5,#0x70]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08063396
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08063396
    bl         Field_SubtractHP
    cmp        r0,#0x64
    bcc        LAB_08063362
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063362:
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806338c
LAB_0806336c:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x70]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0xd
    ldr        r1,[r5,#0x70]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0806338c:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    pop        {pc}
LAB_08063396:
    mov        r0,#0x0
    pop        {pc}


_nt R_SkullMan_DestroyOwnedAttacks
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x0
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_080633aa
    strb       r0,[r7,#0x5]
    str        r1,[r5,#0x68]
LAB_080633aa:
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_080633b4
    strb       r0,[r7,#0x5]
    str        r1,[r5,#0x6c]
LAB_080633b4:
    ldr        r7,[r5,#0x7c]
    tst        r7,r7
    beq        LAB_080633be
    strb       r0,[r7,#0x5]
    str        r1,[r5,#0x7c]
LAB_080633be:
    pop        {pc}
