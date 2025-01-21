#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_BigSnakeBody
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_BigSnakeBody_0_Init_0806c398
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnakeBody_0_Init_0806c398:
    .word PTR_R_BigSnakeBody_0_Init_0806c39c

PTR_R_BigSnakeBody_0_Init_0806c39c:
    .word R_BigSnakeBody_0_Init
    .word R_BigSnakeBody_1_Main
    .word R_BigSnakeBody_2_Free


_ts R_BigSnakeBody_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xbd
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    mov        r2,#0x1
    lsl        r2,r2,#0x10
    sub        r1,r1,r2
    str        r1,[r5,#0x2c]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0xc8
    strh       r0,[r5,#0x24]
    mov        r0,#0x1d
    mov        r1,#0x68
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x32
    mov        r1,#0x6c
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_BigSnakeBody_1_Main
    ldr        r0,[r5,#0x68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts R_BigSnakeBody_1_Main
    push       {lr}
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfDeleted
    bl         R_BigSnakeBody_CheckParent
    tst        r0,r0
    bne        LAB_0806c446
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_BigSnakeBody_1_0_0806c454
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806c446:
    ldr        r0,[r5,#0x68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigSnakeBody_1_0_0806c454:
    .word PTR_R_BigSnakeBody_1_0_0806c458

PTR_R_BigSnakeBody_1_0_0806c458:
    .word R_BigSnakeBody_1_0
    .word R_BigSnakeBody_1_1
    .word R_BigSnakeBody_1_2
    .word R_BigSnakeBody_1_3


_ts R_BigSnakeBody_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806c478
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806c478:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806c48a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806c48a:
    pop        {pc}


_ts R_BigSnakeBody_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BigSnakeBody_1_2_0_0806c4ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806c4aa
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806c4aa:
    pop        {pc}

PTR_PTR_R_BigSnakeBody_1_2_0_0806c4ac:
    .word PTR_R_BigSnakeBody_1_2_0_0806c4b0

PTR_R_BigSnakeBody_1_2_0_0806c4b0:
    .word R_BigSnakeBody_1_2_0
    .word R_BigSnakeBody_1_2_1


_ts R_BigSnakeBody_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    bl         R_BigSnakeBody_1_2_1
    pop        {pc}

    .align 2, 0



_ts R_BigSnakeBody_1_2_1
    push       {lr}
    mov        r0,#0x1
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_0806c4e4
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806c4e4:
    pop        {pc}


_nt R_BigSnakeBody_1_3
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BigSnakeBody_1_3_0_0806c4f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_BigSnakeBody_1_3_0_0806c4f4:
    .word PTR_R_BigSnakeBody_1_3_0_0806c4f8

PTR_R_BigSnakeBody_1_3_0_0806c4f8:
    .word R_BigSnakeBody_1_3_0
    .word R_BigSnakeBody_1_3_1


_ts R_BigSnakeBody_1_3_0
    push       {lr}
    mov        r0,#0x0
    push       {r7}
    bl         FieldObject_UpdateField
    pop        {r7}
    ldr        r7,[r5,#0x70]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    ldr        r3,DAT_0806c548
    ldrb       r2,[r5,#0x18]
    sub        r2,r0,r2
    mul        r2,r3
    str        r2,[r5,#0x44]
    ldr        r3,DAT_0806c54c
    ldrb       r2,[r5,#0x19]
    sub        r2,r1,r2
    mul        r2,r3
    str        r2,[r5,#0x48]
    mov        r0,#0x19
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    bl         R_BigSnakeBody_1_3_1
    pop        {pc}

DAT_0806c548:
    .word 0x19999

DAT_0806c54c:
    .word 0xF5C2


_ts R_BigSnakeBody_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806c594
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    mov        r2,#0x1
    lsl        r2,r2,#0x10
    sub        r1,r1,r2
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0xc
    push       {r0}
    mov        r0,#0x1
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    pop        {r0}
    bne        LAB_0806c58c
    mov        r0,#0x8
LAB_0806c58c:
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0806c594:
    ldr        r0,[r5,#0x28]
    ldr        r2,[r5,#0x44]
    add        r0,r0,r2
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    ldr        r2,[r5,#0x48]
    add        r1,r1,r2
    str        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}


_nt R_BigSnakeBody_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_BigSnakeBody_2_0_Delete_0806c5bc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_BigSnakeBody_2_0_Delete_0806c5bc:
    .word PTR_R_BigSnakeBody_2_0_Delete_0806c5c0

PTR_R_BigSnakeBody_2_0_Delete_0806c5c0:
    .word R_BigSnakeBody_2_0_Delete
    .word R_BigSnakeBody_2_1_Free


_ts R_BigSnakeBody_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_BigSnakeBody_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806c602
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    bl         Actor_Free
LAB_0806c602:
    pop        {pc}


_ts R_BigSnakeBody_GetNextMovePanel
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x8
    mov        r7,sp
    ldr        r6,PTR_CellPosition_ARRAY_0806c664
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0x0
    mov        r3,#0x6
LAB_0806c61a:
    push       {r0,r1,r2,r3,r6,r7}
    add        r7,r7,r2
    ldrsb      r4,[r6,r3]
    add        r0,r0,r4
    add        r3,#0x1
    ldrsb      r4,[r6,r3]
    add        r1,r1,r4
    strb       r0,[r7,#0x0]
    strb       r1,[r7,#0x1]
    bl         R_BigSnakeBody_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1,r2,r3,r6,r7}
    beq        LAB_0806c638
    add        r2,#0x2
LAB_0806c638:
    sub        r3,#0x2
    bpl        LAB_0806c61a
    lsr        r2,r2,#0x1
    beq        LAB_0806c65a
    push       {r2,r7}
    bl         Rng_RandomInt
    pop        {r2,r7}
    add        r1,r2,#0x0
    bl         SWI_DivMod
    lsl        r2,r0,#0x1
    ldrb       r0,[r7,r2]
    add        r2,#0x1
    ldrb       r1,[r7,r2]
    add        sp,#0x8
    pop        {pc}
LAB_0806c65a:
    add        sp,#0x8
    mov        r0,#0x0
    pop        {pc}
    .byte 0x30
    .byte 0x0C
    .byte 0x00
    .byte 0x02

PTR_CellPosition_ARRAY_0806c664:
    .word CellPosition_ARRAY_0806c668

CellPosition_ARRAY_0806c668:
    cell_pos 0, 1
    cell_pos 0, -1
    cell_pos 1, 0
    cell_pos -1, 0


_ts R_BigSnakeBody_IsPanelWalkable
    push       {lr}
    bl         Field_GetPanelFlags
    ldr        r1,DAT_0806c690
    tst        r0,r1
    bne        LAB_0806c688
    ldr        r1,DAT_0806c68c
    and        r0,r1
    cmp        r0,r1
    bne        LAB_0806c688
    mov        r0,#0x1
    pop        {pc}
LAB_0806c688:
    mov        r0,#0x0
    pop        {pc}

DAT_0806c68c:
    .word 0x3

DAT_0806c690:
    .word 0xC10


_ts R_BigSnakeBody_CheckParent
    push       {lr}
    ldr        r7,[r5,#0x70]
    tst        r7,r7
    beq        LAB_0806c6a6
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_0806c6c0
LAB_0806c6a6:
    mov        r0,#0x70
    bl         Sound_PlaySE
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}


_nt R_BigSnakeBody_PlayHitNoise
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0806c6c0:
    mov        r0,#0x0
    pop        {pc}


_ts Routine_BigSnakeBody_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x44
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_0806c6e8
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    ldrb       r0,[r5,#0x1a]
    strb       r0,[r7,#0x1a]
    str        r2,[r7,#0x70]
    tst        r2,r2
    beq        LAB_0806c6e8
LAB_0806c6e8:
    pop        {pc}

    .align 2, 0

