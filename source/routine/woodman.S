#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Woodman
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08058bfe
    bl         Routine_WoodMan_Navi
    pop        {pc}
LAB_08058bfe:
    bl         Routine_WoodMan_Chip
    pop        {pc}


_ts Routine_WoodMan_Navi
    push       {lr}
    ldr        r7,PTR_PTR_R_WoodMan_0_Init_08058c24
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_R_WoodMan_0_Init_08058c18:
    .word R_WoodMan_0_Init
    .word R_WoodMan_1_Main
    .word R_WoodMan_2_Free

PTR_PTR_R_WoodMan_0_Init_08058c24:
    .word PTR_R_WoodMan_0_Init_08058c18


_ts R_WoodMan_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x2
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x1
    strb       r0,[r5,#0x16]
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    strb       r0,[r5,#0xc]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldr        r0,[r5,#0x28]
    str        r0,[r5,#0x50]
    ldr        r0,[r5,#0x2c]
    str        r0,[r5,#0x54]
    ldr        r0,[r5,#0x30]
    str        r0,[r5,#0x58]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0xe
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    ldr        r7,[r5,#0x60]
    mov        r1,#0x20
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    str        r1,[r0,#0xc]
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    bl         R_WoodMan_1_Main
    pop        {pc}


_ts R_WoodMan_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_DisableFlash
    bl         Battle_IsInputLocked
    bne        LAB_08058d0c
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08058d0c
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x2
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_08058cd8
    mov        r0,#0xc8
    bl         Field_AddHp
    mov        r0,#0x72
    bl         Sound_PlaySE
LAB_08058cd8:
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_08058d7c
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
    beq        LAB_08058d0c
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08058d0c:
    bl         Routine_CheckPoisonDrain
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_08058d4a
    ldr        r7,PTR_PTR_R_WoodMan_1_0_08058d78
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08058d3c
    mov        r0,#0x9
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    b          LAB_08058d44
LAB_08058d3c:
    mov        r0,#0xf
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
LAB_08058d44:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08058d5c
LAB_08058d4a:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08058d5c:
    pop        {pc}

    .align 2, 0


PTR_R_WoodMan_1_0_08058d60:
    .word R_WoodMan_1_0
    .word R_WoodMan_1_1
    .word R_WoodMan_1_2
    .word R_WoodMan_1_3
    .word R_WoodMan_1_4
    .word R_WoodMan_1_5

PTR_PTR_R_WoodMan_1_0_08058d78:
    .word PTR_R_WoodMan_1_0_08058d60

PanelFlag_08058d7c:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_WoodMan_1_0
    push       {lr}
    ldr        r7,PTR_PTR_R_WoodMan_1_0_0_08058da4
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_WoodMan_1_0_0_08058d98:
    .word R_WoodMan_1_0_0
    .word R_WoodMan_1_0_1
    .word R_WoodMan_1_0_2

PTR_PTR_R_WoodMan_1_0_0_08058da4:
    .word PTR_R_WoodMan_1_0_0_08058d98


_ts R_WoodMan_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_08058dba
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_08058dba:
    pop        {pc}


_ts R_WoodMan_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_08058dce
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_08058dce:
    pop        {pc}


_ts R_WoodMan_1_0_2
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_08058de4
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08058de4:
    pop        {pc}


_nt R_WoodMan_1_1
    push       {lr}
    ldr        r7,PTR_PTR_R_WoodMan_1_1_0_08058e10
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08058e06
    mov        r1,#0x8
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strb       r1,[r5,#0xa]
    strb       r1,[r5,#0xb]
LAB_08058e06:
    pop        {pc}

PTR_R_WoodMan_1_1_0_08058e08:
    .word R_WoodMan_1_1_0
    .word R_WoodMan_1_1_1

PTR_PTR_R_WoodMan_1_1_0_08058e10:
    .word PTR_R_WoodMan_1_1_0_08058e08


_ts R_WoodMan_1_1_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_WoodMan_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    cmp        r0,#0x3c
    bmi        LAB_08058e62
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    ldrb       r0,[r5,#0x5]
    cmp        r0,#0x4
    bmi        LAB_08058e54
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    push       {r0,r5}
    bl         Rng_RandomUint
    add        r2,r0,#0x0
    pop        {r0,r5}
    mov        r1,#0x7
    and        r1,r2
    ldr        r7,PTR_DAT_08058e68
    ldrb       r1,[r7,r1]
    tst        r1,r1
    beq        LAB_08058e54
    mov        r1,#0x10
    b          LAB_08058e58
LAB_08058e54:
    ldr        r7,PTR_DAT_08058e64
    ldrb       r1,[r7,r0]
LAB_08058e58:
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
LAB_08058e62:
    pop        {pc}

PTR_DAT_08058e64:
    .word DAT_08058e6c

PTR_DAT_08058e68:
    .word DAT_08058e70

DAT_08058e6c:
    .byte 0x14
    .byte 0x14
    .byte 0x14
    .byte 0x0C

DAT_08058e70:
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01


_ts R_WoodMan_1_2
    push       {lr}
    ldr        r7,PTR_PTR_R_WoodMan_1_2_0_08058e90
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_WoodMan_1_2_0_08058e88:
    .word R_WoodMan_1_2_0
    .word R_WoodMan_1_2_1

PTR_PTR_R_WoodMan_1_2_0_08058e90:
    .word PTR_R_WoodMan_1_2_0_08058e88


_ts R_WoodMan_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_WoodMan_1_2_1
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08058ebe
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08058ebe:
    pop        {pc}


_ts R_WoodMan_1_3
    push       {lr}
    ldr        r7,PTR_PTR_R_WoodMan_1_3_0_08058ee4
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_WoodMan_1_3_0_08058ed0:
    .word R_WoodMan_1_3_0
    .word R_WoodMan_1_3_1
    .word R_WoodMan_1_3_2
    .word R_WoodMan_1_3_3
    .word R_WoodMan_1_3_4

PTR_PTR_R_WoodMan_1_3_0_08058ee4:
    .word PTR_R_WoodMan_1_3_0_08058ed0


_ts R_WoodMan_1_3_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x10
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_WoodMan_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08058f0e
    ldr        r0,DAT_08058f10
    str        r0,[r5,#0x4c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
LAB_08058f0e:
    pop        {pc}

DAT_08058f10:
    .word 0xC0000


_ts R_WoodMan_1_3_2
    push       {lr}
    ldr        r0,[r5,#0x4c]
    tst        r0,r0
    bgt        LAB_08058f20
    mov        r1,#0x7
    strb       r1,[r5,#0x14]
LAB_08058f20:
    ldr        r1,[r5,#0x30]
    add        r0,r0,r1
    tst        r0,r0
    bpl        LAB_08058f50
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r1,#0x1
    strh       r1,[r5,#0x1c]
    mov        r1,#0x3
    strh       r1,[r5,#0x1e]
    mov        r1,#0xc
    strb       r1,[r5,#0xa]
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
LAB_08058f50:
    str        r0,[r5,#0x30]
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_08058f5c
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    pop        {pc}

DAT_08058f5c:
    .word 0xFFFF3800


_ts R_WoodMan_1_3_3
    push       {lr}
    sub        sp,#0x14
    mov        r8,sp
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08058ff0
    mov        r0,#0x50
    strh       r0,[r5,#0x1c]
    mov        r3,#0x0
    mov        r4,#0x0
    ldr        r7,PTR_CellPosition_ARRAY_08059008
    mov        r6,r8
LAB_08058f7a:
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    push       {r6}
    bl         Field_GetPanelFlags
    pop        {r6}
    add        r1,r0,#0x0
    mov        r2,#0x1
    tst        r2,r1
    beq        LAB_08058fa0
    mov        r2,#0x2
    and        r2,r1
    lsr        r2,r2,#0x1
    ldrb       r1,[r5,#0x16]
    eor        r1,r2
    beq        LAB_08058fa0
    strb       r3,[r6,#0x0]
    add        r6,#0x1
    add        r4,#0x1
LAB_08058fa0:
    add        r7,#0x2
    add        r3,#0x1
    cmp        r3,#0x12
    bne        LAB_08058f7a
    tst        r4,r4
    beq        LAB_08058fb6
    mov        r0,r8
    add        r1,r4,#0x0
    add        r2,r4,#0x0
    bl         ArrayShuffle
LAB_08058fb6:
    bl         Rng_RandomUint
    mov        r1,#0x7
    and        r0,r1
    ldr        r1,PTR_BYTE_ARRAY_0805900c
    ldrb       r0,[r1,r0]
    mov        r6,r8
LAB_08058fc4:
    push       {r0}
    ldr        r7,PTR_CellPosition_ARRAY_08059008
    ldrb       r1,[r6,r0]
    add        r1,r1,r1
    add        r7,r7,r1
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Attack_WoodTower_Create
    pop        {r0}
    sub        r0,#0x1
    bpl        LAB_08058fc4
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08058ff0
    mov        r0,#0x64
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_08058ff0:
    bl         Battle_GetEntryState
    tst        r0,r0
    beq        LAB_08059002
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
LAB_08059002:
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PTR_CellPosition_ARRAY_08059008:
    .word CellPosition_ARRAY_08059010

PTR_BYTE_ARRAY_0805900c:
    .word BYTE_ARRAY_08059034

CellPosition_ARRAY_08059010:
    cell_pos 1, 1
    cell_pos 1, 2
    cell_pos 1, 3
    cell_pos 2, 1
    cell_pos 2, 2
    cell_pos 2, 3
    cell_pos 3, 1
    cell_pos 3, 2
    cell_pos 3, 3
    cell_pos 4, 1
    cell_pos 4, 2
    cell_pos 4, 3
    cell_pos 5, 1
    cell_pos 5, 2
    cell_pos 5, 3
    cell_pos 6, 1
    cell_pos 6, 2
    cell_pos 6, 3

BYTE_ARRAY_08059034:
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x04
    .byte 0x04
    .byte 0x04


_ts R_WoodMan_1_3_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059054
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strb       r1,[r5,#0xa]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
LAB_08059054:
    bl         Battle_GetEntryState
    tst        r0,r0
    beq        LAB_08059066
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
LAB_08059066:
    pop        {pc}


_ts R_WoodMan_1_4
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_WoodMan_1_4_0_0805908c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08059088
    mov        r1,#0x8
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strb       r1,[r5,#0xa]
    strb       r1,[r5,#0xb]
LAB_08059088:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_WoodMan_1_4_0_0805908c:
    .word PTR_R_WoodMan_1_4_0_08059090

PTR_R_WoodMan_1_4_0_08059090:
    .word R_WoodMan_1_4_0
    .word R_WoodMan_1_4_1
    .word R_WoodMan_1_4_2


_ts R_WoodMan_1_4_0
    push       {lr}
    mov        r0,#0x0
    ldrh       r1,[r5,#0x20]
    ldrh       r2,[r5,#0x22]
    lsr        r2,r2,#0x1
    cmp        r1,r2
    bgt        LAB_080590b6
    bl         Rng_RandomUint
    mov        r1,#0x7
    and        r0,r1
    ldr        r7,PTR_DAT_080590d4
    ldrb       r0,[r7,r0]
LAB_080590b6:
    ldrb       r1,[r5,#0xc]
    add        r1,r1,r0
    cmp        r1,#0x3
    ble        LAB_080590c2
    mov        r0,#0x0
    mov        r1,#0x3
LAB_080590c2:
    strb       r1,[r5,#0xc]
    bl         FUN_080593ce
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


PTR_DAT_080590d4:
    .word DAT_080590d8

DAT_080590d8:
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01


_ts R_WoodMan_1_4_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    ldr        r1,[r5,#0x70]
    cmp        r0,r1
    bpl        LAB_0805911e
    mov        r1,#0x74
    lsl        r2,r0,#0x2
    add        r1,r1,r2
    ldr        r4,[r5,r1]
    ldr        r3,[r5,#0x30]
    mov        r1,#0x50
    lsl        r1,r1,#0x10
    add        r3,r3,r1
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    bl         Attack_Seed_Create
    tst        r7,r7
    beq        LAB_0805910e
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0805910e:
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x50
    strh       r0,[r5,#0x1c]
    mov        r0,#0x81
    bl         Sound_PlaySE
    b          LAB_0805912a
LAB_0805911e:
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805912a:
    pop        {pc}


_ts R_WoodMan_1_4_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805913a
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805913a:
    pop        {pc}


_ts R_WoodMan_1_5
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_WoodMan_1_5_0_PrepareJump_0805914c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_WoodMan_1_5_0_PrepareJump_0805914c:
    .word PTR_R_WoodMan_1_5_0_PrepareJump_08059150

PTR_R_WoodMan_1_5_0_PrepareJump_08059150:
    .word R_WoodMan_1_5_0_PrepareJump
    .word R_WoodMan_1_5_1_Wait
    .word R_WoodMan_1_5_2_Jump
    .word R_WoodMan_1_5_3_DeathTower
    .word R_WoodMan_1_5_4_Next


_ts R_WoodMan_1_5_0_PrepareJump
    push       {lr}
    bl         FUN_080594b0
    tst        r0,r0
    beq        LAB_08059188
    mov        r0,#0x0
    str        r0,[r5,#0x44]
    str        r0,[r5,#0x48]
    mov        r0,#0x3
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x4c]
    mov        r0,#0x19
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    str        r0,[r5,#0x70]
    str        r1,[r5,#0x74]
    b          LAB_080591d0
LAB_08059188:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r3,r0,#0x0
    add        r4,r1,#0x0
    ldr        r0,[r5,#0x70]
    ldr        r1,[r5,#0x74]
    bl         Battle_CellCoordsToSprite
    push       {r0,r1,r5}
    sub        r3,r0,r3
    sub        r1,r1,r4
    add        r0,r1,#0x0
    add        r1,r3,#0x0
    bl         VectorToAngle
    ldr        r1,DAT_080591f0
    bl         AngleToOffset
    add        r3,r0,#0x0
    add        r4,r1,#0x0
    pop        {r0,r1,r5}
    str        r3,[r5,#0x44]
    str        r4,[r5,#0x48]
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    ldr        r4,DAT_080591f0
    ldr        r6,DAT_080591f4
    bl         Field_CalculateGravityZ
    str        r0,[r5,#0x4c]
    strh       r1,[r5,#0x1c]
LAB_080591d0:
    ldr        r6,[r5,#0x64]
    ldr        r0,[r5,#0x70]
    ldr        r1,[r5,#0x74]
    strb       r0,[r6,#0x2]
    strb       r0,[r6,#0x4]
    strb       r1,[r6,#0x3]
    strb       r1,[r6,#0x5]
    add        r0,r6,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


DAT_080591f0:
    .word 0x20000

DAT_080591f4:
    .word 0xFFFFC000


_ts R_WoodMan_1_5_1_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08059212
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08059212:
    pop        {pc}


_ts R_WoodMan_1_5_2_Jump
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805925e
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    ldr        r0,[r5,#0x70]
    strb       r0,[r5,#0x18]
    ldr        r1,[r5,#0x74]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r2,#0x0
    str        r2,[r5,#0x30]
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    b          LAB_0805927c
LAB_0805925e:
    ldr        r0,[r5,#0x44]
    ldr        r1,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x48]
    ldr        r1,[r5,#0x2c]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    str        r1,[r5,#0x30]
    ldr        r1,DAT_08059284
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
LAB_0805927c:
    bl         R_Actor_UpdateCellPos
    pop        {pc}

    .align 2, 0


DAT_08059284:
    .word 0xFFFFC000


_ts R_WoodMan_1_5_3_DeathTower
    push       {lr}
    sub        sp,#0x14
    mov        r8,sp
    mov        r3,#0x0
    mov        r4,#0x0
    ldr        r7,PTR_CellPosition_ARRAY_08059308
    mov        r6,r8
LAB_08059296:
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    push       {r6}
    bl         Field_GetPanelFlags
    pop        {r6}
    add        r1,r0,#0x0
    mov        r2,#0x1
    tst        r2,r1
    beq        LAB_080592bc
    mov        r2,#0x2
    and        r2,r1
    lsr        r2,r2,#0x1
    ldrb       r1,[r5,#0x16]
    eor        r1,r2
    beq        LAB_080592bc
    strb       r3,[r6,#0x0]
    add        r6,#0x1
    add        r4,#0x1
LAB_080592bc:
    add        r7,#0x2
    add        r3,#0x1
    cmp        r3,#0x12
    bne        LAB_08059296
    tst        r4,r4
    beq        LAB_080592d2
    mov        r0,r8
    add        r1,r4,#0x0
    add        r2,r4,#0x0
    bl         ArrayShuffle
LAB_080592d2:
    bl         Rng_RandomUint
    mov        r1,#0x7
    and        r0,r1
    ldr        r1,PTR_BYTE_ARRAY_0805930c
    ldrb       r0,[r1,r0]
    mov        r6,r8
LAB_080592e0:
    push       {r0}
    ldr        r7,PTR_CellPosition_ARRAY_08059308
    ldrb       r1,[r6,r0]
    add        r1,r1,r1
    add        r7,r7,r1
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Attack_WoodTower_Create
    pop        {r0}
    sub        r0,#0x1
    bpl        LAB_080592e0
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x50
    strh       r0,[r5,#0x1c]
    add        sp,#0x14
    pop        {pc}

PTR_CellPosition_ARRAY_08059308:
    .word CellPosition_ARRAY_08059310

PTR_BYTE_ARRAY_0805930c:
    .word BYTE_ARRAY_08059334

CellPosition_ARRAY_08059310:
    cell_pos 1, 1
    cell_pos 1, 2
    cell_pos 1, 3
    cell_pos 2, 1
    cell_pos 2, 2
    cell_pos 2, 3
    cell_pos 3, 1
    cell_pos 3, 2
    cell_pos 3, 3
    cell_pos 4, 1
    cell_pos 4, 2
    cell_pos 4, 3
    cell_pos 5, 1
    cell_pos 5, 2
    cell_pos 5, 3
    cell_pos 6, 1
    cell_pos 6, 2
    cell_pos 6, 3

BYTE_ARRAY_08059334:
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x04
    .byte 0x04
    .byte 0x04


_ts R_WoodMan_1_5_4_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059354
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strb       r1,[r5,#0xa]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
LAB_08059354:
    pop        {pc}


_nt R_WoodMan_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_WoodMan_2_0_Destroy_0805936c
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_WoodMan_2_0_Destroy_08059364:
    .word R_WoodMan_2_0_Destroy
    .word R_WoodMan_2_1_Free

PTR_PTR_R_WoodMan_2_0_Destroy_0805936c:
    .word PTR_R_WoodMan_2_0_Destroy_08059364


_ts R_WoodMan_2_0_Destroy
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Battle_RegisterVirusDelete
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt R_WoodMan_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080593a4
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_080593a4:
    pop        {pc}


_nt Actor_WoodManChip_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x1
    bl         Actor_Alloc
    pop        {r0,r1,r6}
    tst        r5,r5
    beq        LAB_080593cc
    strb       r1,[r5,#0x16]
    mov        r1,#0xa9
    add        r0,r0,r1
    bl         BattleChip_GetChipData
    ldrh       r0,[r0,#0xc]
    strh       r0,[r5,#0x24]
    mov        r0,#0xd
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
LAB_080593cc:
    pop        {pc}


_nt FUN_080593ce
    push       {lr}
    sub        sp,#0x14
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r4,sp
    strb       r0,[r4,#0x12]
LAB_080593da:
    ldr        r7,PTR_DAT_08059488
    add        r0,r2,r2
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    ldrb       r6,[r5,#0x18]
    cmp        r0,r6
    bhi        LAB_080593fe
    bl         Field_GetPanelFlags
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_080593fe
    mov        r1,#0x20
    tst        r0,r1
    bne        LAB_080593fe
    strb       r2,[r4,r3]
    add        r3,#0x1
LAB_080593fe:
    add        r2,#0x1
    cmp        r2,#0x12
    bmi        LAB_080593da
    tst        r3,r3
    beq        LAB_0805942a
    push       {r3,r4}
    add        r0,r4,#0x0
    add        r1,r3,#0x0
    mov        r2,#0xa
    bl         ArrayShuffle
    pop        {r3,r4}
    ldrb       r0,[r4,#0x12]
    tst        r0,r0
    beq        LAB_0805942a
    add        r0,r4,#0x0
    add        r1,r3,#0x0
    push       {r3,r4}
    bl         FUN_08059582
    pop        {r3,r4}
    strb       r0,[r4,#0x13]
LAB_0805942a:
    cmp        r3,#0x3
    bmi        LAB_08059430
    mov        r3,#0x3
LAB_08059430:
    str        r3,[r5,#0x70]
    ldr        r7,PTR_DAT_08059488
    ldrb       r0,[r4,#0x0]
    add        r0,r0,r0
    add        r6,r7,r0
    ldrb       r0,[r6,#0x0]
    ldrb       r1,[r6,#0x1]
    lsl        r0,r0,#0x10
    lsl        r1,r1,#0x18
    orr        r1,r0
    ldrb       r0,[r4,#0x1]
    add        r0,r0,r0
    add        r6,r7,r0
    ldrb       r0,[r6,#0x0]
    ldrb       r2,[r6,#0x1]
    lsl        r0,r0,#0x10
    lsl        r2,r2,#0x18
    orr        r2,r0
    ldrb       r0,[r4,#0x2]
    add        r0,r0,r0
    add        r6,r7,r0
    ldrb       r0,[r6,#0x0]
    ldrb       r3,[r6,#0x1]
    lsl        r0,r0,#0x10
    lsl        r3,r3,#0x18
    orr        r3,r0
    str        r1,[r5,#0x74]
    str        r2,[r5,#0x78]
    str        r3,[r5,#0x7c]
    ldrb       r0,[r4,#0x12]
    tst        r0,r0
    beq        LAB_08059482
    mov        r0,#0x74
    ldrb       r1,[r4,#0x13]
    cmp        r1,#0xff
    beq        LAB_08059482
    lsl        r1,r1,#0x2
    add        r0,r0,r1
    ldr        r1,[r5,r0]
    add        r1,#0x1
    str        r1,[r5,r0]
LAB_08059482:
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PTR_DAT_08059488:
    .word DAT_0805948c

DAT_0805948c:
    .byte 0x01

DAT_0805948d:
    .byte 0x01

DAT_0805948e:
    .byte 0x02

DAT_0805948f:
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x04
    .byte 0x01
    .byte 0x05
    .byte 0x01
    .byte 0x06
    .byte 0x01
    .byte 0x01
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x02
    .byte 0x04
    .byte 0x02
    .byte 0x05
    .byte 0x02
    .byte 0x06
    .byte 0x02
    .byte 0x01
    .byte 0x03
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x04
    .byte 0x03
    .byte 0x05
    .byte 0x03
    .byte 0x06
    .byte 0x03


_ts FUN_080594b0
    push       {lr}
    sub        sp,#0x14
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r4,sp
LAB_080594ba:
    ldr        r7,PTR_DAT_0805952c
    add        r0,r2,r2
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080594ea
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_080594ea
    mov        r1,#0x20
    tst        r0,r1
    bne        LAB_080594ea
    mov        r1,#0x2
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_080594e6
    add        r0,r2,#0x0
    b          LAB_08059516
LAB_080594e6:
    strb       r2,[r4,r3]
    add        r3,#0x1
LAB_080594ea:
    add        r2,#0x1
    cmp        r2,#0x12
    bmi        LAB_080594ba
    tst        r3,r3
    bne        LAB_08059500
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    str        r0,[r5,#0x70]
    str        r1,[r5,#0x74]
    mov        r0,#0x1
    b          LAB_08059526
LAB_08059500:
    push       {r3,r4}
    add        r0,r4,#0x0
    add        r1,r3,#0x0
    mov        r2,#0xa
    bl         ArrayShuffle
    pop        {r3,r4}
    cmp        r3,#0x3
    bmi        LAB_08059514
    mov        r3,#0x3
LAB_08059514:
    ldrb       r0,[r4,#0x0]
LAB_08059516:
    add        r0,r0,r0
    ldr        r7,PTR_DAT_0805952c
    add        r6,r7,r0
    ldrb       r0,[r6,#0x0]
    ldrb       r1,[r6,#0x1]
    str        r0,[r5,#0x70]
    str        r1,[r5,#0x74]
    mov        r0,#0x0
LAB_08059526:
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PTR_DAT_0805952c:
    .word DAT_0805948c


_ts FUN_08059530_IsTargetablePanelToLeft
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r2,r0,#0x0
    pop        {r0,r1}
    tst        r2,r2
    bne        LAB_0805957e
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x2
    tst        r3,r2
    beq        LAB_0805957e
LAB_08059550:
    sub        r0,#0x1
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r2,r0,#0x0
    pop        {r0,r1}
    tst        r2,r2
    bne        LAB_0805957e
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08059578
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_0805957a
    b          LAB_0805957e
LAB_08059578:
    b          LAB_08059550
LAB_0805957a:
    mov        r0,#0x1
    b          LAB_08059580
LAB_0805957e:
    mov        r0,#0x0
LAB_08059580:
    pop        {pc}


_nt FUN_08059582
    push       {lr}
    mov        r2,#0x0
LAB_08059586:
    push       {r0,r1,r2}
    ldr        r7,PTR_DAT_080595d0
    ldrb       r2,[r0,r2]
    add        r2,r2,r2
    add        r7,r7,r2
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         FUN_08059530_IsTargetablePanelToLeft
    add        r3,r0,#0x0
    pop        {r0,r1,r2}
    tst        r3,r3
    bne        LAB_080595aa
    add        r2,#0x1
    cmp        r2,r1
    bmi        LAB_08059586
    mov        r2,#0xff
    b          LAB_080595ca
LAB_080595aa:
    cmp        r2,#0x3
    bmi        LAB_080595ca
    cmp        r1,#0x3
    bmi        LAB_080595b4
    mov        r1,#0x3
LAB_080595b4:
    push       {r0,r2}
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    pop        {r0,r2}
    ldrb       r3,[r0,r2]
    strb       r3,[r0,r1]
    add        r2,r1,#0x0
LAB_080595ca:
    add        r0,r2,#0x0
    pop        {pc}

    .align 2, 0


PTR_DAT_080595d0:
    .word DAT_0805948c


_ts Routine_WoodMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_WoodManC_0_Init_080595f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_R_WoodManC_0_Init_080595e8:
    .word R_WoodManC_0_Init
    .word R_WoodManC_1_Main
    .word R_WoodManC_2_Free

PTR_PTR_R_WoodManC_0_Init_080595f4:
    .word PTR_R_WoodManC_0_Init_080595e8


_ts R_WoodManC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x2
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    LoadMain battle, r7, r7
    add        r7,#0x40
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,DAT_0805965c
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    str        r0,[r5,#0x4c]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         R_WoodManC_1_Main
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0xC4
    .byte -1
    .byte 0x00
    .byte 0x00
    .byte 0x0C

    .align 2, 0


DAT_0805965c:
    .word 0x780000


_ts R_WoodManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_WoodManC_1_0_Land_08059680
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_WoodManC_1_0_Land_08059670:
    .word R_WoodManC_1_0_Land
    .word R_WoodManC_1_1_Wait
    .word R_WoodManC_1_2_Attack
    .word R_WoodManC_1_3_Rise

PTR_PTR_R_WoodManC_1_0_Land_08059680:
    .word PTR_R_WoodManC_1_0_Land_08059670


_ts R_WoodManC_1_0_Land
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_WoodManC_1_0_1_Land_0805969c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_WoodManC_1_0_1_Land_08059694:
    .word R_WoodManC_1_0_1_Land
    .word R_WoodMan_1_0_2_Wait

PTR_PTR_R_WoodManC_1_0_1_Land_0805969c:
    .word PTR_R_WoodManC_1_0_1_Land_08059694


_ts R_WoodManC_1_0_1_Land
    push       {lr}
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    bmi        LAB_080596b6
    str        r1,[r5,#0x30]
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_080596dc
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    pop        {pc}
LAB_080596b6:
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_080596dc:
    .word 0xFFFF3800


_ts R_WoodMan_1_0_2_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080596f0
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_080596f0:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059700
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059700:
    pop        {pc}


_nt R_WoodManC_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_WoodManC_1_1_0_Stand_08059718
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_WoodManC_1_1_0_Stand_08059710:
    .word R_WoodManC_1_1_0_Stand
    .word R_WoodManC_1_1_1_Wait

PTR_PTR_R_WoodManC_1_1_0_Stand_08059718:
    .word PTR_R_WoodManC_1_1_0_Stand_08059710


_ts R_WoodManC_1_1_0_Stand
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x30
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_WoodManC_1_1_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805973e
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805973e:
    pop        {pc}


_ts R_WoodManC_1_2_Attack
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_WoodManC_1_2_0_Rise_08059768
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_WoodManC_1_2_0_Rise_08059750:
    .word R_WoodManC_1_2_0_Rise
    .word R_WoodManC_1_2_1_Stand
    .word R_WoodManC_1_2_2_Jump
    .word R_WoodManC_1_2_3_PepareAttack
    .word R_WoodManC_1_2_4_Attack
    .word R_WoodManC_1_2_5_Wait

PTR_PTR_R_WoodManC_1_2_0_Rise_08059768:
    .word PTR_R_WoodManC_1_2_0_Rise_08059750


_ts R_WoodManC_1_2_0_Rise
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_WoodManC_1_2_1_Stand
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08059790
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    ldr        r0,DAT_08059794
    str        r0,[r5,#0x4c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08059790:
    pop        {pc}

    .align 2, 0


DAT_08059794:
    .word 0x100000


_ts R_WoodManC_1_2_2_Jump
    push       {lr}
    ldr        r0,[r5,#0x4c]
    tst        r0,r0
    bpl        LAB_080597a4
    mov        r1,#0x7
    strb       r1,[r5,#0x14]
LAB_080597a4:
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    bmi        LAB_080597b6
    str        r1,[r5,#0x30]
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_080597dc
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    pop        {pc}
LAB_080597b6:
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_080597dc:
    .word 0xFFFF3800


_ts R_WoodManC_1_2_3_PepareAttack
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805980c
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    LoadMain battle, r7, r7
    mov        r0,#0x1
    ldrb       r1,[r7,#0x1a]
    ldrb       r2,[r5,#0x16]
    eor        r1,r2
    strb       r1,[r5,#0x1b]
    tst        r1,r1
    beq        LAB_0805980a
    mov        r0,#0x6
LAB_0805980a:
    strh       r0,[r5,#0x1e]
LAB_0805980c:
    pop        {pc}


_nt R_WoodManC_1_2_4_Attack
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805986e
    mov        r4,#0x1
LAB_0805981a:
    ldrh       r0,[r5,#0x1e]
    add        r1,r4,#0x0
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    mov        r1,#0x2
    and        r1,r2
    lsr        r1,r1,#0x1
    ldrb       r2,[r5,#0x16]
    eor        r1,r2
    beq        LAB_08059842
    ldrh       r0,[r5,#0x1e]
    add        r1,r4,#0x0
    ldrb       r2,[r5,#0x16]
    mov        r3,#0x1
    ldrh       r6,[r5,#0x24]
    push       {r4}
    bl         Attack_WoodTower_Create
    pop        {r4}
LAB_08059842:
    add        r7,#0x2
    add        r4,#0x1
    cmp        r4,#0x4
    bne        LAB_0805981a
    ldrh       r0,[r5,#0x1e]
    ldrb       r1,[r5,#0x1b]
    tst        r1,r1
    bne        LAB_0805985a
    add        r0,#0x1
    cmp        r0,#0x7
    bmi        LAB_08059868
    b          LAB_0805985e
LAB_0805985a:
    sub        r0,#0x1
    bgt        LAB_08059868
LAB_0805985e:
    mov        r0,#0x46
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strb       r0,[r5,#0xa]
    b          LAB_0805986e
LAB_08059868:
    strh       r0,[r5,#0x1e]
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
LAB_0805986e:
    pop        {pc}


_ts R_WoodManC_1_2_5_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08059882
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08059882:
    pop        {pc}


_ts R_WoodManC_1_3_Rise
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_WoodManC_1_3_0_Crouch_080598a0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_WoodManC_1_3_0_Crouch_08059894:
    .word R_WoodManC_1_3_0_Crouch
    .word R_WoodManC_1_3_1_Jump
    .word R_WoodManC_1_3_2_Rise

PTR_PTR_R_WoodManC_1_3_0_Crouch_080598a0:
    .word PTR_R_WoodManC_1_3_0_Crouch_08059894


_ts R_WoodManC_1_3_0_Crouch
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_WoodManC_1_3_1_Jump
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080598c8
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    ldr        r0,DAT_080598cc
    str        r0,[r5,#0x4c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_080598c8:
    pop        {pc}

    .align 2, 0


DAT_080598cc:
    .word 0x100000


_ts R_WoodManC_1_3_2_Rise
    push       {lr}
    bl         SpritePtr_CheckIfMultipleParts
    tst        r0,r0
    beq        LAB_080598ec
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    str        r1,[r5,#0x30]
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_080598f8
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    pop        {pc}
LAB_080598ec:
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_080598f8:
    .word 0xFFFF3800


_ts R_WoodManC_2_Free
    push       {lr}
    bl         Actor_Free
    ldr        r7,PTR_gScreenDim_0805990c
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    pop        {pc}

    .align 2, 0


PTR_gScreenDim_0805990c:
    .word gScreenDim
