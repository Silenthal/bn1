#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Ratton
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Ratton_0_Init_08074510
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Ratton_0_Init_08074510:
    .word PTR_A_Ratton_0_Init_08074514

PTR_A_Ratton_0_Init_08074514:
    .word A_Ratton_0_Init
    .word A_Ratton_1_Main
    .word A_Ratton_2_Free


_ts A_Ratton_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x9e
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x3
    ldr        r7,PTR_RattonParam_ARRAY_0807459c
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#0x24]
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r1,[r7,#0x4]
    str        r1,[r5,#0x48]
    mul        r1,r0
    str        r1,[r5,#0x44]
    ldrb       r2,[r5,#0x18]
    add        r2,r2,r0
    strb       r2,[r5,#0x6]
    ldrb       r2,[r5,#0x19]
    strb       r2,[r5,#0x7]
    ldrb       r0,[r7,#0x2]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1b
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

PTR_RattonParam_ARRAY_0807459c:
    .word RattonParam_ARRAY_080745a0

RattonParam_ARRAY_080745a0:
    .byte 0x14, 0x46, 0x00, 0x00, 0x00, 0x80, 0x02, 0x00
    .byte 0x1E, 0x55, 0x01, 0x00, 0x00, 0x80, 0x02, 0x00
    .byte 0x28, 0x64, 0x02, 0x00, 0x00, 0x80, 0x03, 0x00
    .byte 0x14, 0x50, 0x00, 0x00, 0x00, 0x80, 0x02, 0x00
    .byte 0x1E, 0x64, 0x01, 0x00, 0x00, 0x80, 0x02, 0x00
    .byte 0x28, 0x78, 0x02, 0x00, 0x00, 0x80, 0x03, 0x00
    .byte 0x28, 0x64, 0x03, 0x00, 0x00, 0x80, 0x03, 0x00


_ts A_Ratton_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08074612
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08074694
LAB_08074612:
    bl         SpritePtr_ResetPalette
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,DAT_080746a4
    ldrb       r2,[r5,#0x16]
    tst        r2,r2
    beq        LAB_08074624
    ldr        r1,DAT_080746a8
LAB_08074624:
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
    beq        LAB_08074652
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08074652:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Ratton_1_0_MoveX_08074698
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldr        r7,[r5,#0x60]
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08074694
    add        r0,r7,#0x0
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x76
    bl         Sound_PlaySE
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08074694:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Ratton_1_0_MoveX_08074698:
    .word PTR_A_Ratton_1_0_MoveX_0807469c

PTR_A_Ratton_1_0_MoveX_0807469c:
    .word A_Ratton_1_0_MoveX
    .word A_Ratton_1_1_MoveY

DAT_080746a4:
    .word 0x80

DAT_080746a8:
    .word 0x40


_ts A_Ratton_1_0_MoveX
    push       {lr}
    bl         A_Ratton_IsCollision
    tst        r0,r0
    beq        LAB_080746dc
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x76
    bl         Sound_PlaySE
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08074736
LAB_080746dc:
    ldr        r1,[r5,#0x44]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    ldr        r2,[r5,#0x44]
    tst        r2,r2
    bmi        LAB_08074700
    ldr        r2,[r5,#0x28]
    cmp        r2,r0
    blt        LAB_08074736
    ldrb       r2,[r5,#0x6]
    add        r2,#0x1
    strb       r2,[r5,#0x6]
    b          LAB_0807470c
LAB_08074700:
    ldr        r2,[r5,#0x28]
    cmp        r2,r0
    bgt        LAB_08074736
    ldrb       r2,[r5,#0x6]
    sub        r2,#0x1
    strb       r2,[r5,#0x6]
LAB_0807470c:
    push       {r0,r1}
    bl         A_Ratton_GetYDistanceToTarget
    add        r2,r1,#0x0
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0807471c
    b          LAB_08074736
LAB_0807471c:
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x48]
    tst        r2,r2
    bge        LAB_08074728
    neg        r0,r0
LAB_08074728:
    str        r0,[r5,#0x48]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
LAB_08074736:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_ts A_Ratton_1_1_MoveY
    push       {lr}
    bl         A_Ratton_IsCollision
    tst        r0,r0
    beq        LAB_0807476c
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x76
    bl         Sound_PlaySE
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08074778
LAB_0807476c:
    ldr        r1,[r5,#0x48]
    ldr        r0,[r5,#0x2c]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    bl         R_Actor_UpdateCellPos
LAB_08074778:
    pop        {pc}


_nt A_Ratton_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_Ratton_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x2d
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_080747b6
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r2,[r5,#0x16]
    strb       r2,[r7,#0x16]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    push       {r7}
    bl         Battle_CellCoordsToSprite
    pop        {r7}
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_080747b6:
    pop        {pc}


_ts A_Ratton_IsCollision
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldr        r1,DAT_080747d8
    ldrb       r2,[r5,#0x16]
    tst        r2,r2
    beq        LAB_080747cc
    ldr        r1,DAT_080747dc
LAB_080747cc:
    mov        r3,#0x0
    tst        r0,r1
    beq        LAB_080747d4
    mov        r3,#0x1
LAB_080747d4:
    add        r0,r3,#0x0
    pop        {pc}

DAT_080747d8:
    .word 0x820

DAT_080747dc:
    .word 0x810


_ts A_Ratton_GetYDistanceToTarget
    push       {lr}
    bl         A_Ratton_GetYDistanceToTarget_
    pop        {pc}


_ts FUN_080747e8
    push       {lr}
    mov        r2,#0x0
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x18]
    cmp        r0,r1
    bgt        LAB_08074806
    mov        r1,#0x1
    ldrb       r0,[r5,#0x19]
    ldrb       r2,[r7,#0x19]
    cmp        r0,r2
    ble        LAB_08074804
    neg        r1,r1
LAB_08074804:
    mov        r2,#0x1
LAB_08074806:
    add        r0,r2,#0x0
    pop        {pc}


_nt FUN_0807480a
    push       {lr}
    LoadMain battle, r7, r7
    mov        r1,#0x54
    add        r7,r7,r1
    mov        r3,#0x0
LAB_08074816:
    ldr        r6,[r7,#0x0]
    tst        r6,r6
    beq        LAB_08074834
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r6,#0x18]
    cmp        r0,r1
    blt        LAB_08074834
    mov        r1,#0x1
    ldrb       r0,[r5,#0x19]
    ldrb       r2,[r6,#0x19]
    cmp        r0,r2
    ble        LAB_08074830
    neg        r1,r1
LAB_08074830:
    mov        r2,#0x1
    b          LAB_0807483e
LAB_08074834:
    add        r7,#0x4
    add        r3,#0x1
    cmp        r3,#0x4
    blt        LAB_08074816
    mov        r2,#0x0
LAB_0807483e:
    add        r0,r2,#0x0
    pop        {pc}


_nt A_Ratton_GetYDistanceToTarget_
    push       {lr}
    bl         Battle_FindOpponentInSameColumn
    tst        r0,r0
    beq        LAB_08074854
    ldrb       r2,[r5,#0x19]
    sub        r1,r1,r2
    mov        r0,#0x1
    b          LAB_08074856
LAB_08074854:
    mov        r0,#0x0
LAB_08074856:
    pop        {pc}
