#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Vulgear
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Vulgear_0_Init_0805ab44
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_R_Vulgear_0_Init_0805ab38:
    .word R_Vulgear_0_Init
    .word R_Vulgear_1_Main
    .word R_Vulgear_2_Free

PTR_PTR_R_Vulgear_0_Init_0805ab44:
    .word PTR_R_Vulgear_0_Init_0805ab38


_ts R_Vulgear_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x14
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
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
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
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
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_Vulgear_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_DisableFlash
    bl         Battle_IsInputLocked
    bne        LAB_0805ac0e
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,DAT_0805ac68
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_0805ac0e
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0805ac0e:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0805ac30
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Vulgear_1_0_0805ac64
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805ac42
LAB_0805ac30:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0805ac42:
    pop        {pc}

PTR_R_Vulgear_1_0_0805ac44:
    .word R_Vulgear_1_0
    .word R_Vulgear_1_1
    .word R_Vulgear_1_2
    .word R_Vulgear_1_2
    .word R_Vulgear_1_2
    .word R_Vulgear_1_5
    .word R_Vulgear_1_6
    .word R_Vulgear_1_7

PTR_PTR_R_Vulgear_1_0_0805ac64:
    .word PTR_R_Vulgear_1_0_0805ac44

DAT_0805ac68:
    .word 0x28850


_ts R_Vulgear_1_0
    push       {lr}
    ldr        r7,PTR_PTR_R_Vulgear_1_0_0_0805ac88
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Vulgear_1_0_0_0805ac7c:
    .word R_Vulgear_1_0_0
    .word R_Vulgear_1_0_1
    .word R_Vulgear_1_0_2

PTR_PTR_R_Vulgear_1_0_0_0805ac88:
    .word PTR_R_Vulgear_1_0_0_0805ac7c


_ts R_Vulgear_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805ac9e
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0805ac9e:
    pop        {pc}


_ts R_Vulgear_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805acb2
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_0805acb2:
    pop        {pc}


_ts R_Vulgear_1_0_2
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805acc8
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805acc8:
    pop        {pc}


_nt R_Vulgear_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805ace4
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805ace4:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805acf6
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805acf6:
    pop        {pc}


_ts R_Vulgear_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Vulgear_1_2_0_0805ad20
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805ad16
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805ad16:
    pop        {pc}

PTR_R_Vulgear_1_2_0_0805ad18:
    .word R_Vulgear_1_2_0
    .word R_Vulgear_1_2_1

PTR_PTR_R_Vulgear_1_2_0_0805ad20:
    .word PTR_R_Vulgear_1_2_0_0805ad18


_ts R_Vulgear_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Vulgear_1_2_1
    pop        {pc}


_ts R_Vulgear_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    cmp        r0,#0xf0
    bmi        LAB_0805ad4e
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805ad4e:
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    bne        LAB_0805ad7a
    bl         R_Actor_GetNewY
    cmp        r0,#0xff
    beq        LAB_0805ad7a
    strb       r0,[r5,#0x7]
    ldr        r7,[r5,#0x64]
    ldrb       r1,[r5,#0x18]
    strb       r1,[r7,#0x2]
    strb       r1,[r7,#0x4]
    strb       r0,[r7,#0x3]
    strb       r0,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ad7a:
    pop        {pc}


_ts R_Vulgear_1_5
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Vulgear_1_5_0_0805ada0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    pop        {pc}

PTR_R_Vulgear_1_5_0_0805ad90:
    .word R_Vulgear_1_5_0
    .word R_Vulgear_1_5_1
    .word R_Vulgear_1_5_2
    .word R_Vulgear_1_5_3

PTR_PTR_R_Vulgear_1_5_0_0805ada0:
    .word PTR_R_Vulgear_1_5_0_0805ad90


_ts R_Vulgear_1_5_0
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Vulgear_1_5_1
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805adc2
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805adc2:
    mov        pc,lr


_ts R_Vulgear_1_5_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ade8
    ldrb       r1,[r5,#0x7]
    strb       r1,[r5,#0x19]
    ldrb       r0,[r5,#0x18]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x11
    strh       r0,[r5,#0x1c]
LAB_0805ade8:
    pop        {pc}


_nt R_Vulgear_1_5_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ae02
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ae02:
    pop        {pc}


_ts R_Vulgear_1_6
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Vulgear_1_6_0_0805ae40
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805ae22
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805ae22:
    pop        {pc}

PTR_R_Vulgear_1_6_0_0805ae24:
    .word R_Vulgear_1_6_0
    .word R_Vulgear_1_6_1
    .word R_Vulgear_1_6_2
    .word R_Vulgear_1_6_3
    .word R_Vulgear_1_6_4
    .word R_Vulgear_1_6_5
    .word R_Vulgear_1_6_6

PTR_PTR_R_Vulgear_1_6_0_0805ae40:
    .word PTR_R_Vulgear_1_6_0_0805ae24


_ts R_Vulgear_1_6_0
    mov        r0,#0x2
    strh       r0,[r5,#0x1c]
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Vulgear_1_6_1
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ae66
    mov        r0,#0x23
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0805ae66:
    mov        pc,lr


_ts R_Vulgear_1_6_2
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805ae7c
    mov        r0,#0x8
    strh       r0,[r5,#0x1c]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0805ae7c:
    mov        pc,lr


_nt R_Vulgear_1_6_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805aeba
    push       {r5}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    LoadMain battle, r2, r2
    ldr        r2,[r2,#0x40]
    add        r2,#0x2c
    ldr        r4,PTR_ElementID_0805aec4
    ldrb       r3,[r5,#0x4]
    add        r3,r3,r3
    add        r4,r4,r3
    ldrb       r3,[r4,#0x0]
    ldrb       r4,[r4,#0x1]
    ldr        r7,PTR_BYTE_ARRAY_0805aec8
    ldrb       r6,[r5,#0x4]
    ldrb       r6,[r7,r6]
    bl         Attack_Tower_Create
    pop        {r5}
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x2
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0805aeba:
    pop        {pc}

ElementID_0805aebc:
    element Fire
    .byte 0x00
    element Water
    .byte 0x02

BYTE_ARRAY_0805aec0:
    .byte 0x0F
    .byte 0x32

    .align 2, 0


PTR_ElementID_0805aec4:
    .word ElementID_0805aebc

PTR_BYTE_ARRAY_0805aec8:
    .word BYTE_ARRAY_0805aec0


_ts R_Vulgear_1_6_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805aee2
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strb       r0,[r5,#0xa]
LAB_0805aee2:
    mov        pc,lr


_ts R_Vulgear_1_6_5
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805aefa
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x2
    strh       r0,[r5,#0x1c]
    mov        r0,#0x18
    strb       r0,[r5,#0xa]
LAB_0805aefa:
    mov        pc,lr


_ts R_Vulgear_1_6_6
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805af0e
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805af0e:
    mov        pc,lr


_ts R_Vulgear_1_7
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Vulgear_1_7_0_0805af38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805af2e
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805af2e:
    pop        {pc}

PTR_R_Vulgear_1_7_0_0805af30:
    .word R_Vulgear_1_7_0
    .word R_Vulgear_1_7_1

PTR_PTR_R_Vulgear_1_7_0_0805af38:
    .word PTR_R_Vulgear_1_7_0_0805af30


_ts R_Vulgear_1_7_0
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        pc,lr


_nt R_Vulgear_1_7_1
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805af5a
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805af5a:
    mov        pc,lr


_ts R_Vulgear_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Vulgear_2_0_Delete_0805af74
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Vulgear_2_0_Delete_0805af6c:
    .word R_Vulgear_2_0_Delete
    .word R_Vulgear_2_1_Free

PTR_PTR_R_Vulgear_2_0_Delete_0805af74:
    .word PTR_R_Vulgear_2_0_Delete_0805af6c


_ts R_Vulgear_2_0_Delete
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
    str        r0,[r5,#0x7c]
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt R_Vulgear_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805afb4
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805afb4:
    pop        {pc}


_nt R_Actor_GetNewY
    push       {lr}
    sub        sp,#0x10
    mov        r8,sp
    ldr        r6,PTR_BYTE_ARRAY_0805b020
    ldrb       r0,[r5,#0x19]
    sub        r0,#0x1
    add        r0,r0,r0
    add        r6,r6,r0
    mov        r2,#0x0
    ldrb       r1,[r6,#0x0]
    ldrb       r0,[r5,#0x18]
    push       {r1,r2,r6}
    bl         IsPanelWalkable
    pop        {r1,r2,r6}
    tst        r0,r0
    beq        LAB_0805afe4
    ldr        r0,PanelFlag_0805b024
    tst        r0,r3
    bne        LAB_0805afe4
    mov        r7,r8
    strb       r1,[r7,r2]
    add        r2,#0x1
LAB_0805afe4:
    ldrb       r1,[r6,#0x1]
    ldrb       r0,[r5,#0x18]
    push       {r1,r2}
    bl         IsPanelWalkable
    pop        {r1,r2}
    tst        r0,r0
    beq        LAB_0805b000
    ldr        r0,PanelFlag_0805b024
    tst        r0,r3
    bne        LAB_0805b000
    mov        r7,r8
    strb       r1,[r7,r2]
    add        r2,#0x1
LAB_0805b000:
    mov        r0,#0xff
    tst        r2,r2
    beq        LAB_0805b01a
    mov        r7,r8
    ldrb       r0,[r7,#0x0]
    cmp        r2,#0x1
    beq        LAB_0805b01a
    bl         Rng_RandomUint
    mov        r1,#0x1
    and        r0,r1
    mov        r7,r8
    ldrb       r0,[r7,r0]
LAB_0805b01a:
    add        sp,#0x10
    pop        {pc}

    .align 2, 0


PTR_BYTE_ARRAY_0805b020:
    .word BYTE_ARRAY_0805b028

PanelFlag_0805b024:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid

BYTE_ARRAY_0805b028:
    .byte 0x02
    .byte 0x03
    .byte 0x01
    .byte 0x03
