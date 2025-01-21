#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Dynamyte
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Dynamyte_0_Init_08078d68
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Dynamyte_0_Init_08078d58:
    .word A_Dynamyte_0_Init
    .word A_Dynamyte_1_Main
    .word A_Dynamyte_2_Destroy
    .word A_Dynamyte_3_Explode

PTR_PTR_A_Dynamyte_0_Init_08078d68:
    .word PTR_A_Dynamyte_0_Init_08078d58


_ts A_Dynamyte_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xc1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x3
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x4
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x1e
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x93
    bl         Sound_PlaySE
    mov        r0,#0x1c
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    ldr        r0,DAT_08078de4
    str        r0,[r5,#0x60]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_Dynamyte_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

DAT_08078de4:
    .word 0xBB8


_ts A_Dynamyte_1_Main
    push       {lr}
    bl         Battle_IsInputLocked
    beq        LAB_08078df6
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_08078df6:
    ldrb       r0,[r5,#0x19]
    add        r0,#0xf
    bl         Battle_SetBattleFlag
    bl         SpritePtr_DisableFlash
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_08078e1e
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08078e2a
LAB_08078e1e:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    b          LAB_08078e3c
LAB_08078e2a:
    bl         A_Dynamyte_CheckDamage
    tst        r0,r0
    bne        LAB_08078e3c
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Dynamyte_1_0_08078e44
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08078e3c:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Dynamyte_1_0_08078e44:
    .word PTR_A_Dynamyte_1_0_08078e48

PTR_A_Dynamyte_1_0_08078e48:
    .word A_Dynamyte_1_0
    .word A_Dynamyte_1_1


_ts A_Dynamyte_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08078e7e
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Enable
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x1c
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08078e7e:
    pop        {pc}


_ts A_Dynamyte_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bhi        LAB_08078ea8
    mov        r0,#0x18
    strh       r0,[r5,#0x1e]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldrb       r4,[r5,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1b
    push       {r1,r2,r3,r4}
    bl         Effect_DynamyteRedDot_Create
    pop        {r1,r2,r3,r4}
    add        r4,#0x1
    bl         Effect_DynamyteRedDot_Create
LAB_08078ea8:
    bl         Field_GetAttackDirectionOffset_MP
    add        r2,r0,#0x0
    ldr        r7,PTR_CellPosition_ARRAY_08078eec
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x1b
    ldrsb      r3,[r7,r0]
    mul        r2,r3
    add        r0,#0x1
    ldrsb      r3,[r7,r0]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1,r2,r3}
    bl         A_Dynamyte_IsTargetInRange
    tst        r0,r0
    pop        {r0,r1,r2,r3}
    bne        LAB_08078eda
    neg        r3,r3
    bl         A_Dynamyte_IsTargetInRange
    tst        r0,r0
    bne        LAB_08078eda
    pop        {pc}
LAB_08078eda:
    mov        r0,#0x8
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0xc
    str        r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0


PTR_CellPosition_ARRAY_08078eec:
    .word CellPosition_ARRAY_08078ef0

CellPosition_ARRAY_08078ef0:
    cell_pos 1, 0
    cell_pos 1, -1
    cell_pos 0, -1

    .align 2, 0



_ts A_Dynamyte_2_Destroy
    push       {lr}
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_08078f20
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_08078f20:
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08078f30
    mov        r0,#0x0
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_08078f30
    str        r0,[r7,#0x0]
LAB_08078f30:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_Dynamyte_3_Explode
    push       {lr}
    mov        r0,#0x76
    bl         Sound_PlaySE
    bl         SpritePtr_EnableFlash
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08078fbe
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08078f72
    mov        r0,#0x0
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_08078f72
    str        r0,[r7,#0x0]
LAB_08078f72:
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r7,PTR_DAT_08078fc0
    ldrb       r4,[r5,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1b
    ldrh       r6,[r5,#0x24]
    ldrsb      r2,[r7,r4]
    mul        r2,r0
    add        r3,r4,#0x1
    ldrsb      r3,[r7,r3]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1,r2,r3,r4,r6}
    add        r0,r0,r2
    add        r1,r1,r3
    bl         Effect_DynamyteExplosion_Create
    pop        {r0,r1,r2,r3,r4,r6}
    neg        r3,r3
    add        r0,r0,r2
    add        r1,r1,r3
    add        r4,#0x1
    bl         Effect_DynamyteExplosion_Create
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0xb
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
LAB_08078fbe:
    pop        {pc}

PTR_DAT_08078fc0:
    .word DAT_08078fc4

DAT_08078fc4:
    .byte 0x01

DAT_08078fc5:
    .byte 0x00
    .byte 0x01
    .byte -1
    .byte 0x00
    .byte -1

    .align 2, 0



_ts A_Dynamyte_IsTargetInRange
    push       {lr}
    ldr        r6,PTR_PanelFlag_ARRAY_08079000
    ldrb       r4,[r5,#0x16]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1a
    ldr        r4,[r6,r4]
LAB_08078fd8:
    add        r0,r0,r2
    add        r1,r1,r3
    push       {r0,r1,r2,r3,r4}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r2,r3,r4}
    beq        LAB_08078ff6
    push       {r0,r1,r2,r3}
    bl         Field_GetPanelFlags
    tst        r4,r0
    pop        {r0,r1,r2,r3}
    bne        LAB_08078ffa
    b          LAB_08078fd8
LAB_08078ff6:
    mov        r0,#0x0
    pop        {pc}
LAB_08078ffa:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_08079000:
    .word PanelFlag_ARRAY_08079004

PanelFlag_ARRAY_08079004:
    .word PF_EnemyOccupied
    .word PF_PlayerOccupied


_ts A_Dynamyte_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0807905a
    ldr        r7,[r5,#0x64]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_08079074
    ldr        r0,[r5,#0x60]
    sub        r0,#0x1
    str        r0,[r5,#0x60]
    bls        LAB_0807905a
    mov        r0,#0xa
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08079074
    push       {r1,r7}
    ldr        r7,PTR_PanelFlag_ARRAY_08079078
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r1,r7}
    bne        LAB_0807905a
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08079074
    bl         Field_SubtractHP
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0807906e
LAB_0807905a:
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0807906e:
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08079074:
    mov        r0,#0x0
    pop        {pc}

PTR_PanelFlag_ARRAY_08079078:
    .word PanelFlag_ARRAY_0807907c

PanelFlag_ARRAY_0807907c:
    .word PF_EnemyOccupied | PF_Solid | PF_Break
    .word PF_PlayerOccupied | PF_Solid | PF_Break


_ts Attack_Dynamyte_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x4a
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    beq        LAB_080790a4
    str        r0,[r4,#0x68]
    tst        r0,r0
    beq        LAB_0807909c
    str        r4,[r0,#0x0]
LAB_0807909c:
    strb       r7,[r4,#0x16]
    strh       r6,[r4,#0x24]
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
LAB_080790a4:
    pop        {pc}

    .align 2, 0

