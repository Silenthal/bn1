#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listPopperParams:
    .byte 0x3C
    .byte 0x00
    .byte 0x00
    .byte 0x64
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x8C
    .byte 0x3C
    .byte 0x00
    .byte 0x08
    .byte 0xB4


_ts Routine_Popper
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Popper_0_Init_080628c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Popper_0_Init_080628c8:
    .word PTR_R_Popper_0_Init_080628cc

PTR_R_Popper_0_Init_080628cc:
    .word R_Popper_0_Init
    .word R_Popper_1_Main
    .word R_Popper_2_Free


_ts R_Popper_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x4c
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    mov        r2,#0xd0
    lsl        r2,r2,#0x10
    str        r2,[r5,#0x30]
    mov        r7,#0x50
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x0
    mov        r3,#0x0
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listPopperParams_08062960
    add        r7,r7,r0
    str        r7,[r5,#0x70]
    ldrb       r0,[r7,#0x2]
    mov        r3,#0x60
    strb       r0,[r5,r3]
    ldrb       r0,[r7,#0x3]
    strh       r0,[r5,#0x24]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x9
    mov        r3,#0x74
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    mov        r0,#0xf
    mov        r3,#0x78
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_Popper_1_Main
    ldr        r0,[r5,#0x74]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_listPopperParams_08062960:
    .word listPopperParams


_ts R_Popper_1_Main
    push       {lr}
    ldr        r0,[r5,#0x74]
    bl         FieldObject_DisableIfHitFlagSet
    bl         FUN_08062c50
    tst        r0,r0
    bne        LAB_0806297e
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806298c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806297e:
    ldr        r0,[r5,#0x74]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0806298c:
    .word PTR_R_Actor_1_0_Spawn_08062990

PTR_R_Actor_1_0_Spawn_08062990:
    .word R_Actor_1_0_Spawn
    .word R_Popper_1_1_Wait
    .word R_Popper_1_2_Decide
    .word R_Popper_1_3_Move
    .word R_Popper_1_4_WoodTower


_ts R_Popper_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080629be
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_080629be:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080629d0
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080629d0:
    pop        {pc}


_nt R_Popper_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Popper_1_2_0_Wait_080629f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080629f0
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_080629f0:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Popper_1_2_0_Wait_080629f4:
    .word PTR_R_Popper_1_2_0_Wait_080629f8

PTR_R_Popper_1_2_0_Wait_080629f8:
    .word R_Popper_1_2_0_Wait
    .word R_Popper_1_2_1_Decide


_ts R_Popper_1_2_0_Wait
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r0,r1
    ldr        r7,[r5,#0x70]
    ldrh       r1,[r7,#0x0]
    add        r0,r0,r1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Popper_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062a48
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_08062a40
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08062a40:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08062a48:
    pop        {pc}


_nt R_Popper_1_3_Move
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    mov        r1,#0x4
    mov        r2,#0x0
    sub        sp,#0x4
    mov        r7,sp
    add        r6,r7,#0x0
LAB_08062a5e:
    sub        r1,#0x1
    beq        LAB_08062a8a
    ldrb       r3,[r5,#0x19]
    cmp        r1,r3
    beq        LAB_08062a5e
    push       {r0,r1,r2,r6,r7}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r6,r7}
    ldr        r4,PanelFlag_08062ac8
    tst        r3,r4
    bne        LAB_08062a5e
    ldr        r4,PanelFlag_08062ac4
    and        r3,r4
    cmp        r3,r4
    bne        LAB_08062a5e
    strb       r0,[r6,#0x0]
    strb       r1,[r6,#0x1]
    add        r6,#0x2
    add        r2,#0x1
    b          LAB_08062a5e
LAB_08062a8a:
    sub        r2,#0x1
    bmi        LAB_08062ab6
    push       {r2,r7}
    bl         Rng_RandomUint
    pop        {r2,r7}
    and        r0,r2
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x78]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
LAB_08062ab6:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    add        sp,#0x4
    pop        {pc}

    .align 2, 0


PanelFlag_08062ac4:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08062ac8:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_Popper_1_4_WoodTower
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Popper_1_4_0_StartAnim_08062ae0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Popper_1_4_0_StartAnim_08062ae0:
    .word PTR_R_Popper_1_4_0_StartAnim_08062ae4

PTR_R_Popper_1_4_0_StartAnim_08062ae4:
    .word R_Popper_1_4_0_StartAnim
    .word R_Popper_1_4_1_Drop
    .word R_Popper_1_4_2_WoodTower
    .word R_Popper_1_4_3_Wait
    .word R_Popper_1_4_4_Rise


_ts R_Popper_1_4_0_StartAnim
    push       {lr}
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x4c]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Popper_1_4_1_Drop
    push       {lr}
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x4c]
    sub        r0,r0,r1
    str        r0,[r5,#0x30]
    lsr        r0,r0,#0x10
    cmp        r0,#0x58
    bgt        LAB_08062b22
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Enable
    b          LAB_08062b28
LAB_08062b22:
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
LAB_08062b28:
    ldr        r0,[r5,#0x30]
    mov        r1,#0x40
    lsl        r1,r1,#0x10
    cmp        r0,r1
    bgt        LAB_08062b46
    str        r1,[r5,#0x30]
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08062b46:
    pop        {pc}


_ts R_Popper_1_4_2_WoodTower
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062b96
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    ldrh       r0,[r5,#0x20]
    ldrh       r1,[r5,#0x22]
    sub        r0,r1,r0
    lsr        r1,r1,#0x2
    cmp        r0,r1
    bmi        LAB_08062b76
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    sub        r0,#0x1
    bmi        LAB_08062b76
    strb       r0,[r5,r3]
    add        r0,r5,#0x0
    mov        r1,#0x4
    bl         ScreenDim_Recover_Create
    b          LAB_08062b8e
LAB_08062b76:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    mov        r2,#0x2c
    add        r2,r2,r7
    mov        r3,#0x4
    mov        r4,#0x3
    ldrh       r6,[r5,#0x24]
    bl         Attack_Tower_Create
LAB_08062b8e:
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08062b96:
    pop        {pc}


_ts R_Popper_1_4_3_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062bb0
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x4c]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_08062bb0:
    pop        {pc}


_nt R_Popper_1_4_4_Rise
    push       {lr}
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x4c]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    lsr        r0,r0,#0x10
    cmp        r0,#0x58
    bgt        LAB_08062bca
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Enable
    b          LAB_08062bd0
LAB_08062bca:
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
LAB_08062bd0:
    ldr        r0,[r5,#0x30]
    mov        r1,#0xd0
    lsl        r1,r1,#0x10
    cmp        r0,r1
    bmi        LAB_08062bea
    str        r1,[r5,#0x30]
    ldr        r0,[r5,#0x74]
    bl         FieldObject_ClearHitFlag
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08062bea:
    pop        {pc}


_ts R_Popper_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Popper_2_0_08062bfc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Popper_2_0_08062bfc:
    .word PTR_R_Popper_2_0_08062c00

PTR_R_Popper_2_0_08062c00:
    .word R_Popper_2_0
    .word R_Popper_2_1


_ts R_Popper_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_Popper_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08062c4e
    ldr        r0,[r5,#0x74]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x78]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08062c4e:
    pop        {pc}


_ts FUN_08062c50
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08062cb4
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_08062c92
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_08062c92
    ldr        r1,[r5,#0x74]
    ldrb       r0,[r1,#0x0]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_08062cb4
    mov        r0,#0xa
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08062cb4
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08062cb4
    bl         Field_SubtractHP
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08062caa
LAB_08062c92:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x74]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08062caa:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    pop        {pc}
LAB_08062cb4:
    mov        r0,#0x0
    pop        {pc}
