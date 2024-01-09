#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

.set Attack_SharpStrike_Create, 0x80719ac

non_word_aligned_thumb_func_start FUN_08000dd4
FUN_08000dd4:
    push       {r5,lr}
    tst        r4,r4
    bne        LAB_08000e02
LAB_08000dda:
    ldr        r0,[r0,#0x8]
    sub        r0,r3,r0
    bmi        LAB_08000de6
    add        r0,r4,#0x0
    mov        r1,#0x0
    pop        {r5,pc}
LAB_08000de6:
    lsr        r1,r6,#0x8
    bl         SWI_Div
    bl         SWI_Sqrt
    mov        r2,#0x0
    mov        r1,#0xff
    tst        r0,r1
    beq        LAB_08000dfa
    mov        r2,#0x1
LAB_08000dfa:
    lsr        r0,r0,#0x8
    add        r1,r0,r2
    mov        r0,#0x0
    pop        {r5,pc}
LAB_08000e02:
    ldmia      r0!,{r5,r7}
    push       {r0,r3}
    sub        r1,r1,r5
    lsr        r1,r1,#0x8
    add        r5,r1,#0x0
    mul        r1,r5
    sub        r2,r2,r7
    lsr        r2,r2,#0x8
    add        r5,r2,#0x0
    mul        r2,r5
    add        r0,r1,r2
    bl         SWI_Sqrt
    lsl        r0,r0,#0x8
    push       {r4}
    add        r1,r4,#0x0
    bl         SWI_Div
    pop        {r4}
    lsr        r4,r4,#0x1
    cmp        r1,r4
    bmi        LAB_08000e30
    add        r0,#0x1
LAB_08000e30:
    add        r1,r0,#0x0
    pop        {r0,r3}
    tst        r1,r1
    beq        LAB_08000dda
    ldr        r0,[r0,#0x0]
    sub        r0,r3,r0
    push       {r1}
    bl         SWI_Div
    pop        {r1}
    neg        r2,r6
    mul        r2,r1
    lsr        r2,r2,#0x1
    add        r0,r0,r2
    pop        {r5,pc}
thumb_func_end FUN_08000dd4


non_word_aligned_thumb_func_start FUN_08000e4e
FUN_08000e4e:
    push       {lr}
    ldr        r7,[r0,#0x0]
    sub        r1,r1,r7
    ldr        r7,[r0,#0x4]
    sub        r2,r2,r7
    push       {r1,r2}
    lsl        r0,r3,#0x1
    neg        r1,r4
    bl         SWI_Div
    lsr        r3,r3,#0x1
    cmp        r1,r3
    bmi        LAB_08000e6a
    add        r0,#0x1
LAB_08000e6a:
    pop        {r1,r2}
    push       {r0,r1}
    add        r1,r0,#0x0
    add        r0,r2,#0x0
    bl         SWI_Div
    add        r2,r0,#0x0
    pop        {r0,r1}
    push       {r0,r2}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    add        r0,r2,#0x0
    bl         SWI_Div
    add        r1,r0,#0x0
    pop        {r0,r2}
    pop        {pc}
thumb_func_end FUN_08000e4e


non_word_aligned_thumb_func_start Field_IsEntityCellPositionValid
Field_IsEntityCellPositionValid:
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    pop        {pc}
thumb_func_end Field_IsEntityCellPositionValid


non_word_aligned_thumb_func_start Field_IsCellPositionValid
Field_IsCellPositionValid:
    sub        r0,#0x1
    cmp        r0,#0x6
    bcs        LAB_08000ea8
    sub        r1,#0x1
    cmp        r1,#0x3
    bcs        LAB_08000ea8
    mov        r0,#0x1
    mov        pc,lr
LAB_08000ea8:
    mov        r0,#0x0
    mov        pc,lr
thumb_func_end Field_IsCellPositionValid


non_word_aligned_thumb_func_start Field_Search
Field_Search:
    push       {lr}
    add        r7,r0,#0x0
    add        r4,r1,#0x0
    add        r6,r2,#0x0
    mov        r1,#0x1
    mov        r2,#0x0
LAB_08000eb8:
    mov        r0,#0x1
LAB_08000eba:
    push       {r0,r1,r2,r4,r6,r7}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r4,r6,r7}
    tst        r3,r6
    bne        LAB_08000ed8
    and        r3,r4
    cmp        r3,r4
    bne        LAB_08000ed8
    lsl        r3,r1,#0x3
    add        r3,r3,r0
    strb       r3,[r7,#0x0]
    add        r7,#0x1
    add        r2,#0x1
LAB_08000ed8:
    add        r0,#0x1
    cmp        r0,#0x7
    bne        LAB_08000eba
    add        r1,#0x1
    cmp        r1,#0x4
    bne        LAB_08000eb8
    add        r1,r2,#0x0
    pop        {pc}
thumb_func_end Field_Search


non_word_aligned_thumb_func_start Field_SearchWithOwner
Field_SearchWithOwner:
    push       {r5,lr}
    mov        r4,r10
    ldr        r4,[r4,#0xc]
    ldrb       r4,[r4,#0x1a]
    eor        r3,r4
    add        r7,r0,#0x0
    ldr        r6,PTR_listStartX_08000f40
    lsl        r3,r3,#0x1
    add        r6,r6,r3
    ldrb       r0,[r6,#0x0]
    mov        r4,#0x1
    ldrsb      r4,[r6,r4]
    add        r3,r1,#0x0
    mov        r1,#0x3
    mov        r6,#0x0
LAB_08000f06:
    push       {r0}
LAB_08000f08:
    push       {r0,r1,r2,r3,r4,r6,r7}
    bl         Field_GetPanelFlags
    add        r5,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r6,r7}
    tst        r2,r5
    bne        LAB_08000f28
    and        r5,r3
    cmp        r5,r3
    bne        LAB_08000f28
    push       {r3}
    lsl        r3,r1,#0x3
    add        r3,r3,r0
    strb       r3,[r7,r6]
    add        r6,#0x1
    pop        {r3}
LAB_08000f28:
    add        r0,r0,r4
    push       {r0}
    sub        r0,#0x1
    cmp        r0,#0x6
    pop        {r0}
    bcc        LAB_08000f08
    pop        {r0}
    sub        r1,#0x1
    bne        LAB_08000f06
    add        r1,r6,#0x0
    pop        {r5,pc}
thumb_func_end Field_SearchWithOwner

    .align 2, 0
PTR_listStartX_08000f40: .word listStartX
listStartX:
    .byte 1, 1
    .byte 1, 1


thumb_func_start Field_SearchExcludeFirstCol
Field_SearchExcludeFirstCol:
    push       {r5,lr}
    mov        r4,r10
    ldr        r4,[r4,#0xc]
    ldrb       r4,[r4,#0x1a]
    eor        r3,r4
    add        r7,r0,#0x0
    ldr        r6,PTR_BYTE_ARRAY_ARRAY_08000fa0
    lsl        r3,r3,#0x1
    add        r6,r6,r3
    ldrb       r0,[r6,#0x0]
    mov        r4,#0x1
    ldrsb      r4,[r6,r4]
    add        r3,r1,#0x0
    mov        r1,#0x3
    mov        r6,#0x0
LAB_08000f66:
    push       {r0}
LAB_08000f68:
    push       {r0,r1,r2,r3,r4,r6,r7}
    bl         Field_GetPanelFlags
    add        r5,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r6,r7}
    tst        r2,r5
    bne        LAB_08000f88
    and        r5,r3
    cmp        r5,r3
    bne        LAB_08000f88
    push       {r3}
    lsl        r3,r1,#0x3
    add        r3,r3,r0
    strb       r3,[r7,r6]
    add        r6,#0x1
    pop        {r3}
LAB_08000f88:
    add        r0,r0,r4
    push       {r0}
    sub        r0,#0x2
    cmp        r0,#0x4
    pop        {r0}
    bcc        LAB_08000f68
    pop        {r0}
    sub        r1,#0x1
    bne        LAB_08000f66
    add        r1,r6,#0x0
    pop        {r5,pc}
thumb_func_end Field_SearchExcludeFirstCol

    .align 2, 0
PTR_BYTE_ARRAY_ARRAY_08000fa0:  .word BYTE_ARRAY_ARRAY_08000fa4
BYTE_ARRAY_ARRAY_08000fa4:
    .byte 2, 1
    .byte 2, 1


thumb_func_start Field_GetFirstWalkableColumnFront
Field_GetFirstWalkableColumnFront:
    push       {lr}
    lsl        r2,r0,#0x1
    mov        r4,r10
    ldr        r4,[r4,#0xc]
    ldrb       r4,[r4,#0x1a]
    eor        r0,r4
    ldr        r7,PTR_listOffsetX_1004_08000ff8
    ldrsb      r6,[r7,r0]
    ldr        r7,PTR_listStartX_1006_08000ffc
    ldrb       r0,[r7,r0]
LAB_08000fbc:
    mov        r1,#0x1
LAB_08000fbe:
    push       {r0,r1,r2,r6}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r6}
    mov        r4,#0x1
    tst        r3,r4
    beq        LAB_08000fda
    mov        r4,#0x2
    and        r3,r4
    ldr        r7,PTR_listTerritoryFlag_08000ff4
    ldrh       r4,[r7,r2]
    cmp        r3,r4
    bne        LAB_08000ff2
LAB_08000fda:
    add        r1,#0x1
    push       {r1}
    sub        r1,#0x1
    cmp        r1,#0x3
    pop        {r1}
    bcc        LAB_08000fbe
    add        r0,r0,r6
    push       {r0}
    sub        r0,#0x1
    cmp        r0,#0x6
    pop        {r0}
    bcc        LAB_08000fbc
LAB_08000ff2:
    pop        {pc}
thumb_func_end Field_GetFirstWalkableColumnFront

PTR_listTerritoryFlag_08000ff4: .word listTerritoryFlag
PTR_listOffsetX_1004_08000ff8:  .word listOffsetX_1004
PTR_listStartX_1006_08000ffc:   .word listStartX_1006
listTerritoryFlag:
    .short 0
    .short 2
listOffsetX_1004:
    .byte 1, -1
listStartX_1006:
    .byte 1, 6

    
thumb_func_start Field_GetFirstColumnFront
Field_GetFirstColumnFront:
    push       {r5,lr}
    mov        r3,r10
    ldr        r3,[r3,#0xc]
    ldrb       r3,[r3,#0x1a]
    eor        r0,r3
    ldr        r7,PTR_listOffsetX_105C_08001054
    ldrsb      r6,[r7,r0]
    ldr        r7,PTR_listStartX_105E_08001058
    ldrb       r0,[r7,r0]
    add        r4,r1,#0x0
    add        r5,r2,#0x0
    lsl        r2,r0,#0x1
LAB_08001020:
    mov        r1,#0x1
LAB_08001022:
    push       {r0,r1,r2,r4,r6}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r4,r6}
    tst        r3,r5
    bne        LAB_08001036
    and        r3,r4
    cmp        r3,r4
    beq        LAB_08001050
LAB_08001036:
    add        r1,#0x1
    push       {r1}
    sub        r1,#0x1
    cmp        r1,#0x3
    pop        {r1}
    bcc        LAB_08001022
    add        r0,r0,r6
    push       {r0}
    sub        r0,#0x1
    cmp        r0,#0x6
    pop        {r0}
    bcc        LAB_08001020
    mov        r0,#0x0
LAB_08001050:
    pop        {r5,pc}
thumb_func_end Field_GetFirstColumnFront

    .align 2, 0
PTR_listOffsetX_105C_08001054:  .word listOffsetX_105C
PTR_listStartX_105E_08001058:   .word listStartX_105E
listOffsetX_105C:
    .byte 1, -1
listStartX_105E:
    .byte 1, 6


thumb_func_start Field_IndexToCellXY
Field_IndexToCellXY:
    lsr        r1,r0,#0x3
    mov        r2,#0x7
    and        r0,r2
    mov        pc,lr
thumb_func_end Field_IndexToCellXY


thumb_func_start Field_CreateEntity
Field_CreateEntity:
    push       {lr}
    push       {r0,r1}
    bl         FieldObject_Alloc
    push       {r0}
    bl         FieldObject_GetIdFlag
    pop        {r7}
    add        r2,r0,#0x0
    pop        {r0,r1}
    str        r7,[r1,#0x0]
    str        r2,[r7,#0x10]
    mov        r2,#0x0
    str        r2,[r7,#0x14]
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    strb       r1,[r7,#0x2]
    strb       r1,[r7,#0x4]
    strb       r2,[r7,#0x3]
    strb       r2,[r7,#0x5]
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r7,#0x6]
    push       {r7}
    bl         Field_GetPanelFlagGroup
    pop        {r7}
    str        r1,[r7,#0xc]
    ldrh       r1,[r5,#0x24]
    strh       r1,[r7,#0x8]
    pop        {pc}
thumb_func_end Field_CreateEntity


thumb_func_start Field_GetDamageOnEntity
Field_GetDamageOnEntity:
    push       {lr}
    push       {r1}
    bl         Field_GetPanelFlagGroup
    pop        {r6}
    ldrb       r0,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    lsl        r2,r2,#0x8
    orr        r0,r2
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    push       {r6}
    bl         FieldObject_CalcDamage
    mov        r8,r6
    pop        {r6}
    str        r1,[r6,#0x14]
    mov        r6,r8
    pop        {pc}
thumb_func_end Field_GetDamageOnEntity


thumb_func_start FieldObject_SetPanelFlags
FieldObject_SetPanelFlags:
    push       {r5,lr}
    push       {r1}
    bl         Field_GetPanelFlagGroup
    pop        {r7}
    str        r1,[r7,#0xc]
    pop        {r5,pc}
thumb_func_end FieldObject_SetPanelFlags


non_word_aligned_thumb_func_start Field_CreateSharpStrikeAttack
Field_CreateSharpStrikeAttack:
    push       {lr}
    bl         Attack_SharpStrike_Create
    pop        {pc}
thumb_func_end Field_CreateSharpStrikeAttack


non_word_aligned_thumb_func_start Field_GetPanelFlagGroup
Field_GetPanelFlagGroup:
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    lsl        r0,r0,#0x3
    add        r0,r0,r1
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_080010f0
    ldr        r1,[r7,r0]
    mov        pc,lr
thumb_func_end Field_GetPanelFlagGroup

PTR_PanelFlag_ARRAY_ARRAY_080010f0: .word PanelFlag_ARRAY_ARRAY_080010f4
PanelFlag_ARRAY_ARRAY_080010f4:
_00: @ 0
    .word 0x0
    .word 0x0
_01: @ 1
    .word PF_Player
    .word PF_Enemy
_02: @ 2
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
_03: @ 3
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy
_04: @ 4
    .word PF_Player
    .word PF_Ground | PF_Enemy
_05: @ 5
    .word PF_EnemyOccupied | PF_Solid | 0x8000
    .word PF_PlayerOccupied | PF_Solid | 0x8100
_06: @ 6
    .word 0x100
    .word 0x100
_07: @ 7
    .word PF_Enemy | PF_Solid | 0x8000
    .word PF_Player | PF_Solid | 0x8000
_08: @ 8
    .word PF_Ground | 0x100
    .word PF_Ground | 0x100
_09: @ 9
    .word PF_PlayerOccupied | PF_ActorPlayer
    .word PF_EnemyOccupied | PF_ActorEnemy
_0A: @ 10
    .word PF_EnemyOccupied | PF_Enemy | PF_Solid | PF_Apple | 0x8000
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_Apple | 0x8000
_0B: @ 11
    .word PF_Ground | PF_PlayerOccupied | PF_ActorPlayer
    .word PF_Ground | PF_EnemyOccupied | PF_ActorEnemy
_0C: @ 12
    .word PF_PlayerOccupied | PF_Armor | PF_ActorPlayer
    .word PF_EnemyOccupied | PF_Armor | PF_ActorEnemy
_0D: @ 13
    .word PF_PlayerOccupied
    .word PF_EnemyOccupied
_0E: @ 14
    .word PF_PlayerOccupied | PF_ActorPlayer | 0x1000000
    .word PF_EnemyOccupied | PF_ActorEnemy | 0x1000000
_0F: @ 15
    .word PF_Teleporting
    .word PF_Teleporting
_10: @ 16
    .word PF_Solid | 0x8000
    .word PF_Solid | 0x8000
_11: @ 17
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Solid | 0xC000
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Solid | 0xC000
_12: @ 18
    .word PF_Player | 0x1000
    .word PF_Enemy | 0x2000
_13: @ 19
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
_14: @ 20
    .word PF_Ground | PF_Player | 0x1000
    .word PF_Ground | PF_Enemy | 0x2000
_15: @ 21
    .word PF_Player | 0x10000
    .word PF_Enemy | 0x10000
_16: @ 22
    .word PF_Player | 0x200000
    .word PF_Enemy | 0x200000
_17: @ 23
    .word PF_Ground | PF_Player | 0x200000
    .word PF_Ground | PF_Enemy | 0x200000
_18: @ 24
    .word PF_Player | 0x4000
    .word PF_Enemy | 0x4000
_19: @ 25
    .word PF_PlayerOccupied | PF_Player
    .word PF_EnemyOccupied | PF_Enemy
_1A: @ 26
    .word PF_Ground | PF_PlayerOccupied | PF_Player
    .word PF_Ground | PF_EnemyOccupied | PF_Enemy
_1B: @ 27
    .word PF_PlayerOccupied | PF_Player
    .word PF_Ground | PF_EnemyOccupied | PF_Enemy
_1C: @ 28
    .word PF_PlayerOccupied | PF_Player | PF_Teleporting
    .word PF_EnemyOccupied | PF_Enemy | PF_Teleporting
_1D: @ 29
    .word PF_PlayerOccupied | PF_Player | PF_Armor
    .word PF_EnemyOccupied | PF_Enemy | PF_Armor
_1E: @ 30
    .word PF_Player | 0x8000
    .word PF_Enemy | 0x8000
_1F: @ 31
    .word PF_Ground | PF_Player | 0x8000
    .word PF_Ground | PF_Enemy | 0x8000
_20: @ 32
    .word PF_Player | 0x8000
    .word PF_Ground | PF_Enemy | 0x8000
_21: @ 33
    .word PF_PlayerOccupied | 0x8000
    .word PF_EnemyOccupied | 0x8000
_22: @ 34
    .word PF_Ground | PF_PlayerOccupied | 0x8000
    .word PF_Ground | PF_EnemyOccupied | 0x8000
_23: @ 35
    .word PF_Player | 0x9000
    .word PF_Enemy | 0xA000
_24: @ 36
    .word PF_Ground | PF_Player | 0x9000
    .word PF_Ground | PF_Enemy | 0xA000
_25: @ 37
    .word PF_PlayerOccupied | 0x404000
    .word PF_EnemyOccupied | 0x404000
_26: @ 38
    .word PF_EnemyOccupied | PF_Enemy
    .word PF_PlayerOccupied | PF_Player
_27: @ 39
    .word PF_Ground
    .word PF_Ground
_28: @ 40
    .word PF_Player | PF_Enemy
    .word PF_Player | PF_Enemy
_29: @ 41
    .word PF_Ground | PF_Player | PF_Enemy
    .word PF_Ground | PF_Player | PF_Enemy
_2A: @ 42
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
_2B: @ 43
    .word PF_Player | PF_Enemy | 0x4000000
    .word PF_Player | PF_Enemy | 0x4000000
_2C: @ 44
    .word PF_Player | 0x800000
    .word PF_Enemy | 0x800000
_2D: @ 45
    .word PF_Ground | PF_Player | 0x800000
    .word PF_Ground | PF_Enemy | 0x800000
_2E: @ 46
    .word PF_Player | 0x800000
    .word PF_Ground | PF_Enemy | 0x800000
_2F: @ 47
    .word PF_PlayerOccupied | 0x800000
    .word PF_EnemyOccupied | 0x800000
_30: @ 48
    .word PF_PlayerOccupied | PF_Player | 0x800000
    .word PF_EnemyOccupied | PF_Enemy | 0x800000
_31: @ 49
    .word PF_EnemyOccupied | PF_Enemy | PF_Solid | 0x1008000
    .word PF_PlayerOccupied | PF_Player | PF_Solid | 0x1008000
_32: @ 50
    .word 0x2000000
    .word 0x2000000
_33: @ 51
    .word PF_Enemy | 0xC000
    .word PF_Player | 0xC000
_34: @ 52
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid | 0x2000000
    .word PF_PlayerOccupied | PF_Teleporting | PF_Solid | 0x2000000



thumb_func_start Field_GetAttackDirectionOffset_MP
Field_GetAttackDirectionOffset_MP:
    ldrb       r0,[r5,#0x16]
non_word_aligned_thumb_func_start Field_GetAttackDirectionOffset
Field_GetAttackDirectionOffset:
    mov        r1,r10
    ldr        r1,[r1,#0xc]
    ldrb       r1,[r1,#0x1a]
    eor        r0,r1
    lsl        r0,r0,#0x1
    sub        r0,#0x1
    neg        r0,r0
    mov        pc,lr
thumb_func_end Field_GetAttackDirectionOffset
thumb_func_end Field_GetAttackDirectionOffset_MP


non_word_aligned_thumb_func_start Field_GetRandomXZPosOnTarget
Field_GetRandomXZPosOnTarget:
    push       {lr}
    push       {r0,r1,r2,r3}
    bl         Rng_RandomUint
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3}
    add        r4,r7,#0x0
    and        r4,r0
    lsr        r6,r0,#0x1
    sub        r4,r4,r6
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    lsr        r7,r7,#0x10
    and        r7,r0
    lsr        r0,r0,#0x1
    sub        r7,r7,r0
    lsl        r7,r7,#0x10
    add        r3,r3,r7
    pop        {pc}
thumb_func_end Field_GetRandomXZPosOnTarget


thumb_func_start Field_FindEmptyOpponentWalkablePanelsFront
Field_FindEmptyOpponentWalkablePanelsFront:
    push       {r7,lr}
    add        r3,r1,#0x0
    mov        r1,#0x1
    mov        r6,#0x0
    add        r4,r0,#0x0
LAB_080012de:
    push       {r1,r3,r4,r6,r7}
    add        r0,r1,#0x0
    bl         Field_GetFirstWalkableOpponentPanelFront
    pop        {r1,r3,r4,r6,r7}
    tst        r0,r0
    beq        LAB_08001306
    ldrb       r2,[r5,#0x18]
    cmp        r2,r0
    bne        LAB_080012f8
    ldrb       r2,[r5,#0x19]
    cmp        r2,r1
    beq        LAB_08001306
LAB_080012f8:
    cmp        r1,r3
    beq        LAB_08001306
    lsl        r2,r1,#0x3
    add        r2,r2,r0
    strb       r2,[r7,#0x0]
    add        r7,#0x1
    add        r6,#0x1
LAB_08001306:
    add        r1,#0x1
    cmp        r1,#0x4
    bne        LAB_080012de
    add        r1,r6,#0x0
    pop        {r7,pc}
thumb_func_end Field_FindEmptyOpponentWalkablePanelsFront

thumb_func_start Field_GetFirstWalkableOpponentPanelFront
Field_GetFirstWalkableOpponentPanelFront:
    push       {lr}
    add        r1,r0,#0x0
    mov        r0,#0x0
    mov        r6,#0x0
LAB_08001318:
    add        r0,#0x1
    cmp        r0,#0x7
    beq        LAB_0800133a
    push       {r0,r1,r4,r6}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1,r4,r6}
    mov        r7,#0x1
    tst        r2,r7
    beq        LAB_08001318
    mov        r7,#0x2
    tst        r2,r7
    beq        LAB_08001318
    add        r6,r0,#0x0
    sub        r4,#0x1
    bpl        LAB_08001318
LAB_0800133a:
    add        r0,r6,#0x0
    pop        {pc}
thumb_func_end Field_GetFirstWalkableOpponentPanelFront


non_word_aligned_thumb_func_start Field_FindEmptyOpponentWalkableEdgeFront
Field_FindEmptyOpponentWalkableEdgeFront:
    push       {r7,lr}
    add        r3,r1,#0x0
    mov        r1,#0x1
    mov        r6,#0x0
    add        r4,r0,#0x0
LAB_08001348:
    push       {r1,r3,r4,r6,r7}
    add        r0,r1,#0x0
    bl         Field_GetFirstWalkableOpponentPanelBack
    pop        {r1,r3,r4,r6,r7}
    tst        r0,r0
    beq        LAB_08001370
    ldrb       r2,[r5,#0x18]
    cmp        r2,r0
    bne        LAB_08001362
    ldrb       r2,[r5,#0x19]
    cmp        r2,r1
    beq        LAB_08001370
LAB_08001362:
    cmp        r1,r3
    beq        LAB_08001370
    lsl        r2,r1,#0x3
    add        r2,r2,r0
    strb       r2,[r7,#0x0]
    add        r7,#0x1
    add        r6,#0x1
LAB_08001370:
    add        r1,#0x1
    cmp        r1,#0x4
    bne        LAB_08001348
    add        r1,r6,#0x0
    pop        {r7,pc}
thumb_func_end Field_FindEmptyOpponentWalkableEdgeFront


non_word_aligned_thumb_func_start Field_GetFirstWalkableOpponentPanelBack
Field_GetFirstWalkableOpponentPanelBack:
    push       {lr}
    add        r1,r0,#0x0
    mov        r0,#0x7
    mov        r6,#0x0
LAB_08001382:
    sub        r0,#0x1
    tst        r0,r0
    beq        LAB_080013a4
    push       {r0,r1,r4,r6}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1,r4,r6}
    mov        r7,#0x1
    tst        r2,r7
    beq        LAB_08001382
    mov        r7,#0x2
    tst        r2,r7
    beq        LAB_08001382
    add        r6,r0,#0x0
    sub        r4,#0x1
    bpl        LAB_08001382
LAB_080013a4:
    add        r0,r6,#0x0
    pop        {pc}
thumb_func_end Field_GetFirstWalkableOpponentPanelBack
    

thumb_func_start Field_FindFirstEdgeForward
Field_FindFirstEdgeForward:
    push       {lr}
    mov        r4,r10
    ldr        r4,[r4,#0xc]
    ldrb       r4,[r4,#0x1a]
    eor        r0,r4
    mov        r4,#0x1
    mov        r7,#0x0
LAB_080013b6:
    push       {r0,r1,r2,r3,r4,r7}
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldrb       r6,[r6,#0x1a]
    eor        r0,r6
    bl         Field_GetFirstInRowForward
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r6
    beq        LAB_080013da
    push       {r0}
    lsl        r0,r4,#0x3
    orr        r0,r6
    strb       r0,[r3,#0x0]
    pop        {r0}
    add        r3,#0x1
    add        r7,#0x1
LAB_080013da:
    add        r4,#0x1
    cmp        r4,#0x4
    bne        LAB_080013b6
    add        r0,r7,#0x0
    pop        {pc}
thumb_func_end Field_FindFirstEdgeForward


thumb_func_start Field_GetFirstInRowForward
Field_GetFirstInRowForward:
    push       {r5,lr}
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldrb       r6,[r6,#0x1a]
    eor        r0,r6
    lsl        r5,r0,#0x1
    ldr        r7,PTR_listSearchDirection_0800141c
    ldrb       r0,[r7,r5]
    add        r5,#0x1
    ldrsb      r5,[r7,r5]
LAB_080013f8:
    push       {r0,r1,r2,r3,r4}
    add        r1,r4,#0x0
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3,r4}
    tst        r7,r2
    bne        LAB_0800140e
    and        r7,r1
    cmp        r7,r1
    beq        LAB_0800141a
LAB_0800140e:
    add        r0,r0,r5
    add        r6,r0,#0x0
    sub        r6,#0x1
    cmp        r6,#0x6
    bcc        LAB_080013f8
    mov        r0,#0x0
LAB_0800141a:
    pop        {r5,pc}
thumb_func_end Field_GetFirstInRowForward

    .align 2, 0
PTR_listSearchDirection_0800141c:   .word listSearchDirection
listSearchDirection:
    .byte 6, -1
    .byte 1,  1

thumb_func_start Field_OpponentFindInRowForward
Field_OpponentFindInRowForward:
    push       {lr}
    add        r6,r0,#0x0
    add        r7,r1,#0x0
    mov        r0,#0x6
    add        r1,r2,#0x0
    mov        r2,#0x0
LAB_08001430:
    push       {r0,r1,r2,r6,r7}
    bl         Field_GetPanelFlags
    add        r4,r0,#0x0
    pop        {r0,r1,r2,r6,r7}
    tst        r4,r7
    bne        LAB_0800144c
    and        r4,r6
    cmp        r4,r6
    bne        LAB_0800144c
    lsl        r4,r1,#0x3
    orr        r4,r0
    strb       r4,[r3,r2]
    add        r2,#0x1
LAB_0800144c:
    sub        r0,#0x1
    bne        LAB_08001430
    add        r1,r2,#0x0
    pop        {pc}
thumb_func_end Field_OpponentFindInRowForward


thumb_func_start FUN_08001454
FUN_08001454:
    push       {r5,lr}
    lsl        r3,r0,#0x2
    push       {r3}
    ldr        r7,PTR_PanelFlag_ARRAY_080014f0
    ldr        r1,[r7,r3]
    ldr        r7,PTR_PanelFlag_ARRAY_080014f4
    ldr        r2,[r7,r3]
    bl         Field_GetFirstColumnFront
    pop        {r5}
    tst        r0,r0
    bne        LAB_0800146e
    pop        {r5,pc}
LAB_0800146e:
    sub        sp,#0x4
    mov        r7,sp
    mov        r1,#0x3
    mov        r2,#0x0
    ldr        r6,PTR_PanelFlag_ARRAY_080014f8
    ldr        r4,[r6,r5]
    ldr        r6,PTR_PanelFlag_ARRAY_080014fc
    ldr        r3,[r6,r5]
LAB_0800147e:
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r3
    bne        LAB_0800149a
    and        r6,r4
    cmp        r6,r4
    bne        LAB_0800149a
    lsl        r6,r1,#0x3
    orr        r6,r0
    strb       r6,[r7,r2]
    add        r2,#0x1
LAB_0800149a:
    sub        r1,#0x1
    bne        LAB_0800147e
    tst        r2,r2
    bne        LAB_080014d6
    mov        r1,#0x3
    ldr        r6,PTR_PanelFlag_ARRAY_080014f0
    ldr        r4,[r6,r5]
    ldr        r6,PTR_PanelFlag_ARRAY_080014f4
    ldr        r3,[r6,r5]
LAB_080014ac:
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r3
    bne        LAB_080014c8
    and        r6,r4
    cmp        r6,r4
    bne        LAB_080014c8
    lsl        r6,r1,#0x3
    orr        r6,r0
    strb       r6,[r7,r2]
    add        r2,#0x1
LAB_080014c8:
    sub        r1,#0x1
    bne        LAB_080014ac
    tst        r2,r2
    bne        LAB_080014d6
    mov        r0,#0x0
    add        sp,#0x4
    pop        {r5,pc}
LAB_080014d6:
    push       {r2,r7}
    bl         Rng_RandomInt
    pop        {r2,r7}
    add        r1,r2,#0x0
    bl         SWI_DivMod
    ldrb       r0,[r7,r0]
    bl         Field_IndexToCellXY
    add        sp,#0x4
    pop        {r5,pc}
thumb_func_end FUN_08001454

.align 2, 0
PTR_PanelFlag_ARRAY_080014f0:   .word PanelFlag_ARRAY_08001500
PTR_PanelFlag_ARRAY_080014f4:   .word PanelFlag_ARRAY_08001508
PTR_PanelFlag_ARRAY_080014f8:   .word PanelFlag_ARRAY_08001510
PTR_PanelFlag_ARRAY_080014fc:   .word PanelFlag_ARRAY_08001518

PanelFlag_ARRAY_08001500:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_Walkable
PanelFlag_ARRAY_08001508:
    .word 0
    .word PF_EnemyTerritory
PanelFlag_ARRAY_08001510:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_Walkable
PanelFlag_ARRAY_08001518:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_EnemyTerritory

thumb_func_start Field_CrackPanel
Field_CrackPanel:
    push       {lr}
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x1
    tst        r7,r2
    beq        LAB_08001566
    mov        r2,#0x4
    tst        r7,r2
    bne        LAB_0800154c
    push       {r0,r1}
    bl         Field_GetPanelProperty
    pop        {r0,r1}
    mov        r3,#0x4
    orr        r2,r3
    bl         Field_SetPanelProperty
    mov        r0,#0x1
    pop        {pc}
LAB_0800154c:
    ldr        r2,INT_0800156c
    tst        r7,r2
    bne        LAB_08001562
    push       {r0,r1}
    bl         Field_GetPanelProperty
    pop        {r0,r1}
    mov        r3,#0x1
    bic        r2,r3
    bl         Field_SetPanelProperty
LAB_08001562:
    mov        r0,#0x1
    pop        {pc}
LAB_08001566:
    mov        r0,#0x0
    pop        {pc}
thumb_func_end Field_CrackPanel

    .align 2, 0
INT_0800156c: .word 0x2000C30

thumb_func_start FUN_08001570
FUN_08001570:
    push       {lr}
    ldr        r7,PTR_LAB_080015ac
    add        r7,r7,r0
    ldrb       r2,[r7,#0x0]
    ldrb       r3,[r7,#0x2]
    mov        r1,#0x2
LAB_0800157c:
    mov        r0,#0x5
LAB_0800157e:
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r7,r3
    bne        LAB_080015a2
    and        r7,r2
    cmp        r7,r2
    bne        LAB_080015a2
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_CrackPanel
    pop        {r0,r1,r2,r3}
LAB_080015a2:
    sub        r0,#0x1
    bpl        LAB_0800157e
    sub        r1,#0x1
    bpl        LAB_0800157c
    pop        {pc}

PTR_LAB_080015ac:   .word LAB_080015b0

LAB_080015b0:
    lsl        r3,r0,#0x4
LAB_080015b2:
    lsl        r0,r0,#0x8
    push       {lr}
    mov        r2,#0x1
    mov        r3,#0x0
    mov        r1,#0x2
LAB_080015bc:
    mov        r0,#0x5
LAB_080015be:
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r7,r3
    bne        LAB_080015e2
    and        r7,r2
    cmp        r7,r2
    bne        LAB_080015e2
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_CrackPanel
    pop        {r0,r1,r2,r3}
LAB_080015e2:
    sub        r0,#0x1
    bpl        LAB_080015be
    sub        r1,#0x1
    bpl        LAB_080015bc
    pop        {pc}


non_word_aligned_thumb_func_start FUN_080015ec
FUN_080015ec:
    ldr        r2,PTR_DAT_08001614
    ldrb       r2,[r2,r0]
    mul        r2,r1
    ldr        r3,PTR_gEntityListPlayerLocation_08001604
    lsl        r0,r0,#0x2
    ldr        r0,[r3,r0]
    add        r0,r0,r2
    mov        pc,lr
thumb_func_end FUN_080015ec

    .align 2, 0
    
    .word PTR_gEntityListPlayerLocation_08001604
    .word PTR_DAT_08001614
PTR_gEntityListPlayerLocation_08001604:
    .word gEntityListPlayerLocation
    .word gEntityListActor
    .word gEntityListAttack
    .word gListEffect
PTR_DAT_08001614:
    .byte 0xb0
    .byte 0xc0
    .byte 0xb0
    .byte 0xb0

thumb_func_start FUN_08001618
FUN_08001618:
    mov        r4,#0xc
    ldr        r2,PTR_PTR_gEntityListPlayerLocation_0800163c
    ldr        r3,[r2,r4]
LAB_0800161e:
    cmp        r0,r3
    bpl        LAB_08001628
    sub        r4,#0x4
    ldr        r3,[r2,r4]
    bne        LAB_0800161e
LAB_08001628:
    lsr        r4,r4,#0x2
    sub        r0,r0,r3
    ldr        r2,PTR_PTR_DAT_08001640
    ldr        r1,[r2,r4]
    bl         SWI_Div
    add        r1,r0,#0x0
    ldr        r2,PTR_DAT_08001644
    ldrb       r0,[r2,r4]
    mov        pc,lr
thumb_func_end FUN_08001618

    .align 2, 0
PTR_PTR_gEntityListPlayerLocation_0800163c: .word PTR_gEntityListPlayerLocation_08001604
PTR_PTR_DAT_08001640:                       .word PTR_DAT_08001614
PTR_DAT_08001644:                           .word DAT_08001648
DAT_08001648:
    .byte 0
    .byte 1
    .byte 2
    .byte 3

    .end