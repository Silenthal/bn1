#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_LockOn
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_LockOn_0_Init_0807ade0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_LockOn_0_Init_0807ade0:
    .word PTR_A_LockOn_0_Init_0807ade4

PTR_A_LockOn_0_Init_0807ade4:
    .word A_LockOn_0_Init
    .word A_LockOn_1_Main
    .word A_LockOn_2_Free


_ts A_LockOn_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x52
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0xa
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    str        r0,[r5,#0x68]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x1c
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    mov        r1,#0xa
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    ldr        r0,DAT_0807ae74
    str        r0,[r5,#0x70]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_LockOn_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

DAT_0807ae74:
    .word 0xBB8


_ts A_LockOn_1_Main
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807aea0
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    b          LAB_0807aeb2
LAB_0807aea0:
    bl         A_LockOn_CheckDamage
    tst        r0,r0
    bne        LAB_0807aeb2
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_LockOn_1_0_0807aeb8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0807aeb2:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_LockOn_1_0_0807aeb8:
    .word PTR_A_LockOn_1_0_0807aebc

PTR_A_LockOn_1_0_0807aebc:
    .word A_LockOn_1_0
    .word A_LockOn_1_1
    .word A_LockOn_1_2
    .word A_LockOn_1_3
    .word A_LockOn_1_4


_ts A_LockOn_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_LockOn_1_0_0_0807aee0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_LockOn_1_0_0_0807aee0:
    .word PTR_A_LockOn_1_0_0_0807aee4

PTR_A_LockOn_1_0_0_0807aee4:
    .word A_LockOn_1_0_0


_ts A_LockOn_1_0_0
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x8
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x12
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0807af0a
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0807af0a:
    pop        {r5}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807af26
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_0807af26:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Enable
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt A_LockOn_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0807af58
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0807af58:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0807af6a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807af6a:
    pop        {pc}


_ts A_LockOn_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_LockOn_1_2_0_0807af8c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807af8a
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0807af8a:
    pop        {pc}

PTR_PTR_A_LockOn_1_2_0_0807af8c:
    .word PTR_A_LockOn_1_2_0_0807af90

PTR_A_LockOn_1_2_0_0807af90:
    .word A_LockOn_1_2_0
    .word A_LockOn_1_2_1


_ts A_LockOn_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts A_LockOn_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807afba
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807afba:
    pop        {pc}


_ts A_LockOn_1_3
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_LockOn_1_3_0_0807afcc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_LockOn_1_3_0_0807afcc:
    .word PTR_A_LockOn_1_3_0_0807afd0

PTR_A_LockOn_1_3_0_0807afd0:
    .word A_LockOn_1_3_0
    .word A_LockOn_1_3_1
    .word A_LockOn_1_3_2
    .word A_LockOn_1_3_3
    .word A_LockOn_1_3_4


_ts A_LockOn_1_3_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts A_LockOn_1_3_1
    push       {lr}
    ldr        r0,[r5,#0x30]
    mov        r1,#0x1
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807b010
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0807b010:
    pop        {pc}


_nt A_LockOn_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807b046
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    ldr        r7,[r5,#0x68]
    ldrh       r0,[r7,#0x18]
    strh       r0,[r5,#0x6]
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0807b048
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0807b046:
    pop        {pc}

DAT_0807b048:
    .word 0x10B0000


_ts A_LockOn_1_3_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807b0be
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldrb       r0,[r5,#0x1a]
    ldrh       r6,[r5,#0x24]
    ldr        r4,DAT_0807b0c0
    mov        r7,#0x1
    push       {r1,r2,r3}
    bl         Attack_SharpStrike_Create
    pop        {r1,r2,r3}
    mov        r4,#0x2d
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    lsl        r0,r0,#0x7
    add        r4,r4,r0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xe0
    bl         Sound_PlaySongImmediate
    ldr        r7,[r5,#0x68]
    ldrh       r0,[r7,#0x18]
    strh       r0,[r5,#0x6]
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0807b0be
    mov        r0,#0x10
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0807b0be
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
    bl         R_Actor_ClearCurrentAttack
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0807b0be:
    pop        {pc}

DAT_0807b0c0:
    .word 0x100FF


_ts A_LockOn_1_3_4
    push       {lr}
    ldr        r0,[r5,#0x30]
    mov        r1,#0x1
    lsl        r1,r1,#0x10
    sub        r0,r0,r1
    str        r0,[r5,#0x30]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807b0e0
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807b0e0:
    pop        {pc}


_nt A_LockOn_1_4
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_LockOn_1_4_0_0807b0f0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_LockOn_1_4_0_0807b0f0:
    .word PTR_A_LockOn_1_4_0_0807b0f4

PTR_A_LockOn_1_4_0_0807b0f4:
    .word A_LockOn_1_4_0
    .word A_LockOn_1_4_1


_ts A_LockOn_1_4_0
    push       {lr}
    mov        r0,#0x68
    add        r0,r0,r5
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    ldrb       r4,[r5,#0x4]
    ldrh       r6,[r5,#0x24]
    ldrb       r7,[r5,#0x16]
    bl         Attack_LockonTarget_Create
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt A_LockOn_1_4_1
    push       {lr}
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0807b12e
    ldrb       r0,[r7,#0x6]
    tst        r0,r0
    beq        LAB_0807b12c
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807b12c:
    pop        {pc}
LAB_0807b12e:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts A_LockOn_2_Free
    push       {lr}
    mov        r0,#0x76
    bl         Sound_PlaySongImmediate
    bl         R_Actor_ClearCurrentAttack
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0807b164
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_0807b164:
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0807b174
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_0807b174
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_0807b174:
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0807b182
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
LAB_0807b182:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x19, 0x00, 0x01, 0x02


_ts A_LockOn_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0807b1e8
    ldr        r7,[r5,#0x64]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_0807b202
    bl         Battle_IsInputLocked
    bne        LAB_0807b1e8
    ldr        r0,[r5,#0x70]
    sub        r0,#0x1
    str        r0,[r5,#0x70]
    bls        LAB_0807b1e8
    mov        r0,#0xa
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0807b202
    push       {r1,r7}
    ldr        r7,PTR_PanelFlag_ARRAY_0807b208
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r1,r7}
    bne        LAB_0807b1e8
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0807b202
    bl         Field_SubtractHP
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0807b1fc
LAB_0807b1e8:
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0807b1fc:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0807b202:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_0807b208:
    .word PanelFlag_ARRAY_0807b20c

PanelFlag_ARRAY_0807b20c:
    .word PF_EnemyOccupied | PF_Solid | PF_Break
    .word PF_PlayerOccupied | PF_Solid | PF_Break


_ts Attack_LockOn_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x59
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    beq        LAB_0807b234
    str        r0,[r4,#0x6c]
    tst        r0,r0
    beq        LAB_0807b22c
    str        r4,[r0,#0x0]
LAB_0807b22c:
    strb       r7,[r4,#0x16]
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
    strh       r6,[r4,#0x24]
LAB_0807b234:
    pop        {pc}

    .align 2, 0

