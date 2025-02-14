#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listSharkManSpec:
    .byte 0x78
    .byte 0x50
    .byte 0x05
    .byte 0x08
    .byte 0x78
    .byte 0x50
    .byte 0x07
    .byte 0x05
    .byte 0x78
    .byte 0x50
    .byte 0x09
    .byte 0x04


_ts Routine_SharkMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_SharkMan_0_Init_08065898
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkMan_0_Init_08065898:
    .word PTR_R_SharkMan_0_Init_0806589c

PTR_R_SharkMan_0_Init_0806589c:
    .word R_SharkMan_0_Init
    .word R_SharkMan_1_Main
    .word R_SharkMan_2_Free


_ts R_SharkMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x59
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r2,#0x0
    str        r2,[r5,#0x30]
    mov        r7,#0x50
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x3
    strb       r0,[r5,#0x1a]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    str        r0,[r5,#0x20]
    mov        r0,#0x60
    add        r0,r0,r5
    mov        r1,#0x20
    mov        r2,#0x0
    bl         memset_32
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_0806590e
    bl         Battle_LoadEnemyHp
    bl         R_SharkMan_SpawnFins
    tst        r0,r0
    beq        LAB_08065982
    bl         Battle_PriorityQueueEnqueue
LAB_0806590e:
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1b
    lsr        r0,r0,#0x19
    ldr        r7,PTR_listSharkManSpec_08065988
    add        r7,r7,r0
    str        r7,[r5,#0x68]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#0x24]
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1f
    lsl        r0,r0,#0x1
    sub        r0,#0x1
    mov        r1,#0xc0
    lsl        r1,r1,#0x8
    mul        r0,r1
    str        r0,[r5,#0x48]
    ldr        r7,[r5,#0x68]
    ldrb       r0,[r7,#0x2]
    lsl        r0,r0,#0x10
    neg        r0,r0
    str        r0,[r5,#0x44]
    mov        r0,#0x9
    ldrb       r1,[r5,#0x4]
    lsr        r1,r1,#0x8
    bcc        LAB_0806594a
    mov        r0,#0xc
    mov        r3,#0x60
    mov        r1,#0x1
    strb       r1,[r5,r3]
LAB_0806594a:
    mov        r1,#0x6c
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r1,#0x70
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r7,#0x9]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_SharkMan_1_Main
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_08065982:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}

PTR_listSharkManSpec_08065988:
    .word listSharkManSpec


_ts R_SharkMan_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0xc
    mov        r3,#0x60
    ldrb       r1,[r5,r3]
    tst        r1,r1
    bne        LAB_080659a4
    mov        r0,#0x9
LAB_080659a4:
    ldr        r1,[r5,#0x6c]
    bl         Field_SetPanelFlagsOnEntity
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         R_SharkMan_CheckDamage
    tst        r0,r0
    bne        LAB_080659c2
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Drone_1_0_Spawn_080659d0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_080659c2:
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Drone_1_0_Spawn_080659d0:
    .word PTR_R_Drone_1_0_Spawn_080659d4

PTR_R_Drone_1_0_Spawn_080659d4:
    .word R_Drone_1_0_Spawn
    .word R_SharkMan_1_1_WaitForBattleStart
    .word R_SharkMan_1_2_Idle
    .word R_SharkMan_1_3_Flinch
    .word R_SharkMan_1_4_Move
    .word R_SharkMan_1_5
    .word R_SharkMan_1_6_AquaTower
    .word R_SharkMan_1_7
    .word R_SharkMan_1_8_Dive
    .word R_SharkMan_1_9_FinEmerge
    .word R_SharkMan_1_10_RushForward


_ts R_SharkMan_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08065a20
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08065a1c
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
LAB_08065a1c:
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08065a20:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08065a32
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065a32:
    pop        {pc}


_ts R_SharkMan_1_2_Idle
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_2_0_08065a54
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08065a52
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08065a52:
    pop        {pc}

PTR_PTR_R_SharkMan_1_2_0_08065a54:
    .word PTR_R_SharkMan_1_2_0_08065a58

PTR_R_SharkMan_1_2_0_08065a58:
    .word R_SharkMan_1_2_0
    .word R_SharkMan_1_2_1


_ts R_SharkMan_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x30
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_SharkMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065a88
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065a88:
    pop        {pc}


_nt R_SharkMan_1_3_Flinch
    push       {lr}
    ldr        r0,PTR_gFrameCounter_08065ab4
    ldrh       r0,[r0,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_08065a98
    bl         SpritePtr_EnableFlash
LAB_08065a98:
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_3_0_08065aa4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SharkMan_1_3_0_08065aa4:
    .word PTR_R_SharkMan_1_3_0_08065aa8

PTR_R_SharkMan_1_3_0_08065aa8:
    .word R_SharkMan_1_3_0
    .word R_SharkMan_1_3_1
    .word R_SharkMan_1_3_2

PTR_gFrameCounter_08065ab4:
    .word gFrameCounter


_ts R_SharkMan_1_3_0
    push       {lr}
    bl         dummy_660c8
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_SharkMan_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065af0
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08065af0:
    pop        {pc}


_nt R_SharkMan_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065b06
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x5a
    mov        r3,#0x64
    strh       r0,[r5,r3]
LAB_08065b06:
    pop        {pc}


_ts R_SharkMan_1_4_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_4_0_StartMove_08065b18
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkMan_1_4_0_StartMove_08065b18:
    .word PTR_R_SharkMan_1_4_0_StartMove_08065b1c

PTR_R_SharkMan_1_4_0_StartMove_08065b1c:
    .word R_SharkMan_1_4_0_StartMove
    .word R_SharkMan_1_4_1_EndMove


_ts R_SharkMan_1_4_0_StartMove
    push       {lr}
    ldr        r0,[r5,#0x48]
    mov        r6,#0x2
LAB_08065b2a:
    lsr        r1,r0,#0x1f
    lsl        r1,r1,#0x1
    neg        r1,r1
    add        r1,#0x1
    ldrb       r0,[r5,#0x19]
    add        r1,r1,r0
    ldrb       r0,[r5,#0x18]
    ldr        r7,[r5,#0x70]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    push       {r6}
    bl         FieldObject_GetPanelFlags
    pop        {r6}
    ldr        r1,DAT_08065b7c
    tst        r0,r1
    bne        LAB_08065b58
    ldr        r1,DAT_08065b78
    and        r0,r1
    cmp        r0,r1
    beq        LAB_08065b68
LAB_08065b58:
    ldr        r0,[r5,#0x48]
    neg        r0,r0
    str        r0,[r5,#0x48]
    sub        r6,#0x1
    bne        LAB_08065b2a
    bl         R_SharkMan_Decide
    pop        {pc}
LAB_08065b68:
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_08065b78:
    .word 0x3

DAT_08065b7c:
    .word 0x800


_ts R_SharkMan_1_4_1_EndMove
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_08065b9e
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    ldr        r2,[r5,#0x48]
    add        r1,r1,r2
    str        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}
LAB_08065b9e:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    bl         R_SharkMan_Decide
    pop        {pc}


_nt R_SharkMan_1_5
    push       {lr}
    ldrb       r0,[r5,#0x5]
    add        r0,#0x2
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_5_0_08065bcc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SharkMan_1_5_0_08065bcc:
    .word PTR_R_SharkMan_1_5_0_08065bd0

PTR_R_SharkMan_1_5_0_08065bd0:
    .word R_SharkMan_1_5_0
    .word R_SharkMan_1_5_1


_ts R_SharkMan_1_5_0
    push       {lr}
    ldrh       r1,[r5,#0x18]
    ldr        r0,[r5,#0x70]
    strh       r1,[r0,#0x4]
    strh       r1,[r0,#0x2]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_SharkMan_1_5_1
    push       {lr}
    mov        r0,#0x4
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_08065c00
    mov        r0,#0x20
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065c00:
    pop        {pc}


_nt R_SharkMan_1_6_AquaTower
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_6_0_Emerge_08065c10
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SharkMan_1_6_0_Emerge_08065c10:
    .word PTR_R_SharkMan_1_6_0_Emerge_08065c14

PTR_R_SharkMan_1_6_0_Emerge_08065c14:
    .word R_SharkMan_1_6_0_Emerge
    .word R_SharkMan_1_6_1_AquaTower
    .word R_SharkMan_1_6_2_Wait
    .word R_SharkMan_1_6_3_Dive
    .word R_SharkMan_1_6_4_SetState
    .word R_SharkMan_1_6_5_Next


_ts R_SharkMan_1_6_0_Emerge
    push       {lr}
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    bl         R_SharkMan_Splash
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x35
    strh       r0,[r5,#0x1c]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x9]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_SharkMan_1_6_1_AquaTower
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065c90
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    ldrb       r4,[r5,#0x19]
    mov        r1,#0x1
    mov        r2,#0x2
    bl         Field_GetColumnInRowLeftToRight
    tst        r0,r0
    beq        LAB_08065c88
    add        r0,#0x1
    ldrb       r1,[r5,#0x19]
    LoadMain battle, r2, r2
    ldr        r2,[r2,#0x40]
    add        r2,#0x2c
    mov        r3,#0x3
    mov        r4,#0x2
    ldr        r6,[r5,#0x68]
    ldrb       r6,[r6,#0x1]
    bl         Attack_Tower_Create
LAB_08065c88:
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08065c90:
    pop        {pc}


_nt R_SharkMan_1_6_2_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065ca0
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08065ca0:
    pop        {pc}


_nt R_SharkMan_1_6_3_Dive
    push       {lr}
    mov        r0,#0x1
    bl         Battle_SetBattleFlag
    mov        r0,#0xc
    bl         Battle_GetBattleFlagMulti
    mov        r1,#0xc
    cmp        r0,r1
    bne        LAB_08065cd2
    mov        r0,#0x4
    bl         Battle_SetBattleFlag
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    bl         R_SharkMan_Splash
    mov        r0,#0x1
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08065cd2:
    pop        {pc}


_ts R_SharkMan_1_6_4_SetState
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08065cf8
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r7,#0x9]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_08065cf8:
    pop        {pc}


_nt R_SharkMan_1_6_5_Next
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0xc0
    bl         Battle_GetBattleFlagMulti
    mov        r1,#0xc0
    cmp        r0,r1
    bne        LAB_08065d24
    ldrh       r1,[r5,#0x18]
    ldr        r0,[r5,#0x70]
    strh       r1,[r0,#0x4]
    strh       r1,[r0,#0x2]
    bl         FieldObject_Enable
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065d24:
    pop        {pc}


_nt R_SharkMan_1_7
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_7_0_08065d3c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SharkMan_1_7_0_08065d3c:
    .word PTR_R_SharkMan_1_7_0_08065d40

PTR_R_SharkMan_1_7_0_08065d40:
    .word R_SharkMan_1_7_0


_ts R_SharkMan_1_7_0
    push       {lr}
    sub        sp,#0x10
    mov        r7,sp
    mov        r0,#0xc
    add        r6,r7,r0
    add        r2,r7,#0x0
    ldr        r0,[r5,#0x74]
    ldr        r1,[r5,#0x78]
    stmia      r2!,{r0,r1,r5}
    ldr        r0,DAT_08065da4
    str        r0,[r6,#0x0]
    add        r0,r6,#0x0
    mov        r1,#0x3
    mov        r2,#0x6
    push       {r6,r7}
    bl         ArrayShuffle
    pop        {r6,r7}
    mov        r0,#0x2
LAB_08065d6a:
    push       {r0,r6,r7}
    ldrb       r1,[r6,r0]
    ldr        r1,[r7,r1]
    add        r0,#0x4
    strb       r0,[r1,#0x18]
    push       {r1}
    bl         R_SharkMan_ChooseNextY
    pop        {r1}
    push       {r1}
    ldrb       r0,[r1,#0x18]
    ldrb       r1,[r1,#0x19]
    bl         Battle_CellCoordsToSprite
    pop        {r7}
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    pop        {r0,r6,r7}
    sub        r0,#0x1
    bpl        LAB_08065d6a
    mov        r0,#0x8
    bl         Battle_SetBattleFlag
    mov        r0,#0x24
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    add        sp,#0x10
    pop        {pc}

DAT_08065da4:
    .word 0x80400


_ts R_SharkMan_1_8_Dive
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_8_0_08065db8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkMan_1_8_0_08065db8:
    .word PTR_R_SharkMan_1_8_0_08065dbc

PTR_R_SharkMan_1_8_0_08065dbc:
    .word R_SharkMan_1_8_0
    .word R_SharkMan_1_8_1
    .word R_SharkMan_1_8_2


_ts R_SharkMan_1_8_0
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_SharkMan_1_8_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08065dec
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08065dec:
    pop        {pc}


_nt R_SharkMan_1_8_2
    push       {lr}
    ldrb       r0,[r5,#0x5]
    add        r0,#0x6
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_08065e12
    mov        r0,#0x24
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065e12:
    pop        {pc}


_ts R_SharkMan_1_9_FinEmerge
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_9_0_Emerge_08065e24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkMan_1_9_0_Emerge_08065e24:
    .word PTR_R_SharkMan_1_9_0_Emerge_08065e28

PTR_R_SharkMan_1_9_0_Emerge_08065e28:
    .word R_SharkMan_1_9_0_Emerge
    .word R_SharkMan_1_9_1_Next


_ts R_SharkMan_1_9_0_Emerge
    push       {lr}
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    bl         R_SharkMan_Splash
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_SharkMan_1_9_1_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08065e66
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08065e5e
    mov        r0,#0x0
    mov        r3,#0x60
    strb       r0,[r5,r3]
LAB_08065e5e:
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065e66:
    pop        {pc}


_ts R_SharkMan_1_10_RushForward
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_SharkMan_1_10_0_Prepare_08065e7c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_SharkMan_1_10_0_Prepare_08065e7c:
    .word PTR_R_SharkMan_1_10_0_Prepare_08065e80

PTR_R_SharkMan_1_10_0_Prepare_08065e80:
    .word R_SharkMan_1_10_0_Prepare
    .word R_SharkMan_1_10_1_StartAnim
    .word R_SharkMan_1_10_2_RushForward
    .word R_SharkMan_1_10_3_Return


_ts R_SharkMan_1_10_0_Prepare
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    mov        r3,#0x60
    strb       r0,[r5,r3]
    ldrh       r1,[r5,#0x18]
    ldr        r0,[r5,#0x70]
    strh       r1,[r0,#0x4]
    strh       r1,[r0,#0x2]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_SharkMan_1_10_1_StartAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08065ec8
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x94
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08065ec8:
    pop        {pc}


_nt R_SharkMan_1_10_2_RushForward
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08065ef6
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    tst        r0,r1
    bne        LAB_08065ef6
    ldr        r1,[r5,#0x44]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}
LAB_08065ef6:
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_SharkMan_1_10_3_Return
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08065f38
    ldr        r7,[r5,#0x70]
    ldrb       r0,[r7,#0x2]
    ldrb       r1,[r7,#0x3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08065f30
    mov        r0,#0x0
    mov        r3,#0x60
    strb       r0,[r5,r3]
LAB_08065f30:
    mov        r0,#0x24
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065f38:
    pop        {pc}


_nt R_SharkMan_2_Free
    push       {lr}
    mov        r0,#0x5
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_SharkMan_2_0_Delete_08065f54
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_SharkMan_2_0_Delete_08065f54:
    .word PTR_R_SharkMan_2_0_Delete_08065f58

PTR_R_SharkMan_2_0_Delete_08065f58:
    .word R_SharkMan_2_0_Delete
    .word R_SharkMan_2_1_Free


_ts R_SharkMan_2_0_Delete
    push       {lr}
    bl         dummy_660c8
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x0
    ldrb       r1,[r5,#0x4]
    lsr        r1,r1,#0x8
    bcs        LAB_08065f7e
    push       {r0}
    bl         Battle_RegisterVirusDelete
    pop        {r0}
    mov        r0,#0x5
LAB_08065f7e:
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


_ts R_SharkMan_2_1_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065fbc
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x70]
    bl         FieldObject_Free
    ldrb       r1,[r5,#0x4]
    lsr        r1,r1,#0x8
    bcs        LAB_08065fb4
LAB_08065fb4:
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08065fbc:
    pop        {pc}


_nt R_SharkMan_CheckDamage
    push       {lr}
    mov        r0,#0x5
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_08066034
    bl         Battle_IsInputLocked
    bne        LAB_08066066
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08065fe4
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_08066034
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_08066034
LAB_08065fe4:
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    tst        r0,r0
    bne        LAB_08066066
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_08066066
    mov        r3,#0x64
    ldrh       r0,[r5,r3]
    tst        r0,r0
    beq        LAB_0806600c
    sub        r0,#0x1
    strh       r0,[r5,r3]
    lsr        r0,r0,#0x1
    bcc        LAB_08066066
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    b          LAB_08066066
LAB_0806600c:
    mov        r0,#0xa
    ldr        r1,[r5,#0x6c]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08066066
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08066066
    bl         Field_SubtractHP
    mov        r0,#0x1
    strb       r0,[r5,#0x6]
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806605c
LAB_08066034:
    ldrb       r1,[r5,#0x4]
    lsr        r1,r1,#0x8
    bcs        LAB_08066048
    bl         Battle_DecreaseOpponentCount
    ldr        r0,[r5,#0x6c]
    mov        r1,#0x10
    lsl        r1,r1,#0x10
    bl         FieldObject_ClearPanelFlag
LAB_08066048:
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0806605c:
    mov        r0,#0x6f
    bl         Sound_PlaySE
    mov        r0,#0x0
    pop        {pc}
LAB_08066066:
    mov        r0,#0x0
    pop        {pc}


_nt R_SharkMan_Decide
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcc        LAB_08066086
    mov        r0,#0x1
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_08066096
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08066086:
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    beq        LAB_08066096
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08066096:
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x19]
    ldrb       r1,[r5,#0x19]
    cmp        r0,r1
    bne        LAB_080660be
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_080660be
    mov        r0,#0x28
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    pop        {pc}
LAB_080660be:
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts dummy_660c8
    mov        pc,lr


_nt R_SharkMan_SpawnFins
    push       {lr}
    mov        r0,#0x4
    mov        r1,#0x1
    ldrb       r4,[r5,#0x4]
    mov        r2,#0x80
    orr        r4,r2
    push       {r4}
    bl         Routine_SharkMan_Create
    pop        {r4}
    str        r7,[r5,#0x74]
    tst        r7,r7
    beq        LAB_080660fc
    mov        r0,#0x6
    mov        r1,#0x3
    mov        r2,#0x1
    lsl        r2,r2,#0x8
    orr        r4,r2
    bl         Routine_SharkMan_Create
    str        r7,[r5,#0x78]
    tst        r7,r7
    beq        LAB_080660fc
    mov        r0,#0x1
    pop        {pc}
LAB_080660fc:
    mov        r0,#0x0
    pop        {pc}


_ts R_SharkMan_ChooseNextY
    push       {lr}
    sub        sp,#0x4
    mov        r7,sp
    add        r2,r1,#0x0
    mov        r1,#0x3
    mov        r3,#0x0
LAB_0806610c:
    push       {r0,r1,r2,r7}
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x3
    and        r0,r1
    cmp        r0,r1
    pop        {r0,r1,r2,r7}
    bne        LAB_08066120
    strb       r1,[r7,r3]
    add        r3,#0x1
LAB_08066120:
    sub        r1,#0x1
    bne        LAB_0806610c
    tst        r3,r3
    beq        LAB_0806613e
    push       {r2,r7}
    add        r0,r7,#0x0
    add        r1,r3,#0x0
    mov        r2,#0x3
    bl         ArrayShuffle
    pop        {r2,r7}
    ldrb       r0,[r7,#0x0]
    strb       r0,[r2,#0x19]
    add        sp,#0x4
    pop        {pc}
LAB_0806613e:
    mov        r0,#0x2
    strb       r0,[r2,#0x19]
    add        sp,#0x4
    pop        {pc}


_nt R_SharkMan_Splash
    push       {r5,lr}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x26
    bl         Effect_QuickEffect_Create
    pop        {r5,pc}


_nt Routine_SharkMan_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x29
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    tst        r7,r7
    beq        LAB_08066170
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08066170:
    pop        {pc}

    .align 2, 0

