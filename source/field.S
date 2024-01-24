#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

.set Attack_SharpStrike_Create, 0x80719ac

_nt FUN_08000dd4
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


_nt FUN_08000e4e
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


_nt Field_IsEntityCellPositionValid
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    pop        {pc}


_nt Field_IsCellPositionValid
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


_nt Field_Search
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


_nt Field_SearchWithOwner
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

    .align 2, 0
PTR_listStartX_08000f40: .word listStartX
listStartX:
    .byte 1, 1
    .byte 1, 1


_ts Field_SearchExcludeFirstCol
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

    .align 2, 0
PTR_BYTE_ARRAY_ARRAY_08000fa0:  .word BYTE_ARRAY_ARRAY_08000fa4
BYTE_ARRAY_ARRAY_08000fa4:
    .byte 2, 1
    .byte 2, 1


_ts Field_GetFirstWalkableColumnFront
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


_ts Field_GetFirstColumnFront
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

    .align 2, 0
PTR_listOffsetX_105C_08001054:  .word listOffsetX_105C
PTR_listStartX_105E_08001058:   .word listStartX_105E
listOffsetX_105C:
    .byte 1, -1
listStartX_105E:
    .byte 1, 6


_ts Field_IndexToCellXY
    lsr        r1,r0,#0x3
    mov        r2,#0x7
    and        r0,r2
    mov        pc,lr


_ts Field_CreateEntity
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


_ts Field_GetDamageOnEntity
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


_ts FieldObject_SetPanelFlags
    push       {r5,lr}
    push       {r1}
    bl         Field_GetPanelFlagGroup
    pop        {r7}
    str        r1,[r7,#0xc]
    pop        {r5,pc}


_nt Field_CreateSharpStrikeAttack
    push       {lr}
    bl         Attack_SharpStrike_Create
    pop        {pc}


_nt Field_GetPanelFlagGroup
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    lsl        r0,r0,#0x3
    add        r0,r0,r1
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_080010f0
    ldr        r1,[r7,r0]
    mov        pc,lr

PTR_PanelFlag_ARRAY_ARRAY_080010f0: .word PanelFlag_ARRAY_ARRAY_080010f4
PanelFlag_ARRAY_ARRAY_080010f4:
    @ 0 | 0x00
    .word 0x0
    .word 0x0
    @ 1 | 0x01
    .word PF_Player
    .word PF_Enemy
    @ 2 | 0x02
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
    @ 3 | 0x03
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy
    @ 4 | 0x04
    .word PF_Player
    .word PF_Ground | PF_Enemy
    @ 5 | 0x05
    .word PF_EnemyOccupied | PF_Solid | PF_FieldBlock
    .word PF_PlayerOccupied | PF_Solid | PF_FieldBlock | 0x100
    @ 6 | 0x06
    .word 0x100
    .word 0x100
    @ 7 | 0x07
    .word PF_Enemy | PF_Solid | PF_FieldBlock
    .word PF_Player | PF_Solid | PF_FieldBlock
    @ 8 | 0x08
    .word PF_Ground | 0x100
    .word PF_Ground | 0x100
    @ 9 | 0x09
    .word PF_PlayerOccupied | PF_ActorPlayer
    .word PF_EnemyOccupied | PF_ActorEnemy
    @ 10 | 0x0A
    .word PF_EnemyOccupied | PF_Enemy | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    @ 11 | 0x0B
    .word PF_Ground | PF_PlayerOccupied | PF_ActorPlayer
    .word PF_Ground | PF_EnemyOccupied | PF_ActorEnemy
    @ 12 | 0x0C
    .word PF_PlayerOccupied | PF_Armor | PF_ActorPlayer
    .word PF_EnemyOccupied | PF_Armor | PF_ActorEnemy
    @ 13 | 0x0D
    .word PF_PlayerOccupied
    .word PF_EnemyOccupied
    @ 14 | 0x0E
    .word PF_PlayerOccupied | PF_ActorPlayer | PF_Drain
    .word PF_EnemyOccupied | PF_ActorEnemy | PF_Drain
    @ 15 | 0x0F
    .word PF_Teleporting
    .word PF_Teleporting
    @ 16 | 0x10
    .word PF_Solid | PF_FieldBlock
    .word PF_Solid | PF_FieldBlock
    @ 17 | 0x11
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Solid | PF_Break | PF_FieldBlock
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Solid | PF_Break | PF_FieldBlock
    @ 18 | 0x12
    .word PF_Player | PF_PlayerPush
    .word PF_Enemy | PF_EnemyPush
    @ 19 | 0x13
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
    @ 20 | 0x14
    .word PF_Ground | PF_Player | PF_PlayerPush
    .word PF_Ground | PF_Enemy | PF_EnemyPush
    @ 21 | 0x15
    .word PF_Player | PF_DieBombExplosion
    .word PF_Enemy | PF_DieBombExplosion
    @ 22 | 0x16
    .word PF_Player | PF_Freeze
    .word PF_Enemy | PF_Freeze
    @ 23 | 0x17
    .word PF_Ground | PF_Player | PF_Freeze
    .word PF_Ground | PF_Enemy | PF_Freeze
    @ 24 | 0x18
    .word PF_Player | PF_Break
    .word PF_Enemy | PF_Break
    @ 25 | 0x19
    .word PF_PlayerOccupied | PF_Player
    .word PF_EnemyOccupied | PF_Enemy
    @ 26 | 0x1A
    .word PF_Ground | PF_PlayerOccupied | PF_Player
    .word PF_Ground | PF_EnemyOccupied | PF_Enemy
    @ 27 | 0x1B
    .word PF_PlayerOccupied | PF_Player
    .word PF_Ground | PF_EnemyOccupied | PF_Enemy
    @ 28 | 0x1C
    .word PF_PlayerOccupied | PF_Player | PF_Teleporting
    .word PF_EnemyOccupied | PF_Enemy | PF_Teleporting
    @ 29 | 0x1D
    .word PF_PlayerOccupied | PF_Player | PF_Armor
    .word PF_EnemyOccupied | PF_Enemy | PF_Armor
    @ 30 | 0x1E
    .word PF_Player | PF_FieldBlock
    .word PF_Enemy | PF_FieldBlock
    @ 31 | 0x1F
    .word PF_Ground | PF_Player | PF_FieldBlock
    .word PF_Ground | PF_Enemy | PF_FieldBlock
    @ 32 | 0x20
    .word PF_Player | PF_FieldBlock
    .word PF_Ground | PF_Enemy | PF_FieldBlock
    @ 33 | 0x21
    .word PF_PlayerOccupied | PF_FieldBlock
    .word PF_EnemyOccupied | PF_FieldBlock
    @ 34 | 0x22
    .word PF_Ground | PF_PlayerOccupied | PF_FieldBlock
    .word PF_Ground | PF_EnemyOccupied | PF_FieldBlock
    @ 35 | 0x23
    .word PF_Player | PF_PlayerPush | PF_FieldBlock
    .word PF_Enemy | PF_EnemyPush | PF_FieldBlock
    @ 36 | 0x24
    .word PF_Ground | PF_Player | PF_PlayerPush | PF_FieldBlock
    .word PF_Ground | PF_Enemy | PF_EnemyPush | PF_FieldBlock
    @ 37 | 0x25
    .word PF_PlayerOccupied | PF_Break | PF_Chaser
    .word PF_EnemyOccupied | PF_Break | PF_Chaser
    @ 38 | 0x26
    .word PF_EnemyOccupied | PF_Enemy
    .word PF_PlayerOccupied | PF_Player
    @ 39 | 0x27
    .word PF_Ground
    .word PF_Ground
    @ 40 | 0x28
    .word PF_Player | PF_Enemy
    .word PF_Player | PF_Enemy
    @ 41 | 0x29
    .word PF_Ground | PF_Player | PF_Enemy
    .word PF_Ground | PF_Player | PF_Enemy
    @ 42 | 0x2A
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
    @ 43 | 0x2B
    .word PF_Player | PF_Enemy | PF_Trap
    .word PF_Player | PF_Enemy | PF_Trap
    @ 44 | 0x2C
    .word PF_Player | PF_Numb
    .word PF_Enemy | PF_Numb
    @ 45 | 0x2D
    .word PF_Ground | PF_Player | PF_Numb
    .word PF_Ground | PF_Enemy | PF_Numb
    @ 46 | 0x2E
    .word PF_Player | PF_Numb
    .word PF_Ground | PF_Enemy | PF_Numb
    @ 47 | 0x2F
    .word PF_PlayerOccupied | PF_Numb
    .word PF_EnemyOccupied | PF_Numb
    @ 48 | 0x30
    .word PF_PlayerOccupied | PF_Player | PF_Numb
    .word PF_EnemyOccupied | PF_Enemy | PF_Numb
    @ 49 | 0x31
    .word PF_EnemyOccupied | PF_Enemy | PF_Solid | PF_FieldBlock | PF_Drain
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Drain
    @ 50 | 0x32
    .word PF_Sealed
    .word PF_Sealed
    @ 51 | 0x33
    .word PF_Enemy | PF_Break | PF_FieldBlock
    .word PF_Player | PF_Break | PF_FieldBlock
    @ 52 | 0x34
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed
    .word PF_PlayerOccupied | PF_Teleporting | PF_Solid | PF_Sealed


_ts Field_GetAttackDirectionOffset_MP
    ldrb       r0,[r5,#0x16]
_nt Field_GetAttackDirectionOffset
    mov        r1,r10
    ldr        r1,[r1,#0xc]
    ldrb       r1,[r1,#0x1a]
    eor        r0,r1
    lsl        r0,r0,#0x1
    sub        r0,#0x1
    neg        r0,r0
    mov        pc,lr


_nt Field_GetRandomXZPosOnTarget
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


_ts Field_FindEmptyOpponentWalkablePanelsFront
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

_ts Field_GetFirstWalkableOpponentPanelFront
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


_nt Field_FindEmptyOpponentWalkableEdgeFront
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


_nt Field_GetFirstWalkableOpponentPanelBack
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


_ts Field_FindFirstEdgeForward
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


_ts Field_GetFirstInRowForward
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

    .align 2, 0
PTR_listSearchDirection_0800141c:   .word listSearchDirection
listSearchDirection:
    .byte 6, -1
    .byte 1,  1

_ts Field_OpponentFindInRowForward
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


_ts Field_FindEmptyEnemyPanelForward
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

_ts Field_CrackPanel
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

    .align 2, 0
INT_0800156c: .word 0x2000C30

_ts FUN_08001570
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


_nt FUN_080015ec
    ldr        r2,PTR_DAT_08001614
    ldrb       r2,[r2,r0]
    mul        r2,r1
    ldr        r3,PTR_gEntityListPlayerLocation_08001604
    lsl        r0,r0,#0x2
    ldr        r0,[r3,r0]
    add        r0,r0,r2
    mov        pc,lr

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

_ts FUN_08001618
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

    .align 2, 0
PTR_PTR_gEntityListPlayerLocation_0800163c: .word PTR_gEntityListPlayerLocation_08001604
PTR_PTR_DAT_08001640:                       .word PTR_DAT_08001614
PTR_DAT_08001644:                           .word DAT_08001648
DAT_08001648:
    .byte 0
    .byte 1
    .byte 2
    .byte 3


_nt Battle_SetBattleFlag
    mov        r1,#0x1
    lsl        r1,r0
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r0,[r7,#0x68]
    orr        r0,r1
    str        r0,[r7,#0x68]
    mov        pc,lr


_nt Battle_GetBattleFlagCurrent
    mov        r1,#0x1
    lsl        r1,r0
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r0,[r7,#0x68]
    ldr        r2,[r7,#0x6c]
    orr        r0,r2
    and        r0,r1
    mov        pc,lr


_nt Battle_GetBattleFlagMulti
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r1,[r7,#0x68]
    ldr        r2,[r7,#0x6c]
    orr        r1,r2
    and        r0,r1
    mov        pc,lr


_nt Battle_GetBattleFlag
    mov        r1,#0x1
    lsl        r1,r0
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r0,[r7,#0x6c]
    and        r0,r1
    mov        pc,lr


_nt Field_CreateStrikeEffect
    push       {r5,lr}
    push       {r0}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r3}
    bl         Field_GetPanelFlags
    pop        {r3}
    ldr        r1,DAT_080016d0
    tst        r0,r1
    pop        {r0}
    bne        LAB_080016b0
    add        r4,r0,#0x0
    ldrb       r0,[r5,#0x1a]
    tst        r0,r0
    beq        LAB_080016b2
    mov        r4,#0x19
    add        r4,r4,r0
    b          LAB_080016b2
LAB_080016b0:
    mov        r4,#0x2
LAB_080016b2:
    mov        r7,#0x0
    tst        r4,r4
    beq        LAB_080016cc
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    mov        r0,#0xf
    push       {r4,r7}
    bl         Field_GetRandomXZPosOnTarget
    pop        {r4,r7}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
LAB_080016cc:
    pop        {r5,pc}

    .align 2, 0
DAT_080016d0:
    .word 0x40000


@@ Creates an effect based on the property of the target.
@@ if armored, create an effect of the attack bouncing
@@ off.
_nt Field_CreateBusterEffect
    push       {r5,lr}
    push       {r0}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r3}
    bl         Field_GetPanelFlags
    pop        {r3}
    ldr        r1,DAT_08001710
    tst        r0,r1
    pop        {r0}
    bne        LAB_080016f6
    mov        r7,#0x0
    tst        r0,r0
    beq        LAB_0800170c
    add        r4,r0,#0x0
    b          LAB_080016f8
LAB_080016f6:
    mov        r4,#0x2
LAB_080016f8:
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    mov        r0,#0xf
    push       {r4,r7}
    bl         Field_GetRandomXZPosOnTarget
    pop        {r4,r7}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
LAB_0800170c:
    pop        {r5,pc}

    .align 2, 0
DAT_08001710:
    .word 0x40000


_nt R_Actor_CheckPush
    push       {r2,r7,lr}
    ldr        r7,PTR_INT_08001758
    mov        r1,#0x10
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_08001722
    add        r7,#0x4
LAB_08001722:
    mov        r1,#0x20
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_0800172c
    add        r7,#0x8
LAB_0800172c:
    ldr        r1,[r7,#0x0]
    mov        r2,r10
    ldr        r2,[r2,#0xc]
    ldrb       r2,[r2,#0x1a]
    tst        r2,r2
    beq        LAB_0800173a
    neg        r1,r1
LAB_0800173a:
    push       {r1}
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r1
    sub        r0,#0x1
    cmp        r0,#0x6
    bcs        LAB_08001750
    pop        {r1}
    mov        r0,#0x4
    mul        r0,r1
    lsl        r0,r0,#0x10
    pop        {r2,r7,pc}
LAB_08001750:
    pop        {r0}
    mov        r0,#0x0
    mov        r1,#0x0
    pop        {r2,r7,pc}
PTR_INT_08001758:
    .word INT_0800175c
INT_0800175c:
    .word 0
    .word 1
    .word -1
    .word 0


_nt Field_RepairPanel
    push       {lr}
    push       {r0,r1}
    bl         Field_GetPanelProperty
    pop        {r0,r1}
    mov        r3,#0x1
    orr        r2,r3
    mov        r3,#0x4
    mvn        r3,r3
    and        r2,r3
    bl         Field_SetPanelProperty
    pop        {pc}


_nt R_Actor_ClearCurrentAttack
    push       {lr}
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0800179c
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
LAB_0800179c:
    pop        {pc}


_nt Battle_GetBattleFlagBuffer
    add        r0,#0x1c
    mov        r1,#0x1
    lsl        r1,r0
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r0,[r7,#0x68]
    tst        r0,r1
    mov        pc,lr


_nt Battle_GetPlayer
    lsl        r0,r0,#0x2
    add        r0,#0x40
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,r0]
    mov        pc,lr


_nt Battle_FindFirstEnemyPanel
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    add        r2,r0,#0x0
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_080017f8
    ldr        r3,[r7,r3]
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
LAB_080017ce:
    mov        r1,#0x3
    push       {r0,r1,r2,r3}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r2,r3}
    beq        LAB_080017f2
LAB_080017dc:
    push       {r0,r1,r2,r3}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r6,r3
    bne        LAB_080017f6
    sub        r1,#0x1
    bpl        LAB_080017dc
    add        r0,r0,r2
    b          LAB_080017ce
LAB_080017f2:
    mov        r0,#0x0
    ldrb       r1,[r5,#0x19]
LAB_080017f6:
    pop        {pc}
PTR_PanelFlag_ARRAY_080017f8:
    .word PanelFlag_ARRAY_080017fc
PanelFlag_ARRAY_080017fc:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


_nt Battle_FindOpponentInSameColumn
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    neg        r2,r0
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0800183c
    ldr        r3,[r7,r3]
    ldrb       r0,[r5,#0x18]
    mov        r1,#0x3
    push       {r0,r1,r2,r3}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r2,r3}
    beq        LAB_08001836
LAB_08001824:
    push       {r0,r1,r2,r3}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r6,r3
    bne        LAB_0800183a
    sub        r1,#0x1
    bpl        LAB_08001824
LAB_08001836:
    mov        r0,#0x0
    ldrb       r1,[r5,#0x19]
LAB_0800183a:
    pop        {pc}
PTR_PanelFlag_ARRAY_0800183c:
    .word PanelFlag_ARRAY_080017fc


_nt Battle_FindOpponentPanelsForward
    push       {lr}
    push       {r0}
    bl         Field_GetAttackDirectionOffset_MP
    add        r2,r0,#0x0
    pop        {r0}
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0800188c
    ldr        r3,[r7,r3]
    add        r7,r0,#0x0
    mov        r4,#0x0
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
LAB_0800185c:
    mov        r1,#0x3
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r2,r3,r4,r7}
    beq        LAB_08001888
LAB_0800186a:
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r3
    beq        LAB_08001880
    lsl        r6,r1,#0x3
    add        r6,r6,r0
    strb       r6,[r7,r4]
    add        r4,#0x4
LAB_08001880:
    sub        r1,#0x1
    bpl        LAB_0800186a
    add        r0,r0,r2
    b          LAB_0800185c
LAB_08001888:
    add        r0,r4,#0x0
    pop        {pc}
PTR_PanelFlag_ARRAY_0800188c:
    .word PanelFlag_ARRAY_08001890
PanelFlag_ARRAY_08001890:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


_nt Battle_IsOnscreenX
    mov        r2,#0x2a
    ldrsh      r1,[r5,r2]
    add        r2,r1,r0
    add        r2,#0x78
    sub        r3,r1,r0
    add        r3,#0x78
    mov        r0,#0x1
    cmp        r2,#0xef
    bls        LAB_080018b0
    cmp        r3,#0xef
    bls        LAB_080018b0
    mov        r0,#0x0
LAB_080018b0:
    mov        pc,lr

    .align 2, 0

    .end
