#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Fishy
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Fishy_0_Init_0805cae8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fishy_0_Init_0805cae8:
    .word PTR_R_Fishy_0_Init_0805caec

PTR_R_Fishy_0_Init_0805caec:
    .word R_Fishy_0_Init
    .word R_Fishy_1_Main
    .word R_Fishy_2_Free


_ts R_Fishy_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x26
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    bl         SpritePtr_EnableShadow
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    ldr        r0,[r5,#0x28]
    str        r0,[r5,#0x50]
    ldr        r0,[r5,#0x2c]
    str        r0,[r5,#0x54]
    ldr        r0,[r5,#0x30]
    str        r0,[r5,#0x58]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r5,#0x4]
    mov        r1,#0x78
    mul        r0,r1
    add        r0,#0x1e
    strh       r0,[r7,#0x8]
    mov        r0,#0xf
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x0
    str        r0,[r5,#0x6c]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_nt R_Fishy_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805cbc6
    bl         Battle_IsInputLocked
    bne        LAB_0805cbc6
    bl         Routine_CheckPoisonDrain
    bl         SpritePtr_DisableFlash
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_0805cc28
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
    beq        LAB_0805cbc6
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0805cbc6:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0805cbfa
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Fishy_1_0_Spawn_0805cc24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805cbec
    mov        r0,#0x9
    b          LAB_0805cbee
LAB_0805cbec:
    mov        r0,#0xf
LAB_0805cbee:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805cc0c
LAB_0805cbfa:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0805cc0c:
    pop        {pc}

    .align 2, 0


PTR_R_Fishy_1_0_Spawn_0805cc10:
    .word R_Fishy_1_0_Spawn
    .word R_Fishy_1_1_Wait
    .word R_Fishy_1_2_Wait
    .word R_Fishy_1_3_DecideMoveOrAttack
    .word R_Fishy_1_4_Dash

PTR_PTR_R_Fishy_1_0_Spawn_0805cc24:
    .word PTR_R_Fishy_1_0_Spawn_0805cc10

PanelFlag_0805cc28:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Fishy_1_0_Spawn
    push       {lr}
    ldr        r7,PTR_PTR_R_Fishy_1_0_0_0805cc50
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Fishy_1_0_0_0805cc44:
    .word R_Fishy_1_0_0
    .word R_Fishy_1_0_1
    .word R_Fishy_1_0_2

PTR_PTR_R_Fishy_1_0_0_0805cc50:
    .word PTR_R_Fishy_1_0_0_0805cc44


_ts R_Fishy_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805cc66
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0805cc66:
    pop        {pc}


_ts R_Fishy_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805cc7a
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_0805cc7a:
    pop        {pc}


_ts R_Fishy_1_0_2
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805cc90
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805cc90:
    pop        {pc}


_nt R_Fishy_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805ccac
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805ccac:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805ccbe
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ccbe:
    pop        {pc}


_ts R_Fishy_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Fishy_1_2_0_Wait_0805ccec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805cce0
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    b          LAB_0805cce0
LAB_0805cce0:
    pop        {pc}

    .align 2, 0


PTR_R_Fishy_1_2_0_Wait_0805cce4:
    .word R_Fishy_1_2_0_Wait
    .word R_Fishy_1_2_1_Next

PTR_PTR_R_Fishy_1_2_0_Wait_0805ccec:
    .word PTR_R_Fishy_1_2_0_Wait_0805cce4


_ts R_Fishy_1_2_0_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Fishy_1_2_1_Next
    pop        {pc}


_ts R_Fishy_1_2_1_Next
    push       {lr}
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Fishy_1_3_DecideMoveOrAttack
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Fishy_1_3_0_Decide_0805cd20
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_Actor_UpdateCellPos
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fishy_1_3_0_Decide_0805cd20:
    .word PTR_R_Fishy_1_3_0_Decide_0805cd24

PTR_R_Fishy_1_3_0_Decide_0805cd24:
    .word R_Fishy_1_3_0_Decide
    .word R_Fishy_1_3_1_MoveUp
    .word R_Fishy_1_3_2_MoveDown


_ts R_Fishy_1_3_0_Decide
    push       {lr}
    bl         R_Fishy_IsTargetInRow
    tst        r0,r0
    beq        LAB_0805cd50
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    bl         R_Fishy_SetRestingFieldObject
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0805cd9a
LAB_0805cd50:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldr        r2,[r5,#0x6c]
    tst        r2,r2
    bne        LAB_0805cd76
    sub        r1,#0x1
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    bl         R_Fishy_IsPanelBlockedForMoving
    tst        r0,r0
    bne        LAB_0805cd92
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         R_Fishy_SetRestingFieldObject
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    b          LAB_0805cd9a
LAB_0805cd76:
    add        r1,#0x1
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    bl         R_Fishy_IsPanelBlockedForMoving
    tst        r0,r0
    bne        LAB_0805cd92
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         R_Fishy_SetRestingFieldObject
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    b          LAB_0805cd9a
LAB_0805cd92:
    ldr        r2,[r5,#0x6c]
    mov        r3,#0x1
    eor        r2,r3
    str        r2,[r5,#0x6c]
LAB_0805cd9a:
    pop        {pc}


_ts R_Fishy_1_3_1_MoveUp
    push       {lr}
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_0805cdac
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
LAB_0805cdac:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    ldr        r2,[r5,#0x2c]
    ldr        r3,DAT_0805cdd4
    add        r2,r2,r3
    cmp        r2,r1
    bgt        LAB_0805cdce
    add        r2,r1,#0x0
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    push       {r2}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    pop        {r2}
LAB_0805cdce:
    str        r2,[r5,#0x2c]
    pop        {pc}

    .align 2, 0


DAT_0805cdd4:
    .word 0xFFFF4000


_ts R_Fishy_1_3_2_MoveDown
    push       {lr}
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_0805cde8
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
LAB_0805cde8:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    ldr        r2,[r5,#0x2c]
    ldr        r3,DAT_0805ce10
    add        r2,r2,r3
    cmp        r2,r1
    blt        LAB_0805ce0a
    add        r2,r1,#0x0
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    push       {r2}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    pop        {r2}
LAB_0805ce0a:
    str        r2,[r5,#0x2c]
    pop        {pc}

    .align 2, 0


DAT_0805ce10:
    .word 0xC000


_ts R_Fishy_1_4_Dash
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Fishy_1_4_0_StartAnim_0805ce24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fishy_1_4_0_StartAnim_0805ce24:
    .word PTR_R_Fishy_1_4_0_StartAnim_0805ce28

PTR_R_Fishy_1_4_0_StartAnim_0805ce28:
    .word R_Fishy_1_4_0_StartAnim
    .word R_Fishy_1_4_1_Wait
    .word R_Fishy_1_4_2_Dash
    .word R_Fishy_1_4_3_DropBack
    .word R_Fishy_1_4_4_TeleportBack


_ts R_Fishy_1_4_0_StartAnim
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Fishy_1_4_1_Wait
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ce56
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805ce56:
    mov        pc,lr


_ts R_Fishy_1_4_2_Dash
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Fishy_1_4_2_0_StartDash_0805ce68
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fishy_1_4_2_0_StartDash_0805ce68:
    .word PTR_R_Fishy_1_4_2_0_StartDash_0805ce6c

PTR_R_Fishy_1_4_2_0_StartDash_0805ce6c:
    .word R_Fishy_1_4_2_0_StartDash
    .word R_Fishy_1_4_2_1_Forward


_ts R_Fishy_1_4_2_0_StartDash
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x94
    bl         Sound_PlaySE
    pop        {pc}


_nt R_Fishy_1_4_2_1_Forward
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listFishyDashSpeed_0805cf14
    ldr        r1,[r7,r0]
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    beq        LAB_0805ce98
    neg        r1,r1
LAB_0805ce98:
    ldr        r0,[r5,#0x28]
    str        r0,[r5,#0x34]
    add        r0,r0,r1
    ldr        r1,[r5,#0x2c]
    push       {r0}
    bl         Battle_SpriteCoordsToCell
    bl         R_Fishy_IsOutOfBounds
    add        r1,r0,#0x0
    pop        {r0}
    tst        r1,r1
    beq        LAB_0805ceb8
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
    b          LAB_0805cf12
LAB_0805ceb8:
    str        r0,[r5,#0x28]
    bl         R_Actor_UpdateCellPos
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r0,#0x0
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x34]
    bl         R_Fishy_IsSpritePosAtCellPos
    tst        r0,r0
    beq        LAB_0805cf12
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0805cf06
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805cf06
    mov        r1,#0x2
    tst        r0,r1
    bne        LAB_0805cf06
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x2
    mov        r3,#0x0
    mov        r4,#0x6
    mov        r6,#0x1e
    bl         Effect_Tower_Create
LAB_0805cf06:
    bl         R_Fishy_IsBlockedPanel
    tst        r0,r0
    beq        LAB_0805cf12
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0805cf12:
    pop        {pc}

PTR_listFishyDashSpeed_0805cf14:
    .word listFishyDashSpeed

listFishyDashSpeed:
    .word 0x30000
    .word 0x50000


_ts R_Fishy_1_4_3_DropBack
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Fishy_1_4_3_0_StartDrop_0805cf30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fishy_1_4_3_0_StartDrop_0805cf30:
    .word PTR_R_Fishy_1_4_3_0_StartDrop_0805cf34

PTR_R_Fishy_1_4_3_0_StartDrop_0805cf34:
    .word R_Fishy_1_4_3_0_StartDrop
    .word R_Fishy_1_4_3_1_EndDrop
    .word R_Fishy_1_4_3_2_Next


_ts R_Fishy_1_4_3_0_StartDrop
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r2,#0xa0
    lsl        r2,r2,#0x10
    str        r2,[r5,#0x30]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_nt R_Fishy_1_4_3_1_EndDrop
    push       {lr}
    ldr        r0,[r5,#0x30]
    lsr        r1,r0,#0x10
    cmp        r1,#0x32
    bpl        LAB_0805cf70
    mov        r1,#0x1
    strb       r1,[r5,#0x17]
LAB_0805cf70:
    mov        r1,#0x3
    lsl        r1,r1,#0x10
    sub        r0,r0,r1
    bgt        LAB_0805cf88
    mov        r1,#0x1e
    strh       r1,[r5,#0x1c]
    mov        r1,#0x8
    strb       r1,[r5,#0xb]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x0
LAB_0805cf88:
    str        r0,[r5,#0x30]
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_ts R_Fishy_1_4_3_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805cfa2
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805cfa2:
    pop        {pc}


_ts R_Fishy_1_4_4_TeleportBack
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Fishy_1_4_4_0_StartTeleport_0805cfb4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fishy_1_4_4_0_StartTeleport_0805cfb4:
    .word PTR_R_Fishy_1_4_4_0_StartTeleport_0805cfb8

PTR_R_Fishy_1_4_4_0_StartTeleport_0805cfb8:
    .word R_Fishy_1_4_4_0_StartTeleport
    .word R_Fishy_1_4_4_1_EndTeleport
    .word R_Fishy_1_4_4_2_Next


_ts R_Fishy_1_4_4_0_StartTeleport
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x10
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x11
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    mvn        r1,r1
    and        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    pop        {pc}


_ts R_Fishy_1_4_4_1_EndTeleport
    push       {lr}
    bl         R_Actor_WaitCounter
    bne        LAB_0805d026
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         R_Actor_UpdateSpritePos
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x10
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x12
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x6
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0805d026:
    pop        {pc}


_ts R_Fishy_1_4_4_2_Next
    push       {lr}
    bl         R_Actor_WaitCounter
    bne        LAB_0805d040
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805d040:
    pop        {pc}


_nt R_Fishy_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Fishy_2_0_0805d058
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Fishy_2_0_0805d050:
    .word R_Fishy_2_0
    .word R_Fishy_2_1

PTR_PTR_R_Fishy_2_0_0805d058:
    .word PTR_R_Fishy_2_0_0805d050


_ts R_Fishy_2_0
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


_ts R_Fishy_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805d096
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805d096:
    pop        {pc}


_ts R_Fishy_IsPanelBlockedForMoving
    push       {lr}
    mov        r4,#0x1
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0805d0bc
    bl         Field_GetPanelFlags
    mov        r1,#0xc2
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_0805d0bc
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0805d0bc
    mov        r4,#0x0
LAB_0805d0bc:
    add        r0,r4,#0x0
    pop        {pc}


_ts R_Fishy_IsPanelBlocked
    push       {lr}
    mov        r4,#0x1
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0805d0de
    bl         Field_GetPanelFlags
    mov        r1,#0x82
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_0805d0de
    mov        r4,#0x0
LAB_0805d0de:
    add        r0,r4,#0x0
    pop        {pc}


_nt R_Actor_UpdateSpritePos
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    pop        {pc}


_nt R_Actor_UpdateCellPos
    push       {lr}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    mov        r2,#0x0
    ldr        r2,[r5,#0x30]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}


_nt R_Fishy_IsTargetInRow
    push       {lr}
    bl         Entity_CompareToPlayerRow
    mov        r4,#0x0
    tst        r0,r0
    bne        LAB_0805d120
    push       {r4}
    bl         R_Fishy_IsRowBlocked
    pop        {r4}
    tst        r0,r0
    bne        LAB_0805d120
    mov        r4,#0x1
LAB_0805d120:
    add        r0,r4,#0x0
    pop        {pc}


_ts R_Fishy_IsRowBlocked
    push       {lr}
    mov        r2,#0x0
    sub        r2,#0x1
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_0805d132
    mov        r2,#0x1
LAB_0805d132:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
LAB_0805d136:
    add        r0,r0,r2
    push       {r0,r1,r2}
    bl         R_Fishy_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1,r2}
    tst        r3,r3
    bne        LAB_0805d15a
    push       {r0,r1,r2}
    bl         R_Fishy_IsPanelBlocked
    add        r3,r0,#0x0
    pop        {r0,r1,r2}
    tst        r3,r3
    bne        LAB_0805d156
    b          LAB_0805d136
LAB_0805d156:
    mov        r0,#0x1
    b          LAB_0805d15c
LAB_0805d15a:
    mov        r0,#0x0
LAB_0805d15c:
    pop        {pc}


_nt R_Fishy_IsBlockedPanel
    push       {lr}
    mov        r2,#0x0
    sub        r2,#0x1
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_0805d16c
    mov        r2,#0x1
LAB_0805d16c:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    add        r0,r0,r2
    push       {r0,r1,r2}
    bl         R_Fishy_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1,r2}
    tst        r3,r3
    bne        LAB_0805d18c
    bl         R_Fishy_IsPanelBlocked
    tst        r0,r0
    beq        LAB_0805d18c
    mov        r0,#0x1
    b          LAB_0805d18e
LAB_0805d18c:
    mov        r0,#0x0
LAB_0805d18e:
    pop        {pc}


_ts R_Fishy_IsOutOfBounds
    mov        r3,#0x1
    sub        r2,r0,#0x1
    cmp        r2,#0x5
    bhi        LAB_0805d1a0
    sub        r2,r1,#0x1
    cmp        r2,#0x2
    bhi        LAB_0805d1a0
    mov        r3,#0x0
LAB_0805d1a0:
    add        r0,r3,#0x0
    mov        pc,lr


_ts R_Fishy_IsSpritePosAtCellPos
    push       {lr}
    mov        r3,#0x0
    cmp        r0,r1
    bgt        LAB_0805d1b8
    cmp        r2,r0
    ble        LAB_0805d1c2
    cmp        r2,r1
    bgt        LAB_0805d1c2
    mov        r3,#0x1
    b          LAB_0805d1c2
LAB_0805d1b8:
    cmp        r2,r1
    ble        LAB_0805d1c2
    cmp        r2,r0
    bgt        LAB_0805d1c2
    mov        r3,#0x1
LAB_0805d1c2:
    add        r0,r3,#0x0
    pop        {pc}


_nt R_Fishy_SetRestingFieldObject
    push       {lr}
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    pop        {pc}

    .align 2, 0

