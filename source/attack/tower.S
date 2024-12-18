#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Tower
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Tower_0_Init_08070d10
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Tower_0_Init_08070d04:
    .word A_Tower_0_Init
    .word A_Tower_1_Main
    .word A_Tower_2_Free

PTR_PTR_A_Tower_0_Init_08070d10:
    .word PTR_A_Tower_0_Init_08070d04


_ts A_Tower_0_Init
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08070d92
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r7,PTR_EP_64_A_TowerParam_ARRAY_08070d98
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    lsr        r0,r0,#0x17
    add        r7,r7,r0
    str        r7,[r5,#0x64]
    mov        r0,#0x1
    ldrh       r1,[r7,#0x2]
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r0,#0x0
    str        r0,[r5,#0x60]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_08070d7c
    mov        r0,#0x3
    mov        r1,#0x6c
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
LAB_08070d7c:
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_Tower_1_Main
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_08070d90
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_MarkAsChecked
LAB_08070d90:
    pop        {pc}
LAB_08070d92:
    bl         Attack_Free
    pop        {pc}

PTR_EP_64_A_TowerParam_ARRAY_08070d98:
    .word EP_64_A_TowerParam_ARRAY_08070d9c

EP_64_A_TowerParam_ARRAY_08070d9c:
    .byte 0x80, 0x14, 0x76, 0x00
    .byte 0x80, 0x0C, 0x76, 0x00
    .byte 0xB2, 0x0C, 0x7B, 0x00
    .byte 0x9C, 0x0C, 0x7D, 0x00
    .byte 0x80, 0x08, 0x76, 0x00
    .byte 0xB2, 0x08, 0x7B, 0x00


_ts A_Tower_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_08070dd6
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08070dd6
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Enable
    bl         A_Tower_CheckTargetDamage
    tst        r0,r0
    bne        LAB_08070de0
LAB_08070dd6:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Tower_1_0_Move_08070df4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08070de0:
    bl         UpdateSpriteFrameIndex
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_08070df0
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_UpdateCellPosition
LAB_08070df0:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Tower_1_0_Move_08070df4:
    .word PTR_A_Tower_1_0_Move_08070df8

PTR_A_Tower_1_0_Move_08070df8:
    .word A_Tower_1_0_Move
    .word A_Tower_1_1_Damage
    .word A_Tower_1_2_Wait
    .word A_Tower_1_3_PrepareFree


_ts A_Tower_1_0_Move
    push       {lr}
    ldr        r7,[r5,#0x64]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_08070e16
    bl         Sound_PlaySongImmediate
LAB_08070e16:
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_08070e26
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
LAB_08070e26:
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    bne        LAB_08070e32
    mov        r0,#0x1
    strb       r0,[r5,#0x6]
    b          LAB_08070e62
LAB_08070e32:
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    lsr        r0,r0,#0x19
    ldr        r4,PTR_BYTE_ARRAY_08070ee0
    ldr        r4,[r4,r0]
    ldrh       r6,[r5,#0x24]
    ldrb       r0,[r5,#0x1a]
    bl         Effect_Tower_Create
    tst        r7,r7
    beq        LAB_08070e5a
    ldrb       r0,[r5,#0x0]
    mov        r2,#0x4
    and        r0,r2
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_08070e5a:
    ldr        r0,[r5,#0x60]
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r0
    strb       r1,[r5,#0x19]
LAB_08070e62:
    bl         Tower_CompareY
    str        r0,[r5,#0x60]
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    strb       r1,[r5,#0x18]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcc        LAB_08070ec0
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_08070ed8
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x18
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_08070ece
    ldrb       r0,[r5,#0x1a]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x1
    mov        r6,#0x2
    lsl        r6,r6,#0x18
    orr        r4,r6
    mov        r6,#0x1
    lsl        r6,r6,#0x10
    orr        r4,r6
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    b          LAB_08070ece
LAB_08070ec0:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08070ed8
LAB_08070ece:
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}
LAB_08070ed8:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0


PTR_BYTE_ARRAY_08070ee0:
    .word BYTE_ARRAY_08070ee4

BYTE_ARRAY_08070ee4:
    .byte 0x01
    .byte 0x03
    .byte 0x04
    .byte 0x05
    .byte 0x87
    .byte 0x88


_nt A_Tower_1_1_Damage
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08070f16
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_08070f0a
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Enable
LAB_08070f0a:
    mov        r3,#0x64
    ldr        r7,[r5,r3]
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_08070f16:
    pop        {pc}


_ts A_Tower_1_2_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08070f26
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
LAB_08070f26:
    pop        {pc}


_ts A_Tower_1_3_PrepareFree
    push       {lr}
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts A_Tower_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_08070f3e
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
LAB_08070f3e:
    bl         Attack_Free
    pop        {pc}


_ts Tower_CompareY
    push       {lr}
    mov        r3,#0x68
    ldr        r7,[r5,r3]
    tst        r7,r7
    beq        LAB_08070f64
    ldr        r1,[r7,#0x0]
    bl         Battle_SpriteCoordsToCell
    ldrb       r2,[r5,#0x19]
    mov        r0,#0x1
    neg        r0,r0
    cmp        r1,r2
    beq        LAB_08070f64
    bmi        LAB_08070f62
    mov        r0,#0x1
LAB_08070f62:
    pop        {pc}
LAB_08070f64:
    mov        r0,#0x0
    pop        {pc}


_ts A_Tower_CheckTargetDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08070f8c
    mov        r0,#0x2
    ldr        r1,[r5,#0x6c]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08070f94
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x19
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    bl         Field_CreateStrikeEffect
LAB_08070f8c:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08070f94:
    mov        r0,#0x0
    pop        {pc}


_ts Attack_Tower_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x10
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    tst        r7,r7
    beq        LAB_08070fba
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
    strb       r3,[r7,#0x1a]
    mov        r3,#0x68
    str        r2,[r7,r3]
LAB_08070fba:
    pop        {pc}
