#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Jelly
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Jelly_0_Init_08061f18
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Jelly_0_Init_08061f18:
    .word PTR_R_Jelly_0_Init_08061f1c

PTR_R_Jelly_0_Init_08061f1c:
    .word R_Jelly_0_Init
    .word R_Jelly_1_Main
    .word R_Jelly_2_Free


_ts R_Jelly_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x42
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    ldr        r7,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x1
    str        r0,[r5,#0x48]
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_nt R_Jelly_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08061ffc
    bl         Battle_IsInputLocked
    bne        LAB_08061ffc
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_0806205c
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08061ffc
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08061ffc:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_08062030
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08062044
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08062022
    mov        r0,#0x9
    b          LAB_08062024
LAB_08062022:
    mov        r0,#0xf
LAB_08062024:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08062042
LAB_08062030:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    add        r0,r7,#0x0
    bl         FieldObject_SetDeletedFlag
LAB_08062042:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_08062044:
    .word PTR_R_Actor_1_0_Spawn_08062048

PTR_R_Actor_1_0_Spawn_08062048:
    .word R_Actor_1_0_Spawn
    .word R_Jelly_1_1_Wait
    .word R_Jelly_1_2_Charge
    .word R_Jelly_1_3_Move
    .word R_Jelly_1_4_Wave

PanelFlag_0806205c:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Jelly_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Jelly_1_0_0_08062088
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Jelly_1_0_0_08062078:
    .word R_Jelly_1_0_0
    .word R_Jelly_1_0_1
    .word R_Jelly_1_0_2
    .word R_Jelly_1_0_3

PTR_PTR_R_Jelly_1_0_0_08062088:
    .word PTR_R_Jelly_1_0_0_08062078


_ts R_Jelly_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0806209e
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0806209e:
    pop        {pc}


_ts R_Jelly_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_080620b2
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_080620b2:
    pop        {pc}


_ts R_Jelly_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080620c6
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_080620c6:
    pop        {pc}


_ts R_Jelly_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_080620dc
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080620dc:
    pop        {pc}


_nt R_Jelly_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080620f8
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_080620f8:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806210a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806210a:
    pop        {pc}


_ts R_Jelly_1_2_Charge
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Jelly_1_2_0_Charge_08062138
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806212a
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806212a:
    pop        {pc}

PTR_R_Jelly_1_2_0_Charge_0806212c:
    .word R_Jelly_1_2_0_Charge
    .word R_Jelly_1_2_1_Next
    .word R_Jelly_1_2_2_Next

PTR_PTR_R_Jelly_1_2_0_Charge_08062138:
    .word PTR_R_Jelly_1_2_0_Charge_0806212c


_ts R_Jelly_1_2_0_Charge
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x12]
    mov        r1,#0x78
    mul        r0,r1
    add        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    bl         Effect_JellyCharging_Create
    bl         R_Jelly_1_2_1_Next
    pop        {pc}


_nt R_Jelly_1_2_1_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062170
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08062170:
    pop        {pc}


_nt R_Jelly_1_2_2_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    bl         R_Jelly_1_2_1_Next
    pop        {pc}


_nt R_Jelly_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Jelly_1_3_0_CheckMove_0806219c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Jelly_1_3_0_CheckMove_08062194:
    .word R_Jelly_1_3_0_CheckMove
    .word R_Jelly_1_3_1_Move

PTR_PTR_R_Jelly_1_3_0_CheckMove_0806219c:
    .word PTR_R_Jelly_1_3_0_CheckMove_08062194


_ts R_Jelly_1_3_0_CheckMove
    push       {lr}
    bl         R_Jelly_GetNextMovePanel
    cmp        r0,#0xff
    bne        LAB_080621b4
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    b          LAB_080621e4
LAB_080621b4:
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    ldrb       r2,[r5,#0x4]
    lsl        r2,r2,#0x2
    ldr        r7,PTR_listJellyMoveSpeed_080621e8
    ldr        r2,[r7,r2]
    ldrb       r0,[r5,#0x19]
    ldrb       r1,[r5,#0x7]
    cmp        r0,r1
    bmi        LAB_080621da
    neg        r2,r2
LAB_080621da:
    str        r2,[r5,#0x48]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
LAB_080621e4:
    pop        {pc}

    .align 2, 0


PTR_listJellyMoveSpeed_080621e8:
    .word listJellyMoveSpeed

listJellyMoveSpeed:
    .word 0x4000
    .word 0x4000
    .word 0x4000


_ts R_Jelly_1_3_1_Move
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x48]
    tst        r3,r3
    bmi        LAB_08062212
    add        r2,r2,r3
    cmp        r2,r1
    bmi        LAB_08062256
    b          LAB_08062218
LAB_08062212:
    add        r2,r2,r3
    cmp        r2,r1
    bgt        LAB_08062256
LAB_08062218:
    str        r2,[r5,#0x2c]
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    cmp        r0,#0x1
    bgt        LAB_08062232
    strb       r0,[r5,#0x5]
LAB_08062232:
    ldrb       r0,[r5,#0x1b]
    add        r0,#0x1
    strb       r0,[r5,#0x1b]
    ldrb       r1,[r5,#0x4]
    ldr        r7,PTR_BYTE_ARRAY_08062264
    ldrb       r1,[r7,r1]
    cmp        r0,r1
    bmi        LAB_0806224c
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_08062258
LAB_0806224c:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    b          LAB_08062258
LAB_08062256:
    str        r2,[r5,#0x2c]
LAB_08062258:
    bl         R_Actor_UpdateCellPos
    pop        {pc}

BYTE_ARRAY_0806225e:
    .byte 0x04
    .byte 0x04
    .byte 0x03

    .align 2, 0


PTR_BYTE_ARRAY_08062264:
    .word BYTE_ARRAY_0806225e


_ts R_Jelly_1_4_Wave
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Jelly_1_4_0_StartAnim_08062284
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Jelly_1_4_0_StartAnim_08062278:
    .word R_Jelly_1_4_0_StartAnim
    .word R_Jelly_1_4_1_Wave
    .word R_Jelly_1_4_2_Next

PTR_PTR_R_Jelly_1_4_0_StartAnim_08062284:
    .word PTR_R_Jelly_1_4_0_StartAnim_08062278


_ts R_Jelly_1_4_0_StartAnim
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x2
    strb       r0,[r5,#0x5]
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Jelly_1_4_1_Wave
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080622ca
    mov        r0,#0xff
    strb       r0,[r5,#0x5]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r2,[r5,#0x1a]
    ldrb       r4,[r5,#0x4]
    ldr        r7,PTR_listJellyWaveDamage_080622d4
    ldrb       r6,[r5,#0x4]
    lsl        r6,r6,#0x1
    ldrh       r6,[r7,r6]
    bl         Attack_Wave_CreateColumn
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
LAB_080622ca:
    pop        {pc}

listJellyWaveDamage:
    .short 0xC8
    .short 0xC8
    .short 0x12C

    .align 2, 0


PTR_listJellyWaveDamage_080622d4:
    .word listJellyWaveDamage


_ts R_Jelly_1_4_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080622f2
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    bl         Effect_JellyCharging_Create
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080622f2:
    pop        {pc}


_ts R_Jelly_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Jelly_2_0_Delete_0806230c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Jelly_2_0_Delete_08062304:
    .word R_Jelly_2_0_Delete
    .word R_Jelly_2_1_Free

PTR_PTR_R_Jelly_2_0_Delete_0806230c:
    .word PTR_R_Jelly_2_0_Delete_08062304


_ts R_Jelly_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Jelly_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806234a
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806234a:
    pop        {pc}


_ts R_Jelly_IsPanelEmpty
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_08062370
    bl         Field_GetPanelFlags
    ldr        r1,DAT_08062374
    tst        r0,r1
    bne        LAB_08062370
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08062370
    mov        r2,#0x1
LAB_08062370:
    add        r0,r2,#0x0
    pop        {pc}

DAT_08062374:
    .word 0xC30


_ts R_Jelly_GetNextMovePanel
    push       {lr}
    mov        r0,#0x0
    sub        r0,#0x1
    ldr        r1,[r5,#0x48]
    tst        r1,r1
    bmi        LAB_08062386
    mov        r0,#0x1
LAB_08062386:
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r0
    ldrb       r0,[r5,#0x18]
    push       {r0,r1}
    bl         R_Jelly_IsPanelEmpty
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_0806239a
    b          LAB_080623a2
LAB_0806239a:
    ldr        r0,[r5,#0x48]
    neg        r0,r0
    str        r0,[r5,#0x48]
    mov        r0,#0xff
LAB_080623a2:
    pop        {pc}
