#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_08075394:
    .byte 0x02
    .byte 0x01
    .byte 0x02
    .byte 0x03

DAT_08075398:
    .byte 0x04

DAT_08075399:
    .byte 0x03
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x05
    .byte 0x04
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x01
    .byte 0x03
    .byte 0x01
    .byte 0x03
    .byte 0x03
    .byte 0x02
    .byte 0x01
    .byte 0x03
    .byte 0x02
    .byte 0x04
    .byte 0x05
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x01
    .byte 0x02
    .byte 0x02
    .byte 0x03
    .byte 0x05
    .byte 0x04
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x02
    .byte 0x05
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x04
    .byte 0x02
    .byte 0x04
    .byte 0x04
    .byte 0x00

    .align 2, 0



_ts Attack_ColumnCurrentH
    push       {lr}
    mov        r0,#0x0
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_ColumnCurrentH_0_080753f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_ColumnCurrentH_0_080753e8:
    .word A_ColumnCurrentH_0
    .word A_ColumnCurrentH_1
    .word A_ColumnCurrentH_2

PTR_PTR_A_ColumnCurrentH_0_080753f4:
    .word PTR_A_ColumnCurrentH_0_080753e8


_ts A_ColumnCurrentH_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xa9
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x1
    strb       r0,[r5,#0x1a]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x4
    ldr        r7,PTR_DAT_0807545c
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x3
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_ColumnCurrentH_1
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_DAT_0807545c:
    .word DAT_08075394


_ts A_ColumnCurrentH_1
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x3
    bl         Battle_GetBattleFlagCurrent
    beq        LAB_08075476
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    b          LAB_08075480
LAB_08075476:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_ColumnCurrentH_1_0_0807548c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08075480:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_ColumnCurrentH_1_0_0807548c:
    .word PTR_A_ColumnCurrentH_1_0_08075490

PTR_A_ColumnCurrentH_1_0_08075490:
    .word A_ColumnCurrentH_1_0
    .word A_ColumnCurrentH_1_1
    .word A_ColumnCurrentH_1_2
    .word A_ColumnCurrentH_1_3


_ts A_ColumnCurrentH_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_08075500
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1e
    lsl        r0,r0,#0x4
    ldr        r7,PTR_DAT_08075508
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    mov        r4,#0x2
LAB_080754c0:
    push       {r4,r7}
    lsl        r2,r4,#0x1
    ldrb       r0,[r7,r2]
    add        r2,#0x1
    ldrb       r1,[r7,r2]
    bl         FieldObject_GetPanelFlags
    ldr        r1,PanelFlag_0807550c
    tst        r0,r1
    pop        {r4,r7}
    bne        LAB_080754fe
    sub        r4,#0x1
    bpl        LAB_080754c0
    mov        r4,#0x2
LAB_080754dc:
    push       {r4,r7}
    lsl        r2,r4,#0x1
    ldrb       r1,[r7,r2]
    add        r2,#0x1
    ldrb       r2,[r7,r2]
    ldrh       r6,[r5,#0x24]
    bl         Attack_ColumnCurrentV_Create
    pop        {r4,r7}
    sub        r4,#0x1
    bpl        LAB_080754dc
    mov        r0,#0x6
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080754fe:
    pop        {pc}
LAB_08075500:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0


PTR_DAT_08075508:
    .word DAT_08075394

PanelFlag_0807550c:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts A_ColumnCurrentH_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08075526
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08075526:
    pop        {pc}


_ts A_ColumnCurrentH_1_2
    push       {lr}
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    bl         Battle_SetBattleFlag
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08075580
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r5,#0x5]
    add        r1,r0,r7
    ldrb       r1,[r1,#0xa]
    strb       r1,[r5,#0x14]
    lsl        r1,r0,#0x1
    add        r7,r7,r1
    ldrb       r0,[r7,#0x6]
    strb       r0,[r5,#0x18]
    ldrb       r1,[r7,#0x7]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Enable
    bl         FieldObject_UpdateCellPosition
    mov        r0,#0xbc
    bl         Sound_PlaySE
    mov        r0,#0xf
    strh       r0,[r5,#0x1e]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08075580:
    pop        {pc}


_nt A_ColumnCurrentH_1_3
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08075596
    mov        r0,#0xbc
    bl         Sound_PlaySE
    mov        r0,#0xf
    strh       r0,[r5,#0x1e]
LAB_08075596:
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    bl         Battle_SetBattleFlag
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080755c8
    ldrb       r0,[r5,#0x5]
    mov        r1,#0x1
    eor        r0,r1
    strb       r0,[r5,#0x5]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080755c8:
    pop        {pc}


_nt A_ColumnCurrentH_2
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_ColumnCurrentH_Create
    push       {lr}
    push       {r5,r6}
    mov        r0,#0x33
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5,r6}
    tst        r7,r7
    beq        LAB_080755f0
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_080755f0:
    pop        {pc}

    .align 2, 0

